$(document).ready( function() {
    
    var functions = {
        data: {
            rows: null,
            paging: {
                page: 0,
                page_size: 10,
                total_pages: 0
            },
            filter: null,
            order: {
                id:"asc"
            },
            values: {}
        },
        loadValues: function()
        {
            $.each($(".javascript-data"), function(key,value) {
                
                var name = $(this).attr("data-key");
                var val = $(this).attr("data-value");
                functions.data.values[name] = val;
            });
            //console.log(functions.data.values);
        },
        insertData: function() {
            $("#table-records > tbody").html("");
            $("#page-size").val(functions.data.paging.page_size);
            if(!!functions.data.rows)
            {
                var pos = "odd";
                functions.data.rows.forEach( function(item,index) {
                    var html = "";
                    
                    if(pos == "odd")
                        pos = "even";
                    else
                        pos = "odd";
                    
                    var active = "Yes";
                    if(item.active == 0)
                        active = "No";
                    
                    var deleted = "Yes";
                    if(item.deleted == 0)
                        deleted = "No";
                    
                    html += "<tr class=\"" + pos + " pointer\">";
                    html += "   <td class=\a-center\">";
                    html += "       <input type=\"checkbox\" class=\"flat\" name=\"table_records\" data-id=\"" + item.id + "\" />";
                    html += "   </td>";
                    html += "   <td class=\"a-center\">" + item.id + "</td>";
                    html += "   <td class=\"\">" + item.name + "</td>";
                    html += "   <td class=\"\">" + item.app_modules_id.name + "</td>";
                    html += "   <td class=\"a-center\">" + active + "</td>";
                    html += "   <td class=\"a-center\">" + deleted + "</td>";
                    html += "   <td class=\"last\">";
                    html += "       <div class=\"btn-group\">";
                    html += "           <a class=\"btn btn-success\" href=\"\">"
                    html += "       </div>";
                    html += "   </td>";
                    html += "</tr>";
                    $("#table-records > tbody").append(html);
                });
                $("input.flat").iCheck({checkboxClass:"icheckbox_flat-green",radioClass:"iradio_flat-green"})
            }
            functions.makeSort();
            functions.makePagination();
        },
        makePagination: function()
        {
            var MAX_PAGES = 5;
            var html = "";
            var startPage = 0;
            var endPage = 1;
            if(functions.data.paging.page < Math.ceil(MAX_PAGES/2)) {
                startPage = 0;
                if(functions.data.paging.total_pages > MAX_PAGES)
                {
                    endPage = MAX_PAGES;
                } else {
                    endPage = functions.data.paging.total_pages;
                }
            } else if (functions.data.paging.page > functions.data.paging.total_pages - Math.ceil(MAX_PAGES/2)) {
                startPage = functions.data.paging.total_pages - MAX_PAGES;
                endPage = functions.data.paging.total_pages;
            } else {
                startPage = functions.data.paging.page - Math.floor(MAX_PAGES/2);
                endPage = functions.data.paging.page + Math.ceil(MAX_PAGES/2)
            }

            var disabled = "";
            if(functions.data.paging.page == 0)
                disabled = "disabled";
            html += "<a class=\"paging btn btn-default " + disabled + "\" data-btn=\"first\" data-page=\"0\"><i class=\"fa fa-angle-double-left\"></i> First </a>";
            html += "<a class=\"paging btn btn-default " + disabled + "\" data-btn=\"previous\" data-page=\"" + (functions.data.paging.page-1) + "\"><i class=\"fa fa-angle-left\"></i> Prev </a>";

            var active = "";
            for(var page = startPage; page < endPage; page++)
            {
                active = "";
                if(page == functions.data.paging.page)
                {
                    active = "active";
                }
                html += "<a class=\"paging btn btn-default " + active + "\" data-btn=\"" + page + "\" data-page=\"" + page + "\"> " + (page+1) + " </a>";
            } 

            disabled = "";
            if(functions.data.paging.page == functions.data.paging.total_pages-1)
                disabled = "disabled";
            html += "<a class=\"paging btn btn-default " + disabled + "\" data-btn=\"next\" data-page=\"" + (functions.data.paging.page+1) + "\"> Next <i class=\"fa fa-angle-right\"></i></a>";
            html += "<a class=\"paging btn btn-default " + disabled + "\" data-btn=\"last\" data-page=\"" + (functions.data.paging.total_pages-1) + "\"> Last <i class=\"fa fa-angle-double-right\"></i></a>";
            
            $("#paging").html(html);
            
            var showingText = 
                    "Showing " + 
                    (functions.data.paging.page+1) +
                    " of " + 
                    (functions.data.paging.total_pages) + " pages.";
            $("#paging-show").text(showingText);
            
        },
        makeSort: function() {
            $(".headings > th > a > i")
                    .removeClass("fa-sort-amount-asc")
                    .removeClass("fa-sort-amount-desc")
                    .addClass("fa-sort");
            if(!!functions.data.order)
            {
                var field = Object.keys(functions.data.order)[0];
                var value = functions.data.order[field].toLowerCase();
                $("#col-" + field + " > a > i")
                    .removeClass("fa-sort")
                    .addClass("fa-sort-amount-" + value);
            } else {
                console.error("ERROR: Sort information doesn't exist!");
            }
        },
        makeUrl: function() {
            functions.data.paging.pageSize = $("#page-size").val();
            var orderField = Object.keys(functions.data.order)[0];
            var url = functions.data.values['controller-path'] + functions.data.values['action-path'] + "?paging[page]=" + functions.data.paging.page + "&paging[page_size]=" + functions.data.paging.page_size + "&order[" + orderField + "]=" + functions.data.order[orderField] + "&r=1";
            return url;
        },
        reload: function() {
            functions.ajaxLoad(functions.makeUrl());
        },
        loading:function() {
            var cols = $("#table-records th").length;
            var html = "";
            html += "<tr>";
            html += "<td colspan=\"" + cols + "\">";
            html += "<div id=\"loading-alert\" class=\"alert alert-info\" role=\"alert\">";
            html += "<i id=\"loading-spin\" class=\"fa fa-spinner fa-spin\"></i>&nbsp;<strong id=\"loading-title\">Wait!</strong> <span id=\"loading-message\">Your request is being processed.</span>";
            html += "</div>";
            html += "</td>";
            html += "</tr>";
            $("#table-records > tbody").html(html);
        },
        ajaxLoad: function(url) {
            if(url) {
               functions.loading();
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
                                    $("#loading-message").text("Bad server request!");
                                    $("#loading-title").text("ERROR:");
                                    $("#loading-spin")
                                            .addClass("fa-ban")
                                            .removeClass("fa-spinner")
                                            .removeClass("fa-spin");
                                    $("#loading-alert")
                                            .addClass("alert-error")
                                            .removeClass("alert-info")
                                    break;
                                case 401:
                                    $("#loading-message").text("You don't have permissions to access this information!");
                                    $("#loading-title").text("ERROR:");
                                    $("#loading-spin")
                                            .addClass("fa-ban")
                                            .removeClass("fa-spinner")
                                            .removeClass("fa-spin");
                                    $("#loading-alert")
                                            .addClass("alert-error")
                                            .removeClass("alert-info")
                                    break;
                                case 404:
                                    $("#loading-message").text("No information found!");
                                    $("#loading-title").text("INFO:");
                                    $("#loading-spin")
                                            .addClass("fa-exclamation-triangle")
                                            .removeClass("fa-spinner")
                                            .removeClass("fa-spin");
                                    $("#loading-alert")
                                            .addClass("alert-warning")
                                            .removeClass("alert-info")
                                    break;
                                case 500:
                                    $("#loading-message").text("Internal server error!");
                                    $("#loading-title").text("ERROR:");
                                    $("#loading-spin")
                                            .addClass("fa-ban")
                                            .removeClass("fa-spinner")
                                            .removeClass("fa-spin");
                                    $("#loading-alert")
                                            .addClass("alert-error")
                                            .removeClass("alert-info")
                                    break;
                            }
                        }
                    },
                    success: function(data)
                    {
                        if(!!data.status) {
                            functions.data.rows = data.data.result;
                            functions.data.paging = data.data.paging;
                            functions.data.filter = data.data.filter;
                            functions.insertData();
                        } else {
                            $("#login-error").text("The response from the server is wrong!");
                            $("#login-error").removeClass("hidden");
                        }          
                    }
                });
            }
        }
    }
    
    //functions.loading();
    //setTimeout(function(){
    functions.loadValues()
    functions.reload();
    //}, 2000);     
    
    $("body").on("click",".paging",function(e){
        e.preventDefault();
        var page = $(this).attr("data-page");
        functions.data.paging.page = page;
        functions.reload();
    });
    
    $("#page-size").change(function(e){
        functions.data.paging.page_size = $(this).val();
        functions.reload();
    });
    
    $(".headings > th").click(function(e){
        
        var field = $(this).attr("id");
        var icon = $("#" + field + " > a > i");
        field = field.replace("col-","");
        functions.data.order = {};
        if( icon.hasClass("fa-sort") === true || icon.hasClass("fa-sort-amount-desc") === true )
        {
            functions.data.order[field] = "asc";
        } else if(icon.hasClass("fa-sort-amount-asc") === true) {
            functions.data.order[field] = "desc";
        }
        
        functions.reload();
        
    });
});


