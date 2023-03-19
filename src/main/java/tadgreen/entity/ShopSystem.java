package tadgreen.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToOne;

@Entity
public class ShopSystem {
	@Id
	private String shopID;
	private String name;
	@Lob
	private byte[] logoShop;
	private String email;
	@OneToOne(mappedBy="User")
	private User userID;
	
}
