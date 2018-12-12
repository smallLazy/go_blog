<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>用户列表</h2>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>查询</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <form class="form-inline">
                            <div class="col-lg-3">
                                <label class="control-label">用户名</label>
                                <input type="text" name="username" class="form-control" value="{{.username}}"/>
                            </div>
                            <div class="col-lg-3">
                                <label class="control-label">身份</label>
                                <select class="form-control m-b" name="userGroupId" style="margin-bottom: 0px;">
                                    <option value="0">所有</option>
                                {{range .userGroups}}
                                    <option value="{{.Id}}" {{if eq $.userGroupId .Id}}selected{{end}}>{{.Name}}</option>
                                {{end}}
                                </select>
                            </div>
                            <div class="col-lg-3">
                                <input type="submit" class="btn btn-primary" value="查询" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
                                    <th>用户ID</th>
                                    <th>用户名</th>
                                    <th>身份</th>
                                    <th>所属上级</th>
                                    <th>注册时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{range .users}}
                                <tr>
                                    <td>{{.Id}}</td>
                                    <td>{{.UserName}}</td>
                                    <td>
                                        {{.UserGroup.Name}}
                                    </td>
                                    <td>
                                    {{if .Parent}}
                                        {{.Parent.UserName}}
                                    {{else}}
                                    {{end}}
                                    </td>
                                    <td>{{dateformat .Addtime "2006-01-02 15:04:05"}}</td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="/admin/user/show/{{.Id}}" class="btn btn-primary" oapermission="wxwifi_show" href="" style="display: inline;">查看</a>
                                            <a href="/admin/user/edit/{{.Id}}" class="btn btn-primary" oapermission="wxwifi_edit" href="" style="display: inline;">编辑</a>
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