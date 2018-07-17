package waa.mum.edu.domain;

import org.hibernate.validator.constraints.NotEmpty;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

@Entity
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  @Size(min=2, max = 20)
  private String firstName;

  @NotEmpty
  private String password;

  @Size(min=3, max=20)
  private String lastName;

  @Past
  private Date birthday;

  @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  private Address address;

  @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  @JoinColumn(name="id")
  private List<Telephone> phones;

  private String roles;

  public User() {
  }

  public User(String firstName, String lastName, Date birthday, Address address, String roles, List<Telephone>
      phones, String password) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.birthday = birthday;
    this.address = address;
    this.roles = roles;
    this.phones = phones;
    this.password = password;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public Date getBirthday() {
    return birthday;
  }

  public void setBirthday(Date birthday) {
    this.birthday = birthday;
  }

  public Address getAddress() {
    return address;
  }

  public void setAddress(Address address) {
    this.address = address;
  }

  public String getRoles() {
    return roles;
  }

  public void setRoles(String roles) {
    this.roles = roles;
  }

  public List<Telephone> getPhones() {
    return phones;
  }

  public void setPhones(List<Telephone> phones) {
    this.phones = phones;
  }
}
