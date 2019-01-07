package routers

import (
	"blog/controllers/admin"
	"blog/controllers/frontend"

	"github.com/astaxie/beego"
)

func init() {
	adminNs := beego.NewNamespace("/admin",
		beego.NSNamespace("/login",
			beego.NSInclude(
				&admin.LoginController{},
			),
		),
		beego.NSNamespace("/article",
			beego.NSInclude(
				&admin.ArticleController{},
			),
		),
		beego.NSNamespace("/article_category",
			beego.NSInclude(
				&admin.CategoryController{},
			),
		),
		beego.NSNamespace("/friendship_link",
			beego.NSInclude(
				&admin.FriendshipLinkController{},
			),
		),
	)
	frontNs := beego.NewNamespace("/frontend",
		beego.NSNamespace("/index",
			beego.NSInclude(
				&frontend.IndexController{},
			),
		),
		beego.NSNamespace("/detail",
			beego.NSInclude(
				&frontend.DetailController{},
			),
		),
	)
	beego.Router("/", &frontend.IndexController{}, "get:Index")
	beego.AddNamespace(adminNs)
	beego.AddNamespace(frontNs)
}
