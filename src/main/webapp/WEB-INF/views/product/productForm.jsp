<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	textarea {
		
		padding: 10px;
		box-sizing: border-box;
		border: solid 1px #708090;
		border-radius: 5px;
		font-size: 16px;
		resize: both;
		}
		
#rDiv{
	border-top: 2px solid #ccc;
	width: 1200px;
	margin: 0 auto;
	margin-top: 30px;
}
		
#rTitle{
	font-size: 40px;
	margin-left: 60px;
}

#reviewInsert{
	margin-top: 20px;
	margin-bottom: 20px;
}

#reviewList{
	width: 1200px;
	margin: 0 auto;
	margin-top: 30px;
}

td{
	border-top: 2px solid #ccc;
	width: 1200px;
	margin: 0 auto;
	margin-top: 30px;
	text-align: center;
	padding: 5px;
	}
textarea {
    width: 1200px;
    height: 6.25em;
    border: none;
    resize: none;
    border: 2px solid #ccc;
  }
</style>
</head>
<body>
	<section class="product-page">
        <div class="container">
            <div class="product-control">
                <a href="#">Previous</a>
                <a href="#">Next</a>
            </div>
            <form id = "frm" action="cartCompare.do" method="post"> <!-- 카다 담기위한 FORM -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="product-slider owl-carousel">
                        <div class="product-img">
                            <figure>
                                <img src="images/${product.productDir }" alt="img"> 
								<div class="p-status">new</div>
                            </figure>
                        </div>
                        <div class="product-img">
                            <figure>
                                <img src="images/${product.productDir }" alt="img">
                                <div class="p-status">new</div>
                            </figure>
                        </div>
                    </div>
                    
                </div>
                <div class="col-lg-6">
                    <div class="product-content">
                        <h2>${product.productName }</h2>
                        <div class="pc-meta">
                            <h5><fmt:formatNumber value="${product.productPrice}" pattern="#,###원" /></h5>      
                           
                        </div>
                        <p>${product.productText }</p>
                        <ul class="tags">
                            <li><span>Category :</span> ${product.productCategory} </li>
                        </ul>
                        <div class="product-quantity">
                            <div class="pro-qty">
                                <input type="text" id = "productAmount" name = "productAmount" value="1"> <!-- 데이터 값 가져오는 ID, NAME -->
                            </div>
                        </div>
                        <!-- 데이터 값 가져오는 기능 -->>
                        <input type="hidden" id = "memberId" name = "memberId" value="${id }">
                        <input type="hidden" id = "productId" name = "productId" value = "${product.productId }">
                        <input type="hidden" id = "productName" name = "productName" value = "${product.productName }">
                        <input type="hidden" id = "productPrice" name = "productPrice" value = "${product.productPrice }">
                        <input type="hidden" id = "productImg" name = "productImg" value = "${product.productDir }">
                        <input type="hidden">
                        <c:if test="${not empty id }">
                        <button type="submit" class="primary-btn pc-btn">Add to cart</button>
                        </c:if>
                        
                        <c:if test="${empty id }">
                        <a href="loginAlert.do" class="primary-btn pc-btn">Add to cart</a>
                        </c:if>
                       <!-- 장바구니 가는 역할 -->
                        <ul class="p-info">
                            <li>Product Information</li>
                            <li>Reviews</li>
                            <li>Product Care</li>
                        </ul>
						<c:if test="${auth eq 'A' }">
							<button type = "button" onclick="clickBtn('D')" class="primary-btn pc-btn">상품 삭제</button>
							<button type = "button" onclick="clickBtn('U')" class="primary-btn pc-btn">상품 수정</button>
						</c:if> 
						
                    </div>
                </div>
            </div>
            </form>
            <form id="frm" method="post">
				<input type="hidden" id="productId" name="productId" 
					   value="${product.productId }">
			</form>
        </div>
    </section>
    <form name="reviewFrm">
    <div id="rDiv">
    	<p id="rTitle">Review</p>

    </div>
	    <div align="center">
	    	<div>
	    		<textarea rows="2" cols="100" name="reviewSubject" id="reviewSubject"></textarea>
	    	</div>
	    	<div>
	    		<button type="button" onclick="reviewInsert()" id="btnstyle" class="btn btn-dark">Submit</button>
	    	</div>
	    	<input type="hidden" id="reviewCheck" name="productId" value="${product.productId }">
	    </div>
	  	<div align="center" id ="reviewList">
	    	
	    </div>
	    
    </form>
<script type="text/javascript">
function reviewInsert(){
	if(${id == null} ){
		alert("로그인 하셔야 합니다.");
		return "memberLoginForm.do";
	}	
	//리뷰 내용
	var reviewSubject = $("#reivewSubject").val();
	
	var queryString = $("form[name=reviewFrm]").serialize();
	$.ajax({
		url:"reviewInsert.do",
		type:"POST",
		data:queryString,
		success:function(){
			/* alert("성공");  */
			$("#reviewSubject").val("").focus();
			$("#reviewList").empty();
			
			reviewList();
			
		},
		error: function(request, status, error){
			alert("code:" + request.status+"\n"+"message: " +request.responseText + "\n"+"error: " + error);
		}
	});	
}
reviewList();
function reviewList(){
	let url = "ajaxReivewList.do"
	fetch(url+"?productId="+"${product.productId }")
		.then(response => response.json())
		.then(json => HtmlConvert(json));
} 
 
function HtmlConvert(datas){
	const container = document.createElement('table');//<table>태그 생성
	container.innerHTML = datas.map(data => createHTMLString(data)).join("");
	
	document.querySelector('#reviewList').appendChild(container);//화면에 추가
}
function createHTMLString(data){
	let str="<tr>";
		str+="<td>"+ data.memberName+"</td>";
		str+="<td>"+ data.reviewSubject+"</td>";
		str+="<td>"+ data.reviewDate+"</td>";
	if("${id}" == data.memberId ){
		str+="<td class='rDelete'><button type='button' onclick='rDeleteBtn("+data.reviewNo+")'>"+"삭제"+"</button></td></tr>"; //삭제버튼
	}else{
		str+="<td></td></tr>"
	}
	return str;

}
	
function rDeleteBtn(reviewNo) {
	location.href = "deleteReview.do?reviewNo=" + reviewNo + "&productId=" + "${product.productId }";
}

function clickBtn(str){
	let frm = document.getElementById("frm");
	if(str=='D'){
 		if(confirm("정말 삭제하시겠습니까?")==true){
			frm.action="productDelete.do" 
	 	}else{
		 	return;
	 	}
	}else{
	 	frm.action="productEdit.do"
	}
	frm.submit();
}

</script>

</body>

</html>
