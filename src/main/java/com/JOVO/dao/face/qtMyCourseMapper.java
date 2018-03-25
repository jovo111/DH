package com.JOVO.dao.face;

import com.JOVO.model.MyCourse;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface qtMyCourseMapper {
    List<MyCourse> mycourse(int sid);
    
    Long mycourseCount(int sid);
    
    Long notMyCourse(int sid);
    
    Long isMyCourse(int sid);
    
    Long newMyCourse(int sid);
    
    Integer Topcid(int sid);
    
    Integer selectcount(@Param("sid") int sid,@Param("cid") int cid);
}