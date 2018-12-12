<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>友情链接列表</h2>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>友情链接列表</h5>
                    <div class="ibox-tools">
                        <a href="/admin/friendship_link/create" class="btn btn-outline btn-info" style="display: inline">创建</a>
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
                                    <th>链接名</th>
                                    <th>链接url</th>
                                    <th>链接描述</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{range .data}}
                                <tr>
                                    <td>{{.Id}}</td>
                                    <td>{{.Name}}</td>
                                    <td>{{.Url}}</td>
                                    <td>{{.Description}}</td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="/admin/friendship_link/edit/{{.Id}}" class="btn btn-primary" style="display: inline;">编辑</a>
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