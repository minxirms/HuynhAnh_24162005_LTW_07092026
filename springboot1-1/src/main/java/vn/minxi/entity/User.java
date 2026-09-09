package vn.minxi.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "username", nullable = false, unique = true, length = 100)
	private String username;

	@Column(name = "password", nullable = false, length = 100)
	private String password;

	@Column(name = "fullname", columnDefinition = "NVARCHAR(255) NULL")
	private String fullname;

	@Column(name = "email", length = 255)
	private String email;

	@Column(name = "role", length = 50)
	private String role = "USER";
}