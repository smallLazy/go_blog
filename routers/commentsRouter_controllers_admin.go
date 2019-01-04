package routers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context/param"
)

func init() {

    beego.GlobalControllerRouter["blog/controllers/admin:ArticleController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:ArticleController"],
        beego.ControllerComments{
            Method: "Create",
            Router: `/create`,
            AllowHTTPMethods: []string{"get","post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/admin:ArticleController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:ArticleController"],
        beego.ControllerComments{
            Method: "Edit",
            Router: `/edit/:id:int`,
            AllowHTTPMethods: []string{"get","post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/admin:ArticleController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:ArticleController"],
        beego.ControllerComments{
            Method: "List",
            Router: `/list`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/admin:ArticleController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:ArticleController"],
        beego.ControllerComments{
            Method: "Show",
            Router: `/show/:id:int`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/admin:CategoryController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:CategoryController"],
        beego.ControllerComments{
            Method: "Create",
            Router: `/create`,
            AllowHTTPMethods: []string{"get","post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/admin:CategoryController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:CategoryController"],
        beego.ControllerComments{
            Method: "Edit",
            Router: `/edit/:id:int`,
            AllowHTTPMethods: []string{"get","post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/admin:CategoryController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:CategoryController"],
        beego.ControllerComments{
            Method: "List",
            Router: `/list`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/admin:FriendshipLinkController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:FriendshipLinkController"],
        beego.ControllerComments{
            Method: "Create",
            Router: `/create`,
            AllowHTTPMethods: []string{"get","post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/admin:FriendshipLinkController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:FriendshipLinkController"],
        beego.ControllerComments{
            Method: "Edit",
            Router: `/edit/:id:int`,
            AllowHTTPMethods: []string{"get","post"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/admin:FriendshipLinkController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:FriendshipLinkController"],
        beego.ControllerComments{
            Method: "List",
            Router: `/list`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/admin:LoginController"] = append(beego.GlobalControllerRouter["blog/controllers/admin:LoginController"],
        beego.ControllerComments{
            Method: "LoginPage",
            Router: `/`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

}
