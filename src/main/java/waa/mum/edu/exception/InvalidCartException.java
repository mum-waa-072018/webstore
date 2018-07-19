package waa.mum.edu.exception;

public class InvalidCartException extends RuntimeException {

	private static final long serialVersionUID = -5192041563033358491L;
	private Long cartId;

	public InvalidCartException(Long cartId) {
		this.cartId = cartId;
	}

	public Long getCartId() {
		return cartId;
	}
}
