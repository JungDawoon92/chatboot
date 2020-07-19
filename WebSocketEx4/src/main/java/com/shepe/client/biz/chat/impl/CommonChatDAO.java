package com.shepe.client.biz.chat.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.biz.chat.CommonChatDTO;

@Repository
public class CommonChatDAO {
		
	@Autowired
	private SqlSessionTemplate mybatis;
			
		public List<CommonChatDTO> getChatListByID(String fromID, String toID, String chatSQ) {
			
			System.out.println("getChatListByID");
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fromID", fromID);
			map.put("toID", toID);
			map.put("fromIDr", toID);
			map.put("toIDr", fromID);
			map.put("chatSQ", Integer.parseInt(chatSQ));
			
			return mybatis.selectList("CommonChatDAO.getChatListByID", map);
		} 
		
		
		public List<CommonChatDTO> getChatListByRecent(String fromID, String toID, int number) {
			System.out.println("getChatListByRecent");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fromID", fromID);
			map.put("toID", toID);
			map.put("fromIDr", toID);
			map.put("toIDr", fromID);
			map.put("number", number);
			map.put("toIDrr", fromID);
			map.put("fromIDrr", toID);
			map.put("toIDrrr", toID);
			map.put("fromIDrrr", fromID);

			return mybatis.selectList("CommonChatDAO.getChatListByRecent", map);
		} 
		
		
		
		public List<CommonChatDTO> getBox(String userID) { // 메세지함
			System.out.println("getBox");
			List<CommonChatDTO> chatList = null;
			chatList = mybatis.selectList("CommonChatDAO.getBox", userID);
			for(int i = 0; i < chatList.size(); i++) {
				CommonChatDTO x = chatList.get(i);
				for(int j = 0; j < chatList.size(); j++) {
					CommonChatDTO y = chatList.get(j);
					if(x.getFromID().equals(y.getToID()) && x.getToID().equals(y.getFromID())) {
						if(x.getChatSQ() < y.getChatSQ()) {
							chatList.remove(x);
							i--;
							break;
						} else {
							chatList.remove(y);
							j--;
						}
					}
				}
			}
			return chatList; // 리스트 반환
		} 
		
		
		public void submit(String fromID, String toID, String chatContent) {
			System.out.println("submit");
			System.out.println(fromID);
			System.out.println(toID);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fromID", fromID);
			map.put("toID", toID);
			map.put("chatContent", chatContent);
			mybatis.insert("CommonChatDAO.submit", map);
		} 
		
		public void readChat(String fromID, String toID) {
			System.out.println("readChat");
			System.out.println(fromID);
			System.out.println(toID);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fromID", toID );
			map.put("toID", fromID);
			mybatis.update("CommonChatDAO.readChat", map);
		}
		
		public int getAllUnreadChat(String userID) { // 읽지 않은 메세지를 가져오는 메소드
			System.out.println("getAllUnreadChat");
			return mybatis.selectOne("CommonChatDAO.getAllUnreadChat", userID);
			
		}
		
		public int getUnreadChat(String fromID, String toID) {
			System.out.println("getUnreadChat");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fromID", fromID);
			map.put("toID", toID);
			
			return mybatis.selectOne("CommonChatDAO.getUnreadChat", map);

		}	
	}