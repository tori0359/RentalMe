<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/used.css" >
<jsp:include page="../template/headerRe.jsp"></jsp:include>
<style type="text/css">
	.usedStore{
		width: 80%;
		margin: 100px auto;
		margin-bottom: 300px;
	}
	.usedStore #search{
		display: inline-block;
		margin-left: 10px;
	}
	.usedStore h2{
		text-align:center;
		background-color: lightgray;
		cursor: default;
	}
	.usedStore select{
		display: inline-block;
		float: right;
		width: 120px;
		height: 30px;
	}
	.usedStore .tabs{
		margin-top: 20px;
		width: 100%;
		border-bottom: 5px solid black;
	}
	.usedStore .tabs>li{
		display: inline-block;
		width: 20.5%;
		height: 30px;
		line-height: 30px;
		background-color: lightgray;
		text-align: center;
		cursor:pointer;
	}
	.usedStore .tabs>li:first-child{
		margin-left: -40px;
	}
	.usedStore .tabs>li:not(.active):hover{
		background-color: white;
	}
	.usedStore .tabs> .active{
		background-color: black;
		color: white;
	}
	.pagination{
		display: block;
		text-align: center;
		margin-top: 50px;
	}
	.pagination>li>a{
		float: none;
	}
	#insertThing{
		float: right;
		color:white;
		background-color: black;
		width: 100px;
		height: 30px;
		line-height: 30px;
		font-size: 15px;
		text-align: center;
		text-decoration: none;
	}
	#myUsedList ul{
		padding: 0px;
		clear: both;
		
	}
	#myUsedList{
		margin-bottom: 50px;
		clear:both;
	}
	#myUsedList ul>li{
		display: inline-block;
		border-bottom: 1px solid #dedede;
		width: 14.27%;
		height: 30px;
		line-height: 30px;
		float: left;
		text-align: center;
	}
	#myUsedList ul:first-child>li{
		border-top: 1px solid #dedede;
		font-weight: bold;
	}
	#myUsedList ul{
		cursor: default;
	}
	
	
	#myUsedList .used_del{
		display: block;
		background-color: lightgray;
		width: 50px;
		height: 29px;
		margin: auto;
		text-decoration: none;
		color: black;
		border-radius: 5px;
	}
	#myUsedReview textarea{
		margin-left: 0px;
	}
	#myUsedReview button{
		float: right;
		clear: both;
	}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/used.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		$('#myUsedReview').hide();
		$('.tab:first-child').addClass('active');
		var who;	// 클릭한 탭이 누군지
		$('.tab').eq(0).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
			showList();
		});
		$('.tab').eq(1).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
			showReview();
		});
		$('.myUsedLt').mouseenter(function(){
			$(this).children('li').css('background-color','#f0fbfc');
			$(this).children('li').css('cursor','pointer');
		});
		$('.myUsedLt').mouseleave(function(){
			$(this).children('li').css('background-color','white');
		});
		$('.myUsedLt').not('.used_del').click(function(){
			console.log('상세정보');
		});



	});
		
	function removeCls(who){
		$('.tabs').find('li').removeClass('active');
		who.addClass('active');
	}
	function showList(){
		$('#myUsedReview').hide();
		$('#myUsedList').show();
	}
	function showReview(){
		$('#myUsedList').hide();
		$('#myUsedReview').show();
	}

	
</script>
<body>
<div class="usedStore">
	<h2>님의 상점</h2>
	<div>
		<select>
			<option>10개씩 보기</option>
			<option>20개씩 보기</option>
			<option>30개씩 보기</option>		
		</select>
		<select>
			<option>전체</option>
			<option>판매중</option>
			<option>판매완료</option>		
		</select>
	</div><br><br>
	
	<a href="/used/mng" id="insertThing">물품등록</a>
	<ul class="tabs">
		<li class="tab">상품목록</li>
		<li class="tab">상점후기</li>	
	</ul>
	<div id="myUsedList">
		<ul>
			<li>사진</li>
			<li>상태</li>
			<li>물품명</li>
			<li>가격</li>
			<li>찜&#47;댓글</li>
			<li>최근수령일</li>
			<li>삭제</li>
		</ul>
		<ul class="myUsedLt">
			<li>ㅁ</li>
			<li>ㅁ</li>
			<li>ㅁ</li>
			<li>ㅁ</li>
			<li>ㅁ</li>
			<li>ㅁ</li>
			<li><a href="#" class="used_del">삭제</a></li>
		</ul>
	</div>
	<div id="myUsedReview">
		<form action="#" method="post">
			<textarea class="form-control" rows="3"></textarea>
			<button type="submit">후기등록</button>
		</form>
		
	</div>
	
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="active"><a href="#">1</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
	
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>