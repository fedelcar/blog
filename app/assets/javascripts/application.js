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

$(".edit-button").click(function(){
  id = this.id;
  $( "#"+id+".txt-title" ).show();
  $( "#"+id+".txt-text" ).show();
  $( "#"+id+".send-edit" ).show();
  $( "#"+id+".edit-button" ).hide();
  $( "#"+id+".destroy-button" ).hide();
  $( "#"+id+".lbl-title" ).hide();
  $( "#"+id+'.lbl-text' ).hide();
});

$(".send-edit").click(function(){
  id = this.id;
  $( "#"+id+".txt-title" ).hide();
  $( "#"+id+".txt-text" ).hide();
  $( "#"+id+".send-edit" ).hide();
  $( "#"+id+".edit-button" ).show();
  $( "#"+id+".destroy-button" ).show();
  $( "#"+id+".lbl-title" ).show();
  $( "#"+id+'.lbl-text' ).show();
  // debugger;
  id = id.split("_")[1],
  $.ajax({
    url: "api/v1/articles/"+id+"/edit",
    method: "POST",
	  data: {"post_title": $("#id_"+id+".txt-title").val(), "text": $("#id_"+id+".txt-text").val()},
	  success: (function(a, b, c){
      $( "#id_"+id+".lbl-title" ).html($("#id_"+id+".txt-title").val());
      $( "#id_"+id+".lbl-text" ).html($("#id_"+id+".txt-text").val());
 	  	console.log("OK")
    }),
	  error: (function(a, b, c){
	  	console.log("Error: "+b)
	  })});
});
