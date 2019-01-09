package admin

import (
	"fmt"
	"time"

	"github.com/astaxie/beego/orm"
)

// Category ...
type Category struct {
	Id         int
	Category   string
	CreateTime time.Time  `orm:"auto_now_add;type(datetime)"`
	UpdateTime time.Time  `orm:"auto_now";type(datetime)`
	Article    []*Article `orm:"reverse(many)"`
}

// GetCategories 获取文章所有分类列表
func GetCategories() ([]*Category, error) {
	o := orm.NewOrm()
	var category []*Category
	_, err := o.QueryTable("category").All(&category)
	if err != nil {
		fmt.Printf(err.Error())
		return nil, err
	}
	return category, nil
}

// GetCategoryById 根据分类id获取分类信息
func GetCategoryById(id int) (*Category, error) {
	o := orm.NewOrm()
	category := &Category{}
	err := o.QueryTable("Category").Filter("Id", id).One(category)
	if err != nil {
		fmt.Printf(err.Error())
	}
	return category, nil
}

// ArticleCategoryEdit 编辑文章分类信息
func ArticleCategoryEdit(id int, data orm.Params) (int64, error) {
	o := orm.NewOrm()
	num, err := o.QueryTable("Category").Filter("Id", id).Update(data)
	if err != nil {
		fmt.Printf(err.Error())

	}
	return num, nil
}

// ArticleCategoryCreate 创建分类
func ArticleCategoryCreate(category string) error {
	o := orm.NewOrm()
	artCategory := Category{Category: category}
	err := o.Read(&artCategory, "Category")
	if err != nil && err != orm.ErrNoRows {
		return err
	}
	art := Category{
		Category: category,
	}
	if artCategory.Id == 0 {
		_, err := o.Insert(&art)
		if err != nil {
			return err
		}
	} else {
		_, err := o.Update(&art)
		if err != nil {
			return err
		}
	}
	return nil
}
