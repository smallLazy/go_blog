<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>编辑用户</h2>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox">
        <div class="ibox-title">
            <h5>编辑用户</h5>
            <div class="ibox-tools">
                <a href="/admin/user/list" class="btn btn-primary">返回列表</a>
            </div>
        </div>
        <div class="ibox-content">
            <div class="form-group">
                <label class="control-label">用户名</label>
                <input type="text" name="username" readonly="true" class="form-control" value="{{.user.UserName}}">
            </div>
            
            <div class="form-group">
                <label class="control-label">登录密码</label>
                <input type="password" name="password" class="form-control">
            </div>
            
            <div class="form-group">
                <label class="control-label">确认登录密码</label>
                <input type="password" name="passwordConfirm" class="form-control">
            </div>

            <div class="form-group">
                <label class="control-label">管理身份</label>
                <select class="form-control m-b" name="userGroupId">
                {{range .userGroups}}
                    <option value="{{.Id}}" {{if eq $.user.UserGroup.Id .Id }}selected{{end}}>{{.Name}}</option>
                {{end}}
                </select>
            </div>

            <div class="form-group">
                <label class="control-label">所属上级</label>
                <select class="form-control m-b" name="parentId">
                {{range .parents}}
                    <option value="{{.Id}}" {{if eq $.user.Parent.Id .Id }}selected{{end}}>{{.Name}}</option>
                {{end}}
                </select>
            </div>

            <div>
                <label>
                    <input type="checkbox" name="enabled" class="i-checks" {{if .user.Enabled}}checked{{end}} />
                    启用{{.user.Enabled}}
                </label>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn">提交</button>
            </div>
        </div>
    </div>
</div>