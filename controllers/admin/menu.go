package admin

import (
	"git.pleamon.com/p/pconfig"
)

type Menu struct {
	Active  bool
	Icon    string
	Name    string
	Uri     string
	SubMenu []*Menu
}

type MenuLoad struct {
	Menu []*Menu
}

var (
	menus []*Menu
)

func init() {
	menuLoad := &MenuLoad{}
	pconfig.LoadYml("conf/menu.yml", menuLoad)
	menus = menuLoad.Menu
}
