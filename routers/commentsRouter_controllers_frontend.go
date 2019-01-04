package routers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context/param"
)

func init() {

    beego.GlobalControllerRouter["blog/controllers/frontend:DetailController"] = append(beego.GlobalControllerRouter["blog/controllers/frontend:DetailController"],
        beego.ControllerComments{
            Method: "Detail",
            Router: `/art/:id:int`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/frontend:IndexController"] = append(beego.GlobalControllerRouter["blog/controllers/frontend:IndexController"],
        beego.ControllerComments{
            Method: "Index",
            Router: `/index/`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["blog/controllers/frontend:IndexController"] = append(beego.GlobalControllerRouter["blog/controllers/frontend:IndexController"],
        beego.ControllerComments{
            Method: "Second",
            Router: `/second/:id:int`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

}
