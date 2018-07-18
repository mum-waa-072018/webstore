package waa.mum.edu.service;

import waa.mum.edu.domain.Message;

import java.util.List;

public interface MessageService {

    public void addMessage(Message message);

    public List<Message> getLatestTenMessages();
}
