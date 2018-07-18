package waa.mum.edu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import waa.mum.edu.domain.Message;
import waa.mum.edu.repository.MessageRepository;
import waa.mum.edu.service.MessageService;

import java.util.List;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

  @Autowired
  private MessageRepository messageRepository;

  @Override
  public void addMessage(Message message) {
    messageRepository.save(message);
  }

  @Override
  public List<Message> getLatestTenMessages(){
    return messageRepository.getLatestTenMessages();
  }

}
