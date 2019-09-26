package com.internousdev.olive.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.olive.dao.UserInfoDAO;
import com.internousdev.olive.dto.UserInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware {
	UserInfoDTO userInfoDTO;
	private Map<String,Object> session;

	public String execute(){
		/*「"tempUserId"」、「"userId"」が存在しない場合はセッションタイムアウトを返す*/
		if(!session.containsKey("tempUserId") && !session.containsKey("userId")){
			return "sessionTimeout";
		}

		/*非ログイン時はセッションタイムアウトを返す*/
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		int logined = Integer.parseInt(String.valueOf(session.get("logined")));
		if(logined!=1){
			return "sessionTimeout";
		}

		userInfoDTO = userInfoDAO.getUserInfo(String.valueOf(session.get("userId")));

		if(userInfoDTO.getUserId() == null){
			userInfoDTO = null;
		}
		return SUCCESS;
	}
	public UserInfoDTO getUserInfoDTO(){
		return userInfoDTO;
	}
	public void setUserInfoDTO(UserInfoDTO userInfoDTO){
		this.userInfoDTO = userInfoDTO;
	}
	public Map<String,Object> getSession(){
		return session;
	}
	public void setSession(Map<String,Object> session){
		this.session = session;
	}
}
