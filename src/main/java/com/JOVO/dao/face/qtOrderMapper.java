package com.JOVO.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Order;

public interface qtOrderMapper {

	Long orderCount(int sid);

	Long isOrder(int sid);

	Long notOrder(int sid);

	List<Order> select(int sid);
	
	Integer selectcount(@Param("sid") int sid,@Param("cid") int cid);

	List<Order> select_on(int sid);

	int delete(int oid);

}