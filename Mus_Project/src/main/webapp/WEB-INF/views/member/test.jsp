<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
//��ȿ�� �˻� ������� ����

var pwCheck = false;            // ���
var pwckCheck = false;            // ��� Ȯ��
var pwckcorCheck = false;        // ��� Ȯ�� ��ġ Ȯ��


$(document).ready(function(){
	//ȸ������ ��ư(ȸ������ ��� �۵�)
	$(".join_button").click(function(){
		
		/* �Է°� ���� */
		var pw = $('.pw_input').val();           // ��й�ȣ �Է�
		var pwck = $('.pwck_input').val();       // ��й�ȣ Ȯ�� �Է¶�

		
		/* ��й�ȣ ��ȿ���˻� */
		if(pw == ""){
			$('.final_pw_ck').css('display','block');
			pwCheck = false;
		}else{
			$('.final_pw_ck').css('display','none');
			pwCheck = true;
		}
		
		/* ��й�ȣ Ȯ�� ��ȿ���˻� */
		if(pwck == ""){
			$('.final_pwck_ck').css('display','block');
			pwckCheck = false;
		}else{
			$('.final_pwck_ck').css('display','none');
			pwckCheck = true;
		}

		
		/* ���� ��ȿ�� �˻� */
       if(pwCheck&&pwckCheck&&pwckcorCheck){

       	$("#join_form").attr("action", "/member/join");
		$("#join_form").submit();
			//alert("���� ��ȿ��");
       }
		return false;
		
	});
	
});

/* ��й�ȣ Ȯ�� ��ġ ��ȿ�� �˻� */

$('.pwck_input').on("propertychange change keyup paste input", function(){
	
	var pw = $('.pw_input').val();
	var pwck = $('.pwck_input').val();
	$('.final_pwck_ck').css('display', 'none');
	
	if(pw == pwck){
		$('.pwck_input_re_1').css("display","block");
		$('.pwck_input_re_2').css("display","none");
		pwckcorCheck = true;
	}else{
		$('.pwck_input_re_1').css("display","none");
		$('.pwck_input_re_2').css("display","block");
		pwckcorCheck = false;
	}
	
});
</script>
</body>
</html>