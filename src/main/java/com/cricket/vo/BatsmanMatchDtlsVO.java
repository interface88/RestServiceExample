package com.cricket.vo;

import java.io.Serializable;

public class BatsmanMatchDtlsVO implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -1091589345615716665L;

	private Long uuid;

	private Long matchUuid;

	private Long playerUuid;

	private String playerName;

	private Integer runs;

	private Integer balls;

	private Integer fours;

	private Integer sixes;

	private Integer zeroes;

	private double strikeRate;

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
