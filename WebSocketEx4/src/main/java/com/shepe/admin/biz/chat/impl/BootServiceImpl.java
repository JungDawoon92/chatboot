package com.shepe.admin.biz.chat.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.biz.chat.BootService;

@Service
public class BootServiceImpl implements BootService {
	
	@Autowired
	private BootDAO bootdao;
	
	public void startBoot(String startBootContent) {
		bootdao.startBoot(startBootContent);
		
	}
}
