package models

import (
	"blog/models/admin"
	"fmt"
	"net/url"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

func init() {
	if beego.BConfig.RunMode == "dev" {
		orm.Debug = true
	}

	dbhost := beego.AppConfig.String("dbhost")
	dbport := beego.AppConfig.String("dbport")
	dbuser := beego.AppConfig.String("dbuser")
	dbpassword := beego.AppConfig.String("dbpassword")
	dbname := beego.AppConfig.String("dbname")

	conn := fmt.Sprintf(
		"%s:%s@tcp(%s:%s)/%s?charset=utf8&loc=%s",
		dbuser,
		dbpassword,
		dbhost,
		dbport,
		dbname,
		url.QueryEscape("Asia/Shanghai"),
	)

	orm.RegisterDataBase("default", "mysql", conn)

	orm.SetMaxIdleConns("default", 0)
	orm.SetMaxOpenConns("default", 0)

	orm.RegisterModel(new(admin.Article))
	orm.RegisterModel(new(admin.Category))
	orm.RegisterModel(new(admin.FriendshipLink))

	orm.RunSyncdb("default", false, true)
}
