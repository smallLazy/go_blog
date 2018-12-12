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
	CreateTime time.Time
	UpdateTime time.Time
	Article    []*Article `orm:"reverse(many)"`
}

// GetCategories 获取文章分类列表
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

func GetCategoryById(id int) (*Category, error) {
	o := orm.NewOrm()
	category := &Category{}
	err := o.QueryTable("Category").Filter("Id", id).One(category)
	if err != nil {
		fmt.Printf(err.Error())
	}
	return category, nil
}

func ArticleCategoryEdit(id int, data orm.Params) (int64, error) {
	o := orm.NewOrm()
	num, err := o.QueryTable("Category").Filter("Id", id).Update(data)
	if err != nil {
		fmt.Printf(err.Error())

	}
	return num, nil
}

// ArticleCategoryCreate 创建分类
func ArticleCategoryCreate(category string, createtime, updatetime time.Time) (*Category, error) {
	artCategory := &Category{
		Category:   category,
		CreateTime: createtime,
		UpdateTime: updatetime,
	}
	err := artCategory.Insert()
	if err != nil {
		return nil, err
	}
	return artCategory, err
}

// Insert 插入方法
func (this *Category) Insert() error {
	o := orm.NewOrm()
	_, err := o.Insert(this)
	if err != nil {
		return err
	}
	return nil
}
