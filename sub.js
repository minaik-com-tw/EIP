 

//function document.onkeydown()    
//{    
//	//(event.keyCode==8)   ||                  //不能用鍵盤上的delete&backspace
//   if ((event.keyCode==116)||                  //不能用鍵盤上的f5
//       (event.ctrlKey && event.keyCode==82)){ //不能用Ctrl + R    
//      event.keyCode=0;    
//      event.returnValue=false;    
//      }    
//}    
   
//以下是不能按右鍵
if (window.Event) 
document.captureEvents(Event.MOUSEUP); 
function nocontextmenu()
{ 
 event.cancelBubble = true 
 event.returnValue = false; 
 return false; 
} 
function norightclick(e){ 
 if (window.Event){ 
  if (e.which == 2 || e.which == 3) 
  return false; 
 } 
 else 
  if (event.button == 2 || event.button == 3){ 
   event.cancelBubble = true 
   event.returnValue = false; 
   return false; 
  } 
} 
document.oncontextmenu = nocontextmenu; // for IE5+ 
document.onmousedown = norightclick; // for all others 

