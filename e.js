["resize", "scroll", "load"].forEach(function(b) {
  window.addEventListener(b, auto_enlarge)
})
function auto_enlarge() {
  [].slice.call(document.querySelectorAll("a.fileThumb>img:first-child:not([data-clicked])")).forEach(function(b) {
    var c = window.innerWidth, d = window.innerHeight, a = b.getBoundingClientRect();
    a.left < c && a.top < d && a.left > -a.width && a.top > -a.height && (b.setAttribute("data-clicked", ""), b.click())
  })
}
