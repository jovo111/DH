package com.JOVO.dao;

import com.JOVO.model.Order;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
    int delete(@Param("oid") int oid);

    int insert(Order record); 
//    	��ѯһ��
    List<Order> select_one(@Param("oid")int oid);
//    ģ����ѯʱ��
    List<Order> totime(@Param("starting")String starting,@Param("ending")String ending); 
//    ģ����ѯȫ������
    List<Order> queryselect(@Param("oid")String oid,@Param("isbuy")String isbuy,@Param("snick")String snick,@Param("cname") String cname);
    
    int update(@Param("record") Order record);
    
    List<Order> oldOrder(int sid);
    
    long orderCount(int cid);
    
    List<Order> courseOrder(int cid);
    
}