<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- 주소 가져오기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function findAddr() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            let roadAddr = data.roadAddress;  	// 도로명 주소
	            let jibunAddr = data.jibunAddress;	// 지번 주소
	            let extraAddr = '';					// 동이나 빌딩명을 넣을 변수
	            
	            document.getElementById("postcode").value = data.zonecode; // 우편번호
	            
	            if(data.userSelectedType == 'R') {  // 사용자가 도로명 주소 선택
	            	if(data.bname != '') {
	            		extraAddr += data.bname;		// 동이름
	            	}
	            	if(data.buildingName != '') {
	            		extraAddr += ', ' + data.buildingName;	// 빌딩명
	            	}
	            	roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';          	
	            	document.getElementById("addr").value = roadAddr;
	            	
	            } else {		// 사용자가 지번 주소 선택
	            	if(data.buildingName != '') {
	            		extraAddr += ', ' + data.buildingName;	// 빌딩명
	            	}
	            	jibunAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
	            	document.getElementById("addr").value = jibunAddr;
	            }
	        }
	    }).open();
	}
</script>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
     <div class="outer">
        <h2>회원가입</h2>
        <form method="post" action="insert.me" id="enrollForm">
            <table align="center">
                <tr>
                    <td>* ID</td>
                    <td><input name="userId" id="userid" required></td>
                    <div id="checkResult" style="font-size: 0.8em; display: none;"></div>
                </tr>
                <tr>
                    <td>* PWD</td>
                    <td><input type="password" name="userPwd" required></td>
                </tr>
                <tr>
                    <td>* NAME</td>
                    <td><input name="userName" required></td>
                </tr>
                <tr>
                    <td>&ensp; EMAIL</td>
                    <td><input name="email"></td>
                </tr>
                <tr>
                    <td>&ensp; BIRTHDAY</td>
                    <td><input name="birthday" placeholder="생년월일 6자리 ex)010101"></td>
                </tr>
                <tr>
                    <td>&ensp; GENDER</td>
                    <td><input type="radio" name="gender" value="M">남&emsp;</td>
                    <td><input type="radio" name="gender" value="F">여</td>
                </tr>
                <tr>
                    <td>&ensp; PHONE</td>
                    <td><input name="phone" placeholder="- 포함"></td>
                </tr>
                <tr>
                    <td>&ensp; ADDRESS</td>
                    <td><input name="address" size="40" id="Addr" onclick="findAddr();"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="회원가입">&emsp;
                        <input type="reset" value="초기화">
                    </td>
                </tr>
            </table>
        </form>
     </div>
     
     <script>
     	$(() => {
     		const $input = $('#userid');
     		$input.keyup(function() {
     			if($input.val().length >= 5) {
     				$ajax({
     					url : "idCheck.me",
     					data : {checkId: $input.val()} ,
     					seccess : function() {
     						if(result == 'idN') {
     							$('#checkResult').show();
     							$('#checkResult').css('color', 'red').text('사용할 수 없습니다.');
     							$('#enrollForm :submit').attr('disabled', true);
     						} else {
     							$('#checkResult').show();
     							$('#checkResult').css('color', 'green').text('사용가능한 아이디 입니다.');
     							$('#enrollForm :submit').attr('disabled', false);
     						}
     					},
     					error: function() {
     						console.log("아이디 중복 ajax 통신 실패");
     					}
     				})
     			} else {
     				$('#checkResult')hide();
     				$('#enrollForm :submit').attr('disabled', true);
     			}
     		})
     	})
     </script>
     
</body>
</html>