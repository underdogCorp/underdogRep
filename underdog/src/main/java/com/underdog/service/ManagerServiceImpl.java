package com.underdog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.underdog.dao.ManagerDAO;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDAO managerdao;

}
