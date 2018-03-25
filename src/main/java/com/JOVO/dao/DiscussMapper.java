package com.JOVO.dao;

import com.JOVO.model.Discuss;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DiscussMapper {
    int insert(Discuss record);
    
    long discussCount(int cid);
    
    List<Discuss> courseDiscuss(int cid);
}