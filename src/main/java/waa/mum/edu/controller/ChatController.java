package waa.mum.edu.controller;

import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import waa.mum.edu.domain.Message;
import waa.mum.edu.domain.User;
import waa.mum.edu.service.MessageService;
import waa.mum.edu.service.UserService;
import waa.mum.edu.util.UserSessionUtil;
import waa.mum.edu.websocket.MyWebSocketHandler;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/chatroom")
public class ChatController {

	@Autowired
	MyWebSocketHandler handler;

	@Autowired
	UserService userService;

	@Autowired
	MessageService messageService;

	@RequestMapping("/chatroom")
	public String chat(Model model,Long id) {

		User user  = userService.getUserById(id);
		UserSessionUtil.setUser(user);
		model.addAttribute("greeting", "Welcome to the Lone Ranger Company, Kimosabe!!");
		model.addAttribute("tagline", "The one and only place to work, so you can live and play!!");


		return "chat/chatroom";
	}

	@RequestMapping("/toChatroom")
	public String chatroom(Model model){

		User user =UserSessionUtil.currentUser();

		if(null==user){
			return "redirect:/login";
		}
		List<Message> chatRecords = messageService.getLatestTenMessages();
		model.addAttribute("chatRecords",chatRecords);
		return "chat/chatroom";
	}


	@RequestMapping("/onlineusers")
	@ResponseBody
	public List<User> onlineusers(HttpSession session){
		Map<Long, WebSocketSession> map=MyWebSocketHandler.userSocketSessionMap;
		Set<Long> set=map.keySet();
		Iterator<Long> it = set.iterator();
		List<User> list=new ArrayList<User>();
		while(it.hasNext()){
			Long entry = it.next();
			User u=userService.getUserById(entry);
			String user= UserSessionUtil.currentUser().getFirstName();
			if(!user.equals(u.getFirstName())){
				list.add(u);
			}
		}
		return list;
	}

	// broadcast
	@ResponseBody
	@RequestMapping(value = "broadcast", method = RequestMethod.POST)
	public void broadcast(@RequestParam("text") String text) throws IOException {
		User user =UserSessionUtil.currentUser();
		Message msg = new Message();
		msg.setDate(new Date());
		msg.setFromId(-1l);//-1 : broadcast
		msg.setFromName(user.getFirstName());
		msg.setToId(0l);
		msg.setText(text);
		messageService.addMessage(msg);
		handler.broadcast(new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
	}

	@RequestMapping("getuid")
	@ResponseBody
	public User getuid(@RequestParam("username")String username){
		User user=userService.getUserByName(username);
		return user;
	}

	

}
