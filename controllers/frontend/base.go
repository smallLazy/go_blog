package frontend

import (
	"blog/libs"
	"blog/models/admin"

	"github.com/astaxie/beego"
)

type BaseController struct {
	beego.Controller
	Router string
}

// RenderTpl 模板渲染
func (c *BaseController) RenderTpl(router, tplName string) {
	c.TplPrefix = "frontend/"
	c.Layout = "frontend/layout.tpl"
	c.TplName = tplName
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["section1"] = "frontend/section1.tpl"
	c.LayoutSections["section2"] = "frontend/section2.tpl"
	c.LayoutSections["sidebar"] = "frontend/sidebar.tpl"
	c.LayoutSections["footer"] = "frontend/footer.tpl"
	links, err := admin.FriendshipLinkList()
	if err != nil {
		c.Data["links"] = nil
	}
	category, err := admin.GetCategories()
	if err != nil {
		c.Data["category"] = nil
	}
	c.Data["links"] = links
	c.Data["category"] = category
}

// SetPaginator 设置分页
func (c *BaseController) SetPaginator(per int, nums int64) *libs.Paginator {
	p := libs.NewPaginator(c.Ctx.Request, per, nums)
	c.Data["paginator"] = p
	return p
}
