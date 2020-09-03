package com.cricket.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="csc_batting_style")
public class BattingStyle implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UUID")
	private Long uuid;
	
	@Column(name = "BATTING_STYLE_NAME")
	private String battingStyleName;
	
	@Column(name = "IS_DELETED")
	private boolean isdeleted;
	
	public Long getUuid() {
		return uuid;
	}
	public void setUuid(Long uuid) {
		this.uuid = uuid;
	}
	public String getBattingStyleName() {
		return battingStyleName;
	}
	public void setBattingStyleName(String battingStyleName) {
		this.battingStyleName = battingStyleName;
	}
	public boolean isIsdeleted() {
		return isdeleted;
	}
	public void setIsdeleted(boolean isdeleted) {
		this.isdeleted = isdeleted;
	}
}
