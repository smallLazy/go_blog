package admin

import (
	"blog/libs"

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
	title := libs.Split(router, "/")
	// aa := libs.ContainsStr(router, "/", 0)
	// aaa := strings.Split(router, "/")
	// log.Println("==========", router, aaa)
	for _, menu := range menus {
		var active = false
		if len(menu.SubMenu) > 0 {
			for _, submenu := range menu.SubMenu {
				if submenu.Name == title[1] {
					active = true
					// submenu.Active = active
				} else {
					active = false
					// submenu.Active = active
				}
				submenu.Active = active
			}
		}
		if menu.Name == title[0] {
			active = true
		} else {
			active = false
		}
		menu.Active = active

		// log.Printf("%+v", menu)

	}
	c.Data["Username"] = "lazy"
	c.Data["menus"] = menus
}

func (c *BaseController) Error(msg string) {
	c.Data["error"] = msg
	c.RenderTpl("", "error.tpl")
}

func (c *BaseController) Success(msg, uri string) {
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
