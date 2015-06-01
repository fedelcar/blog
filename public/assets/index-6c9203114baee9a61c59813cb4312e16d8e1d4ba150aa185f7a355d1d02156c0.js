$("#boton").click(function(){
    $("#div1").load("/articles/send_last_10_by_last_5", function(responseTxt, statusTxt, xhr){
        if(statusTxt != "error")
            alert("Error: asdasd");    	
        if(statusTxt == "error")
            alert("Error: " + xhr.status + ": " + xhr.statusText);
    });
});
