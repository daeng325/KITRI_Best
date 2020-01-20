package com.simplify.shop.db.mapper;

import java.util.List;
import com.simplify.shop.db.dto.Account;

public interface AccountMapper {
	public List<Account> getAll() throws Exception;
}
