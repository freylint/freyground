// NOTE: JQuery is imported in stage1. It is available here.

function show(elem) {
    elem.css("display", "block");
}

function hide(elem) {
    elem.css("display", "none");
}

$(document).ready(function() {
    var path = window.location.pathname;
    var first = $("#first");
    var second = $("#second");

    if (path === "/" || path === "/about") {
        show(first)
        hide(second)
    } else {
        hide(first)
        show(second)
    }

});

