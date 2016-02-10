// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$('.timer').hide()
$('.start-timer-button').click(function(){
   $(this).siblings('.timer').show()
   $(this).hide()
   var timeOutput = $(this).siblings('.timer').children()
   var formId = $(this).data('todo-action-id')
   var remainingTime = 1500
   var timer =  setInterval(function(){
       var postId = formId
       remainingTime -= 1
       if (remainingTime > 0){
         $(timeOutput).html(Math.floor((remainingTime /60)) +':'+ (remainingTime % 60))
       }else{
         clearInterval(timer);
         var actionStatus =  confirm('Time is up!, did you finish the task?');
         if (actionStatus){
            $.post('/todo_actions/'+postId)
            $(timeOutput).parent().append('<i class="fa fa-check-square-o"></i>')
            $(timeOutput).hide();
         } else {
           $(timeOutput).parent().append('<button class="btn btn-default start-timer-button">Restart <i class="fa fa-clock-o"></i></button>')
           $(timeOutput).hide();
         }

       }
     }, 1000);

})
