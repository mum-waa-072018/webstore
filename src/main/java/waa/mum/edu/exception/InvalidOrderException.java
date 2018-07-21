package waa.mum.edu.exception;

public class InvalidOrderException extends RuntimeException {

	private static final long serialVersionUID = -5192041563033358491L;
	private Long orderId;

	public InvalidOrderException(Long orderId) {
		this.orderId = orderId;
	}

	public Long getOrderId() {
		return orderId;
	}
}
