<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전기요금 계산</title>
<style>
	body { font-size:11px;}
	table { border-width: thin; }
</style>
</head>
<body>
	<form action="output.do" method="post">
		<table width="600" align="center" border="1">
			<tr>
				<th colspan="4">전기요금 계산</th>
			</tr>
			<tr>
				<td colspan="2">사용일(yyyy-mm-dd)</td>
				<td colspan="2"><input type="text" name="measureDate"  /></td>
			</tr>
			<tr>
				<td colspan="2">사용량(KWh)</td>
				<td colspan="2"><input type="text" name="eAmount"  /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <b>정액할인</b> </td>
				<td colspan="2">해당 없음<input type="radio" name="discountType1" value="0" checked/></td>
			</tr>
			<tr>
				<td colspan="2">장애의 정도가 심한 장애인 및 상이유공자<br/>독립유공자 또는 독립유공자 권리이전 유족 1인</td>
				<td>
					해당<input type="radio" name="discountType1"  value="1"/>
				</td>
				<td>정액 할인<br/>(월 1만6천원, 여름철 2만원 한도)</td>
			</tr>
			<tr>
				<td rowspan="2">기초생활수급자</td>
				<td> 생계, 의료급여</td>
				<td>
					해당<input type="radio" name="discountType1"  value="2"/>
				</td>
				<td>정액 할인<br/>(월 1만6천원, 여름철 2만원 한도)</td>
			</tr>
			<tr>
				<td> 주거, 교육급여</td>
				<td>
					해당<input type="radio" name=discountType1  value="3"/>
				</td>
				<td>정액 할인<br/>(월 1만원, 여름철 1만2천원 한도)</td>
			</tr>
			<tr>
				<td colspan="2">
					차상위계층
					<ul>
						<li>국민기초생활보장법 제9조 5항</li>
						<li>국민건강보험법 시행령 별표2 제3호 라목</li>
						<li>장애인복지법 제49조 및 제50조</li>
						<li>한부모가족지원법 제5조</li>
						<li>우선돌봅 차상위자</li>
					</ul>
				</td>
				<td>
					해당<input type="radio" name="discountType1"  value="4"/>
				</td>
				<td>정액 할인<br/>(월 8천원, 여름철 1만원 한도)</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <b>정률할인(30%)</b> </td>
				<td colspan="2">해당 없음 <input type="radio" name="discountType2"  value="0" checked/></td>
			</tr>
			<tr>
				<td colspan="2">
					3자녀 이상 가구<br/>
					<ul>
						<li>주민등록표상 자(子) 또는 손(孫) 3인 이상</li>
					</ul>
				</td>
				<td>
					해당<input type="radio" name="discountType2"  value="1"/>
				</td>
				<td>30%할인<br/>(월 1만6천원 한도)</td>
			</tr>
			<tr>
				<td colspan="2">
					대가족 가구<br/>
					<ul>
						<li>주민등록표상 가구원수가 5인 이상</li>
					</ul>
				</td>
				<td>
					해당<input type="radio" name="discountType2"  value="2"/>
				</td>
				<td>30%할인<br/>(월 1만6천원 한도)</td>
			</tr>
			<tr>
				<td colspan="2">
					출산가구<br/>
					<ul>
						<li>주민등록표상 출생일로부터 3년 미만의 영아 기재</li>
					</ul>
				</td>
				<td>
					해당<input type="radio" name="discountType2"  value="3"/>
				</td>
				<td>30%할인<br/>(월 1만6천원 한도)</td>
			</tr>
			<tr>
				<td colspan="2">
					생명유지장치 사용고객<br/>
					<ul>
						<li>호흡기 장애 또는 희귀난치성질환</li>
					</ul>
				</td>
				<td>
					해당<input type="radio" name="discountType2"  value="4"/>
				</td>
				<td>30%할인</td>
			</tr>
			<tr>
				<td colspan="2">
					사회복지사업법에 의한 사회복지시설<br/>
				</td>
				<td>
					해당<input type="radio" name="discountType2"  value="4"/>
				</td>
				<td>30%할인</td>
			</tr>
			<tr>
				<td colspan="4">
					※ 여름철 구분 : 6월 1일 ~ 8월 31일 <br/>
					※ 기초생활수급자 및 차상위계층 정액할인은 정률할인(30%)과 중복 적용 가능 <br/>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<button type="submit"> 계산하기 </button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>