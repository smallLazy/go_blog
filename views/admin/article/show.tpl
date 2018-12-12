<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>文章</h2>
    </div>
    <div class="col-lg-2">
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox">
        <div class="ibox-title">
            <h5>文章</h5>
            <div class="ibox-tools">
                <a href="/admin/article/list" class="btn btn-primary">返回列表</a>
            </div>
        </div>
        <div class="ibox-content">
            <form class="form" method="post">
               
                <div class="form-group">
                    <label class="control-label col-md-1">文章名称</label>
                    <label class="control-label">{{.article.ArtTitle}}</label>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-1">文章类型</label>
                    <label class="control-label">{{.article.Category.Category}}</label>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-1">短标题</label>
                    <label class="control-label">{{.article.ArticleShortDetail}}</label>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-1">文章内容</label>
                    <p>{{.article.ArticleLongDetail}}</p>
                </div>
            </form>
        </div>
    </div>
</div>