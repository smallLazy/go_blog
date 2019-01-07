package main

import (
	"blog/controllers/admin"
	_ "blog/models"
	_ "blog/routers"

	"github.com/astaxie/beego"
)

func main() {
	admin.Init()
	beego.BConfig.WebConfig.Session.SessionOn = true
	beego.Run()
}
