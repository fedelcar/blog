// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$("#boton").click(function(){
    $("#div1").load("/articles/send_last_10_by_last_5", function(responseTxt, statusTxt, xhr){
        if(statusTxt == "error")
            alert("Error: " + xhr.status + ": " + xhr.statusText);
    });
});

$("#editButton").click(function(){
  $( "#txtTitle" ).show();
  $( "#txtText" ).show();
  $( "#sendEdit" ).show();
  $( "#editButton" ).hide();
  $( "#destroyButton" ).hide();
  $( "#lblTitle" ).hide();
  $( '#lblText' ).hide();
});

$("#sendEdit").click(function(){
  $( "#txtTitle" ).hide();
  $( "#txtText" ).hide();
  $( "#sendEdit" ).hide();
  $( "#editButton" ).show();
  $( "#destroyButton" ).show();
  $( "#lblTitle" ).show();
  $( '#lblText' ).show();
  $.ajax({
	  url: $('form')[1].action,
	  method: "POST",
	  data: {"post_title": $("#txtTitle").val(), "text": $("#txtText").val()},
	  success: (function(a, b, c){
      $( '#lblTitle' ).text($("#txtTitle").val());
      $( '#lblText' ).text($("#txtText").val());
	  	console.log("OKKKK")
    }),
	  error: (function(a, b, c){
	  	console.log("Nope")
	  })});
});
