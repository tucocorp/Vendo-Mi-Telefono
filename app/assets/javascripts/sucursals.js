$(function(){

  //---- validacion nombre sucursal ----
  $('#sucursal_name').on('blur', function(){
    var name = $(this).val();

      if(name == ''){
        $('.error-name').removeClass('hidden');
        $('.name').addClass('has-error');
        return false;
      }else{
        $('.error-name').addClass('hidden');
        $('.name').removeClass('has-error');
        return true;

      }


  });
//--- validacion on Click Nombre sucursal --------
  $('#buton-sucursal').on('click', function(){
    var name = $('#sucursal_name').val();
      if(name ==''){
        $('.error-name').removeClass('hidden');
        $('.name').addClass('has-error');
        return false;
      }else{
        $('.error-name').addClass('hidden');
        $('.name').removeClass('has-error');
        return true;
      }


  });
//-------------------- validacion address sucursal ------
  $('#sucursal_address').on('blur',function(){
    var address = $(this).val();
  
      if(address == ''){
        $('.error-address').removeClass('hidden');
        $('.address').addClass('has-error');
        return false;
      }else{
        $('.error-address').addClass('hidden');
        $('.address').removeClass('has-error');
        return true;
      }

  });
//-------- validacion On Click address sucursal -----
  $('#buton-sucursal').on('click',function(){
    var address = $('#sucursal_address').val();
  
      if(address == ''){
        $('.error-address').removeClass('hidden');
        $('.address').addClass('has-error');
        return false;
      }else{
        $('.error-address').addClass('hidden');
        $('.address').removeClass('has-error');
        return true;
      }

  });
//------------ validacion email --------
  $('#sucursal_email').on('blur', function(){
    var email = $(this).val();
      if(email == ''){
          $('.error-email').removeClass('hidden');
          $('.email').addClass('has-error');
          return false;
      }else{
        $('.error-email').addClass('hidden');
        $('.email').removeClass('has-error');
        return true;

      }
  });
// ------------validacion on click email -----------
  $('#buton-sucursal').on('click', function(){
    var email = $('#sucursal_email').val();
      if(email == ''){
          $('.error-email').removeClass('hidden');
          $('.email').addClass('has-error');
          return false;
      }else{
        $('.error-email').addClass('hidden');
        $('.email').removeClass('has-error');
        return true;

      }

  });
//-----------validacion Contact number ---
 $('#sucursal_contact_number').on('blur', function(){
    var phone = $(this).val();

      if(phone == ''){
          $('.phone').addClass('has-error');
          $('.error-phone-empty').removeClass('hidden');
          $('.error-phone-isNaN').addClass('hidden');
          $('.error-phone-length').addClass('hidden');
          return false;
      }else if(!isNaN(phone)){
          if(phone.length != 8){
            $('.phone').addClass('has-error');
            $('.error-phone-length').removeClass('hidden');
            $('.error-phone-isNaN').addClass('hidden');
            $('.error-phone-empty').addClass('hidden');
            return false;
          }
      }else{
        $('.phone').addClass('has-error');
        $('.error-phone-isNaN').removeClass('hidden');
        $('.error-phone-empty').addClass('hidden');
        $('.error-phone-length').addClass('hidden');
        return false;
      }
     $('.phone').removeClass('has-error');
     $('.error-phone-isNaN').addClass('hidden');
     $('.error-phone-empty').addClass('hidden');
     $('.error-phone-length').addClass('hidden');
     return true;
    
  });
//------------validacion Contact number "onClick"-----

$('#buton-sucursal').on('click', function(){
    var phone = $('#sucursal_contact_number').val();

      if(phone == ''){
          $('.phone').addClass('has-error');
          $('.error-phone-empty').removeClass('hidden');
          $('.error-phone-isNaN').addClass('hidden');
          $('.error-phone-length').addClass('hidden');
          return false;
      }else if(!isNaN(phone)){
          if(phone.length != 8){
            $('.phone').addClass('has-error');
            $('.error-phone-length').removeClass('hidden');
            $('.error-phone-isNaN').addClass('hidden');
            $('.error-phone-empty').addClass('hidden');
            return false;
          }
      }else{
        $('.phone').addClass('has-error');
        $('.error-phone-isNaN').removeClass('hidden');
        $('.error-phone-empty').addClass('hidden');
        $('.error-phone-length').addClass('hidden');
        return false;
      }
     $('.phone').removeClass('has-error');
     $('.error-phone-isNaN').addClass('hidden');
     $('.error-phone-empty').addClass('hidden');
     $('.error-phone-length').addClass('hidden');
     return true;
    
  });
//---------- validacion responsible_name---- 
  $('#sucursal_responsible_name').on('blur', function(){
    var responsible = $(this).val();
    if(responsible == ''){
      $('.error-responsable').removeClass('hidden');
      $('.responsable').addClass('has-error');
      return false;
    }else{
      $('.error-responsable').addClass('hidden');
      $('.responsable').removeClass('has-error');
      return true;
    }

  });
//--------validacion on click responsible_name---- 
  $('#buton-sucursal').on('click', function(){
      var responsible = $('#sucursal_responsible_name').val();

      if(responsible == ''){
        $('.error-responsable').removeClass('hidden');
        $('.responsable').addClass('has-error');
        return false;
      }else{
        $('.error-responsable').addClass('hidden');
        $('.responsable').removeClass('has-error');
        return true;
      }

    });

});