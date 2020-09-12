package com.cricket.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "csn_player")
public class Player implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UUID")
	private Long uuid;

	@Column(name = "PLAYER_NAME")
	private String playerName;

	@Column(name = "MOBILE")
	private String mobile;

	@Column(name = "ADHAAR_NUMBER")
	private String adhaarNumber;

	@Column(name = "DOB")
	private Date dob;

	@Column(name = "PLACE")
	private String place;

	@Column(name = "PLAYER_ROLE")
	private String playerRole;

	@Column(name = "BATTING_STYLE")
	private String battingStyle;

	@Column(name = "BOWLING_STYLE")
	private String bowlingStyle;

	// @Column(name = "IS_DELETED", columnDefinition = "int default 0")
	// @ColumnDefault(value = "true")
	@Transient
	private Boolean isdeleted;

	@Column(name = "creation_date")
	@Transient
	private Date creationDate;

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public String getAdhaarNumber() {
		return adhaarNumber;
	}

	public void setAdhaarNumber(String adhaarNumber) {
		this.adhaarNumber = adhaarNumber;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getPlayerRole() {
		return playerRole;
	}

	public void setPlayerRole(String playerRole) {
		this.playerRole = playerRole;
	}

	public String getBattingStyle() {
		return battingStyle;
	}

	public void setBattingStyle(String battingStyle) {
		this.battingStyle = battingStyle;
	}

	public String getBowlingStyle() {
		return bowlingStyle;
	}

	public void setBowlingStyle(String bowlingStyle) {
		this.bowlingStyle = bowlingStyle;
	}

	public Boolean getIsdeleted() {
		return isdeleted;
	}

	public void setIsdeleted(Boolean isdeleted) {
		this.isdeleted = isdeleted;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public Long getUuid() {
		return uuid;
	}

	public void setUuid(Long uuid) {
		this.uuid = uuid;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}
