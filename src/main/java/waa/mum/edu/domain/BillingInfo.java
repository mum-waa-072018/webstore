package waa.mum.edu.domain;

import java.io.Serializable;

import javax.validation.Valid;

public class BillingInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Valid
	private Card card;

	@Valid
	private Address billingAddress;
	
	public BillingInfo() {
		card = new Card();
		billingAddress = new Address();
	}

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}

	public Address getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(Address billingAddress) {
		this.billingAddress = billingAddress;
	}

}
