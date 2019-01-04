package frontend

import "blog/models/admin"

type DetailController struct {
	BaseController
}

// @router /art/:id:int [get]
func (c *DetailController) Detail() {
	id, _ := c.GetInt(":id")
	article, err := admin.GetArticleById(id)
	if err != nil {
		c.Data["detail"] = article
	}
	c.Data["detail"] = article
	c.RenderTpl("详情", "detail.tpl")
}
