package admin

import (
	"blog/libs"
	"blog/models/admin"

	"github.com/astaxie/beego/context"

	"github.com/astaxie/beego"
)

type LoginController struct {
	BaseController
}

// @router /index
func (this *LoginController) Index() {
	this.TplName = "admin/login/login.tpl"
	this.Render()
}

// @router /login [post]
func (this *LoginController) Login() {
	username := this.GetString("username")
	password := this.GetString("password")
	newpas := libs.Encrypt(password)
	user, err := admin.LoginAdmin(username, newpas)
	if err != nil {
		this.Data["err"] = err
		this.TplName = "admin/login/login.tpl"
		this.Render()
		return
	}
	this.SetSession("user", user)
	this.Redirect("/admin/article/list", 302)
}

// @router /logout
func (this *LoginController) Logout() {
	this.DelSession("user")
	this.Redirect("/admin/login/index", 302)
}

func Init() {
	var FilterLogin = func(ctx *context.Context) {
		user := ctx.Input.Session("user")
		if user == nil {
			if ctx.Request.RequestURI == "/admin/login/index" || ctx.Request.RequestURI == "/admin/login/login" {
				return
			}
			ctx.Redirect(302, "/admin/login/index")
			return
		}
		if ctx.Request.RequestURI == "/admin/login/index" {
			ctx.Redirect(302, "/admin/article/list")
		}
	}
	beego.InsertFilter("/admin/*", beego.BeforeRouter, FilterLogin)
}
