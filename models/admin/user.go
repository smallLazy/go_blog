package admin

import (
	"time"

	"github.com/astaxie/beego/orm"
)

type AdminUser struct {
	Id         int
	Name       string
	Password   string
	Header     string
	CreateTime time.Time `orm:"auto_now_add;type(datetime)"`
	UpdateTime time.Time `orm:"auto_now;type(datetime)"`
}

func LoginAdmin(uname string, pwd string) (*AdminUser, error) {
	o := orm.NewOrm()
	var user = &AdminUser{}
	err := o.QueryTable("AdminUser").Filter("Name", uname).Filter("Password", pwd).One(user)
	if err != nil {
		return nil, err
	}
	return user, nil
}
