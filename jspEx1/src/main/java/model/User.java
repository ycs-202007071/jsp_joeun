package model;

public class User {
	private String name;
	private String userId;
	private String status;

	public User(String name) {
		this.name = name;
	}

	public User(String userId, String name, String status) {
		this.userId = userId;
		this.name = name;
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public String getUserId() {
		return userId;
	}

	public String getStatus() {
		return status;
	}
}