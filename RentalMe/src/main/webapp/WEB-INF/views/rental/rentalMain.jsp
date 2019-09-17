<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../template/header.jsp"></jsp:include>

<style type="text/css">
	.maincar{
		height: 500px;	
	}
	
	.carousel-inner{
		height:500px;
	}
	#event{
		background-color:black;
	}
	#event p {
		color:white;
	}
	

</style>
<script type="text/javascript">
			$(document).ready(function(){
				$('.carousel').carousel({
					  interval: 2000
					})
				});
				
</script>
</head>
<body>
<div id="carousel-example-generic" class="maincar carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="mainimg" src="imgs/main1.png" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
      <img class="mainimg" src="imgs/main2.png" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    ...
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="container">
	<div id="event" style="border:1px solid red;">
		<p> 땡 잡았다! 이벤트경매 바로가기</p>
	</div>
</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>