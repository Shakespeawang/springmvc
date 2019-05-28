package com.util.bean;

import java.awt.Image;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;

import com.microbolg.DaoMicrobolg;
import com.other.MakeImage;
import com.util.jdbc.CatenateDB;

public class Mymaintest {
	static BASE64Encoder encoder = new sun.misc.BASE64Encoder();   
	static BASE64Decoder decoder = new sun.misc.BASE64Decoder(); 
	static String s = "2019-05-9 10:00:59";
	public static void main(String []args) throws IOException, Exception {
	     
		  Statement st = null;
	     Connection conn = CatenateDB.createConn("mytest");
	  // Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	  // Connection conn = DriverManager.getConnection("jdbc:sqlserver://192.168.1.111:1433;DatabaseName= a2", "sa", "1234");
	   System.out.println("success");
	   //获取当前时间，以字符串（nowTime）形式存在
	    //  Date date = new Date();
          SimpleDateFormat sdf =   new SimpleDateFormat( "yy-MM-dd HH:mm:ss" );
        
         for(int i =1;i<15;i++) {
          String sqlStr = "insert into Table_2(time,distance) values('"+s+"','"+i+"')";
          st = conn.createStatement();
    	  st.executeUpdate(sqlStr);
          Date date = sdf.parse(s);
          Date afterDate = new Date(date.getTime() + 60000);
          
          s = sdf.format(afterDate);
          }
         
         Connection con = null;
         String sql = null;
         con = CatenateDB.createConn("mytest");
         java.sql.Statement st1 = con.createStatement();
             sql = "select * from Table_2";
             ResultSet rs = st1.executeQuery(sql);
            // List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
             while (rs.next()) {
                String date1 =rs.getString(1);
            	int dis = rs.getInt(2);
            	
            	 // Map<String, Object> map = new HashMap<String, Object>();
        //  String nowTime = sdf.format(date);
         // date = sdf.parse(nowTime);
//          int i = 5;
//          String time ="dsa";
//	      String sqlStr = "insert into Tabletest(id,time) values('25','"+time+"')";
	      
	    //  st = conn.createStatement();
	  //    st.executeUpdate(sqlStr);
	  
	      //System.out.println("success");
	      
//      @SuppressWarnings("deprecation")
//		Date date1 = new Date(19,04,9,10,00,59);
//	      String nowTime1 = sdf.format(date1);
//	      @SuppressWarnings("deprecation")
//		Date date2 = new Date(19,04,7,20,16,10);
//	      String nowTime2 = sdf.format(date2);
	      
	  
//	       String sql = "select * from Table_1 where time =?";
//	       PreparedStatement ps = CatenateDB.prepare(conn, sql);
//	       ArrayList<Object> array = new ArrayList<Object>();
//	       byte [] picbuffer = null;
//	       int kk =0;
//	       try {
//	          ps.setString(1, nowTime1);
//	         // ps.setString(2, nowTime2);
//	          ResultSet rs = ps.executeQuery();
//	         
//	          if(rs.equals(null)) {
//	        	  
//	        	  System.out.println("dafsh");
//	          }
//	          while(rs.next()){
//	        	  //System.out.println("有数据");
//	        	  picbuffer =rs.getBytes(2);
//	        	 // kk=rs.getInt(1); 
//	                System.out.println(picbuffer);
//	        	 
//	          }
//	       } catch (SQLException e) {
//	          e.printStackTrace();
//	       }
//	      
//	       System.out.println(nowTime1);
//	       CatenateDB.close(ps);
//	       CatenateDB.close(conn);
//	       
	      //return array;
	       
	}
             
	}
}
//	       PreparedStatement ps = CatenateDB.prepare(conn, sql);
	       
	       //ps.setString(1,"step");

	