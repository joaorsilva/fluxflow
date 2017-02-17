$(document).ready( function() {
    
    $("#loading-alert")
            .removeClass("alert-warning")
            .removeClass("alert-danger")
            .addClass("alert-info");
    
    $("#page-content").addClass("hidden");
    
    $("#loading-spin")
            .removeClass("fa-exclamation-triangle")
            .removeClass("fa-ban")
            .addClass("fa-spinner")
            .addClass("fa-spin");
    
    if($("#_param_resourceId")) {
        $.ajax({
            url: "/api/userusers/" + $("#_param_resourceId").attr("data-value"),
            type: "GET",
            error: function(xhr, ajaxOptions, thrownError)
            {
                if(!!xhr.status)
                {
                    switch(xhr.status)
                    {
                        case 400:
                            $("#loading-alert")
                                .removeClass("alert-info")
                                .addClass("alert-danger");
                            $("#loading-title").text("ERROR: ");
                            $("#loading-message").text("(" + xhr.status + ") Bad request!");
                            $("#loading-spin")
                                    .removeClass("fa-spinner")
                                    .removeClass("fa-spin")
                                    .addClass("fa-ban");
                            break;
                        case 404:
                            $("#loading-alert")
                                .removeClass("alert-info")
                                .addClass("alert-warning");
                            $("#loading-title").text("ERROR: ");
                            $("#loading-message").text("(" + xhr.status + ") Not found!");
                            $("#loading-spin")
                                    .removeClass("fa-spinner")
                                    .removeClass("fa-spin")
                                    .addClass("fa-exclamation-triangle");
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
                    $("#loading-content").addClass("hidden");
                    $("#page-content").removeClass("hidden");
                    $(window).trigger('resize');
                    return false;
                } else {
                    $("#login-error").text("The response from the server is wrong!");
                    $("#login-error").removeClass("hidden");
                }
            }
        });
    }
});


