package com.cricket.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

@Entity
@Table(name="csc_player_role")
@Where(clause="coalesce(is_deleted,0)<>1")
public class PlayerRole implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UUID")
	private Long uuid;
	
	@Column(name = "PLAYER_ROLE_NAME")
	private String playerRoleName;
	
	@Column(name = "IS_DELETED")
	private boolean isdeleted;
	
	public Long getUuid() {
		return uuid;
	}
	public void setUuid(Long uuid) {
		this.uuid = uuid;
	}
	public String getPlayerRoleName() {
		return playerRoleName;
	}
	public void setPlayerRoleName(String playerRoleName) {
		this.playerRoleName = playerRoleName;
	}
	public boolean isIsdeleted() {
		return isdeleted;
	}
	public void setIsdeleted(boolean isdeleted) {
		this.isdeleted = isdeleted;
	}
	
	

}
