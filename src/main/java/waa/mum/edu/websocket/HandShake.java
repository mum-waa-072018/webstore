
package waa.mum.edu.websocket;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;
import waa.mum.edu.domain.User;
import waa.mum.edu.util.UserSessionUtil;

import java.util.Map;


/**
 * Socket built connecttion
 */
public class HandShake implements HandshakeInterceptor {

	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
		User user = UserSessionUtil.currentUser();
		System.out.println("Websocket:User [ID:" + user.getId() + "] has built a connecttion");
		if (request instanceof ServletServerHttpRequest) {
			Long uid = user.getId();
			if(uid!=null){
				attributes.put("uid", uid);
			}else{
				return false;
			}
		}
		return true;
	}

	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {
	}

}
