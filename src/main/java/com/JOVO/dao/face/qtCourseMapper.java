package com.JOVO.dao.face;

import com.JOVO.model.Course;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface qtCourseMapper {

	List<Course> free();

	List<Course> pay();

	List<Course> payRank();

	List<Course> freeRank();

	List<Course> all(@Param("typeid") Integer typeid);

	List<Course> watchlist(@Param("typeid") Integer typeid);

	List<Course> freelist(@Param("typeid") Integer typeid);

	List<Course> paylist(@Param("typeid") Integer typeid);

	List<Course> notMoney(@Param("example") String example);

	List<Course> isMoney(@Param("example") String example);

	List<Course> goodTeacher();

	List<Course> selectCourse(@Param("example") String param);
}