package controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.microbolg.DaoMicrobolg;
import com.other.MakeImage;

import com.util.jdbc.CatenateDB;



@Controller
public class IndexController {
	 static BASE64Encoder encoder = new sun.misc.BASE64Encoder();   
	 static BASE64Decoder decoder = new sun.misc.BASE64Decoder(); 
	 static String initial_time = null;
	 
	 static int initial_id = 0; 
	 static int index =0;
	 static String time = null;
	 static String path = "c://test.jpg";
	// static String path= "C://Users//Administrator//workspace1//springmvc//WebContent//test.jpg";
	 static int mystep = DaoMicrobolg.searchStep();
	 
	
	public static ModelAndView all1(String time1) throws Exception {
		ModelAndView mav1 = new ModelAndView("index");
		//调取数据库的图片二进制流	
		String srcstr = MakeImage.getImage1(time1);
		if(srcstr == null) {
			
			String srcstr1 = MakeImage.getImage1(initial_time);
			byte [] bytes1 = decoder.decodeBuffer(srcstr1);
			ByteArrayInputStream bais = new ByteArrayInputStream(bytes1);
			BufferedImage src = ImageIO.read(bais);
			File w2 = new File(path);
			ImageIO.write(src,"jpg", w2);
			//arg1.getOutputStream().write(bytes1);
			mav1.addObject("pic", path);
			mav1.addObject("nowid",initial_time);
			return mav1;
		}
		byte [] bytes1 = decoder.decodeBuffer(srcstr);
		ByteArrayInputStream bais = new ByteArrayInputStream(bytes1);
		BufferedImage src = ImageIO.read(bais);
		File w2 = new File(path);
		//File w2 = new File("c://test.jpg");
		ImageIO.write(src,"jpg", w2);
		//arg1.getOutputStream().write(bytes1);
		mav1.addObject("pic", path);
		mav1.addObject("nowid",time1);
		//System.out.println(time1);
		return mav1;
	}
	
	@RequestMapping("/testtime")
	public ModelAndView showmytime(HttpServletRequest arg0) throws Exception {
		
		 ModelAndView show = new ModelAndView("index");
	     time = arg0.getParameter("mytime").trim();
	     initial_time = time; 
	     show = all1(time);
	      return show;
	}
	@RequestMapping("/next1")
	public ModelAndView nextpage1(HttpSession session) throws Exception{
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
	    
		Date date = sdf.parse(time);
		
        Date afterDate = new Date(date.getTime() + 60000);
        time = sdf.format(afterDate);
        String aftertime = sdf.format(afterDate);
		ModelAndView mav_next = all1(aftertime);		
		return mav_next;
	}
	@RequestMapping("/before1")
	public ModelAndView beforepage1(HttpSession session) throws Exception{
		SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
	     Date date = sdf.parse(time);
	    
        Date beforeDate = new Date(date.getTime() - 60000);
        time = sdf.format(beforeDate);
        String beforetime = sdf.format(beforeDate);
		ModelAndView mav_before = all1(beforetime);
		return mav_before;
	}
	//显示折线图
	@RequestMapping("/showline")
	public ModelAndView showline() throws Exception{
		ModelAndView te1 = new ModelAndView("NewFile");
		return te1;
	}
	//显示选择时间页面
	@RequestMapping("/dateselect")
	public ModelAndView dateselect() throws Exception{
		ModelAndView mod = new ModelAndView("dateselect");
		return mod;
	}
	
	
	@RequestMapping(value = "ajax/test2", method = RequestMethod.POST)
    public @ResponseBody List<Map<String,Object>> getbar() {
	//    public @ResponseBody Map<String,Object>getbar() {
		Connection con = null;
        String sql = null;
        
        try {
            con = CatenateDB.createConn("mytest");
            java.sql.Statement st = con.createStatement();
            sql = "select * from Table_2 order by time";
            ResultSet rs = st.executeQuery(sql);
            List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
            while (rs.next()) {
            	Map<String, Object> map = new HashMap<String, Object>();
            	map.put("time", rs.getString(1));
                map.put("value", rs.getInt(2));
              //  map.put("drilldown", Double.parseDouble(rs.getString(4)));
                list.add(map);
            }
            
            return list;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
	
	@RequestMapping(value = "ajax/test3", method = RequestMethod.POST)
    public @ResponseBody List<Map<String,Object>> getline() {
	//    public @ResponseBody Map<String,Object>getbar() {
		Connection con = null;
        String sql = null;
        
        try {
            con = CatenateDB.createConn("mytest");
            java.sql.Statement st = con.createStatement();
            sql = "select * from Table_2 order by time";
            ResultSet rs = st.executeQuery(sql);
            List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
            while (rs.next()) {
            	Map<String, Object> map = new HashMap<String, Object>();
            	map.put("time", rs.getString(1));
                map.put("value", rs.getInt(2));
              //  map.put("drilldown", Double.parseDouble(rs.getString(4)));
                list.add(map);
            }
            
            return list;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
}


