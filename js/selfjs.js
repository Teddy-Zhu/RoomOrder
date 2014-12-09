var xmlhttp;
String.prototype.trim= function(){  
    return this.replace(/(^\s*)|(\s*$)/g,"");  
}
function query(a,param1,param2){
    var n=parseInt(a);
    if(window.XMLHttpRequest){
       xmlhttp = new XMLHttpRequest();
       if(xmlhttp.overrideMineType){
          xmlhttp.overrideMineType("text/xml");
       }
    }else if(window.ActiveXObject){
       var activexName = ["MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
       for(var i = 0; i<activeName.length; i++){
           try{
              xmlhttp = new ActiveXObject(activexName[i]);
              break;
           }catch(e){}
       }       
       
    }
    if(!xmlhttp){
       alert("失败");return false;
    }
	xmlhttp.onreadystatechange = callback;
	if(n==1){
	var data=document.getElementById("date").value;	
    var roomtype=document.getElementById("roomtype").value;
    var lendtime=document.getElementById("lendtime").value;
	if(data=="" || data == undefined || data ==null) {alert("请选择日期");return false;}
    xmlhttp.open("POST","../files/classinfo.jsp", true);
    xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username="+param2+"&pageNow=" + param1+"&data="+data+"&roomtype="+roomtype+"&lendtime="+lendtime);
	}
	if(n==2){
	var cxusername=document.getElementById("cxusername").value;
    xmlhttp.open("POST","../files/queryeditinfo.jsp" , true);
    xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username=" + param1 +"&cxusername="+ cxusername);
	}
	if(n==3){
	var yyusername=document.getElementById("yyusername").value;
	var date=document.getElementById("date").value;
	var enable=document.getElementById("enable").value;
	var roomtype=document.getElementById("roomtype").value;
	var lendtime=document.getElementById("lendtime").value;
	var sqdate=document.getElementById("sqdate").value;
    xmlhttp.open("POST","../files/yydisplay.jsp" , true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username=" + param2 +"&pageNow="+param1+"&sqdate="+sqdate+"&date="+date+"&enable="+enable +"&yyusername="
	+yyusername+"&roomtype="+roomtype+"&lendtime="+lendtime );
	}
	if(n==4){
	var yyusername=document.getElementById("yyusername").value;
	var date=document.getElementById("date").value;
	var enable=document.getElementById("enable").value;
	var roomtype=document.getElementById("roomtype").value;
    xmlhttp.open("POST","../files/mangecyy.jsp" , true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username=" + param2 +"&pageNow="+param1+"&date="+date+"&enable="+enable +"&yyusername="+yyusername+"&roomtype="+roomtype );
	}
	if(n==5){
	var roomlocal=document.getElementById("roomlocal").value;	
    var roomtype=document.getElementById("roomtype").value;
	xmlhttp.open("POST","./displayroom.jsp", true);
    xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username="+param2+"&pageNow=" + param1+"&roomlocal="+roomlocal+"&roomtype="+roomtype);
	}
	if(n==6){
	var roomlocal=document.getElementById("roomlocal").value;
    xmlhttp.open("POST","../files/roomadd.jsp" , true);
    xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username=" + param1 +"&roomlocal="+ roomlocal);
	}
	if(n==7){
	var cxusername=document.getElementById("cxusername").value;	
    var usertype=document.getElementById("usertype").value;
	xmlhttp.open("POST","./displayuser.jsp", true);
    xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username="+param2+"&pageNow=" + param1+"&usertype="+usertype+"&cxusername="+cxusername);
	}
	if(n==8){
	var roomid = document.getElementById("a"+param2).innerText;
	xmlhttp.open("POST","./discyy.jsp", true);
    xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username="+param1+"&roomid=" + roomid);
	}
	if(n==9){
	var roomlocal=document.getElementById("roomlocal").value;	
    var roomtype=document.getElementById("roomtype").value;
	xmlhttp.open("POST","./displayrooma.jsp", true);
    xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username="+param2+"&pageNow=" + param1+"&roomlocal="+roomlocal+"&roomtype="+roomtype);
	}	
}
function editroominfo(xz,param1){
	var select = document.getElementById("roomtype"+xz);
    var roomtype = select.options[select.selectedIndex].value;
    var roomlocal = document.getElementById("a"+xz).innerText;
	var examecount = document.getElementById("examecount"+xz).value;	
		var roomcount = document.getElementById("roomcount"+xz).value;
	if (  typeof(examecount)=="undefined"  || examecount==0) {alert("请填写正确数值!");return false;}
	if (  typeof(roomcount)=="undefined"  || roomcount==0) {alert("请填写正确数值!");return false;}
    if(window.XMLHttpRequest){
       xmlhttp = new XMLHttpRequest();
       if(xmlhttp.overrideMineType){
          xmlhttp.overrideMineType("text/xml");
       }
    }else if(window.ActiveXObject){
       var activexName = ["MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
       for(var i = 0; i<activeName.length; i++){
           try{
              xmlhttp = new ActiveXObject(activexName[i]);
              break;
           }catch(e){}
       }       
       
    }
    if(!xmlhttp){
       alert("失败");return false;
    }
	xmlhttp.onreadystatechange = callback;
    xmlhttp.open("POST","../files/editroominfo.jsp" , true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username=" + param1 +"&roomtype="+ roomtype +"&roomlocal="+roomlocal+"&examecount="+examecount+"&roomcount="+roomcount);   
}

function callback(){
   if(xmlhttp.readyState == 4){
      if(xmlhttp.status == 200){
         var responseText = xmlhttp.responseText;
         var divNode = document.getElementById("table-c");
         divNode.innerHTML = responseText;
      }
   }
}
function checkLogin(){
var oldpassword=document.getElementById("oldpassword").value;//密码
var newpassword=document.getElementById("newpassword").value;//第一次密码
var repassword=document.getElementById("repassword").value;
//第二次密码

if (oldpassword.length==0) {
alert("请输入密码");
return false;
}

if(!(newpassword==repassword)){
alert("两次密码输入不一致，请重新输入");
return false;
}
return true;
}
function yuyue(xz,param1){
	var select = document.getElementById("xzlendtime"+xz);
	var data=document.getElementById("date").value;	
    var xzlendtime = select.options[select.selectedIndex].text;
    var roomlocal = document.getElementById("a"+xz).innerText;
	var lendfor = document.getElementById("lendfor").value;	
	lendfor =encodeURI(encodeURI(lendfor));
    if(window.XMLHttpRequest){
       xmlhttp = new XMLHttpRequest();
       if(xmlhttp.overrideMineType){
          xmlhttp.overrideMineType("text/xml");
       }
    }else if(window.ActiveXObject){
       var activexName = ["MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
       for(var i = 0; i<activeName.length; i++){
           try{
              xmlhttp = new ActiveXObject(activexName[i]);
              break;
           }catch(e){}
       }         
    }
    if(!xmlhttp){
       alert("失败");return false;
    }
	xmlhttp.onreadystatechange = callback;
    xmlhttp.open("POST","../files/yyroom.jsp" , true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username=" + param1 +"&xzlendtime="+ xzlendtime +"&roomlocal="+roomlocal+"&lendfor="+lendfor+"&data="+data);   
}

function display(param1,param2){
	var id = document.getElementById("a"+param2).innerText;
    var status = document.getElementById("b"+param2).value;
    if(window.XMLHttpRequest){
       xmlhttp = new XMLHttpRequest();
       if(xmlhttp.overrideMineType){
          xmlhttp.overrideMineType("text/xml");
       }
    }else if(window.ActiveXObject){
       var activexName = ["MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
       for(var i = 0; i<activeName.length; i++){
           try{
              xmlhttp = new ActiveXObject(activexName[i]);
              break;
           }catch(e){}
       }       
    }
    if(!xmlhttp){
       alert("失败");return false;
    }
	xmlhttp.onreadystatechange = function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    alert(xmlhttp.responseText.trim());
    }
  };
    xmlhttp.open("POST","../files/displaypost.jsp" , true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username=" + param1 +"&id="+ id+"&status="+status);   
}
function edituser(xz,param1){
	var select = document.getElementById("usertype"+xz);
    var usertype = select.options[select.selectedIndex].value;
	select = document.getElementById("verify"+xz);
    var verify = select.options[select.selectedIndex].value;
    var cxusername = document.getElementById("a"+xz).innerText;
	var email = document.getElementById("email"+xz).value;	
    var selfinfo = document.getElementById("selfinfo"+xz).value;
	var ordernum = document.getElementById("ordernum"+xz).value;
    if(window.XMLHttpRequest){
       xmlhttp = new XMLHttpRequest();
       if(xmlhttp.overrideMineType){
          xmlhttp.overrideMineType("text/xml");
       }
    }else if(window.ActiveXObject){
       var activexName = ["MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
       for(var i = 0; i<activeName.length; i++){
           try{
              xmlhttp = new ActiveXObject(activexName[i]);
              break;
           }catch(e){}
       }       
       
    }
    if(!xmlhttp){
       alert("失败");return false;
    }
	xmlhttp.onreadystatechange = callback;
    xmlhttp.open("POST","../files/edituser.jsp" , true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("username=" + param1 +"&usertype="+ usertype +"&cxusername="+cxusername+"&email="+email+"&selfinfo="+selfinfo+"&verify="+verify+"&ordernum="+ordernum);   
}