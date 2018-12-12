package admin

import (
	"fmt"
	"time"

	"github.com/astaxie/beego/orm"
)

type FriendshipLink struct {
	Id          int
	Name        string
	Url         string
	Description string
	CreateTime  time.Time
	UpdateTime  time.Time
}

func FriendshipLinkList() ([]*FriendshipLink, error) {
	o := orm.NewOrm()
	var links []*FriendshipLink
	_, err := o.QueryTable("FriendshipLink").All(&links)
	if err != nil {
		return nil, err
	}
	return links, nil
}

func FriendshipLinkCreate(url, name, description string, updatetime time.Time) (*FriendshipLink, error) {
	linkdata := &FriendshipLink{
		Name:        name,
		Url:         url,
		Description: description,
		UpdateTime:  updatetime,
	}
	err := linkdata.Insert()
	if err != nil {
		return nil, err
	}
	return linkdata, nil
}

func GetFriendshipLinkById(id int) (*FriendshipLink, error) {
	o := orm.NewOrm()
	link := &FriendshipLink{}
	err := o.QueryTable("FriendshipLink").Filter("Id", id).One(link)
	if err != nil {
		fmt.Printf(err.Error())
	}
	return link, nil
}

func FriendshipLinkEdit(id int, data orm.Params) (int64, error) {
	o := orm.NewOrm()
	num, err := o.QueryTable("FriendshipLink").Filter("Id", id).Update(data)
	if err != nil {
		fmt.Printf(err.Error())
	}
	return num, nil
}

func (this *FriendshipLink) Insert() error {
	o := orm.NewOrm()
	_, err := o.Insert(this)
	if err != nil {
		return err
	}
	return nil
}
