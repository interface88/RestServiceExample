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

@Entity
@Table(name = "csn_match")
public class Match implements Serializable {

	/**
	 * Scorebook.java
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UUID")
	private Long uuid;

	@ManyToOne
	@JoinColumn(name = "tournament_uuid")
	private Tournament tournament;

	@ManyToOne
	@JoinColumn(name = "team1_uuid")
	private Team team1;

	@ManyToOne
	@JoinColumn(name = "team2_uuid")
	private Team team2;

	// @ManyToOne
	// @JoinColumn(name = "group_uuid")
	// private TeamGroup teamGroup;
	@Column(name = "group_name")
	private String groupName;

	@Column(name = "match_no")
	private Long matchNo;

	@Column(name = "toss_decision")
	private String tossDecision;

	@ManyToOne
	@JoinColumn(name = "toss_winner_uuid")
	private Team tossWinnerTeam;

	@ManyToOne
	@JoinColumn(name = "match_winner_uuid")
	private Team matchWinnerTeam;

	@Column(name = "umpire_1")
	private String umpire1;

	@Column(name = "umpire_2")
	private String umpire2;

	@Column(name = "umpire_3")
	private String umpire3;

	@Column(name = "est_start_datetime")
	private String estStartDatetime;

	@Column(name = "est_end_datetime")
	private String estEndDatetime;

	@Column(name = "act_start_datetime")
	private Date actStartDatetime;

	@Column(name = "act_end_datetime")
	private Date actEndDatetime;

	@Column(name = "match_title")
	private String matchTitle;

	@Column(name = "scorer_uuid")
	private String scorerId;

	@Column(name = "overs")
	private Long overs;

	@Column(name = "player_of_match")
	private String playerOfMatch;

	@Column(name = "outcome")
	private String outcome;

	@Column(name = "first_innings_runs")
	private Integer firstInningsRuns;

	@Column(name = "second_innings_runs")
	private Integer secondInningsRuns;

	@Column(name = "first_innings_wickets")
	private Integer firstInningsWickets;

	@Column(name = "second_innings_wickets")
	private Integer secondInningsWickets;

	@Column(name = "current_inning")
	private Integer currentInning;

	@ManyToOne
	@JoinColumn(name = "FIRST_INNINGS_TEAM_UUID")
	private Team firstInningsTeam;

	@ManyToOne
	@JoinColumn(name = "SECOND_INNINGS_TEAM_UUID")
	private Team secondInningsTeam;

	@Column(name = "first_innings_overs")
	private Double firstInningsOvers;

	@Column(name = "SECOND_INNINGS_OVERS")
	private Double secondInningsOvers;

	public Long getUuid() {
		return uuid;
	}

	public void setUuid(Long uuid) {
		this.uuid = uuid;
	}

	public Tournament getTournament() {
		return tournament;
	}

	public void setTournament(Tournament tournament) {
		this.tournament = tournament;
	}

	public Team getTeam1() {
		return team1;
	}

	public void setTeam1(Team team1) {
		this.team1 = team1;
	}

	public Team getTeam2() {
		return team2;
	}

	public void setTeam2(Team team2) {
		this.team2 = team2;
	}

	public Long getMatchNo() {
		return matchNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public void setMatchNo(Long matchNo) {
		this.matchNo = matchNo;
	}

	public String getTossDecision() {
		return tossDecision;
	}

	public void setTossDecision(String tossDecision) {
		this.tossDecision = tossDecision;
	}

	public Team getTossWinnerTeam() {
		return tossWinnerTeam;
	}

	public void setTossWinnerTeam(Team tossWinnerTeam) {
		this.tossWinnerTeam = tossWinnerTeam;
	}

	public Team getMatchWinnerTeam() {
		return matchWinnerTeam;
	}

	public void setMatchWinnerTeam(Team matchWinnerTeam) {
		this.matchWinnerTeam = matchWinnerTeam;
	}

	public String getUmpire1() {
		return umpire1;
	}

	public void setUmpire1(String umpire1) {
		this.umpire1 = umpire1;
	}

	public String getUmpire2() {
		return umpire2;
	}

	public void setUmpire2(String umpire2) {
		this.umpire2 = umpire2;
	}

	public String getUmpire3() {
		return umpire3;
	}

	public void setUmpire3(String umpire3) {
		this.umpire3 = umpire3;
	}

	public String getEstStartDatetime() {
		return estStartDatetime;
	}

	public void setEstStartDatetime(String estStartDatetime) {
		this.estStartDatetime = estStartDatetime;
	}

	public String getEstEndDatetime() {
		return estEndDatetime;
	}

	public void setEstEndDatetime(String estEndDatetime) {
		this.estEndDatetime = estEndDatetime;
	}

	public Date getActStartDatetime() {
		return actStartDatetime;
	}

	public void setActStartDatetime(Date actStartDatetime) {
		this.actStartDatetime = actStartDatetime;
	}

	public Date getActEndDatetime() {
		return actEndDatetime;
	}

	public Team getSecondInningsTeam() {
		return secondInningsTeam;
	}

	public void setSecondInningsTeam(Team secondInningsTeam) {
		this.secondInningsTeam = secondInningsTeam;
	}

	public void setActEndDatetime(Date actEndDatetime) {
		this.actEndDatetime = actEndDatetime;
	}

	public String getMatchTitle() {
		return matchTitle;
	}

	public void setMatchTitle(String matchTitle) {
		this.matchTitle = matchTitle;
	}

	public String getScorerId() {
		return scorerId;
	}

	public void setScorerId(String scorerId) {
		this.scorerId = scorerId;
	}

	public Long getOvers() {
		return overs;
	}

	public void setOvers(Long overs) {
		this.overs = overs;
	}

	public String getPlayerOfMatch() {
		return playerOfMatch;
	}

	public void setPlayerOfMatch(String playerOfMatch) {
		this.playerOfMatch = playerOfMatch;
	}

	public String getOutcome() {
		return outcome;
	}

	public void setOutcome(String outcome) {
		this.outcome = outcome;
	}

	public Team getFirstInningsTeam() {
		return firstInningsTeam;
	}

	public void setFirstInningsTeam(Team firstInningsTeam) {
		this.firstInningsTeam = firstInningsTeam;
	}

	public Integer getFirstInningsRuns() {
		return firstInningsRuns;
	}

	public void setFirstInningsRuns(Integer firstInningsRuns) {
		this.firstInningsRuns = firstInningsRuns;
	}

	public Integer getSecondInningsRuns() {
		return secondInningsRuns;
	}

	public void setSecondInningsRuns(Integer secondInningsRuns) {
		this.secondInningsRuns = secondInningsRuns;
	}

	public Integer getFirstInningsWickets() {
		return firstInningsWickets;
	}

	public void setFirstInningsWickets(Integer firstInningsWickets) {
		this.firstInningsWickets = firstInningsWickets;
	}

	public Integer getSecondInningsWickets() {
		return secondInningsWickets;
	}

	public void setSecondInningsWickets(Integer secondInningsWickets) {
		this.secondInningsWickets = secondInningsWickets;
	}

	public Integer getCurrentInning() {
		return currentInning;
	}

	public void setCurrentInning(Integer currentInning) {
		this.currentInning = currentInning;
	}

	public Double getFirstInningsOvers() {
		return firstInningsOvers;
	}

	public void setFirstInningsOvers(Double firstInningsOvers) {
		this.firstInningsOvers = firstInningsOvers;
	}

	public Double getSecondInningsOvers() {
		return secondInningsOvers;
	}

	public void setSecondInningsOvers(Double secondInningsOvers) {
		this.secondInningsOvers = secondInningsOvers;
	}

}
