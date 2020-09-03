package com.cricket.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.type.TrueFalseType;

import net.bytebuddy.implementation.bind.annotation.Default;

@Entity
@Table(name="csn_player")
public class Player implements Serializable{

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
	
	@Column(name = "ADHAAR_NUMBER")
	private String adhaarNumber;
	
	
	@Column(name = "DOB") 
	private Date dob;
	
	@Column(name = "PLACE")
	private String place;
	
	@ManyToOne
	@JoinColumn(name = "PLAYER_ROLE_UUID")
	private PlayerRole playerRole;
	
	@ManyToOne
	@JoinColumn(name = "BATTING_STYLE_UUID")
	private BattingStyle battingStyle;

	@ManyToOne
	@JoinColumn(name = "BOWLING_STYLE_UUID")
	private BowlingStyle bowlingStyle;
	
	//@Column(name = "IS_DELETED", columnDefinition = "int default 0")
	//@ColumnDefault(value = "true")
	@Transient
	private Boolean isdeleted;
	
	@Column(name = "creation_date")
	@Transient
	private Date creationDate;

	public Boolean getIsdeleted() {
		return isdeleted;
	}

	public void setIsdeleted(Boolean isdeleted) {
		this.isdeleted = isdeleted;
	}

	public Long getUuid() {
		return uuid;
	}

	public void setUuid(Long uuid) {
		this.uuid = uuid;
	}

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

	public PlayerRole getPlayerRole() {
		return playerRole;
	}

	public void setPlayerRole(PlayerRole playerRole) {
		this.playerRole = playerRole;
	}

	public BattingStyle getBattingStyle() {
		return battingStyle;
	}

	public void setBattingStyle(BattingStyle battingStyle) {
		this.battingStyle = battingStyle;
	}

	public BowlingStyle getBowlingStyle() {
		return bowlingStyle;
	}

	public void setBowlingStyle(BowlingStyle bowlingStyle) {
		this.bowlingStyle = bowlingStyle;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

}
