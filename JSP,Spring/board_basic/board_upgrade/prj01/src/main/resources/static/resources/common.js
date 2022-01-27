

function setTrBgcolor( tableClassV , headBgcolor, oddTrBgcolor, evenTrBgcolor, mouceOverBgcolor ){
	try{
		var tableObj = $("."+tableClassV);
		var firstTrObj = tableObj.find("tr:eq(0)");
			//var firstTrObj = tableObj.find("tr:first");
			//var firstTrObj = tableObj.find("tr").first();
		var oddTrObj = firstTrObj.siblings("tr").filter(":even")
		var evenTrObj = firstTrObj.siblings("tr").filter(":odd")

		firstTrObj.attr("bgColor", headBgcolor );
		oddTrObj.attr("bgColor", oddTrBgcolor );
		evenTrObj.attr("bgColor", evenTrBgcolor );
	
		//oddTrObj.find("td,th").css("color", "pink" );
		//evenTrObj.find("td,th").css("color", "green" );
		
		oddTrObj.hover(
			function(){
				$(this).attr("bgColor",mouceOverBgcolor);
			}
			,function(){
				$(this).attr("bgColor",oddTrBgcolor);
			}
		);
		evenTrObj.hover(
			function(){
				$(this).attr("bgColor",mouceOverBgcolor);
			}
			,function(){
				$(this).attr("bgColor",evenTrBgcolor);
			}
		);
	}
	catch(e){
		alert("setTrBgcolor 함수 호출 시 예외발생!"+ e.message );
	}
}

//-----------------------------------------------------------------------
function getRandomData( arr ){
	var randomData = "";
	var cnt = arr.length;
	var idx = Math.floor( Math.random()*cnt );
	randomData = arr[idx];
	return randomData;
}

//-----------------------------------------------------------------------
function getRandomDataArr( arr, cnt ){
	var randomDataArr = [];
	
	//???
	
	return randomDataArr;
}

//-----------------------------------------------------------------------
function getRandomDataArr2( arr, min_cnt, max_cnt ){
	var randomDataArr = [];
	
	//???
	
	return randomDataArr;
}














