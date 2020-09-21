package com.cricket.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;

public class TournamentVO {

	private Long uuid;
	private String tournamentName;
	private String place;
	private String organiser;
	private String tournamentType;
	private Date startDate;
	private Date endDate;

	private List<TeamGroupVO> teamGroupList = new ArrayList<>();
	private List<Long> teamIdList = new ArrayList<>();
	public Long getUuid() {
		return uuid;
	}
	public void setUuid(Long uuid) {
		this.uuid = uuid;
	}
	public String getTournamentName() {
		return tournamentName;
	}
	public void setTournamentName(String tournamentName) {
		this.tournamentName = tournamentName;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getOrganiser() {
		return organiser;
	}
	public void setOrganiser(String organiser) {
		this.organiser = organiser;
	}
	public String getTournamentType() {
		return tournamentType;
	}
	public void setTournamentType(String tournamentType) {
		this.tournamentType = tournamentType;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public List<TeamGroupVO> getTeamGroupList() {
		return teamGroupList;
	}
	public void setTeamGroupList(List<TeamGroupVO> teamGroupList) {
		this.teamGroupList = teamGroupList;
	}
	public List<Long> getTeamIdList() {
		return teamIdList;
	}
	public void setTeamIdList(List<Long> teamIdLists) {
		this.teamIdList = teamIdList;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + ((organiser == null) ? 0 : organiser.hashCode());
		result = prime * result + ((place == null) ? 0 : place.hashCode());
		result = prime * result + ((teamIdList == null) ? 0 : teamIdList.hashCode());
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
		result = prime * result + ((teamGroupList == null) ? 0 : teamGroupList.hashCode());
		result = prime * result + ((tournamentName == null) ? 0 : tournamentName.hashCode());
		result = prime * result + ((tournamentType == null) ? 0 : tournamentType.hashCode());
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
		TournamentVO other = (TournamentVO) obj;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (organiser == null) {
			if (other.organiser != null)
				return false;
		} else if (!organiser.equals(other.organiser))
			return false;
		if (place == null) {
			if (other.place != null)
				return false;
		} else if (!place.equals(other.place))
			return false;
		if (teamIdList == null) {
			if (other.teamIdList != null)
				return false;
		} else if (!teamIdList.equals(other.teamIdList))
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		if (teamGroupList == null) {
			if (other.teamGroupList != null)
				return false;
		} else if (!teamGroupList.equals(other.teamGroupList))
			return false;
		if (tournamentName == null) {
			if (other.tournamentName != null)
				return false;
		} else if (!tournamentName.equals(other.tournamentName))
			return false;
		if (tournamentType == null) {
			if (other.tournamentType != null)
				return false;
		} else if (!tournamentType.equals(other.tournamentType))
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
		return "TournamentVO [uuid=" + uuid + ", tournamentName=" + tournamentName + ", place=" + place + ", organiser="
				+ organiser + ", tournamentType=" + tournamentType + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", teamGroupList=" + teamGroupList + ", playerIdList=" + teamIdList + "]";
	}
	

}
