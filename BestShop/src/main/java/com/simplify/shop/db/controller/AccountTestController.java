package com.simplify.shop.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
 
import com.simplify.shop.db.dto.Account;
import com.simplify.shop.db.service.AccountService;
 
@Controller
public class AccountTestController {
	
	 @Autowired
	    AccountService accountService;
	    
	    @RequestMapping("/account")
	    public @ResponseBody List<Account> query() throws Exception{
	        return accountService.getAll();
	    }
    
}
