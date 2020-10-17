package com.cricket.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "csn_bowler_match_dtls")
public class BowlerMatchDtls implements Serializable {

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

	@Column(name = "OVERS")
	private Double overs;

	@Column(name = "MAIDEN")
	private Integer maiden;

	@Column(name = "WICKETS")
	private Integer wickets;

	@Column(name = "ECONOMY_RATE")
	private Double economyRate;

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

	public Double getOvers() {
		return overs;
	}

	public void setOvers(Double overs) {
		this.overs = overs;
	}

	public Integer getMaiden() {
		return maiden;
	}

	public void setMaiden(Integer maiden) {
		this.maiden = maiden;
	}

	public Integer getWickets() {
		return wickets;
	}

	public void setWickets(Integer wickets) {
		this.wickets = wickets;
	}

	public Double getEconomyRate() {
		return economyRate;
	}

	public void setEconomyRate(Double economyRate) {
		this.economyRate = economyRate;
	}

}
