<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);

@import
	url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300)
	;

.body {
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(/Space/images/loginBack.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.grad {
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0, 0
		, 0, 0)), color-stop(100%, rgba(0, 0, 0, 0.65)));
	/* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header {
	position: absolute;
	top: calc(50% - 35px);
	left: calc(50% - 255px);
	z-index: 2;
}

.header div {
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span {
	color: #5379fa !important;
}

.login {
	position: absolute;
	top: calc(50% - 230px); 
	left: calc(50% - 60px);
	height: 150px;
	width: 450px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top:10px;
}

.login input[type=password] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top:10px;
}

.login input[type=button] {
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #595B5C;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=submit] {
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #595B5C;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover {
	opacity: 0.8;
}

.login input[type=button]:active {
	opacity: 0.6;
}

.login input[type=submit]:hover {
	opacity: 0.8;
}

.login input[type=submit]:active {
	opacity: 0.6;
}

.login input[type=text]:focus {
	outline: none;
	border: 1px solid rgba(255, 255, 255, 0.9);
}

.login input[type=password]:focus {
	outline: none;
	border: 1px solid rgba(255, 255, 255, 0.9);
}

.login input[type=button]:focus {
	outline: none;
}

.login input[type=submit]:focus {
	outline: none;
}

::-webkit-input-placeholder {
	color: rgba(255, 255, 255, 0.6);
}

::-moz-input-placeholder {
	color: rgba(255, 255, 255, 0.6);
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
	<div id="container">
		<div id="main">
			<div class="body"></div>
			<div class="grad"></div>
			<div class="header	">
				<a href="/Space/main.jsp"><div
						style="color: #595B5C; font-size: 3.5em; font-weight: 200;">Space</div></a>
			</div>
			<br>
			<div class="login">
					<form action="<%=request.getContextPath() %>/joinProcess.mem"
					name="join" method="post" onsubmit="return validate()">

					<label for="id"></label> <input type="text" name="id" id="id"
						placeholder="아이디" class="width100" readonly style="background : #a0a0a0	;"/>
						
					<input class="width100" name="idCheck" id="idCheck" type="button" value="중복검사" onclick="window.open('/Space/idCheckForm.mem?openInit=true','','width=500, height=300')">
						
					<br>
					<br> <label for="pass"> </label> <input type="password"
						name="pass" id="pass" placeholder="비밀번호" class="width100" /> <label
						for="pass2"> </label> <input type="password" name="pass2"
						id="pass2" class="width100" placeholder="비밀번호 확인"/> <label for="name"></label> <input
						type="text" name="name" id="name" class="width100" placeholder="이름"/>

					<label for="mem_zip"></label><br>
					<input type="text" name="mem_zip" id="mem_zip" placeholder="우편번호" size="7" readonly style="background: #a0a0a0;"/>
					<input type="text" name="mem_add" id="mem_add" placeholder="도로명주소"  class="width100" readonly style="background : #a0a0a0	;"/>
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					<input type="text" name="mem_add2" id="mem_add2" placeholder="상세주소"  class="width100" />

					<label for="email"></label> <input type="text" name="email"
						id="email" class="width100" value="" placeholder="이메일"/> <input type="hidden" name="grade"
						id="grade" value="u" /> <label for="tel"></label>
						<input type="text" name="tel" id="tel" class="width100" placeholder="전화번호"/>
						<input type="submit" class="width100" value="회원가입">
				</form>
			</div>
			
			
			
			<script
				src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('mem_zip').value = data.zonecode;
					document.getElementById("mem_add").value = roadAddr;

					//auto focus
					document.getElementById("mem_add2").focus();
				}
			}).open();
		}
	</script>
	      <script>
            function validate() {
                var re = /^[a-zA-Z0-9]{4,20}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
                var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                // 이메일이 적합한지 검사할 정규식
 
                var id = document.getElementById("id");
                var pw = document.getElementById("pass");
                var email = document.getElementById("email");
 
 
                // ------------ 이메일 까지 -----------
 
                if(join.id.value=="") {
                    alert("아이디를 입력해 주세요");
                    join.id.focus();
                    return false;
                }
                if(!check(re,id,"아이디는 4~20자의 영문 대소문자와 숫자로만 입력")) {
                    return false;
                }
 
                if(join.pass.value=="") {
                    alert("비밀번호를 입력해 주세요");
                    join.pass.focus();
                    return false;
                }
                if(!check(re,pass,"패스워드는 4~20자의 영문 대소문자와 숫자로만 입력")) {
                    return false;
                }
 
                if(join.pass.value != join.pass2.value) {
                    alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
                    join.pass2.value = "";
                    join.pass2.focus();
                    return false;
                }
                if(join.name.value=="") {
                    alert("이름을 입력해 주세요");
                    join.name.focus();
                    return false;
                }
                
                if(join.mem_zip.value=="") {
                    alert("우편번호를 입력해 주세요");
                    join.mem_zip.focus();
                    return false;
                }
                if(join.mem_add.value=="") {
                    alert("도로명주소를 입력해 주세요");
                    join.mem_add.focus();
                    return false;
                }
                if(join.mem_add2.value=="") {
                    alert("상세주소를 입력해 주세요");
                    join.mem_add2.focus();
                    return false;
                }
                if(email.value=="") {
                    alert("이메일을 입력해 주세요");
                    email.focus();
                    return false;
                }
 
                if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
                    return false;
                }
 
                if(join.tel.value=="") {
                    alert("전화번호를 입력해 주세요");
                    join.tel.focus();
                    return false;
                }
               
            }
 
            function check(re, what, message) {
                if(re.test(what.value)) {
                    return true;
                }
                alert(message);
                what.value = "";
                what.focus();
                //return false;
            }
      </script>
		</div>
	</div>
</body>
</html>