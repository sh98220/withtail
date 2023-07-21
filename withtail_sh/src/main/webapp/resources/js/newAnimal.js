$(function() {
	  // 초기 상태 설정
	  var selectedPet = ""; // 선택된 반려동물 초기화
	  $('.step1').show();
	  $('.step2, .step3, .step4, .step5, .step6, .step7, .step8, .step9').hide();

	  // 강아지나 고양이 선택 시 다음 단계로 이동
	  $('.step1 .add-pet-image').click(function() {
	    selectedPet = $(this).attr('id');
	    $('.step1').hide();
	    $('.step2').show();
	  });
	  
	  // 이름 입력 후 다음 단계로 이동
	  $('.step2 .btn-2').click(function() {
	    var name = $('.step2 .inp').val();
	    if (name !== '') {
	      $('.step2').hide();
	      $('.step3').show();
	    }
	  });

	  // 성별 선택 시 다음 단계로 이동
	  $('.step3 .add-pet-image').click(function() {
	    $('.step3').hide();
	    $('.step4').show();
	  });

	  // 몸무게 입력 후 다음 단계
	  $('.step4 .btn-2').click(function() {
	    var weight = $('.step4 .inp').val();
	    if (weight !== '') {
	      $('.step4').hide();
	      $('.step5').show();
	    }
	  });

	  // 생일 선택 후 다음 단계
	  $('.step5 .btn-2').click(function() {
	    var birthday = $('.step5 .inp').val();
	    if (birthday !== '') {
	      if (selectedPet === 'dogPhoto') {
	        $('.step5').hide();
	        $('.step6').show();
	      } else if (selectedPet === 'catPhoto') {
	        $('.step5').hide();
	        $('.step7').show();
	      }
	    }
	  });

	  // 견종 선택
	  $('.step6 .btn-2').click(function() {
	    var breed = $('.step6 .inp').val();
	    if (breed !== '') {
	      $('.step6').hide();
	      $('.step8').show();
	    }
	  });

	  // 묘종 선택
	  $('.step7 .btn-2').click(function() {
	    var breed = $('.step7 .inp').val();
	    if (breed !== '') {
	      $('.step7').hide();
	      $('.step8').show();
	    }
	  });
	  
	  // 사진 업로드
	  $('.step8 .btn-2').click(function() {
		  var breed = $('.step8 .inp').val();
		    if (breed !== '') {
		      $('.step8').hide();
		      $('.step9').show();
		    }
		  });
	});


$(function() {
  // 이전 버튼 클릭 이벤트 처리
  $(".previous-button").click(function() {
    var currentStep = $(this).closest(".add-content-container").parent();
    var prevStep = currentStep.prev(); 

	// console.log(currentStep);
	// console.log(prevStep);
	
  currentStep.hide(); 
    prevStep.show(); 
  });
});
	
$(function() {
	  // step2 다음 버튼 유효성 검사
	  $('.step2 .inp').on('input', function() {
	    var inputValue = $(this).val();
	    var btnNext = $('.step2 .btn-2');

	    // 유효성 검사: 이름은 한글만 입력 가능
	    var regex = /^[가-힣]+$/;
	    if (regex.test(inputValue)) {
	      $(this).siblings('.error-text').text('');
	      btnNext.prop('disabled', false);
	      btnNext.css('background-color', '#82ae46'); // 버튼의 배경색을 초록색으로 변경
	    } else {
	      $(this).siblings('.error-text').text('올바른 값을 입력하세요.').css('color', 'red');
	      btnNext.prop('disabled', true);
	      btnNext.css('background-color', ''); // 버튼의 배경색을 초기화
	    }
	  });

	  // step4 다음 버튼 유효성 검사
	  $('.step4 .inp').on('input', function() {
	    var inputValue = $(this).val();
	    var btnNext = $('.step4 .btn-2');

	    // 유효성 검사: 몸무게는 숫자만 가능
	    var regex = /^[0-9]+$/;
	    if (regex.test(inputValue)) {
	      $(this).siblings('.error-text').text('');
	      btnNext.prop('disabled', false);
	      btnNext.css('background-color', '#82ae46'); // 버튼의 배경색을 초록색으로 변경
	    } else {
	      $(this).siblings('.error-text').text('올바른 값을 입력하세요.').css('color', 'red');
	      btnNext.prop('disabled', true);
	      btnNext.css('background-color', ''); // 버튼의 배경색을 초기화
	    }
	  });

	  // step5 다음 버튼 유효성 검사
	  $('.step5 .inp').on('input', function() {
	    var inputValue = $(this).val();
	    var btnNext = $('.step5 .btn-2');

	    // 유효성 검사: 올바른 날짜 형식
	    var date = new Date(inputValue);
	    if (date.toString() !== 'Invalid Date') {
	      $(this).siblings('.error-text').text('');
	      btnNext.prop('disabled', false);
	      btnNext.css('background-color', '#82ae46'); // 버튼의 배경색을 초록색으로 변경
	    } else {
	      $(this).siblings('.error-text').text('올바른 값을 입력하세요.').css('color', 'red');
	      btnNext.prop('disabled', true);
	      btnNext.css('background-color', ''); // 버튼의 배경색을 초기화
	    }
	  });

	  // step6 다음 버튼 유효성 검사
	  $('.step6 .inp').on('input', function() {
	    var inputValue = $(this).val();
	    var btnNext = $('.step6 .btn-2');

	    // 유효성 검사: 입력값이 비어있지 않음
	    if (inputValue !== '') {
	      $(this).siblings('.error-text').text('');
	      btnNext.prop('disabled', false);
	      btnNext.css('background-color', '#82ae46'); // 버튼의 배경색을 초록색으로 변경
	    } else {
	      $(this).siblings('.error-text').text('올바른 값을 입력하세요.');
	      btnNext.prop('disabled', true);
	      btnNext.css('background-color', ''); // 버튼의 배경색을 초기화
	    }
	  });
	  
	// step7 다음 버튼 유효성 검사
	  $('.step7 .inp').on('input', function() {
	    var inputValue = $(this).val();
	    var btnNext = $('.step7 .btn-2');

	    // 유효성 검사: 입력값이 비어있지 않음
	    if (inputValue !== '') {
	      $(this).siblings('.error-text').text('');
	      btnNext.prop('disabled', false);
	      btnNext.css('background-color', '#82ae46'); // 버튼의 배경색을 초록색으로 변경
	    } else {
	      $(this).siblings('.error-text').text('올바른 값을 입력하세요.');
	      btnNext.prop('disabled', true);
	      btnNext.css('background-color', ''); // 버튼의 배경색을 초기화
	    }
	  });
	
	});