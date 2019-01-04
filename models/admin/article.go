package admin

import (
	"fmt"
	"time"

	"github.com/astaxie/beego/orm"
)

// Article ...
type Article struct {
	Id                 int
	ArtTitle           string
	ArticleShortDetail string
	ArticleLongDetail  string
	CreateTime         time.Time
	UpdateTime         time.Time
	Category           *Category `orm:"rel(fk);column(cat_id)"`
}

// ArticlesList 获取文章列表
func ArticlesList(limit int, offset int, catid int) ([]*Article, error) {
	o := orm.NewOrm()
	var article []*Article
	qs := o.QueryTable("article")
	qs = qs.RelatedSel("Category")
	if limit != 0 {
		qs = qs.Offset(offset).Limit(limit)
	}
	if catid != 0 {
		qs = qs.Filter("cat_id", catid)
	}
	qs.All(&article)
	return article, nil
}

// GetArticleCounts 获取文章条数（默认是全部，若catid 不为0则表示分类后的条数）
func GetArticleCounts(catid int) (int64, error) {
	o := orm.NewOrm()
	qs := o.QueryTable("article")
	if catid != 0 {
		qs = qs.Filter("cat_id", catid)
	}
	num, err := qs.Count()
	if err != nil {
		return 0, err
	}
	return num, nil
}

// GetArticleById 根据文章id 读取文章信息
func GetArticleById(id int) (*Article, error) {
	o := orm.NewOrm()
	article := &Article{}
	err := o.QueryTable("article").Filter("Id", id).RelatedSel("Category").One(article)
	if err != nil {
		fmt.Printf(err.Error())
	}
	return article, nil
}

// ArticleEdit 编辑文章
func ArticleEdit(id int, data orm.Params) (int64, error) {
	o := orm.NewOrm()
	num, err := o.QueryTable("article").Filter("Id", id).Update(data)
	if err != nil {
		fmt.Printf(err.Error())
	}
	return num, nil
}

// ArticleCreate 添加文章
func ArticleCreate(category int, artTitle, articleShortDetail, articleLongDetail string, createTime, updateTime time.Time) (*Article, error) {
	category1 := &Category{Id: category}
	article := &Article{
		ArtTitle:           artTitle,
		ArticleShortDetail: articleShortDetail,
		ArticleLongDetail:  articleLongDetail,
		Category:           category1,
		CreateTime:         createTime,
		UpdateTime:         updateTime,
	}
	err := article.Insert()
	if err != nil {
		return nil, err
	}
	return article, nil
}

// Insert 插入方法
func (this *Article) Insert() error {
	o := orm.NewOrm()
	_, err := o.Insert(this)
	if err != nil {
		return err
	}
	return nil
}
