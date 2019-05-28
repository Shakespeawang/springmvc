package com.other;
 

import java.awt.Graphics;
import java.awt.Image;

import java.awt.image.ImageObserver;
import java.awt.image.ImageProducer;


import java.io.IOException;
import java.io.OutputStream;

//import java.io.OutputStream;
//import java.util.ArrayList;



import com.microbolg.DaoMicrobolg;
 

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class MakeImage extends Image{
 
    /* 方法：  MakeImage
    * 描述：  从数据库读取二进制字节流(byte[])到页面中生成图片
    * 输入：  int userid 用户ID , OutputStream os 从数据库读取的图片二进制字节流
    * 返回： 
    * 异常处理：
    */
	static BASE64Encoder encoder = new sun.misc.BASE64Encoder();   
	static BASE64Decoder decoder = new sun.misc.BASE64Decoder(); 
	
    public MakeImage(int userid,OutputStream os)throws IOException{
       DaoMicrobolg dao = new DaoMicrobolg();
      // ArrayList<Object> array = dao.searchImage(userid);
        byte [] mypic  = dao.searchImage(userid);
        
       // BufferedImage bi1 =ImageIO.read(bais);  
       os.write(mypic); 
       os.flush(); 
        os.close();   
     
   }
   public static String getImage(int userid) throws IOException {
	    DaoMicrobolg dao = new DaoMicrobolg();
       //ArrayList<Object> array = dao.searchImage(userid);
        byte [] mypic  = dao.searchImage(userid);
        if(mypic == null) {return null;}
      
	    return encoder.encodeBuffer(mypic).trim();
   }
   public static String getImage1(String time) throws IOException {
	    DaoMicrobolg dao = new DaoMicrobolg();
      //ArrayList<Object> array = dao.searchImage(userid);
       byte [] mypic  = dao.searchImage1(time);
       if(mypic == null) {return null;}
     
	    return encoder.encodeBuffer(mypic).trim();
  }
@Override
public int getWidth(ImageObserver observer) {
	// TODO Auto-generated method stub
	return 0;
}
@Override
public int getHeight(ImageObserver observer) {
	// TODO Auto-generated method stub
	return 0;
}
@Override
public ImageProducer getSource() {
	// TODO Auto-generated method stub
	return null;
}
@Override
public Graphics getGraphics() {
	// TODO Auto-generated method stub
	return null;
}
@Override
public Object getProperty(String name, ImageObserver observer) {
	// TODO Auto-generated method stub
	return null;
}
  
   
   
}
