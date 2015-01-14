$(function(){
  $('#trademark_name').on('blur', function(){
    var name = $(this).val();

    if (name == ''){
      $('.error-name').removeClass('hidden');
    }else{
      $('.error-name').addClass('hidden');
    }
  });
});

$(function(){
  $('#buton-marca').on('click', function(){
    var name = $('#trademark_name').val();

    if (name == ''){
      $('.error-name').removeClass('hidden');
       return false;
    }else{
      $('.error-name').addClass('hidden');
      return true;
    }
  });
});