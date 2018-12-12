<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>编辑文章</h2>
    </div>
    <div class="col-lg-2">
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox">
        <div class="ibox-title">
            <h5>编辑文章</h5>
            <div class="ibox-tools">
                <a href="/admin/article/list" class="btn btn-primary">返回列表</a>
            </div>
        </div>
        <div class="ibox-content">
            <form method="post" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label">分类</label>
                    <select class="form-control m-b" name="cat_id">
                    {{range .parents}}
                        <option value="{{.Id}}" {{if eq $.article.Category.Id .Id}}selected{{end}} >{{.Category}}</option>
                    {{end}}
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label">文章标题</label>
                    <input type="text" name="title" class="form-control" value="{{.article.ArtTitle}}">
                </div>
                <div class="form-group">
                    <label class="control-label">短开头</label>
                    <input type="text" name="article_short_detail" class="form-control" value="{{.article.ArticleShortDetail}}">
                </div>
                <div class="form-group">
                    <label class="control-label">文章内容</label>
                    <div class="col-sm-10" id="atricle_long_detail">
                        <textarea  name="article_long_detail">{{.article.ArticleLongDetail}}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
$(function() {
    editormdFun("atricle_long_detail")
});
</script>