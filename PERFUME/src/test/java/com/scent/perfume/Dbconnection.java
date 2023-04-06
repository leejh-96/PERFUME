package com.scent.perfume;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

class Dbconnection {

	@Test
	void DbTest() throws SQLException {
		Connection c =DriverManager.getConnection("jdbc:oracle:thin:@perfume.c8jclpyehznu.ap-southeast-2.rds.amazonaws.com:1521:perfume"
				,"PERFUME","PERFUME123");
		System.out.println(c);
	}
}
