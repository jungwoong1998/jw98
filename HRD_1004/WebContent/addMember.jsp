<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 화면</title>
<script type="text/javascript">
function mailchanges() {
	if(document.add.mails.options[document.add.mails.selectedIndex].value=='0'){
		document.add.mail2.disabled = true;
		document.add.mail2.value =="";
	}
	if(document.add.mails.options[document.add.mails.selectedIndex].value=='9'){
		document.add.mail2.disabled = false;
		document.add.mail2.value =="";
		document.add.mail2.focus();
	}else{
		document.add.mail2.disabled = true;
		document.add.mail2.value=document.add.mails.options[document.add.mails.selectedIndex].value;
	}
}
function check() {
	if(document.add.name.value==""){
		alert("이름을 입력하세요.");
		document.add.name.focus();
	}else if(document.add.password.value==""){
		alert("비밀번호를 입력하세요.");
		document.add.password.focus();
	}else if(document.add.password_re.value==""){
		alert("확인비밀번호를 입력하세요.");
		document.add.password_re.focus();
	}else if(!(document.add.password.value==document.add.password_re.value)){
		alert("비밀번호를 동일하게 입력하세요.");
		docuemnt.add.password_re.focus();
	}else{
		document.add.submit();
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h1>회원 가입 등록 화면</h1><hr/>
<form name="add" method="post" action="addMemberProcess.jsp">
<table border="3" id="tbl">
<% 
PreparedStatement pstmt=null;
ResultSet rs=null;

int idx=0;
String sql="select max(id) from member1004";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	idx = rs.getInt(1)+1;
}
%>
<tr>
<th class="in1">아이디</th>
<td><input type="text" name="id" value="<%=idx %>"></td>
</tr>

<tr>
<th>성 명</th>
<td><input type="text" name="name"></td>
</tr>

<tr>
<th>비밀번호</th>
<td><input type="password" name="password"></td>
</tr>

<tr>
<th>비밀번호 확인</th>
<td><input type="password" name="password_re"></td>
</tr>

<tr>
<th>성 별</th>
<td>
<input type="radio" name="gender" value="남성" checked>남성
<input type="radio" name="gender" value="여성">여성
</td>
</tr>

<tr>
<th>생 일</th>
<td>
<input type="number" name="birth1" min="1960" max="2021" value="<%=2020 %>" size="5">년 
<select name="birth2">
<option value="1">1</option> <option value="2">2</option> <option value="3">3</option> <option value="4">4</option>
<option value="5">5</option> <option value="6">6</option> <option value="7">7</option> <option value="8">8</option>
<option value="9">9</option> <option value="10">10</option> <option value="11">11</option> <option value="12">12</option>
</select>월
<select name="birth3">
<option value="1">1</option> <option value="2">2</option> <option value="3">3</option> <option value="4">4</option> <option value="5">5</option>
<option value="6">6</option> <option value="7">7</option> <option value="8">8</option> <option value="9">9</option> <option value="10">10</option>
<option value="11">11</option> <option value="12">12</option> <option value="13">13</option> <option value="14">14</option> <option value="15">15</option>
<option value="16">16</option> <option value="17">17</option> <option value="18">18</option> <option value="19">19</option> <option value="20">20</option>
<option value="21">21</option> <option value="22">22</option> <option value="23">23</option> <option value="24">24</option> <option value="25">25</option>
<option value="26">26</option> <option value="27">27</option> <option value="28">28</option> <option value="29">29</option> <option value="30">30</option>
</select>일
</td>
</tr>

<tr>
<th>이메일</th>
<td>
<input type="text" name="mail1" value="이메일" onfocus="this.value='';"> @
<input type="text" name="mail2" disabled ><select name="mails" onchange="mailchanges()">
<option value="0">선택하세요</option>
<option value="9">직접입력</option>
<option value="gmail.com">gmail.com</option>
<option value="naver.com">naver.com</option>
<option value="hanmail.net">hanmail.net</option> 
</select>
</td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" name="phone"></td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" name="address"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<input type="button" value="등록" onclick="javascript:check()" class="in2">
<input type="reset" value="취소" class="in2">
</td>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>