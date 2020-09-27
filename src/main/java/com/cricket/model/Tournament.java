package com.cricket.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.cricket.vo.TeamGroupVO;

@Entity
@Table(name = "csn_tournament")
public class Tournament implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UUID")
	private Long uuid;
	
	@Column(name = "tournament_name")
	private String tournamentName;

	@Column(name = "place")
	private String place;

	@Column(name = "organiser")
	private String organiser;

	@Column(name = "tournament_type")
	private String tournamentType;
	
	@Column(name = "start_date")
	private Date startDate;

	@Column(name = "end_date")
	private Date endDate;

	/*
	 * @ManyToMany(cascade = {CascadeType.PERSIST}, fetch = FetchType.EAGER)
	 * 
	 * @JoinTable(name = "csn_team_group", joinColumns = {
	 * 
	 * @JoinColumn(name = "tournament_uuid")}, inverseJoinColumns = {
	 * 
	 * @JoinColumn(name = "team_uuid")})
	 */
	@OrderBy("name asc")
	@OneToMany(mappedBy = "tournament",cascade = {CascadeType.PERSIST}, fetch= FetchType.EAGER)
	private Set<TeamGroup> teamGroups = new HashSet<>();
	
	/*
	 * @Transient private List<TeamGroup> teamGroups = new ArrayList();
	 * 
	 * public List<TeamGroup> getTeamGroups() { return teamGroups; }
	 * 
	 * public void setTeamGroups(List<TeamGroup> list) { this.teamGroups = list; }
	 */	
	
	public Set<TeamGroup> getTeamGroups() {
		return teamGroups;
	}

	public void setTeamGroups(Set<TeamGroup> teamGroups) {
		this.teamGroups = teamGroups;
	}

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
	
}
