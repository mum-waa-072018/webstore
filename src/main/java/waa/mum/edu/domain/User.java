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

  @Size(min=2, max = 20, message = "{firstname.message}")
  private String firstName;

  @NotEmpty
  private String password;

  @Size(min=3, max=20)
  private String lastName;

  @Past
  private Date birthday;

  @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  private Address address;

  @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//  @JoinColumn(name="user_id")
  @JoinColumn(name = "phone_id")
  private Telephone phone;

  @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  @JoinColumn(name="user_id")
  private List<Role> roles;

  public User() {
  }

  public User(String firstName, String lastName, Date birthday, Address address, List<Role> roles, Telephone phone, String password) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.birthday = birthday;
    this.address = address;
    this.roles = roles;
    this.phone = phone;
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

  public List<Role> getRoles() {
    return roles;
  }

  public void setRoles(List<Role> roles) {
    this.roles = roles;
  }

  public Telephone getPhone() {
    return phone;
  }

  public void setPhone(Telephone phone) {
    this.phone = phone;
  }

  @Override
  public String toString() {
    return "User{" +
        "id=" + id +
        ", firstName='" + firstName + '\'' +
        ", password='" + password + '\'' +
        ", lastName='" + lastName + '\'' +
        ", birthday=" + birthday +
        ", address=" + address +
        ", phone=" + phone+
        ", roles=" + roles +
        '}';
  }
}
