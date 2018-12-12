<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>分类列表</h2>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>分类列表</h5>
                    <div class="ibox-tools">
                        <a href="/admin/article_category/create" class="btn btn-outline btn-info" style="display: inline">创建</a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>分类名称</th>
                                    <th>创建时间</th>
                                    <th>更新时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{range .data}}
                                <tr>
                                    <td>{{.Id}}</td>
                                    <td>{{.Category}}</td>
                                    <td>{{dateformat .CreateTime "2006-01-02 15:04:05"}}</td>
                                    <td>{{dateformat .UpdateTime "2006-01-02 15:04:05"}}</td>
                                    <td>
                                        <div class="btn-group">
                                            <!--<a href="/admin/article_category/show/{{.Id}}" class="btn btn-primary" style="display: inline;">查看</a> -->
                                            <a href="/admin/article_category/edit/{{.Id}}" class="btn btn-primary" style="display: inline;">编辑</a>
                                            <!-- <a href="/admin/article/del/{{.Id}}" class="btn btn-danger"  style="display:inline;">删除</a> -->
                                        </div>
                                    </td>
                                </tr>
                                {{end}}
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="ibox-foot">
                </div>
            </div>
        </div>
    </div>
</div>