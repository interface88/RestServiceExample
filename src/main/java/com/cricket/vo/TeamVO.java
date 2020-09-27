package com.cricket.vo;

import java.util.ArrayList;
import java.util.List;

public class TeamVO {

	private Long uuid;
	private String name;
	private String place;
	private List<PlayerVO> playerList = new ArrayList<>();
	private List<Long> playerIdList = new ArrayList<>();

	private Long groupUuid;

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

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public List<PlayerVO> getPlayerList() {
		return playerList;
	}

	public void setPlayerList(List<PlayerVO> playerList) {
		this.playerList = playerList;
	}

	public List<Long> getPlayerIdList() {
		return playerIdList;
	}

	public void setPlayerIdList(List<Long> playerIdList) {
		this.playerIdList = playerIdList;
	}

	public Long getGroupUuid() {
		return groupUuid;
	}

	public void setGroupUuid(Long groupUuid) {
		this.groupUuid = groupUuid;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((groupUuid == null) ? 0 : groupUuid.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((place == null) ? 0 : place.hashCode());
		result = prime * result + ((playerIdList == null) ? 0 : playerIdList.hashCode());
		result = prime * result + ((playerList == null) ? 0 : playerList.hashCode());
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
		TeamVO other = (TeamVO) obj;
		if (groupUuid == null) {
			if (other.groupUuid != null)
				return false;
		} else if (!groupUuid.equals(other.groupUuid))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (place == null) {
			if (other.place != null)
				return false;
		} else if (!place.equals(other.place))
			return false;
		if (playerIdList == null) {
			if (other.playerIdList != null)
				return false;
		} else if (!playerIdList.equals(other.playerIdList))
			return false;
		if (playerList == null) {
			if (other.playerList != null)
				return false;
		} else if (!playerList.equals(other.playerList))
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
		return "TeamVO [uuid=" + uuid + ", name=" + name + ", place=" + place + ", playerList=" + playerList
				+ ", playerIdList=" + playerIdList + ", groupUuid=" + groupUuid + "]";
	}
	
}
