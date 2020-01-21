package com.kitri.shop.db.mapper;

import java.util.List;
import com.kitri.shop.db.dto.Test;
 
public interface TestMapper {
    public List<Test> getAll() throws Exception;
}
