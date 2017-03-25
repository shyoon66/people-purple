package purple.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_party")
public class Party implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="sq_party")
	private long oid;
	private String id;
	private String nick_name;
	private String email;
	private String kind;
	private String location;
	private int total_number;
	private String title;
	private String content;
	private String coordinates;
	
	public Party() {}
	
	public long getOid() {
		return oid;
	}
	
	public void setOid(long oid) {
		this.oid = oid;
	}
	
	public String id() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getNick_name() {
		return nick_name;
	}
	
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getKind() {
		return kind;
	}
	
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public int getTotal_number() {
		return total_number;
	}
	
	public void setTotal_number(int total_number) {
		this.total_number = total_number;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCoordinates() {
		return coordinates;
	}
	
	public void setCoordinates(String coordinates) {
		this.coordinates = coordinates;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
