<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>博客后台管理系统</title>

    {{assets_css "/static/css/bootstrap.min.css"}}
    {{assets_css "/static/font-awesome/css/font-awesome.css"}}
    {{assets_css "/static/css/plugins/iCheck/custom.css"}}
    {{assets_css "/static/css/plugins/toastr/toastr.min.css"}}
    {{assets_css "/static/js/plugins/gritter/jquery.gritter.css"}}
    {{assets_css "/static/css/plugins/select2/select2.min.css"}}
    {{assets_css "/static/css/animate.css"}}
    {{assets_css "/static/css/style.css"}}
    {{assets_css "/static/css/main.css"}}
    {{assets_js "/static/js/jquery-2.1.1.js"}}
    {{assets_css "/static/editor.md-master/css/editormd.css"}}
    {{assets_js "/static/editor.md-master/editormd.min.js"}}
    <!-- 自定义的通用的js  -->
    {{assets_js "/static/js/admin/common.js"}}   

</head>

<body>
    <div id="wrapper">
        {{.menu}}
        {{.header}}
        {{.LayoutContent}}
    </div>

    <!-- Mainly scripts -->
    {{assets_js "/static/js/bootstrap.min.js"}}
    {{assets_js "/static/js/plugins/metisMenu/jquery.metisMenu.js"}}
    {{assets_js "/static/js/plugins/slimscroll/jquery.slimscroll.min.js"}}

    <!-- Flot -->
    {{assets_js "/static/js/plugins/flot/jquery.flot.js"}}
    {{assets_js "/static/js/plugins/flot/jquery.flot.tooltip.min.js"}}
    {{assets_js "/static/js/plugins/flot/jquery.flot.spline.js"}}
    {{assets_js "/static/js/plugins/flot/jquery.flot.resize.js"}}
    {{assets_js "/static/js/plugins/flot/jquery.flot.pie.js"}}

    <!-- Peity -->
    {{assets_js "/static/js/plugins/peity/jquery.peity.min.js"}}
    {{assets_js "/static/js/demo/peity-demo.js"}}

    <!-- Custom and plugin javascript -->
    {{assets_js "/static/js/inspinia.js"}}
    {{assets_js "/static/js/plugins/pace/pace.min.js"}}

    <!-- jQuery UI -->
    {{assets_js "/static/js/plugins/jquery-ui/jquery-ui.min.js"}}

    <!-- GITTER -->
    {{assets_js "/static/js/plugins/gritter/jquery.gritter.min.js"}}

    <!-- Sparkline -->
    {{assets_js "/static/js/plugins/sparkline/jquery.sparkline.min.js"}}

    <!-- Sparkline demo data  -->
    {{assets_js "/static/js/demo/sparkline-demo.js"}}

    <!-- ChartJS-->
    {{assets_js "/static/js/plugins/chartJs/Chart.min.js"}}

    <!-- Toastr -->
    {{assets_js "/static/js/plugins/toastr/toastr.min.js"}}

    <!-- ICheck -->
    {{assets_js "/static/js/plugins/iCheck/icheck.min.js"}}

    <!-- Select2 -->
    {{assets_js "/static/js/plugins/select2/select2.full.min.js"}}

</body>
</html>
