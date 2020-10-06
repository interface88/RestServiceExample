package com.cricket.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "csn_scorebook")
public class Scorebook implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UUID")
	private Long uuid;

	@Column(name = "MATCH_ID")
	private Integer matchId;

	@Column(name = "INNINGS")
	private Integer innings;

	@Column(name = "BATTING_TEAM")
	private String battingTeam;

	@Column(name = "BOWLING_TEAM")
	private String bowlingTeam;

	@Column(name = "BATSMAN")
	private String batsman;

	@Column(name = "NON_STRIKER")
	private String nonStriker;

	@Column(name = "BOWLER")
	private String bowler;

	@Column(name = "`OVER`")
	private Integer over;

	@Column(name = "BALL")
	private Double ball;

	@Column(name = "BATSMAN_RUN")
	private Integer batsmanRun;

	@Column(name = "EXTRA_TYPE")
	private String extraType;

	@Column(name = "EXTRA_RUNS")
	private Integer extraRuns;

	@Column(name = "TOTAL_RUNS")
	private Integer totalRuns;

	@Column(name = "IS_WICKET")
	private Boolean isWicket;

	@Column(name = "FIELDER")
	private String fielder;

	@Column(name = "PLAYER_OUT")
	private Boolean playerOut;

	public Long getUuid() {
		return uuid;
	}

	public void setUuid(Long uuid) {
		this.uuid = uuid;
	}

	public Integer getMatchId() {
		return matchId;
	}

	public void setMatchId(Integer matchId) {
		this.matchId = matchId;
	}

	public Integer getInnings() {
		return innings;
	}

	public void setInnings(Integer innings) {
		this.innings = innings;
	}

	public String getBatsman() {
		return batsman;
	}

	public void setBatsman(String batsman) {
		this.batsman = batsman;
	}

	public Integer getBatsmanRun() {
		return batsmanRun;
	}

	public void setBatsmanRun(Integer batsmanRun) {
		this.batsmanRun = batsmanRun;
	}

	public Integer getExtraRuns() {
		return extraRuns;
	}

	public void setExtraRuns(Integer extraRuns) {
		this.extraRuns = extraRuns;
	}

	public Integer getTotalRuns() {
		return totalRuns;
	}

	public void setTotalRuns(Integer totalRuns) {
		this.totalRuns = totalRuns;
	}

	public String getBattingTeam() {
		return battingTeam;
	}

	public void setBattingTeam(String battingTeam) {
		this.battingTeam = battingTeam;
	}

	public String getBowlingTeam() {
		return bowlingTeam;
	}

	public void setBowlingTeam(String bowlingTeam) {
		this.bowlingTeam = bowlingTeam;
	}

	public String getNonStriker() {
		return nonStriker;
	}

	public void setNonStriker(String nonStriker) {
		this.nonStriker = nonStriker;
	}

	public String getBowler() {
		return bowler;
	}

	public void setBowler(String bowler) {
		this.bowler = bowler;
	}

	public Integer getOver() {
		return over;
	}

	public void setOver(Integer over) {
		this.over = over;
	}

	public Double getBall() {
		return ball;
	}

	public void setBall(Double ball) {
		this.ball = ball;
	}

	public String getExtraType() {
		return extraType;
	}

	public void setExtraType(String extraType) {
		this.extraType = extraType;
	}

	public Boolean getIsWicket() {
		return isWicket;
	}

	public void setIsWicket(Boolean isWicket) {
		this.isWicket = isWicket;
	}

	public String getFielder() {
		return fielder;
	}

	public void setFielder(String fielder) {
		this.fielder = fielder;
	}

	public Boolean getPlayerOut() {
		return playerOut;
	}

	public void setPlayerOut(Boolean playerOut) {
		this.playerOut = playerOut;
	}

}
