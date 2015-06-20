$(document).ready(function(){
  $('.active_form').load('periods/new')

  $('#add_period_link').click(function(e){
    $('.active_form').load('periods/new')
    e.preventDefault
  });

  $('#add_performance_link').click(function(e){
    $('.active_form').load('/periods')
    e.preventDefault
  });
});
