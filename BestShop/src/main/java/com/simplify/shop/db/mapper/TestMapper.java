package com.simplify.shop.db.mapper;

import java.util.List;
import com.simplify.shop.db.dto.Test;
 
public interface TestMapper {
    public List<Test> getAll() throws Exception;
}
