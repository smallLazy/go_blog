// mardown 编辑器
function editormdFun (name) {
    return editormd(name,{
        height  : 640,
        syncScrolling : "single",
        path    : "/static/editor.md-master/lib/"
    })
}

toastr.options = {
    closeButton: true,
    progressBar: true,
    showMethod: 'slideDown',
    timeOut: 1000
};

function operationShow (msg) {
    toastr.success(msg);
}