<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8" />
<title>Contact Form Template | PrepBootstrap</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css" />

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<style>
.header {
	color: #36A0FF;
	font-size: 27px;
	padding: 10px;
}

.bigicon {
	font-size: 35px;
	color: #black;
}

#applyBtn{
	padding: 5px;
	font-size: 1.0rem;
}

#listBtn{
	padding: 5px;
	padding-right: 15px;
	padding-left: 15px;
	font-size: 1.0rem;
}

input[type=file]::file-selector-button {
  width: 100px;
  height: 37px;
  background: #007BFF;
  border: 1px solid #007BFF;
  border-radius: 0.25rem;
  cursor: pointer;
  color: #fff;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}

input#pfile.form-control{
	padding: 0px;
}

</style>
</head>

<body>

	<div class="container" align="center">

		<div class="page-header">
			<h2>Auction Insert</h2>
		</div>

		<!-- Product Insert Form - START -->
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="well well-sm">
						<form id="frm" class="form-horizontal"
							enctype="multipart/form-data" action="auctionInsert.do" onsubmit="return formCheck()"
							method="post">
							<fieldset>
								<!-- 제품아이디 -->
								<!-- <div class="form-group">
									<span class="col-md-1 col-md-offset-2 text-center"></span>
									<div class="col-md-8">
										<input id="auctionId" name="auctionId" type="text"
											placeholder="ID" class="form-control" required="required">
									</div>
								</div> -->
								<!-- 제품이름 -->
								<div class="form-group">
									<span class="col-md-1 col-md-offset-2 text-center"></span>
									<div class="col-md-8">
										<input id="auctionName" name="auctionName" type="text"
											placeholder="Name" class="form-control" required="required">
									</div>
								</div>
								<!-- 제품 시작 가격 -->
								<div class="form-group">
									<span class="col-md-1 col-md-offset-2 text-center"></span>
									<div class="col-md-8">
										<input id="auctionPrice" name="auctionPrice" type="number"
											placeholder="StartPrice (maxprice 30% down)" class="form-control" required="required">
									</div>
								</div>
								<!-- 즉시구매가 -->
								<div class="form-group">
									<span class="col-md-1 col-md-offset-2 text-center"></span>
									<div class="col-md-8">
										<input id="auctionMax" name="auctionMax" type="number"
											placeholder="MaxPrice" class="form-control" required="required">
									</div>
								</div>
								<!-- 제품이미지등록 -->
								<div class="form-group">
									<span class="col-md-1 col-md-offset-2 text-center"></span>
									<div class="col-md-8">
										<input id="pfile" name="pfile" type="file" class="form-control">
									</div>
								</div>
								<!-- 제품 시작시간 -->
								<div class = "form-group">
									<span class="col-md-1 col-md-offset-2 text-center"></span>
									<div class="col-md-8">
										<input id="auctionDate" name = "auctionDate" type="date" class="form-control" readonly="readonly">
									</div>
								</div>
								<!-- 제품 종료시간 -->
								<div class = "form-group">
									<span class="col-md-1 col-md-offset-2 text-center"></span>
									<div class="col-md-8">
										<input id="auctionLastDate" name = "auctionLastDate" type="datetime-local" class="form-control" placeholder="종료시간">
									</div>
								</div>
								<!-- 제품설명 -->
								<div class="form-group">
									<span class="col-md-1 col-md-offset-2 text-center"></span>
									<div class="col-md-8">
										<input id="auctionText" name="auctionText" type="text"
											placeholder="About" class="form-control">
									</div>
								</div>
								<!-- 등록버튼 -->
								<div id="button">
									<div class="form-group">
										<div class="col-md-12 text-center">
											<button id="applyBtn" type="submit" class="btn btn-primary btn-lg">Apply</button>&nbsp;&nbsp;
									<!-- 목록버튼 -->
											<button id="listBtn" type="button" onclick="location.href='productList.do'" class="btn btn-primary btn-lg">List</button>
										</div>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	document.getElementById('auctionDate').valueAsDate = new Date();
	
	function formCheck() {
		let frm = document.getElementById("frm");
		if(frm.auctionPrice.value > frm.auctionMax.value*0.3){
			alert("시작값을 다시 설정해주세요");
			frm.auctionPrice.value = "";
			frm.auctionPrice.focus();
			return false;
		}
		
		return true;
	}
	
	  var now = new Date();
	  var year = now.getFullYear();
	  var month = ('0' + (now.getMonth() + 1)).slice(-2);
	  var day = ('0' + now.getDate()).slice(-2);
	  var hour = ('0' + now.getHours()).slice(-2);
	  var minute = ('0' + now.getMinutes()).slice(-2);
	  var formattedDate = year + '-' + month + '-' + day + 'T' + hour + ':' + minute;
	  
	  document.getElementById("auctionLastDate").setAttribute("min", formattedDate);
</script>
</html>