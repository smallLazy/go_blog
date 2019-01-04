<div class="col-md-3">
                <ul class="list-group">
                    <li class="list-group-item">热门专题</li>
                    <li class="list-group-item">
                        <div id="marquee">
                            <ul>
                                <li><a href="https://www.docker.com/" target="_blank"><img  src="/static/img/frontend/marquee/01.jpg"></a></li>
                                <li><a href="https://www.python.org/" target="_blank"><img  src="/static/img/frontend/marquee/02.jpg"></a></li>
                                <li><a href="https://docs.ucloud.cn/" target="_blank"><img  src="/static/img/frontend/marquee/03.jpg"></a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <br/>
                <ul class="list-group">
                    <li class="list-group-item">
                        <strong>标签</strong>
                    </li>
                    {{range .category}}
                        <li class="list-group-item">
                            <a href="/frontend/index/second/{{.Id}}" attr_id={{.Id}} class="cat_id" >
                                <i class="fa fa fa-tags"></i>
                                {{.Category}}
                        </li>
                    {{end}}
                </ul>
                <br />
                <ul class="list-group">
                    <li class="list-group-item">友情链接</li>
                    {{range .links}}
                        
                        <li class="list-group-item">
                            <a href="{{.Url}}"  target="_blank">
                                <i class="fa fa-link"></i>
                                {{.Name}}
                            </a>
                        </li>
                    {{end}}
                    <li class="list-group-item">
                        <a href="javascript:void();"  target="_blank">
                            <i class="fa fa-link"></i>
                            更多链接
                        </a>
                    </li>
                </ul>
                <br/>
            </div>