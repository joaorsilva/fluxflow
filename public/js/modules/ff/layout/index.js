$(document).ready( function() {
    $('.logout').click(function(e) { 
        e.preventDefault();
        $.ajax({
            url: "/api/login/logout",
            type: "GET",
            error: function(xhr, ajaxOptions, thrownError)
            {
                if(!!xhr.status)
                {
                    switch(xhr.status)
                    {
                        case 400:
                            $("#login-error").text("Bad server request!");
                            break;
                        case 401:
                            $("#login-error").text("Your credentials are temporarelly disabled!");
                            break;
                        case 404:
                            $("#login-error").text("The username and password are wrong!");
                            break;
                        case 500:
                            $("#login-error").text("Internal server error!");
                            break;
                    }
                    $("#login-error").removeClass("hidden");
                }
                console.log(xhr);
                console.log(thrownError);                    
            },
            success: function(data)
            {
                if(!!data.status) {
                    window.location = "/ff/login";
                    return false;
                } else {
                    $("#login-error").text("The response from the server is wrong!");
                    $("#login-error").removeClass("hidden");
                }          
            }
        });
   });
});

