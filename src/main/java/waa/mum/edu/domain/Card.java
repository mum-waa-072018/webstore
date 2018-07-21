package waa.mum.edu.domain;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Card implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
 	private long id;
	
	@NotNull(message = "{Empty.Card.Field}")
	@Range(min = 1000000000000000L, max = 9999999999999999L, message = "{Range.Card.Field}")
	private Long number;

	@NotEmpty(message = "{Empty.Card.Field}")
	private String name;

	@NotNull(message = "{Empty.Card.Field}")
	@Range(min = 100, max = 999, message = "{Range.Card.Field}")
	private Integer ccv;

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCcv() {
		return ccv;
	}

	public void setCcv(Integer ccv) {
		this.ccv = ccv;
	}
}
