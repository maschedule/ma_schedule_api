$(document).ready(function(){
  $('.active_form').load('periods/new form')

  $('#add_period_link').click(function(e){
    $('.active_form').load('periods/new form')
    e.preventDefault
  });

  $('#add_performance_link').click(function(e){
    $('.active_form').load('/period_select #period_select')
    e.preventDefault
  });

  $('#period_id').change(function(){
    var period_id = $(this).val()
    $('#add_performance_for_period').load('periods/' + period_id + '/performances/new form')
  })
});