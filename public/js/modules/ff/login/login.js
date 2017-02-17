$(document).ready( function() {
    
    $('.submit').click(function(e) {
        e.preventDefault();
        submit = true;
        var form = $(this).closest("form");
        
        //TODO: Form validation
        
        if(submit) {
            $("#login-error").addClass("hidden");
            $.ajax({
                url: form.attr("action"),
                type: form.attr("method"),
                dataType : 'json',
                contentType: 'application/json',
                data:JSON.stringify({
                    email: $("#login-email").val(),
                    password: $("#login-password").val()
                }),
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
                        window.location = "/ff/index";
                        return false;
                    } else {
                        $("#login-error").text("The response from the server is wrong!");
                        $("#login-error").removeClass("hidden");
                    }          
                }
            });
        }
        return false;
    });
    
});

