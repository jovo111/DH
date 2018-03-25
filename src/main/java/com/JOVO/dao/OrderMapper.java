package com.JOVO.dao;

import com.JOVO.model.Order;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
    int delete(@Param("oid") int oid);

    int insert(Order record); 
//    	查询一行
    List<Order> select_one(@Param("oid")int oid);
//    模糊查询时间
    List<Order> totime(@Param("starting")String starting,@Param("ending")String ending); 
//    模糊查询全部数据
    List<Order> queryselect(@Param("oid")String oid,@Param("isbuy")String isbuy,@Param("snick")String snick,@Param("cname") String cname);
    
    int update(@Param("record") Order record);
    
    List<Order> oldOrder(int sid);
    
    long orderCount(int cid);
    
    List<Order> courseOrder(int cid);
    
}