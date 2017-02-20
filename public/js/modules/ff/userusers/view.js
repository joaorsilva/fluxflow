$(document).ready( function() {
    
    var functions = 
    {
        data: {
            user: null,
            contact: null,
        },
        userDataSuccess: function()
        {
            $("#user-photo").attr("src","/img/users/" + functions.data.user.photo);
            $("#user-name").text(functions.data.user.first_name + " " + functions.data.user.surename);
            if(!!functions.data.user.user_position_types_id.name)
            {
                $("#user-position").text(functions.data.user.user_position_types_id.name);
            } else {
                $("#user-position").text("");
            }

            functions.ajaxLoad("/api/cntcontacts/?filter['user_users_id']['o']==&filter['user_users_id']['v']=" + $("#_param_resourceId").attr("data-value") + "&r=1", "cntcontact");
            
        },
        contactSuccess: function()
        {
            console.log(functions.data.contact);
            
            if (!!functions.data.contact.cnt_addresses)
            {
                var addressLine = "";
                if(!!functions.data.contact.cnt_addresses.door_number)
                {
                    addressLine += functions.data.contact.cnt_addresses.door_number + ", ";
                }

                if(!!functions.data.contact.cnt_addresses.street_address)
                {
                    addressLine += functions.data.contact.cnt_addresses.street_address;
                }

                var rooInfo = "";
                if(!!functions.data.contact.cnt_addresses.room)
                {
                    rooInfo = "Room " + functions.data.contact.cnt_addresses.room + "<br/>";
                }

                var addressInfo = "";
                if(!!functions.data.contact.cnt_addresses.zip_code)
                {
                    addressInfo += functions.data.contact.cnt_addresses.zip_code;
                }

                if(!!functions.data.contact.cnt_addresses.geo_cities_id.name)
                {
                    if(addressInfo)
                        addressInfo +=" "
                    addressInfo += functions.data.contact.cnt_addresses.geo_cities_id.name + "<br/>";
                }

                if(!!functions.data.contact.cnt_addresses.geo_provinces_id && !!functions.data.contact.cnt_addresses.geo_provinces_id.name )
                {
                    addressInfo += functions.data.contact.cnt_addresses.geo_provinces_id.name + "<br/>";
                }

                if(!!functions.data.contact.cnt_addresses.geo_countries_id && !!functions.data.contact.cnt_addresses.geo_countries_id.name)
                {
                    addressInfo += functions.data.contact.cnt_addresses.geo_countries_id.name  + "<br/>";
                }

                $("#user-address").html(addressLine);
                $("#user-address-info").html(addressInfo);
                if(!!functions.data.contact.cnt_emails.email)
                {
                    $("#user-email").text(functions.data.contact.cnt_emails.email)
                    $("#user-email").attr("href","mailto:" + functions.data.contact.cnt_emails.email);
                }
            }
        },
        ajaxLoad: function(url,resource) {
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

           if(url) {
               $.ajax({
                   url: url,
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
                           switch(resource)
                           {
                                case "userusers":
                                    $(window).trigger('resize');
                                    functions.data.user = data.data;
                                    functions.userDataSuccess();
                                    break;
                                case "cntcontact":
                                    functions.data.contact = data.data.result[0];
                                    functions.contactSuccess();
                                    $("#loading-content").addClass("hidden");
                                    $("#page-content").removeClass("hidden");
                                    break;
                           }
                           return false;
                       } else {
                           $("#login-error").text("The response from the server is wrong!");
                           $("#login-error").removeClass("hidden");
                       }
                   }
               });
           }
        },
    };
    
    if($("#_param_resourceId"))
    {
        functions.ajaxLoad("/api/userusers/" + $("#_param_resourceId").attr("data-value") + "?r=1","userusers");
    }
});


