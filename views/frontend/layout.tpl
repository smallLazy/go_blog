<!DOCTYPE html>
<html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lazy's Blog</title>
    <meta name="keywords" content="lazy's 博客">
    <meta name="description" content="lazy's 博客">
    {{assets_css "/static/css/bootstrap.min.css"}}
    {{assets_css "/static/font-awesome/css/font-awesome.css"}}
    {{assets_css "/static/css/frontend/style.css"}}
    {{assets_js "/static/js/jquery-2.1.1.js"}}
</head>
<body>
{{.section1}}
{{.section2}}
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                {{.LayoutContent}}
            </div>
            {{.sidebar}}
        </div>
    </div>
</section>
<hr />
{{.footer}}

{{assets_js "/static/editor.md-master/lib/marked.min.js"}}
{{assets_js "/static/editor.md-master/lib/prettify.min.js"}}
{{assets_js "/static/editor.md-master/lib/raphael.min.js"}}
{{assets_js "/static/editor.md-master/lib/underscore.min.js"}}
{{assets_js "/static/editor.md-master/lib/sequence-diagram.min.js"}}
{{assets_js "/static/editor.md-master/lib/flowchart.min.js"}}
{{assets_js "/static/editor.md-master/lib/jquery.flowchart.min.js"}}
{{assets_js "/static/editor.md-master/editormd.js"}}
{{assets_js "/static/js/frontend/editorview.js"}}
{{assets_js "/static/js/frontend/jquery.marquee.js"}}
{{assets_js "/static/js/frontend/mymarquee.js"}}
</body>
</html>

