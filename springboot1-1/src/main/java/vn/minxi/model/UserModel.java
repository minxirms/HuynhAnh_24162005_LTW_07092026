package vn.minxi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String role;

	private Boolean isEdit = false;

	public Object getIsEdit() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setIsEdit(boolean b) {
		// TODO Auto-generated method stub
		
	}

	public void setRole(String string) {
		// TODO Auto-generated method stub
		
	}
}