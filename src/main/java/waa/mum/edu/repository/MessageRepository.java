package waa.mum.edu.repository;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import waa.mum.edu.domain.Message;

import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Long> {


    @Query(value="select * from Message  m  order by m.date desc  limit 10", nativeQuery = true)
    public List<Message> getLatestTenMessages();

}
