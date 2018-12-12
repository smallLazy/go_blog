<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>新建文章</h2>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox">
        <div class="ibox-title">
            <h5>添加文章</h5>
            <div class="ibox-tools">
                <a href="/admin/article_category/list" class="btn btn-primary">返回列表</a>
            </div>
        </div>
        <div class="ibox-content">
            <form method="post" action="/admin/article_category/create">
                <div class="form-group">
                    <label class="control-label">分类名称</label>
                    <input type="text" name="title" class="form-control">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>