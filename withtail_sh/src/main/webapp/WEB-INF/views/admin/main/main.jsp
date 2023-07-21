<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.out{
 display: flex; align-items: center;  flex-direction: row; justify-content: center;
}

.body-main {
	width: 960px;
}
.title{
	font-size: 28px; 
	font-weight: bold; 
	border-bottom: 2px solid #eee; 
	padding-bottom: 10px; 
	width: 1200px;
}

.container {
  display: flex;
}

.box {
  width: 270px;
  height: 120px;
  border: 5px solid #eaeaea;
  margin-right: 0px;
}

.box:not(:last-child) {
  border-right: none;
}

.boxprice{
	font-size: 30px;
	padding: 15px;
	display: flex;
	height: 50%;
	color: #42b3e1;
	font-weight: bold;
}

.smallBox{
	display: flex;
	
}

.left{
	text-align: left;
	width: 50%;
	padding: 15px;
	font-size: 15px;
	margin-bottom: 15px;
	color: #a4a4a4;
	font-weight: bold;
}

.right{
	text-align: right;	
	width: 50%;
	padding: 15px;
	font-size: 15px;
	margin-bottom: 15px;
	color: #42b3e1;
	font-weight: bold;
}

.color1{
	color: #29ce7d;
}

.color2{
	color: #ff7b4d;
}

.color3{
	color: #9c6cf9;
}


/**/
.datebox{
	display: flex;
	padding-top: 30px;
}

.box4{
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-right: 0px;
  padding-top: 15px;
  color: #575757;
	
}

.inbox4{
	width: 270px;
  height: 100px;
  border: 4px solid #eaeaea;
}


.ininbox4{
	display: flex;
	width: 100%;
	height: 60%;
	padding-top: 20px;
	font-weight: bold;
}

.lt{
text-align: left;
	font-size: 16px; 
	width: 50%;
	padding-left: 20px; 
}

.rt{
	text-align: right;
	width: 50%;
	padding-right: 20px; 
}

.box4price{
	text-align: right; 
	padding-right: 20px; 
	font-weight: bold;
}


.box5{
	border: 4px solid #eee; 
	width: 520px; 
	height: 200px; 
	margin-top: 15px;  
	margin-left: 20px;
}

.box5top{
	height: 33%;
	text-align: center;
	font-weight: 600;
	font-size: 25px;
	padding-top: 20px;
	color: #575757;
}

.box5middle{
	height: 33%;
	text-align: center;
	font-weight: 600;
	font-size: 25px;
	padding-top: 5px;
	color: #575757;

}

.box5bottom{
	height: 33%;
	text-align: center;
	font-weight: 600;
	font-size: 35px;
	color: #575757;

}

table {
  width: 1080px; 
  height : 100px;
  border-collapse: collapse;
  font-weight: bold;
  color: #575757;
}

td {
  text-align: center; border: 4px solid #eaeaea; width: 16%
}

tr:nth-child(1) {
  height: 60%;
}

tr:nth-child(2) {
  height: 40%;
  color: #115dc2;
}

.chartbox1{
	margin-right : 4px;
	width: 538px;
	height: 325px;
	border: 1px solid #eee;
}

.btn {
color: #333;
border: 1px solid #999;
background-color: #fff;
padding: 4px;
border-radius: 4px;
font-weight: 500;
font-size: 12px;
cursor: pointer;
font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
vertical-align: baseline;
margin-left: 8px;
}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.2/echarts.min.js"></script>

<script type="text/javascript">


$(function(){
	let url = "${pageContext.request.contextPath}/admin/charts";
	
	$.getJSON(url, function(data){
		chartsSales(data);
		chartsNewMember(data);
		
	});

	function chartsSales (data){	
		console.log(data);
		let chartData = [];
		
		 const dates = [];
		 const today = new Date();

		  for (let i = 6; i >= 0; i--) {
		    const currentDate = new Date(today.getFullYear(), today.getMonth(), today.getDate() - i);
		    const month = currentDate.getMonth() + 1; 
		    const day = currentDate.getDate();
		    const formattedDate = month+'월'+ day+'일';
		    dates.push(formattedDate);
		  }
		console.log(dates)
		for(let item of data.weekSales) {
			let s = parseInt(item.ORDERDATE.substring(5, 7))+'월 ';
			s += parseInt(item.ORDERDATE.substring(8))+'일';

			let obj = {value:item.TOTALMONEY, name:s};
			chartData.push(obj);
		}
		
		
		
	
		const chartDom = document.getElementById('chart1');
		let myChart = echarts.init(chartDom);
		let option;

		option = {	  tooltip: {
		    trigger: 'axis',
		    axisPointer: {
		      type: 'cross',
		      label: {
		        backgroundColor: '#6a7985'
		      }
		    }
		  },
		  		  toolbox: {
		    feature: {
		      saveAsImage: {}
		    }
		  },
		   grid: {
		    left: '3%',
		    right: '4%',
		    bottom: '3%',
		    containLabel: true
		  },
  xAxis: {
    type: 'category',
    data:  dates
  },
  yAxis: {
    type: 'value'
  },
  series: [
    { name: '일별 판매현황',
		      stack: 'Total',
		      label: {
		        show: true,
		        position: 'top'
		      },
		      areaStyle: {},
		      emphasis: {
		        focus: 'series'
		      },
      data: chartData,
      type: 'bar',
      showBackground: true,
      backgroundStyle: {
        color: 'rgba(248, 248, 248, 1)'
      },
      color : 'rgba(130, 173, 70, 1)'
    }
  ]
};

		option && myChart.setOption(option);

	
	}

	function chartsNewMember(data) {
		
		
		let chartData = [];
		
		for(let item of data.weekNewMember) {
			let s = parseInt(item.RDATE.substring(5, 7))+'월 ';
			s += parseInt(item.RDATE.substring(8))+'일';

			let obj = {value:item.TOTALMEMBER, name:s};
			chartData.push(obj);
		}		
	
		const chartDom = document.getElementById('chart2');
		let myChart = echarts.init(chartDom);
		let option;

		option = {
				  tooltip: {
				    trigger: 'item'
				  },
				  legend: {
				    top: '3%',
				    left: 'center'
				  },
				  toolbox: {
				    feature: {
				      saveAsImage: {}
				    }
				  },
				  series: [
				    {
				      top: '10%',
				      name: '일별 신규회원 수',
				      type: 'pie',
				      radius: ['30%', '70%'],
				      avoidLabelOverlap: false,
				      itemStyle: {
				        borderRadius: 10,
				        borderColor: '#fff',
				        borderWidth: 2
				      },
				      label: {
				        show: false,
				        position: 'center'
				      },
				      emphasis: {
				        label: {
				          show: true,
				          fontSize: '40',
				          fontWeight: 'bold'
				        }
				      },
				      labelLine: {
				        show: false
				      },
				      data: chartData
				    }
				  ]
				};		
				
				option && myChart.setOption(option);
			}

});


</script>


<div class="out">
<div>

<div style="margin-bottom: 10px">
	<h3 ><i class="fa-solid fa-chart-simple"></i> 회원 통계 </h3>
</div>
<table>
  <tr>
    <td>신규 회원 수<span style="color: #a4a4a4;">(오늘)</span></td>
    <td>누적 회원 수</td>
    <td>현재 접속 수</td>
    <td>오늘 방문자 수</td>
    <td>어제 방문자 수</td>
    <td>전체 방문자 수</td>
  </tr>
  <tr>
    <td>${todayNewMember.COUNT }명</td>
    <td>${totalMember.COUNT }명</td>
    <td>${currentCount }명</td>
    <td>${toDayCount }명</td>
    <td>${yesterDayCount }명</td>
    <td>${totalCount }명</td>
  </tr>
</table>




<br>
<div class="container">
	<div>
		<div style="margin-bottom: 10px;"><h4>>&nbsp; 최근 1주일 판매현황</h4></div>
		<div class="chartbox1" id="chart1"></div>
	</div>	
	
	<div>
		<div style="margin-bottom: 10px;"><h4>>&nbsp; 최근 1주일 신규회원 수</h4></div>
		<div class="chartbox1" id="chart2"></div>
	</div>	

</div>
<br>

<div style="margin-bottom: 10px">
	<h3 ><i class="fa-solid fa-chart-simple"></i> 판매 통계 </h3>
</div>

<div class="container">
  <div class="box">
  	<div class="boxprice"><fmt:formatNumber value="${todaySales.TODAYSALES }" pattern="#,##0원" /></div>
  	<div class="smallBox">
	  	<div class="left">오늘</div>
	  	<div class="right">${todaySales.COUNT }건</div>
  	</div>
  </div>
  <div class="box">
  	<div class="boxprice color1"><fmt:formatNumber value="${yesterDaySales.YESTERDAYSALES }" pattern="#,##0원" /></div>
  	<div class="smallBox">
	  	<div class="left">어제</div>
	  	<div class="right color1">${yesterDaySales.COUNT }건</div>
  	</div>
  </div>
  <div class="box">
  	<div class="boxprice color2"><fmt:formatNumber value="${monthSales.MONTHSALES }" pattern="#,##0원" /></div>
  	<div class="smallBox">
	  	<div class="left">이번달</div>
	  	<div class="right color2">${monthSales.COUNT }건</div>
  	</div>
  </div>
  <div class="box"> 
  	<div class="boxprice color3"><fmt:formatNumber value="${totalSales.TOTALSALES }" pattern="#,##0원" /></div>
  	<div class="smallBox">
	  	<div class="left">전체</div>
	  	<div class="right color3">${totalSales.COUNT }건</div>
  	</div>
  </div>
</div>
<!--
	 
<form method="post" name="dateSearch">
	<div class="datebox">
		<input type="date" id="start-date" name="start-date">&nbsp; 
		<input type="date" id="end-date" name="end-date"> 
		<button type="submit" class="btn">검색</button>
	</div>
</form>
 -->
 <br>
<div class="container">	
	<div class="box4">
		<div class="inbox4" style="border-right: none; border-bottom:none;">  
			<div class="ininbox4" >
				<div class="lt" >결제완료</div>
				<div class="rt">${paymentCompleted.COUNT}건</div>
			</div>
			<div>
				<div class="box4price"><fmt:formatNumber value="${paymentCompleted.PRICE }" pattern="#,##0원" /></div>
			</div>
		</div>
		<div class="inbox4" style="border-right: none;" >
			<div class="ininbox4" >
				<div class="lt" >배송중</div>
				<div class="rt">${inTransit.COUNT }건</div>
			</div>
			<div>
				<div class="box4price"><fmt:formatNumber value="${inTransit.PRICE }" pattern="#,##0원" /></div>
			</div>
		</div>
	</div>
	
	<div class="box4">
		<div class="inbox4" style="border-bottom: none;" >
			<div class="ininbox4" >
				<div class="lt" >배송준비중</div>
				<div class="rt">${preparing.COUNT }건</div>
			</div>
			<div>
				<div class="box4price"><fmt:formatNumber value="${preparing.PRICE }" pattern="#,##0원" /></div>
			</div>
		</div>
		<div class="inbox4" >
			<div class="ininbox4" >
				<div class="lt" >배송완료</div>
				<div class="rt">${deliveryCompleted.COUNT }건</div>
			</div>
			<div>
				<div class="box4price"><fmt:formatNumber value="${deliveryCompleted.PRICE }" pattern="#,##0원" /></div>
			</div>
		</div>
		
	</div>
	
	
	<div class="box5" >
		<div class="box5top">주문처리완료</div>
		<div class="box5middle">${orderComplete.COUNT }건</div>
		<div class="box5bottom"><fmt:formatNumber value="${orderComplete.PRICE }" pattern="#,##0원" /></div>
	</div>

</div>


</div>
</div><!-- 전체 -->
<br><br><br><br>





