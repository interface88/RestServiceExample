package com.cricket.common;

import java.util.HashMap;
import java.util.Map;

// TODO: Auto-generated Javadoc
/**
 * The Class DropDownUtil.
 *
 * @author rajesh
 */
public class DropDownUtil {


	/**
	 * Gets the player role list.
	 *
	 * @return the player role list
	 */
	public static Map<String,String> getPlayerRoleList() {
		Map<String,String> playerRoleList = new HashMap<String, String>();
		playerRoleList.put("Batsman","Batsman");
		playerRoleList.put("Bowler","Bowler");
		playerRoleList.put("WK-Batsman","WK-Batsman");
		playerRoleList.put("Batting Allrounder","Batting Allrounder");
		playerRoleList.put("Batting Allrounder","Batting Allrounder");
		return playerRoleList;

	}

	/**
	 * Gets the batting style list.
	 *
	 * @return the batting style list
	 */
	public static Map<String,String> getBowlingStyleList() {
		Map<String,String> bowlingStyleList = new HashMap<String, String>();
		bowlingStyleList.put("Right-arm fast-medium","Right-arm fast-medium");
		bowlingStyleList.put("Right-arm medium-fast","Right-arm medium-fast");
		bowlingStyleList.put("Right-arm medium","Right-arm medium");
		bowlingStyleList.put("Right-arm medium-slow","Right-arm medium-slow");
		bowlingStyleList.put("Right-arm slow-medium","Right-arm slow-medium");
		bowlingStyleList.put("Right-arm slow","Right-arm slow");
		bowlingStyleList.put("Left-arm fast-medium","Left-arm fast-medium");
		bowlingStyleList.put("Left-arm medium-fast","Left-arm medium-fast");
		bowlingStyleList.put("Left-arm medium","Left-arm medium");
		bowlingStyleList.put("Left-arm medium-slow","Left-arm medium-slow");
		bowlingStyleList.put("Left-arm slow-medium","Left-arm slow-medium");
		bowlingStyleList.put("Left-arm slow","Left-arm slow");
		bowlingStyleList.put("Right-arm Off break","Right-arm Off break");
		bowlingStyleList.put("Right-arm leg break","Right-arm leg break");
		bowlingStyleList.put("Slow left-arm orthodox","Slow left-arm orthodox");
		bowlingStyleList.put("Slow left-arm wrist spin","Slow left-arm wrist spin");
		return bowlingStyleList;

	}

	/**
	 * Gets the bowling style list.
	 *
	 * @return the bowling style list
	 */
	public static Map<String,String> getBattingStyleList() {
		Map<String,String> battingStyleList = new HashMap<String, String>();
		battingStyleList.put("Right-handed","Right-handed");
		battingStyleList.put("Left-handed","Left-handed");
		return battingStyleList;

	}
}
