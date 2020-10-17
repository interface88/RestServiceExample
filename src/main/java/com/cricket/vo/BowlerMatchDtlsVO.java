package com.cricket.vo;

import java.io.Serializable;

public class BowlerMatchDtlsVO implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -3417937326321024815L;
	private Long uuid;
	private Long matchUuid;
	private Long playerUuid;
	private String playerName;
	private Integer runs;
	private Integer balls;
	private Double overs;
	private Integer maiden;
	private Integer wickets;
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
