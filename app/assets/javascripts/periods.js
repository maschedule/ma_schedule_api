$(document).ready(function(){
  var count = 1;

  $('form').on('click', '.remove_fields', function(e){
    $(this).closest('fieldset').slideUp('slow', function(){
      $(this).remove();
    })
    e.preventDefault;
  })

  $('form').on('click', '.add_fields', function(e){
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, count))
    $('fieldset').last().slideDown('slow')
    count ++
    e.preventDefault()
  })
})