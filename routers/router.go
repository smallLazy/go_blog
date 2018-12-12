package routers

import (
	"blog/controllers/admin"

	"github.com/astaxie/beego"
)

func init() {
	adminNs := beego.NewNamespace("/admin",
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
	beego.AddNamespace(adminNs)
}
