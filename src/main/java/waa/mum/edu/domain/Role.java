package waa.mum.edu.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Role {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;


  private String userName;

  private String userRole;

  public Role(String userName, String userRole) {
    this.userName = userName;
    this.userRole = userRole;
  }

  public Role() {
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getUserRole() {
    return userRole;
  }

  public void setUserRole(String userRole) {
    this.userRole = userRole;
  }

  @Override
  public String toString() {
    return "Role{" +
        "id=" + id +
        ", userName='" + userName + '\'' +
        ", userRole='" + userRole + '\'' +
        '}';
  }
}
