<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

      
<div align="center">
<img 
src="${pic}" ></img>
</div>

<div align = "center">
<form action ="before1">
<button  type = "submit">上一张</button>  <input  type ="text" value ="当前id" style="width:120px;" /> 
</form>
<form action ="next1">
<button  type = "submit">下一张</button>  <input type ="text" value ="${nowid}" style="width:120px;"/> 
</form>

</div>