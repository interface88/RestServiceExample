package com.cricket.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "csn_player")
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

	@Column(name = "BATSMAN")
	private String batsman;

	@Column(name = "NON_STRIKER_BATSMAN")
	private String nonStrikeBatsman;

	@Column(name = "BATSMAN_RUN")
	private Integer batsmanRun;

	@Column(name = "EXTRA_RUNS")
	private Integer extraRuns;

	@Column(name = "TOTAL_RUNS")
	private Integer totalRuns;

	@Column(name = "EXTRA_TYPE")
	private Integer extraType;

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

	public String getNonStrikeBatsman() {
		return nonStrikeBatsman;
	}

	public void setNonStrikeBatsman(String nonStrikeBatsman) {
		this.nonStrikeBatsman = nonStrikeBatsman;
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

	public Integer getExtraType() {
		return extraType;
	}

	public void setExtraType(Integer extraType) {
		this.extraType = extraType;
	}
}
