package com.shepe.admin.biz.chat.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BootDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void startBoot(String startBootContent) {
		
		mybatis.update("Boot.startBoot", startBootContent);
	} 




}
