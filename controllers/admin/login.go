package admin

type LoginController struct {
	BaseController
}

// @router / [get]
func (this *LoginController) LoginPage() {
	this.TplName = "login.tpl"
	this.Render()
}

// @router / [post]
// func (this *LoginController) Login() {
// 	username := this.GetString("username")
// 	password := this.GetString("password")
// }
