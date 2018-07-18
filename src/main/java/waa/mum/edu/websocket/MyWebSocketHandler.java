package waa.mum.edu.websocket;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;
import waa.mum.edu.domain.Message;
import waa.mum.edu.domain.User;
import waa.mum.edu.service.UserService;

import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;


/**
 * Socket handler
 */
@Component
public class MyWebSocketHandler implements WebSocketHandler {



	//用于保存HttpSession与WebSocketSession的映射关系
	public static final Map<Long, WebSocketSession> userSocketSessionMap;

	@Autowired
	UserService userService;
	
	static {
		userSocketSessionMap = new ConcurrentHashMap<Long, WebSocketSession>();
	}
	
	/**
	 *  after buiilt the connecttion ,put userId into WebSocketSession ,send a message to show who will be online
	 */
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		Long uid = (Long) session.getAttributes().get("uid");
		User u=userService.getUserById(uid);
		if (userSocketSessionMap.get(uid) == null) {
			userSocketSessionMap.put(uid, session);
			Message msg = new Message();
			msg.setFromId(0l);//0 : online
			msg.setText(u.getFirstName());
			msg.setUserId(u.getId());
//			msg.setAvatar(u.getAvatar());
			this.broadcast(new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
		}
	}

	/**
	 * hanlde message
	 */
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
			if(message.getPayloadLength()==0)
				return;
			Message msg=new Gson().fromJson(message.getPayload().toString(),Message.class);
			msg.setDate(new Date());
			sendMessageToUser(msg.getToId(), new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
	}

	/**
	 * handle transfer message error
	 */
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
		if (session.isOpen()) {
			session.close();
		}
		Iterator<Entry<Long, WebSocketSession>> it = userSocketSessionMap.entrySet().iterator();
		// remove throw exception error user
		while (it.hasNext()) {
			Entry<Long, WebSocketSession> entry = it.next();
			if (entry.getValue().getId().equals(session.getId())) {
				userSocketSessionMap.remove(entry.getKey());
				System.out.println("Socket Session has beed romoved UserId:" + entry.getKey());
				String username=userService.getNameById(entry.getKey());
				Message msg = new Message();
				msg.setFromId(-2l);
				msg.setText(username);
				this.broadcast(new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
				break;
			}
		}
	}

	/**
	 * if close the connection remove the socket session
	 */
	public void afterConnectionClosed(WebSocketSession session,CloseStatus closeStatus) throws Exception {
		System.out.println("Websocket:" + session.getId() + "has close");
		Iterator<Entry<Long, WebSocketSession>> it = userSocketSessionMap.entrySet().iterator();
		// 移除当前用户的Socket会话
		while (it.hasNext()) {
			Entry<Long, WebSocketSession> entry = it.next();
			if (entry.getValue().getId().equals(session.getId())) {
				userSocketSessionMap.remove(entry.getKey());
				System.out.println("Socket Session has been removed :User ID" + entry.getKey());
				String username=userService.getNameById(entry.getKey());
				Message msg = new Message();
				msg.setFromId(-2l);//下线消息，用-2表示
				msg.setText(username);
				this.broadcast(new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
				break;
			}
		}
	}

	public boolean supportsPartialMessages() {
		return false;
	}

	/**
	 * send message to user
	 * @param message
	 * @throws IOException
	 */
	public void broadcast(final TextMessage message) throws IOException {
		Iterator<Entry<Long, WebSocketSession>> it = userSocketSessionMap.entrySet().iterator();

		//broadcast
		while (it.hasNext()) {

			final Entry<Long, WebSocketSession> entry = it.next();

			if (entry.getValue().isOpen()) {
				// entry.getValue().sendMessage(message);
				new Thread(new Runnable() {

					public void run() {
						try {
							if (entry.getValue().isOpen()) {
								entry.getValue().sendMessage(message);
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
					}

				}).start();
			}

		}
	}

	/**
	 * send message to some user
	 * 
	 * @throws IOException
	 */
	public void sendMessageToUser(Long uid, TextMessage message) throws IOException {
		WebSocketSession session = userSocketSessionMap.get(uid);
		if (session != null && session.isOpen()) {
			session.sendMessage(message);
		}
	}

}
