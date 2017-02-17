<?php
namespace Fluxflow\Modules\Ff\Library;

use Phalcon\Mvc\User\Component;
use Fluxflow\Modules\Api\Models\FluxMessages;
class Elements extends Component 
{
    protected $user;
    
    public function initialize()
    {
    }
    
    public function getMenu()
    {
        
    }
    
    public function getTopNavigation()
    {
        $auth = $this->session->get('auth');
        $this->user = $auth['user'];

        $userPictureFile = "/img/users/user_photo_" . $this->user['id'] . ".png";
        if(!file_exists(APP_PATH . "/../public" . $userPictureFile))
        {
            $userPictureFile = "/img/users/user_photo_null.png"; 
        }
        
        $html = "<div class=\"top_nav\">" .
                    "<div class=\"nav_menu\">" .
                        "<nav>" . 
                            "<div class=\"nav toggle\">" . 
                                "<a id=\"menu_toggle\"><i class=\"fa fa-bars\"></i></a>" .
                            "</div>" .
                            "<ul class=\"nav navbar-nav navbar-right\">" . 
                                "<li class=\"\">" . 
                                    "<a href=\"javascript:vaoid(0);\" class=\"user-profile dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\">" . 
                                        "<img src=\"" . $userPictureFile . "\" alt=\"\">" . $auth['user']['first_name'] . "&nbsp;" .
                                        "<span class=\" fa fa-angle-down\"></span>" .
                                    "</a>" .
                                    "<ul class=\"dropdown-menu dropdown-usermenu pull-right\">" . 
                                        "<li><a href=\"/ff/userusers/view/" . $this->user['id'] . "\"> Profile</a></li>" . 
                                        "<li>" . 
                                            "<a href=\"javascript:void(0);\">" . 
                                                "<span class=\"badge bg-red pull-right\">50%</span>" .
                                                "<span>Settings</span>" . 
                                            "</a>" . 
                                        "</li>" . 
                                        "<li><a href=\"javascript:void(0);\">Help</a></li>" . 
                                        "<li><a class=\"logout\" href=\"javascript:void(0);\"><i class=\"fa fa-sign-out pull-right\"></i> Log Out</a></li>" . 
                                    "</ul>" .
                                "</li>" .
                                "<li role=\"presentation\" class=\"dropdown\">" .
                                    "<a href=\"javascript:;\" class=\"dropdown-toggle info-number\" data-toggle=\"dropdown\" aria-expanded=\"false\">" .
                                        "<i class=\"fa fa-envelope-o\"></i>" .
                                        "<span class=\"badge bg-green\">6</span>" . 
                                    "</a>" . 
                                    "<ul id=\"menu1\" class=\"dropdown-menu list-unstyled msg_list\" role=\"menu\">";
        /*
                                        "<li>" . 
                                            "<a>" . 
                                                "<span class=\"image\"><img src=\"/images/img.jpg\" alt=\"Profile Image\" /></span>" . 
                                                "<span>" . 
                                                    "<span>John Smith</span>" . 
                                                    "<span class=\"time\">3 mins ago</span>" . 
                                                "</span>" . 
                                                "<span class=\"message\">" . 
                                                    "Film festivals used to be do-or-die moments for movie makers. They were where..." . 
                                                "</span>" . 
                                            "</a>" . 
                                        "</li>" . 
                                        "<li>" . 
                                            "<a>" . 
                                                "<span class=\"image\"><img src=\"/images/img.jpg\" alt=\"Profile Image\" /></span>" . 
                                                "<span>" . 
                                                    "<span>John Smith</span>" . 
                                                    "<span class=\"time\">3 mins ago</span>" . 
                                                "</span>" . 
                                                "<span class=\"message\">" . 
                                                    "Film festivals used to be do-or-die moments for movie makers. They were where..." . 
                                                "</span>" . 
                                            "</a>" . 
                                        "</li>" . 
                                        "<li>" . 
                                            "<a>" . 
                                                "<span class=\"image\"><img src=\"/images/img.jpg\" alt=\"Profile Image\" /></span>" . 
                                                "<span>" . 
                                                    "<span>John Smith</span>" . 
                                                    "<span class=\"time\">3 mins ago</span>" . 
                                                "</span>" . 
                                                "<span class=\"message\">" . 
                                                    "Film festivals used to be do-or-die moments for movie makers. They were where..." . 
                                                "</span>" . 
                                            "</a>" . 
                                        "</li>" . 
                                        "<li>" . 
                                            "<a>" . 
                                                "<span class=\"image\"><img src=\"/images/img.jpg\" alt=\"Profile Image\" /></span>" . 
                                                "<span>" . 
                                                    "<span>John Smith</span>" . 
                                                    "<span class=\"time\">3 mins ago</span>" . 
                                                "</span>" . 
                                                "<span class=\"message\">" . 
                                                    "Film festivals used to be do-or-die moments for movie makers. They were where..." . 
                                                "</span>" . 
                                            "</a>" . 
                                        "</li>"
                */
                        $html = $html . "<li>" . 
                                            "<div class=\"text-center\">" . 
                                                "<a href=\"/ff/fluxmessages/index\">" . 
                                                    "<strong>See All Alerts</strong>&nbsp;" . 
                                                    "<i class=\"fa fa-angle-right\"></i>" . 
                                                "</a>" . 
                                            "</div>" . 
                                        "</li>" . 
                                    "</ul>" . 
                                "</li>" . 
                            "</ul>" . 
                        "</nav>" . 
                    "</div>" . 
                "</div>";
        return $html;
    }
    
    public function getQuickProfile()
    {
        
        $auth = $this->session->get('auth');
        $this->user = $auth['user'];

        $userPictureFile = "/img/users/user_photo_" . $this->user['id'] . ".png";
        if(!file_exists(APP_PATH . "/../public" . $userPictureFile))
        {
            $userPictureFile = "/img/users/user_photo_null.png"; 
        }
        
        $html = "<div class=\"profile clearfix\">" .
                "<div class=\"profile_pic\">" .
                "<img src=\"" . $userPictureFile . "\" alt=\"User avatar\" class=\"img-circle profile_img\">" .
                "</div>" .
                "<div class=\"profile_info\">" .
                "<span>Welcome,</span>" .
                "<h2>" . $auth['user']['surename'] . ", " . $auth['user']['first_name'] . "</h2>" . 
                "</div>" .
                "<div class=\"clearfix\"></div>" .
                "</div>";
        return $html;
    }
}
