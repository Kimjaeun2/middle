<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#insertBtn{
	margin-top: 30px;
	margin-bottom: 50px;
}

#pInsert{
	marign-top: 10px;
}
</style>
</head>
<body>
	<section class="product-page">
        <div class="container">

           <form method="post" name="auctionFrm">
	            <div class="row">
	                <div class="col-lg-6">
	                    <div class="product-slider owl-carousel">
	                        <div class="product-img">
	                            <figure>
	                                <img src="images/${auction.auctionDir }" alt="img" height=500px> 
									<div class="p-status">new</div>
	                            </figure>
	                        </div>
	                        <div class="product-img">
	                            <figure>
	                                <img src="images/${auction.auctionDir }" alt="img" height=500px>
	                                <div class="p-status">new</div>
	                            </figure>
	                        </div>
	                    </div>
	                    
	                </div>
	                <div class="col-lg-6">
	                    <div class="product-content">
	                        <h2>${auction.auctionName }</h2>
	                        <div class="pc-meta">
	                           <h5>즉시 구매:<fmt:formatNumber value="${auction.auctionMax}" pattern="#,###원" /></h5>   
	                           <p>${auction.auctionText }</p>   
                               <div class="sec7-text-box">
								  <p class="runTimeCon">마감 날짜 : <span id="formattedEndDate"></span></p>
								  <hr/>
								  <p class="time-title">경매 마감까지 남은 시간</p>
								  <div class="time">
								    <span id="d-day-day">00</span>
								    <span class="col">일 </span>
								    <span id="d-day-hour">00</span>
								    <span class="col">:</span>
								    <span id="d-day-min">00</span>
								    <span class="col">:</span>
								    <span id="d-day-sec">00</span>
								  </div>
							 	</div>
	                        	
	                        </div>
			            </div>		           
			            <div id ="auctionlist">
			            	 <p>현재 경매가</p>
			            </div>
						<div id="pInsert">
							<textarea rows="1" cols="10" style="resize: none;" name="auctionPrice" id="auctionPrice" class="form-control">${auction.auctionPrice }</textarea>
						</div>	
						<div id="insertBtn">
							<c:if test="${auth eq 'N' }">
								<c:if test="${not empty id }">
					            	<button type="button" class="btn btn-dark" onclick="auciotnPriceInsert()">금액 입력</button>
					            </c:if>	
					        </c:if>		            
				            <c:if test="${empty id }">
				            	<button type="button" class="btn btn-dark" onclick="location.href='loginAlert.do'">금액 입력</button>
			            	</c:if>
			            	<c:if test="${auth eq 'A'}">
								<button type="button" class="btn btn-dark" onclick="location.href='auctionDelete.do?auctionId=${auction.auctionId }'">삭제</button>
							</c:if>
		            	</div>
		        	</div>	 
		        	<button type="button" class="btn btn-dark" onclick="location.href='auctionList.do'">목록으로</button>          
					<div align="center">

					</div>
						<input type="hidden" id="priceCheck" name="auctionId" value="${auction.auctionId }">	    	
						<input type="hidden" id="maxPrice" name="auctionMax" value="${auction.auctionMax }">
						<input type="hidden" id = "auctionbuyerId" name = "auctionbuyerId" value="${auction.auctionBuyerId }">	
						<input type="hidden" id = "auctionName" name = "auctionName" value = "${auction.auctionName }">    	
						<input type="hidden" id = "acutionImg" name = "auctionImg" value = "${auction.auctionDir }">
					</div>  	
			</form>

            <!-- 데이터 값 가져오는 기능 -->
            <input type="hidden" id = "memberId" name = "memberId" value="${id }">
            <input type="hidden" id = "auctionId" name = "auctionId" value = "${auction.auctionId }">
            <input type="hidden" id = "auctionName" name = "auctionName" value = "${auction.auctionName }">
            <input type="hidden" id = "auctionPrice" name = "auctionPrice" value = "${auction.auctionPrice }">
            <input type="hidden" id = "acutionImg" name = "auctionImg" value = "${auction.auctionImg }">
                   
    	</div>
    </section>
   
<script type="text/javascript">
function auciotnPriceInsert(){
	let today = new Date();
	console.log(today);

	if(${id == null} ){
		alert("로그인 하셔야 합니다.");
		return;
	}	
	//경매 금액
	var auctionPrice = $("#auctionPrice").val();
	console.log(${auction.auctionMax});
	var queryString = $("form[name=auctionFrm]").serialize();


		if(${auction.auctionPrice} < auctionPrice){		
		$.ajax({
			url:"auctionPriceInsert.do",
			type:"POST",
			data:queryString,
			success:function(){			
					$("#auctionPrice").val("").focus();
					$("#auctionlist").empty();				
					auctionPriceSelect();					
			},
			error: function(request, status, error){
				alert("code:" + request.status+"\n"+"message: " +request.responseText + "\n"+"error: " + error);
			}
		});
		if(${auction.auctionMax} <= auctionPrice  ){
			if(confirm("바로 구매하시겠습니까?")==true){
				auctionFrm.action="auctionBuyInsert.do";
			}else{
				return;
			}
			auctionFrm.submit();
		}
	}else{
		alert("현재 금액보다 높은 금액을 입력하세요");
		$("#auctionPrice").val("").focus();
		return;
	}				
}
auctionPriceSelect();
 function auctionPriceSelect(){
	let url = "ajaxAuctionSelect.do"
	fetch(url+"?auctionId="+"${auction.auctionId }")
		.then(response => response.json())
		.then(json => HtmlConvert(json));
} 
 
 function HtmlConvert(datas){
	 const container = document.createElement('table');//<table>태그 생성
	 container.innerHTML = createHTMLString(datas);
	 document.querySelector("#auctionlist").appendChild(container);//화면에 추가
	
 }
 function createHTMLString(data){
	let str="<tr>";		
		str+="<td>"+ "구매자 : " +"</td>";
		str+="<td>"+ data.auctionBuyer +"</td>";
		str+="<td>"+ "최고 가격 : " +"</td>";
		str+="<td>"+ data.auctionPrice +"</td></tr>";
	return str;
	
 }
 if("${auth }" == "A"){
 	auctionFrm.action="auctionForm.do";
 }else{
	 function remaindTime() {
		    var now = new Date(); // 현재시간을 구한다.
		    var open = new Date("${auction.auctionLastDate}");
		    var nt = now.getTime(); // 현재의 시간만 가져온다
		    var ot = open.getTime(); // 오픈시간만 가져온다

		    if (nt < ot) { // 현재시간이 오픈시간보다 이르면 오픈시간까지의 남은 시간을 구한다.
		        sec = parseInt(ot - nt) / 1000;
		        var days = parseInt(sec / (60 * 60 * 24)); // 초를 일로 변환
		        sec = sec % (60 * 60 * 24); // 일로 나눈 나머지 초 값
		        var hour = parseInt(sec / 3600);
		        sec = sec % 3600;
		        var min = parseInt(sec / 60);
		        sec = parseInt(sec % 60);

		        if (hour < 10) { hour = "0" + hour; }
		        if (min < 10) { min = "0" + min; }
		        if (sec < 10) { sec = "0" + sec; }

		        $("#d-day-day").html(days); // 일(day) 표시
		        $("#d-day-hour").html(hour);
		        $("#d-day-min").html(min);
		        $("#d-day-sec").html(sec);
		    } else { // 현재시간이 종료시간보다 크면
		        $("#d-day-day").html('00');
		        $("#d-day-hour").html('00');
		        $("#d-day-min").html('00');
		        $("#d-day-sec").html('00');

		        auctionFrm.action = "auctionTimeOut.do";
		        auctionFrm.submit();
		    }
		}

	setInterval(remaindTime,1000);
}
 
 document.addEventListener('DOMContentLoaded', function() {
	const endDate = new Date("${auction.auctionLastDate}"); // Date 타입으로 가져옴

	// 변환된 값을 원하는 형식으로 표시합니다.
	const formattedEndDateElement = document.getElementById('formattedEndDate');
	const options = { year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric' };
	const formattedEndDate = new Intl.DateTimeFormat('ko-KR', options).format(endDate);
	console.log(formattedEndDate)
	formattedEndDateElement.textContent = formattedEndDate;
	});
</script>
</body>

</html>