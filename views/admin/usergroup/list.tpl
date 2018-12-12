<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>用户列表</h2>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>列表</h5>
                    <div class="ibox-tools">
                        <a href="/admin/user/create" class="btn btn-outline btn-info" style="display: inline">创建</a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>权限ID</th>
                                    <th>权限组名称</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{range .userGroups}}
                                <tr>
                                    <td>{{.Id}}</td>
                                    <td>{{.Name}}</td>
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