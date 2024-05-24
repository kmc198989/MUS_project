<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/admin/memberModify.css">
<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form id="modify_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원 수정</span>
			</div>
			
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
    			<input class="id_input" name="memberId" value="${memberInfo.memberId}" readonly>
				</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
				<span></span>
			</div>
			
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw" value="${memberInfo.memberPw }">
				</div>
				<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
			</div>
			
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input">
				</div>
				<span class="final_pwck_ck">비밀번호 확인란을 입력해주세요.</span>
				<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			</div>
			
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName" value="${memberInfo.memberName }">
				</div>
				<span class="final_name_ck">이름을 입력해주세요.</span>
			</div>
			
			<div class="phone_wrap">
				<div class="phone_name">전화번호</div>
				<div class="phone_input_box">
					<input class="phone_input" name="memberPhone" value="${memberInfo.memberPhone }">
				</div>
			</div>
			
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail" value="${memberInfo.memberMail }">
				</div>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<span class="mail_input_box_warn"></span>
				
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>
			
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1" value="${memberInfo.memberAddr1 }" readonly="readonly">
					</div>
					
					<div class="address_button" onclick="execution_daum_address()">
						<span>주소 찾기</span>
					</div>
					
					<div class="clearfix"></div>
				</div>
				
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddr2" value="${memberInfo.memberAddr2 }" readonly="readonly">
					</div>
				</div>
				
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" name="memberAddr3" value="${memberInfo.memberAddr3 }" readonly="readonly">
					</div>
				</div>
				<span class="final_addr_ck">주소를 입력해주세요.</span>
			</div>
			
			<div class="btn_section">
				<button id="cancelBtn" class="btn">취 소</button>
				<button id="modifyBtn" class="btn modify_btn">수 정</button>
				<button id="deleteBtn" class="btn delete_btn">삭 제</button>
			</div>
			
		</div>
	</form>
	
	<form id="moveForm" action="/admin/memberManage" method="get">
			<input type="hidden" name="pageNum" value="${cri.pageNum}"> 
			<input type="hidden" name="amount" value="${cri.amount}"> 
			<input type="hidden" name="keyword" value="${cri.keyword}"> 
			<input type="hidden" name='memberId' value="${memberInfo.memberId}">
		</form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

		/* 유효성 검사 통과유무 변수 */


		$(document).ready(function() {
			//회원가입 버튼(회원가입 기능 작동)
			$(".modify_btn").click(function() {
				if (true) {
					alert("success");
				} else {
					return false;
				}

			});
		});
		
		/* 취소 버튼 */
		$("#cancelBtn").on("click", function(e){
			e.preventDefault();
			$("#moveForm").submit();
		});
		
		/* 삭제 버튼 */
		$("#deleteBtn").on("click", function(e){
			e.preventDefault();
			let moveForm = $("#moveForm");
			moveForm.find("input").remove();
			moveForm.append('<input type="hidden" name="memberId" value="${memberInfo.memberId}">');
			moveForm.attr("action", "/admin/memberDelete");
			moveForm.attr("method", "post");
			moveForm.submit();
		});	

		//아이디 중복검사
		$('.id_input').on(
				"propertychange change keyup paste input",
				function() {

					/* console.log("keyup 테스트"); */

					var memberId = $('.id_input').val(); // .id_input에 입력되는 값
					var data = {
						memberId : memberId
					} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

					$.ajax({
						type : "post",
						url : "/member/memberIdChk",
						data : data,
						success : function(result) {
							// console.log("성공 여부" + result);
							if (result != 'fail') {
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");
								idckCheck = true;
							} else {
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
								idckCheck = false;
							}
						}// success 종료
					}); // ajax 종료	

				});// function 종료

		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function() {

			var email = $(".mail_input").val(); // 입력한 이메일
			var cehckBox = $(".mail_check_input"); // 인증번호 입력란
			var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스
			var warnMsg = $(".mail_input_box_warn"); // 이메일 입력 경고글

			/* 이메일 형식 유효성 검사 */
			if (mailFormCheck(email)) {
				warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
				warnMsg.css("display", "inline-block");
			} else {
				warnMsg.html("올바르지 못한 이메일 형식입니다.");
				warnMsg.css("display", "inline-block");
				return false;
			}

			$.ajax({

				type : "GET",
				url : "mailCheck?email=" + email,
				success : function(data) {

					//console.log("data : " + data);
					cehckBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;

				}

			});

		});

		/* 인증번호 비교 */
		$(".mail_check_input").blur(function() {

			var inputCode = $(".mail_check_input").val(); // 입력코드	
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과 	

			if (inputCode == code) { // 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class", "correct");
				mailnumCheck = true;
			} else { // 일치하지 않을 경우
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
				mailnumCheck = false;
			}

		});

		/* 다음 주소 연동 */
		function execution_daum_address() {

			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 주소변수 문자열과 참고항목 문자열 합치기
								addr += extraAddr;

							} else {
								addr += ' ';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							$(".address_input_1").val(data.zonecode);
							//$("[name=memberAddr1]").val(data.zonecode);	// 대체가능
							$(".address_input_2").val(addr);
							//$("[name=memberAddr2]").val(addr);			// 대체가능
							// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
							$(".address_input_3").attr("readonly", false);
							$(".address_input_3").focus();

						}
					}).open();

		}

		/* 비밀번호 확인 일치 유효성 검사 */

		$('.pwck_input').on("propertychange change keyup paste input",
				function() {

					var pw = $('.pw_input').val();
					var pwck = $('.pwck_input').val();
					$('.final_pwck_ck').css('display', 'none');

					if (pw == pwck) {
						$('.pwck_input_re_1').css('display', 'block');
						$('.pwck_input_re_2').css('display', 'none');
						pwckcorCheck = true;
					} else {
						$('.pwck_input_re_1').css('display', 'none');
						$('.pwck_input_re_2').css('display', 'block');
						pwckcorCheck = false;
					}

				});

		/* 입력 이메일 형식 유효성 검사 */
		function mailFormCheck(email) {
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return form.test(email);
		}
	</script>

</body>
</html>