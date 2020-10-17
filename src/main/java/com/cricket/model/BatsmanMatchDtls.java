package com.cricket.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "csn_batsman_match_dtls")
public class BatsmanMatchDtls implements Serializable {

	/**
	 * Scorebook.java
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UUID")
	private Long uuid;

	@Column(name = "MATCH_UUID")
	private Long matchUuid;

	@Column(name = "PLAYER_UUID")
	private Long playerUuid;

	@Column(name = "PLAYER_NAME")
	private String playerName;

	@Column(name = "RUNS")
	private Integer runs;

	@Column(name = "BALLS")
	private Integer balls;

	@Column(name = "4s")
	private Integer fours;

	@Column(name = "6s")
	private Integer sixes;

	@Column(name = "0s")
	private Integer zeroes;

	@Column(name = "STRIKE_RATE")
	private double strikeRate;

	@Column(name = "IS_OUT")
	private int isOut;

	public Long getUuid() {
		return uuid;
	}

	public void setUuid(Long uuid) {
		this.uuid = uuid;
	}

	public Long getMatchUuid() {
		return matchUuid;
	}

	public void setMatchUuid(Long matchUuid) {
		this.matchUuid = matchUuid;
	}

	public Long getPlayerUuid() {
		return playerUuid;
	}

	public void setPlayerUuid(Long playerUuid) {
		this.playerUuid = playerUuid;
	}

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public Integer getRuns() {
		return runs;
	}

	public void setRuns(Integer runs) {
		this.runs = runs;
	}

	public Integer getBalls() {
		return balls;
	}

	public void setBalls(Integer balls) {
		this.balls = balls;
	}

	public Integer getFours() {
		return fours;
	}

	public void setFours(Integer fours) {
		this.fours = fours;
	}

	public Integer getSixes() {
		return sixes;
	}

	public void setSixes(Integer sixes) {
		this.sixes = sixes;
	}

	public Integer getZeroes() {
		return zeroes;
	}

	public void setZeroes(Integer zeroes) {
		this.zeroes = zeroes;
	}

	public double getStrikeRate() {
		return strikeRate;
	}

	public void setStrikeRate(double strikeRate) {
		this.strikeRate = strikeRate;
	}

	public int getIsOut() {
		return isOut;
	}

	public void setIsOut(int isOut) {
		this.isOut = isOut;
	}

}
