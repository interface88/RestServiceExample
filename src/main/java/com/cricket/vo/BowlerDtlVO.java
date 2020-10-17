package com.cricket.vo;

public class BowlerDtlVO {

	// bowler [name , over, maiden, run , wicket , economy_rate ]
	private String name;
	private Integer overs;
	private Integer maiden;
	private Integer runs;
	private Integer balls;
	private Integer wickets;
	private Double economyRate;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getOvers() {
		return overs;
	}
	public void setOvers(Integer overs) {
		this.overs = overs;
	}
	public Integer getMaiden() {
		return maiden;
	}
	public void setMaiden(Integer maiden) {
		this.maiden = maiden;
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
	public Integer getWickets() {
		return wickets;
	}
	public void setWickets(Integer wickets) {
		this.wickets = wickets;
	}
	public Double getEconomyRate() {
		return economyRate;
	}
	public void setEconomyRate(Double economyRate) {
		this.economyRate = economyRate;
	}

}
