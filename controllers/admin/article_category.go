package admin

import (
	"blog/models/admin"
	"time"

	"github.com/astaxie/beego/orm"
)

type CategoryController struct {
	BaseController
}

// @router /list
func (c *CategoryController) List() {
	list, err := admin.GetCategories()
	if err != nil {
		c.Error(err.Error())
		return
	}
	c.Data["data"] = list
	c.RenderTpl("文章管理/分类管理", "article_category/list.tpl")
}

// @router /create [get,post]
func (c *CategoryController) Create() {
	if c.IsPost() {
		nowTime := time.Now()
		category := c.GetString("title")
		_, err := admin.ArticleCategoryCreate(category, nowTime, nowTime)
		if err == nil {
			c.Success("添加成功", "/admin/article_category/list")
			return
		}
	}
	c.RenderTpl("文章管理/新建分类", "article_category/create.tpl")
}

// @router /edit/:id:int [get,post]
func (c *CategoryController) Edit() {
	id, _ := c.GetInt(":id")
	if c.IsPost() {
		title := c.GetString("title")
		nowTime := time.Now()
		data := orm.Params{
			"Category":   title,
			"UpdateTime": nowTime,
		}
		_, err := admin.ArticleCategoryEdit(id, data)
		if err == nil {
			c.Success("修改成功", "/admin/article_category/list")
			return
		}
	}
	category, _ := admin.GetCategoryById(id)

	c.Data["data"] = category
	c.RenderTpl("文章管理/编辑分类", "article_category/edit.tpl")
}
