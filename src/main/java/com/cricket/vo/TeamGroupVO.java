package com.cricket.vo;

import java.util.ArrayList;
import java.util.List;

public class TeamGroupVO {

	private Long uuid;
	private String name;
	private List<TournamentVO> tournamentList = new ArrayList<>();
	private List<TeamVO> teamList = new ArrayList<>();

	public Long getUuid() {
		return uuid;
	}

	public void setUuid(Long uuid) {
		this.uuid = uuid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<TournamentVO> getTournamentList() {
		return tournamentList;
	}

	public void setTournamentList(List<TournamentVO> tournamentList) {
		this.tournamentList = tournamentList;
	}

	public List<TeamVO> getTeamList() {
		return teamList;
	}

	public void setTeamList(List<TeamVO> teamList) {
		this.teamList = teamList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((teamList == null) ? 0 : teamList.hashCode());
		result = prime * result + ((tournamentList == null) ? 0 : tournamentList.hashCode());
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
		TeamGroupVO other = (TeamGroupVO) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (teamList == null) {
			if (other.teamList != null)
				return false;
		} else if (!teamList.equals(other.teamList))
			return false;
		if (tournamentList == null) {
			if (other.tournamentList != null)
				return false;
		} else if (!tournamentList.equals(other.tournamentList))
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
		return "TeamGroup [uuid=" + uuid + ", name=" + name + ", tournamentList=" + tournamentList + ", teamList="
				+ teamList + "]";
	}


}
