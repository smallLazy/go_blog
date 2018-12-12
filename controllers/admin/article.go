package admin

import (
	"blog/models/admin"
	"fmt"
	"time"

	"github.com/astaxie/beego/orm"
)

// ArticleController ...
type ArticleController struct {
	BaseController
}

// @router /list [get]
func (c *ArticleController) List() {
	article, err := admin.ArticlesList()
	if err != nil {
		c.Error("文章不存在")
		return
	}
	c.Data["data"] = article
	c.RenderTpl("文章列表", "article/list.tpl")
}

// @router /show/:id:int [get]
func (c *ArticleController) Show() {
	id, _ := c.GetInt(":id")
	article, err := admin.GetArticleById(id)
	if err != nil {
		c.Error(err.Error())
		return
	}
	c.Data["article"] = article
	c.RenderTpl("文章列表", "article/show.tpl")
}

// @router /edit/:id:int [get,post]
func (c *ArticleController) Edit() {
	id, _ := c.GetInt(":id")
	if c.IsPost() {
		category := c.GetString("cat_id")
		title := c.GetString("title")
		articleShortDetail := c.GetString("article_short_detail")
		articleLongDetail := c.GetString("article_long_detail")
		currentTime := time.Now()
		data := orm.Params{
			"ArtTitle":           title,
			"ArticleShortDetail": articleShortDetail,
			"ArticleLongDetail":  articleLongDetail,
			"UpdateTime":         currentTime,
			"Category":           category,
		}
		_, err := admin.ArticleEdit(id, data)
		if err == nil {
			c.Success("修改成功", "/admin/article/list")
			return
		}
	}
	parents, err := admin.GetCategories()
	article, _ := admin.GetArticleById(id)
	if err != nil {
		fmt.Printf(err.Error())
	}
	c.Data["parents"] = parents
	c.Data["article"] = article
	c.RenderTpl("用户编辑", "article/edit.tpl")
}

// @router /create [get,post]
func (c *ArticleController) Create() {
	if c.IsPost() {
		category, _ := c.GetInt("cat_id")
		title := c.GetString("title")
		articleShortDetail := c.GetString("article_short_detail")
		articleLongDetail := c.GetString("article_long_detail")
		nowTime := time.Now()
		_, err := admin.ArticleCreate(category, title, articleShortDetail, articleLongDetail, nowTime, nowTime)
		if err == nil {
			c.Success("添加成功", "/admin/article/list")
			return
		}
	}
	category, _ := admin.GetCategories()
	c.Data["category"] = category
	c.RenderTpl("新建文章", "article/create.tpl")
}

// @router /del/:id:int [get,post]
// func (c *ArticleController) Del() {
// 	id, _ := c.GetInt(":id")
// 	err := admin.DelById(id)
// 	if err != nil {
// 		c.Error(err.Error())
// 		return
// 	}
// 	c.Success("删除成功", "/admin/article/list")
// }
