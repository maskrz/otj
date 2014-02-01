// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap/bootstrap.min
//= require bootstrap/bootstrap-select
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $(".pull-me").click(function(){
    $("#new-athlete-box").fadeIn("slow"); 
    $(".pull-me").fadeOut("slow");
  });
  
  $('#groups').change(function() {
    
   $.ajax({
    type: "GET",
    url: "/remote/get_trainings/" + encodeURIComponent($(this).attr('value')),
    success: function(data){
         $('#trainings').empty();
         $('#trainings').append( $('<option>Select your State</option>'));
         jQuery.each(data,function(i, v) {
           $('#trainings').append( $('<option value="'+ data[i][1] +'">'+data[i][0] +'</option>'));
         });
       
     }
   });
 
  });
});

$(".alert").alert();
