package com.JOVO.dao;

import com.JOVO.model.Bulletin;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BulletinMapper {

    int delete(@Param("bulletinid") int bulletinid);

    int insert(Bulletin record);

    List<Bulletin> select();
    
    int update(Bulletin bulletin);
    
    int updateRelease(Bulletin bulletin);
    
    List<Bulletin> bulletins(@Param("aid") String aid);
}