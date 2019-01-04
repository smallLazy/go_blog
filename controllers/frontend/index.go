package frontend

import (
	"blog/models/admin"
)

type IndexController struct {
	BaseController
}

// @router /index/
func (c *IndexController) Index() {
	limit := 10
	totalNum, _ := admin.GetArticleCounts(0)
	p := c.SetPaginator(limit, totalNum)
	article, err := admin.ArticlesList(limit, p.Offset(), 0)
	if err != nil {
		c.Data["article"] = nil
	} else {
		c.Data["article"] = article
	}
	c.RenderTpl("首页", "index.tpl")
}

// @router /second/:id:int [get]
func (c *IndexController) Second() {
	catid, _ := c.GetInt(":id")
	limit := 10
	totalNum, _ := admin.GetArticleCounts(catid)
	p := c.SetPaginator(limit, totalNum)
	data, err := admin.ArticlesList(limit, p.Offset(), catid)
	if err != nil {
		c.Data["article"] = nil
	} else {
		c.Data["article"] = data
	}
	c.RenderTpl("Second", "second.tpl")
}
