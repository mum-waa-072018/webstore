package waa.mum.edu.domain;


public class JsonResponse {
    private String status = null;
    private Object result = null;
    private String type = null;
    public String getStatus() {
            return status;
    }
    public void setStatus(String status) {
            this.status = status;
    }
    public Object getResult() {
            return result;
    }
    public void setResult(Object result) {
            this.result = result;
    }
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
    

}
