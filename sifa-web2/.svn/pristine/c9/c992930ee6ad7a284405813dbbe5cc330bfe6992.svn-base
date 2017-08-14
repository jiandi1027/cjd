function _message(text,seconds,url){
    	YAHOO.namespace("container");
    	if(YAHOO.container.messagePanel==null){
    		YAHOO.container.messagePanel = new YAHOO.widget.Panel("message", {close:true, modal:false,visible:false,fixedcenter : true,zindex : 4,constraintoviewport:true,width:"240px"} );
		}
		YAHOO.container.messagePanel.setBody(text);
		YAHOO.container.messagePanel.render();
		YAHOO.container.messagePanel.show();
		var iMilliSeconds = 1000;
		if(seconds){
			iMilliSeconds = 1000*seconds;
		}
		if(url){
			window.setTimeout("YAHOO.container.messagePanel.hide();window.location='"+url+"'", iMilliSeconds);
		}else{
			window.setTimeout("YAHOO.container.messagePanel.hide()", iMilliSeconds);
		}
}



function validForm(_form){

 var culprit = _form.getElementsByTagName("select");
 
 for(var i=0;i<culprit.length;i++){
 	if(culprit[i].name.indexOf("culpritId")>-1 &&  culprit[i].value==0 ){
 	 alert("选择对象.");
     culprit[i].focus();
     return false ;
    }
 }
 
 var ipt = _form.getElementsByTagName("input");
 for(var i=0;i<ipt.length;i++){
   if(ipt[i].name.indexOf("Date")>-1 &&  ipt[i].value=="" ){
    alert("此项不能为空.");
    ipt[i].focus();
    return false ;
   }
   
   if(ipt[i].name.indexOf("date")>-1 &&  ipt[i].value=="" ){
    alert("此项不能为空.");
    ipt[i].focus();
    return false ;
   }
   
   if(ipt[i].name.indexOf("Time")>-1 && ( ipt[i].value=="" || ( !isNumber(ipt[i].value) && !isDouble(ipt[i].value) ) )  ){
    alert("此项输入数字.");
    ipt[i].focus();
    return false ;
   }
   
   if(ipt[i].name.indexOf("Mark")>-1 && ( ipt[i].value=="" || ( !isNumber(ipt[i].value) && !isDouble(ipt[i].value) ) )  ){
    alert("此项输入数字.");
    ipt[i].focus();
    return false ;
   }
   
   if(ipt[i].name.indexOf("mark")>-1 &&  ( ipt[i].value=="" || (  !isNumber(ipt[i].value) && !isDouble(ipt[i].value)) )  ){
    alert("此项输入数字.");
    ipt[i].focus();
    return false ;
   }
   
 }
 return true;
}

function isNumber(value){

 if(value.length==0){
  return false;
 }
 var exp=/^[-]?\d+$/;
 var p = new RegExp(exp);
 return p.test(value);
}

function isDouble(value){
 if(value.length==0){
  return false;
 }
 var exp =/^[-]?\d*[.]\d*$/;
 var p = new RegExp(exp);
 return p.test(value);
 
}

function checkIdcard(idcard){ 
	if(idcard.length == 15 || idcard.length == 18)
	{
		return true;
	}
	else
	{
		return false;
	}
} 

function checkMobile(s){ 
var regu =/^[1][3,5,8,7,4][0-9]{9}$/; 
var re = new RegExp(regu); 
if (re.test(s)) { 
return true; 
}else{ 
return false; 
} 
} 

function checkPhone( strPhone ) { 
var phoneRegWithArea = /^[0][1-9]{2,3}-[0-9]{5,8}$/; 
var phoneRegNoArea = /^[1-9]{1}[0-9]{5,8}$/; 
if( strPhone.length > 9 ) {
    if( phoneRegWithArea.test(strPhone) ){return true; }else{return false;}
}else{
    if(phoneRegNoArea.test(strPhone)){return true; }else{return false;}
}
}

