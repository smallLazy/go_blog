package admin

import (
	"blog/models/admin"
	"log"
	"time"

	"github.com/astaxie/beego/orm"
)

type FriendshipLinkController struct {
	BaseController
}

// @router /list
func (c *FriendshipLinkController) List() {
	links, err := admin.FriendshipLinkList()
	if err != nil {
		c.Error("链接不存在")
		return
	}
	c.Data["data"] = links
	c.RenderTpl("友情链接/链接列表", "friendship_link/list.tpl")
}

// @router /create [get,post]
func (c *FriendshipLinkController) Create() {
	if c.IsPost() {
		url := c.GetString("url")
		name := c.GetString("title")
		description := c.GetString("description")
		nowTime := time.Now()
		_, err := admin.FriendshipLinkCreate(url, name, description, nowTime)
		if err == nil {
			c.Success("添加成功", "/admin/friendship_link/list")
			return
		}

	}
	c.RenderTpl("友情链接/添加链接", "friendship_link/create.tpl")
}

// @router /edit/:id:int [get,post]
func (c *FriendshipLinkController) Edit() {
	id, _ := c.GetInt(":id")
	log.Println(id)
	if c.IsPost() {
		url := c.GetString("linkUrl")
		name := c.GetString("title")
		description := c.GetString("description")
		nowTime := time.Now()
		data := orm.Params{
			"Name":        name,
			"Url":         url,
			"Description": description,
			"UpdateTime":  nowTime,
		}
		_, err := admin.FriendshipLinkEdit(id, data)
		if err == nil {
			c.Success("修改成功", "/admin/friendship_link/list")
			return
		}

	}
	link, _ := admin.GetFriendshipLinkById(id)
	c.Data["link"] = link
	c.RenderTpl("友情链接/编辑链接", "friendship_link/edit.tpl")
}
