package com.cricket.vo;

import java.util.ArrayList;
import java.util.List;

public class ScheduleVO {

	//private Long uuid;
	private Long tournamentUuid;
	private String tournamentName;
	private List<MatchVO> matchVOList = new ArrayList<MatchVO>();

	/*
	 * public Long getUuid() { return uuid; } public void setUuid(Long uuid) {
	 * this.uuid = uuid; }
	 */
	public Long getTournamentUuid() {
		return tournamentUuid;
	}
	public void setTournamentUuid(Long tournamentUuid) {
		this.tournamentUuid = tournamentUuid;
	}
	public String getTournamentName() {
		return tournamentName;
	}
	public void setTournamentName(String tournamentName) {
		this.tournamentName = tournamentName;
	}
	public List<MatchVO> getMatchVOList() {
		return matchVOList;
	}
	public void setMatchVOList(List<MatchVO> matchVOList) {
		this.matchVOList = matchVOList;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((matchVOList == null) ? 0 : matchVOList.hashCode());
		result = prime * result + ((tournamentName == null) ? 0 : tournamentName.hashCode());
		result = prime * result + ((tournamentUuid == null) ? 0 : tournamentUuid.hashCode());
		//result = prime * result + ((uuid == null) ? 0 : uuid.hashCode());
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
		ScheduleVO other = (ScheduleVO) obj;
		if (matchVOList == null) {
			if (other.matchVOList != null)
				return false;
		} else if (!matchVOList.equals(other.matchVOList))
			return false;
		if (tournamentName == null) {
			if (other.tournamentName != null)
				return false;
		} else if (!tournamentName.equals(other.tournamentName))
			return false;
		if (tournamentUuid == null) {
			if (other.tournamentUuid != null)
				return false;
		} else if (!tournamentUuid.equals(other.tournamentUuid))
			return false;
		/*
		 * if (uuid == null) { if (other.uuid != null) return false; } else if
		 * (!uuid.equals(other.uuid)) return false;
		 */
		return true;
	}
	@Override
	public String toString() {
		return "ScheduleVO [ tournamentUuid=" + tournamentUuid + ", tournamentName=" + tournamentName //uuid=" + uuid + ",
				+ ", matchVOList=" + matchVOList + "]";
	}
	
	
	

}
