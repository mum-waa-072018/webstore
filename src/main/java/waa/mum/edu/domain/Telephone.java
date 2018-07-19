package waa.mum.edu.domain;

import org.hibernate.validator.constraints.Range;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Telephone {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  @Range(min=100, max=999, message = "{area.message}")
  private String area;
  @Range(min=100, max=999, message = "{prefix.message}")
  private String pre;
  @Range(min=1000, max = 9999, message = "{number.message}")
  private String number;

  @Transient
  private User user;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getArea() {
    return area;
  }

  public void setArea(String area) {
    this.area = area;
  }

  public String getPre() {
    return pre;
  }

  public void setPre(String pre) {
    this.pre = pre;
  }

  public String getNumber() {
    return number;
  }

  public void setNumber(String number) {
    this.number = number;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public Telephone( String area, String pre, String number) {
    this.area = area;
    this.pre = pre;
    this.number = number;
  }

  public Telephone() {
  }

  @Override
  public String toString() {
    return "Telephone{" +
        "id=" + id +
        ", area='" + area + '\'' +
        ", pre='" + pre + '\'' +
        ", number='" + number + '\'' +
        ", user=" + user +
        '}';
  }
}
