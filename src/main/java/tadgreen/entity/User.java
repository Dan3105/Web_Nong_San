package tadgreen.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToOne;

@Entity
public class User {
	@Id
	private String userID;
	private String lastName;
	private String firstName;
	private String email;
	private String phoneNumber;
	@Lob
	private byte[] avatar;
	private boolean state;
	private String password;
	@OneToOne(mappedBy="ShopSystem")
	private ShopSystem shopID;
}
