<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>编辑链接</h2>
    </div>
    <div class="col-lg-2">
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox">
        <div class="ibox-title">
            <h5>编辑链接</h5>
            <div class="ibox-tools">
                <a href="/admin/friendship_link/list" class="btn btn-primary">返回列表</a>
            </div>
        </div>
        <div class="ibox-content">
            <form method="post" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label">链接url</label>
                    <input type="text" name="linkUrl" class="form-control" value="{{.link.Url}}">
                </div>
                <div class="form-group">
                    <label class="control-label">链接名称</label>
                    <input type="text" name="title" class="form-control" value="{{.link.Name}}">
                </div>
                <div class="form-group">
                    <label class="control-label">链接描述</label>
                    <input type="text" name="description" class="form-control" value="{{.link.Description}}">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>