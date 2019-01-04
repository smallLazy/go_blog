{{range .article}}
<div class="blog-main">
    <div class="heading-blog">{{.ArtTitle}}</div>
    <div class="blog-txt">{{.ArticleShortDetail}}</div>
    <div class="blog-info">
        <span class="label label-primary">
            <i class="fa fa-calendar"></i>
            {{dateformat .CreateTime "2006-01-02 15:04:05"}}
        </span>

        <span class="label label-success">
            <i class="fa fa fa-tags"></i>
            {{.Category.Category}}
        </span>

        <a href="/frontend/detail/art/{{.Id}}" class="label label-danger">
            <i class="fa fa-eye"></i>阅读全文
        </a>
    </div>
</div>
{{end}}

{{if gt .paginator.PageNums 1}}
<ul class="pagination">
    {{if .paginator.HasPrev}}
        <li><a href="{{.paginator.PageLinkPrev}}">&laquo;</a></li>
    {{else}}
        <li class="disabled"><a>&laquo;</a></li>
    {{end}}
    {{range $index, $page := .paginator.Pages}}
        <li {{if $.paginator.IsActive .}} class="active"{{end}}>
            <a href="{{$.paginator.PageLink $page}}">{{$page}}</a>
        </li>
    {{end}}
    {{if .paginator.HasNext}}
        <li><a href="{{.paginator.PageLinkNext}}">&raquo;</a></li>
    {{else}}
        <li class="disabled"><a>&raquo;</a></li>
    {{end}}
</ul>
{{end}}