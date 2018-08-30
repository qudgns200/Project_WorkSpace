package Model;

public class follow {

	private String follower;
	private String following;
	
	public String getFollower() {
		return follower;
	}
	public void setFollower(String follower) {
		this.follower = follower;
	}
	public String getFollowing() {
		return following;
	}
	public void setFollowing(String following) {
		this.following = following;
	}
	@Override
	public String toString() {
		return "follow [follower=" + follower + ", following=" + following + "]";
	}
	
	
	
	
}
