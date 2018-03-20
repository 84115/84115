var init = function init(fn) {
    if (document.attachEvent ? document.readyState === "complete" : document.readyState !== "loading") {
        fn();
    }
    else {
        document.addEventListener('DOMContentLoaded', fn);
    }
}

init(function() {
    if (typeof HighlightLisp !== "undefined") {
        HighlightLisp.highlight_auto();
    }

    console.log("Hello World");
});
