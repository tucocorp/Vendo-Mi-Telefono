$(function(){
  $('#state_name').on('blur', function(){
    var name = $(this).val();

    if (name == ''){
      $('.error-name').removeClass('hidden');
    }else{
      $('.error-name').addClass('hidden');
    }
  });
});

$(function(){
  $('#state_factor').on('blur', function(){
    var factor = $(this).val();

    if (factor == ''){
      $('.error-factor-empty').removeClass('hidden');
      $('.error-factor-isNaN').addClass('hidden');
    }else if(isNaN(price) ){
      $('.error-factor-empty').addClass('hidden');
      $('.error-factor-isNaN').removeClass('hidden');
    }else{
      $('.error-factor-empty').addClass('hidden');
      $('.error-factor-isNaN').addClass('hidden');
    }
  });
});


$(function(){
  $('#buton-states').on('click', function(){
    var name = $('#state_name').val();

    if (name == ''){
      $('.error-name').removeClass('hidden'); 
      return false;
    }else{
      $('.error-name').addClass('hidden');
      return true;
    }
  });
});

$(function(){
  $('#buton-states').on('click', function(){
    var factor = $('#state_factor').val();

    if (factor == ''){
      $('.error-factor-empty').removeClass('hidden');
      $('.error-factor-isNaN').addClass('hidden');
      return false;
    }else if(isNaN(factor)){
      console.log(factor);
      $('.error-factor-isNaN').removeClass('hidden');
      $('.error-factor-empty').addClass('hidden');
      return false;
    }else{
      $('.error-factor-isNaN').addClass('hidden');
      $('.error-factor-empty').addClass('hidden');
      return true;
    }
    
  });
});