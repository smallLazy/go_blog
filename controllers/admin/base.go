package admin

import (
	"log"

	"github.com/astaxie/beego"
)

type BaseController struct {
	beego.Controller
	Router string
}

func (c *BaseController) RenderTpl(router, tplName string) {
	c.TplPrefix = "admin/"
	c.Layout = "admin/layout.tpl"
	c.TplName = tplName
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["menu"] = "admin/menu.tpl"
	c.LayoutSections["header"] = "admin/header.tpl"
	for _, menu := range menus {
		var active = false
		if len(menu.SubMenu) > 0 {
			for _, submenu := range menu.SubMenu {
				submenu.Active = false
				if submenu.Name == router {
					active = true
					submenu.Active = active
				}
			}
		}
		if menu.Name == router {
			active = true
		}
		menu.Active = active
	}
	c.Data["Username"] = "lazy"
	c.Data["menus"] = menus
}

func (c *BaseController) Error(msg string) {
	c.Data["error"] = msg
	c.RenderTpl("", "error.tpl")
}

func (c *BaseController) Success(msg, uri string) {
	log.Println("success")
	c.Data["SuccessMsg"] = msg
	c.Data["ReturnUri"] = uri
	c.RenderTpl("", "success.tpl")
}

func (c *BaseController) IsGet() bool {
	return c.Ctx.Request.Method == "GET"
}

func (c *BaseController) IsPost() bool {
	return c.Ctx.Request.Method == "POST"
}
