package com.microbolg;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.util.jdbc.CatenateDB;

public class DaoMicrobolg {


//public ArrayList<Object> searchImage(int userid) {
	//查询图片二进制流，用的是id
	public byte[] searchImage(int userid) { 
	   String databasename = "a2";	
       Connection conn = CatenateDB.createConn(databasename);
       String sql = "select * from Table_1 where id=?";
       PreparedStatement ps = CatenateDB.prepare(conn, sql);
       ArrayList<Object> array = new ArrayList<Object>();
       byte [] picbuffer = null;
       try {
          ps.setInt(1,userid);
          ResultSet rs = ps.executeQuery();
          if(rs.equals(null)) {
        	  picbuffer =null;
          }
          while(rs.next()){
        	  //System.out.println("有数据");
                picbuffer=rs.getBytes(2);  
        	  array.add(rs.getBytes(2));
          }
       } catch (SQLException e) {
          e.printStackTrace();
       }
       CatenateDB.close(ps);
       CatenateDB.close(conn);
      //return array;
       	return picbuffer;
}
	//查询图片二进制流，用的是具体时间
	public byte[] searchImage1(String time) { 
		   String databasename = "a2";	
	       Connection conn = CatenateDB.createConn(databasename);
	       String sql = "select * from Table_1 where time=?";
	       PreparedStatement ps = CatenateDB.prepare(conn, sql);
	       ArrayList<Object> array = new ArrayList<Object>();
	       byte [] picbuffer = null;
	       try {
	          ps.setString(1,time);
	          ResultSet rs = ps.executeQuery();
	          if(rs.equals(null)) {
	        	  picbuffer =null;
	          }
	          while(rs.next()){
	        	  //System.out.println("有数据");
	                picbuffer=rs.getBytes(2);  
	        	  array.add(rs.getBytes(2));
	          }
	       } catch (SQLException e) {
	          e.printStackTrace();
	       }
	       CatenateDB.close(ps);
	       CatenateDB.close(conn);
	      //return array;
	       	return picbuffer;
	}
	//返回时间间隔step
	public static int searchStep() { 
		   String databasename2 = "a1"; 
		   int steplength = 0;
	       Connection conn = CatenateDB.createConn(databasename2);
	       String sql = "select value from mydata where properties =?";
	       PreparedStatement ps = CatenateDB.prepare(conn, sql);
	       
	       try {
	          ps.setString(1,"step");
	          ResultSet rs = ps.executeQuery();
	          if(rs.equals(null)) {
	
	        	  System.out.println("间隙有误");
	          }
	          while(rs.next()){
	        	  //System.out.println("有数据");
	             //String result =rs.getString("value");  
	        	  steplength = Integer.parseInt(rs.getString("value").trim());
	          }
	       } catch (SQLException e) {
	          e.printStackTrace();
	       }
	       CatenateDB.close(ps);
	       CatenateDB.close(conn);
	      //return array;
	       	return steplength;
	}
	
	
}