<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>新建用户</h2>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox">
        <div class="ibox-title">
            <h5>添加用户</h5>
            <div class="ibox-tools">
                <a href="/admin/user/list" class="btn btn-primary">返回列表</a>
            </div>
        </div>
        <div class="ibox-content">
            <form method="post" action="/admin/user/create">
                {{if .error}}
                <div class="form-group">
                    <div class="alert alert-danger">{{.error}}</div>
                </div>
                {{end}}
                <div class="form-group">
                    <label class="control-label required">用户名</label>
                    <input type="text" name="username" class="form-control" value="">
                </div>
                
                <div class="form-group">
                    <label class="control-label required">登录密码</label>
                    <input type="password" name="password" required="required" class="form-control">
                </div>
                
                <div class="form-group">
                    <label class="control-label required">确认登录密码</label>
                    <input type="password" name="passwordConfirm" required="required" class="form-control">
                </div>

                <div class="form-group">
                    <label class="control-label required">管理身份</label>
                    <select class="form-control m-b" name="userGroupId">
                    {{range .userGroups}}
                        <option value="{{.Id}}">{{.Name}}</option>
                    {{end}}
                    </select>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>