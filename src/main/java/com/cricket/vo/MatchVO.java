package com.cricket.vo;

import java.util.Date;

public class MatchVO {

	private Long uuid;
	private Long tournamentUuid;
	private Long team1Uuid;
	private Long team2Uuid;
	private Long teamGroupUuid;
	private Long matchNo;
	private String tossDecision;
	private Long tossWinnerTeamUuid;
	private Long matchWinnerTeamUuid;
	private String umpire1;
	private String umpire2;
	private String umpire3;
	private String estStartDatetime;
	private String estEndDatetime;
	private Date actStartDatetime;
	private Date actEndDatetime;
	private String matchTitle;
	private String scorerId;
	private Long overs;
	private String playerOfMatch;
	private String outcome;

	private String team1Name;
	private String team2Name;
	private String teamGroupName;

	private Integer firstInningsRuns;
	private Integer secondInningsRuns;
	private Integer firstInningsWickets;
	private Integer secondInningsWickets;
	private Integer currentInning;
	private String firstInningsTeam;
	private String secondInningsTeam;

	private Double firstInningsOvers;
	private Double secondInningsOvers;

	public Long getUuid() {
		return uuid;
	}
	public void setUuid(Long uuid) {
		this.uuid = uuid;
	}
	public Long getTournamentUuid() {
		return tournamentUuid;
	}
	public void setTournamentUuid(Long tournamentUuid) {
		this.tournamentUuid = tournamentUuid;
	}
	public Long getTeam1Uuid() {
		return team1Uuid;
	}
	public void setTeam1Uuid(Long team1Uuid) {
		this.team1Uuid = team1Uuid;
	}
	public Long getTeam2Uuid() {
		return team2Uuid;
	}
	public void setTeam2Uuid(Long team2Uuid) {
		this.team2Uuid = team2Uuid;
	}
	public Long getTeamGroupUuid() {
		return teamGroupUuid;
	}
	public void setTeamGroupUuid(Long teamGroupUuid) {
		this.teamGroupUuid = teamGroupUuid;
	}
	public Long getMatchNo() {
		return matchNo;
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
	public Long getTossWinnerTeamUuid() {
		return tossWinnerTeamUuid;
	}
	public void setTossWinnerTeamUuid(Long tossWinnerTeamUuid) {
		this.tossWinnerTeamUuid = tossWinnerTeamUuid;
	}
	public Long getMatchWinnerTeamUuid() {
		return matchWinnerTeamUuid;
	}
	public void setMatchWinnerTeamUuid(Long matchWinnerTeamUuid) {
		this.matchWinnerTeamUuid = matchWinnerTeamUuid;
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
	public String getTeam1Name() {
		return team1Name;
	}
	public void setTeam1Name(String team1Name) {
		this.team1Name = team1Name;
	}
	public String getTeam2Name() {
		return team2Name;
	}
	public void setTeam2Name(String team2Name) {
		this.team2Name = team2Name;
	}
	public String getTeamGroupName() {
		return teamGroupName;
	}
	public void setTeamGroupName(String teamGroupName) {
		this.teamGroupName = teamGroupName;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((actEndDatetime == null) ? 0 : actEndDatetime.hashCode());
		result = prime * result + ((actStartDatetime == null)
				? 0
				: actStartDatetime.hashCode());
		result = prime * result
				+ ((estEndDatetime == null) ? 0 : estEndDatetime.hashCode());
		result = prime * result + ((estStartDatetime == null)
				? 0
				: estStartDatetime.hashCode());
		result = prime * result + ((matchNo == null) ? 0 : matchNo.hashCode());
		result = prime * result
				+ ((matchTitle == null) ? 0 : matchTitle.hashCode());
		result = prime * result + ((matchWinnerTeamUuid == null)
				? 0
				: matchWinnerTeamUuid.hashCode());
		result = prime * result + ((outcome == null) ? 0 : outcome.hashCode());
		result = prime * result + ((overs == null) ? 0 : overs.hashCode());
		result = prime * result
				+ ((playerOfMatch == null) ? 0 : playerOfMatch.hashCode());
		result = prime * result
				+ ((scorerId == null) ? 0 : scorerId.hashCode());
		result = prime * result
				+ ((team1Name == null) ? 0 : team1Name.hashCode());
		result = prime * result
				+ ((team1Uuid == null) ? 0 : team1Uuid.hashCode());
		result = prime * result
				+ ((team2Name == null) ? 0 : team2Name.hashCode());
		result = prime * result
				+ ((team2Uuid == null) ? 0 : team2Uuid.hashCode());
		result = prime * result
				+ ((teamGroupName == null) ? 0 : teamGroupName.hashCode());
		result = prime * result
				+ ((teamGroupUuid == null) ? 0 : teamGroupUuid.hashCode());
		result = prime * result
				+ ((tossDecision == null) ? 0 : tossDecision.hashCode());
		result = prime * result + ((tossWinnerTeamUuid == null)
				? 0
				: tossWinnerTeamUuid.hashCode());
		result = prime * result
				+ ((tournamentUuid == null) ? 0 : tournamentUuid.hashCode());
		result = prime * result + ((umpire1 == null) ? 0 : umpire1.hashCode());
		result = prime * result + ((umpire2 == null) ? 0 : umpire2.hashCode());
		result = prime * result + ((umpire3 == null) ? 0 : umpire3.hashCode());
		result = prime * result + ((uuid == null) ? 0 : uuid.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MatchVO other = (MatchVO) obj;
		if (actEndDatetime == null) {
			if (other.actEndDatetime != null)
				return false;
		} else if (!actEndDatetime.equals(other.actEndDatetime))
			return false;
		if (actStartDatetime == null) {
			if (other.actStartDatetime != null)
				return false;
		} else if (!actStartDatetime.equals(other.actStartDatetime))
			return false;
		if (estEndDatetime == null) {
			if (other.estEndDatetime != null)
				return false;
		} else if (!estEndDatetime.equals(other.estEndDatetime))
			return false;
		if (estStartDatetime == null) {
			if (other.estStartDatetime != null)
				return false;
		} else if (!estStartDatetime.equals(other.estStartDatetime))
			return false;
		if (matchNo == null) {
			if (other.matchNo != null)
				return false;
		} else if (!matchNo.equals(other.matchNo))
			return false;
		if (matchTitle == null) {
			if (other.matchTitle != null)
				return false;
		} else if (!matchTitle.equals(other.matchTitle))
			return false;
		if (matchWinnerTeamUuid == null) {
			if (other.matchWinnerTeamUuid != null)
				return false;
		} else if (!matchWinnerTeamUuid.equals(other.matchWinnerTeamUuid))
			return false;
		if (outcome == null) {
			if (other.outcome != null)
				return false;
		} else if (!outcome.equals(other.outcome))
			return false;
		if (overs == null) {
			if (other.overs != null)
				return false;
		} else if (!overs.equals(other.overs))
			return false;
		if (playerOfMatch == null) {
			if (other.playerOfMatch != null)
				return false;
		} else if (!playerOfMatch.equals(other.playerOfMatch))
			return false;
		if (scorerId == null) {
			if (other.scorerId != null)
				return false;
		} else if (!scorerId.equals(other.scorerId))
			return false;
		if (team1Name == null) {
			if (other.team1Name != null)
				return false;
		} else if (!team1Name.equals(other.team1Name))
			return false;
		if (team1Uuid == null) {
			if (other.team1Uuid != null)
				return false;
		} else if (!team1Uuid.equals(other.team1Uuid))
			return false;
		if (team2Name == null) {
			if (other.team2Name != null)
				return false;
		} else if (!team2Name.equals(other.team2Name))
			return false;
		if (team2Uuid == null) {
			if (other.team2Uuid != null)
				return false;
		} else if (!team2Uuid.equals(other.team2Uuid))
			return false;
		if (teamGroupName == null) {
			if (other.teamGroupName != null)
				return false;
		} else if (!teamGroupName.equals(other.teamGroupName))
			return false;
		if (teamGroupUuid == null) {
			if (other.teamGroupUuid != null)
				return false;
		} else if (!teamGroupUuid.equals(other.teamGroupUuid))
			return false;
		if (tossDecision == null) {
			if (other.tossDecision != null)
				return false;
		} else if (!tossDecision.equals(other.tossDecision))
			return false;
		if (tossWinnerTeamUuid == null) {
			if (other.tossWinnerTeamUuid != null)
				return false;
		} else if (!tossWinnerTeamUuid.equals(other.tossWinnerTeamUuid))
			return false;
		if (tournamentUuid == null) {
			if (other.tournamentUuid != null)
				return false;
		} else if (!tournamentUuid.equals(other.tournamentUuid))
			return false;
		if (umpire1 == null) {
			if (other.umpire1 != null)
				return false;
		} else if (!umpire1.equals(other.umpire1))
			return false;
		if (umpire2 == null) {
			if (other.umpire2 != null)
				return false;
		} else if (!umpire2.equals(other.umpire2))
			return false;
		if (umpire3 == null) {
			if (other.umpire3 != null)
				return false;
		} else if (!umpire3.equals(other.umpire3))
			return false;
		if (uuid == null) {
			if (other.uuid != null)
				return false;
		} else if (!uuid.equals(other.uuid))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "MatchVO [uuid=" + uuid + ", tournamentUuid=" + tournamentUuid
				+ ", team1Uuid=" + team1Uuid + ", team2Uuid=" + team2Uuid
				+ ", teamGroupUuid=" + teamGroupUuid + ", matchNo=" + matchNo
				+ ", tossDecision=" + tossDecision + ", tossWinnerTeamUuid="
				+ tossWinnerTeamUuid + ", matchWinnerTeamUuid="
				+ matchWinnerTeamUuid + ", umpire1=" + umpire1 + ", umpire2="
				+ umpire2 + ", umpire3=" + umpire3 + ", estStartDatetime="
				+ estStartDatetime + ", estEndDatetime=" + estEndDatetime
				+ ", actStartDatetime=" + actStartDatetime + ", actEndDatetime="
				+ actEndDatetime + ", matchTitle=" + matchTitle + ", scorerId="
				+ scorerId + ", overs=" + overs + ", playerOfMatch="
				+ playerOfMatch + ", outcome=" + outcome + ", team1Name="
				+ team1Name + ", team2Name=" + team2Name + ", teamGroupName="
				+ teamGroupName + "]";
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
	public String getFirstInningsTeam() {
		return firstInningsTeam;
	}
	public void setFirstInningsTeam(String firstInningsTeam) {
		this.firstInningsTeam = firstInningsTeam;
	}
	public String getSecondInningsTeam() {
		return secondInningsTeam;
	}
	public void setSecondInningsTeam(String secondInningsTeam) {
		this.secondInningsTeam = secondInningsTeam;
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
