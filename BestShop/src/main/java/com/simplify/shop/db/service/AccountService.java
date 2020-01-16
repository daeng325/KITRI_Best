package com.simplify.shop.db.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simplify.shop.db.dto.Account;
import com.simplify.shop.db.mapper.AccountMapper;
 
@Service
public class AccountService {
	
	@Autowired
	AccountMapper accountMapper;
	
	public List<Account> getAll() throws Exception{
		return accountMapper.getAll();
	}
}
