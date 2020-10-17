package com.cricket.vo;

/**
 *
 * @author rajesh
 */
public class ScorebookDisplayVO {

	BatsmanMatchDtlsVO batsman;
	BatsmanMatchDtlsVO nonStriker;
	BowlerMatchDtlsVO bowler;
	MatchVO match;
	public BatsmanMatchDtlsVO getNonStriker() {
		return nonStriker;
	}
	public void setNonStriker(BatsmanMatchDtlsVO nonStriker) {
		this.nonStriker = nonStriker;
	}
	public MatchVO getMatch() {
		return match;
	}
	public void setMatch(MatchVO match) {
		this.match = match;
	}
	public BatsmanMatchDtlsVO getBatsman() {
		return batsman;
	}
	public void setBatsman(BatsmanMatchDtlsVO batsman) {
		this.batsman = batsman;
	}
	public BowlerMatchDtlsVO getBowler() {
		return bowler;
	}
	public void setBowler(BowlerMatchDtlsVO bowler) {
		this.bowler = bowler;
	}

}
