(function(b) {
    b.CookieUtil = {
        get: function(e) {
            var d = new RegExp("\\b" + e + "=([^;]*)\\b");
            var c = d.exec(document.cookie);
            return c ? decodeURIComponent(c[1]) : null
        },
        set: function(e, g) {
            var c = arguments,
                j = arguments.length,
                d = (j > 2) ? c[2] : new Date(new Date().valueOf() + 365 * 24 * 60 * 60 * 1000),
                i = (j > 3) ? c[3] : "/",
                f = (j > 4) ? c[4] : null,
                h = (j > 5) ? c[5] : false;
            document.cookie = e + "=" + encodeURIComponent(g) + ((d === null) ? "": ("; expires=" + d.toGMTString())) + ((i === null) ? "": ("; path=" + i)) + ((f === null) ? "": ("; domain=" + f)) + ((h === true) ? "; secure": "")
        },
        remove: function(c, e, d) {
            if (this.get(c)) {
                e = e || "/";
                document.cookie = c + "=; expires=Thu, 01-Jan-70 00:00:01 GMT; path=" + e + (d ? ("; domain=" + d) : "")
            }
        }
    };
    b.NumberUtil = {
        toInt: function(e, d) {
            d = d || 0;
            try {
                return parseInt(e, 10)
            } catch(c) {
                return d
            }
        }
    };
})(window); (function(a) {
})(window); (function(a) {
    a.pbArr = [];
    var c = location.pathname ? location.pathname.substring(1).replace(/\//g, "_") : "unknown";
    var b = a.host + "/h5/images/tj.gif?t=";
    var d = {
        pb: function(q) {
            try {
                var h = [b, (new Date()).getTime(), "&type=cl&page=", encodeURIComponent(c)];
                var g = q.attributes;
                var f = g.id;
                if (f) {
                    h.push("&id=");
                    h.push(encodeURIComponent(f.value))
                }
                var n = g.key;
                if (n) {
                    h.push("&key=");
                    h.push(encodeURIComponent(n.value))
                }
                for (var j = 0,
                         k = g.length; j < k; j++) {
                    var p = g[j].name;
                    if (p.startsWith("geri-pb-")) {
                        var m = g[p];
                        if (m) {
                            h.push("&");
                            h.push(p.substring(8));
                            h.push("=");
                            h.push(encodeURIComponent(m.value))
                        }
                    }
                }
                h.push("&");
                h.push(a.gp);
                var o = pbArr.length;
                pbArr[o] = new Image();
                pbArr[o].src = h.join("")
            } catch(l) {
                console.log(l)
            }
        },
        cpb: function() {
            try {
                var h = [b, (new Date()).getTime(), "&type=cl&page=", encodeURIComponent(c)];
                var j = arguments.length;
                if (j % 2 != 0 || j < 1) {
                    return
                }
                for (var g = 0; g < j - 1; g += 2) {
                    h.push("&");
                    h.push(arguments[g]);
                    h.push("=");
                    h.push(encodeURIComponent(arguments[g + 1]))
                }
                h.push("&");
                h.push(a.gp);
                var f = pbArr.length;
                pbArr[f] = new Image();
                pbArr[f].src = h.join("")
            } catch(k) {
                console.log(k)
            }
        },
        pv: function() {
            var e = pbArr.length;
            pbArr[e] = new Image();
            var f = a.gp.replace(/gf=([^&]+)/, "gf=" + param("gf"));
            pbArr[e].src = [b, (new Date()).getTime(), "&type=pv&page=", encodeURIComponent(c), "&", f].join("")
        },
        setPbPage: function(e) {
            c = e
        }
    };
    a.Stats = d
})(window); (function(a) {
    a.onload = function() {
        document.addEventListener("click",
            function(b) {
                b = b ? b: a.event;
                var c = b.target || b.srcElement;
                if (c && c.nodeName == "HTML") {
                    return
                }
                while (c && c.nodeName != "BODY") {
                    if ((c.nodeName == "A" || c.getAttribute("stats") == "1") && c.getAttribute("id")) {
                        Stats.pb(c);
                        return
                    } else {
                        c = c.parentNode
                    }
                }
            },
            false)
    }
})(window); (function(b) {
    var a = {
        toast: function(d, c) {
            c = c || 1000;
            if ($("#Geri-toast").length == 0) {
                $("body").prepend('<div id="Geri-toast" style="display: none;position: fixed;left: 50%;top: 50%;-webkit-transform: translate(-50%,-50%);transform: translate(-50%,-50%);width: 280px;text-align: center;font-size: 16px;line-height: 26px;padding: 15px 20px;color: #fff;background: rgba(51,51,51,.9);border-radius: 5px;z-index: 999;"></div>')
            }
            var e = $("#Geri-toast");
            if (e.css("display") != "none") {
                return
            }
            e.html(d);
            e.show();
            setTimeout(function() {
                    e.hide()
                },
                c)
        }
    };
    b.GeriTip = a
})(window);
