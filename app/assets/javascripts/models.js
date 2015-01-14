$(function(){
  $('#model_name').on('blur', function(){
    var name = $(this).val();

    if (name == ''){
      $('.error-name').removeClass('hidden');
    }else{
      $('.error-name').addClass('hidden');
    }
  });
});


$(function(){
  $('#model_price').on('blur', function(){
    var price = $(this).val();

    if (price == ''){
      $('.error-price').removeClass('hidden');
      $('.error-price-isNaN').addClass('hidden');
    }else if(isNaN(price) ){
      $('.error-price-isNaN').removeClass('hidden');
      $('.error-price').addClass('hidden');
    }else{
      $('.error-price').addClass('hidden');
      $('.error-price-isNaN').addClass('hidden');
    }
  });
});


$(function(){
  $('#buton-model').on('click', function(){
    var name = $('#model_name').val();

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
  $('#buton-model').on('click', function(){
    var price = $('#model_price').val();

    if (price == ''){
      $('.error-price').removeClass('hidden');
      $('.error-price-isNaN').addClass('hidden');
      return false;
    }else if(isNaN(price)){
      $('.error-price-isNaN').removeClass('hidden');
      $('.error-price').addClass('hidden');
      return false;
    }else{
      $('.error-price-isNaN').addClass('hidden');
      $('.error-price').addClass('hidden');
      return true;
    }
    
  });
});