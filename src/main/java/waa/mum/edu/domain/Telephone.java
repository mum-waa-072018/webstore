package waa.mum.edu.domain;

import org.hibernate.validator.constraints.Range;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Telephone {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  @Range(min=100, max=999)
  private String area;
  @Range(min=100, max=999, message = "{Telephone.pre}")
  private String pre;
  @Range(min=1000, max = 9999)
  private String number;

  public Telephone(Long id, String area, String pre, String number) {
    this.id = id;
    this.area = area;
    this.pre = pre;
    this.number = number;
  }
}
