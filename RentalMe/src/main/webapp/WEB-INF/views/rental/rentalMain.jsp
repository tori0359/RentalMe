<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<jsp:include page="../template/header.jsp"></jsp:include>

<style type="text/css">
	.maincar{
		height: 850px;	
	}
	
	.carousel-inner{
		height:500px;
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
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="mainimg" src="imgs/aircon_caro.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
      <img class="mainimg" src="imgs/bed_caro.jpg" alt="...">
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
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>