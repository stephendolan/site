// thirdPartyScripts.js
export const loadTwitter = () => {
  return new Promise((resolve) => {
    const script = document.createElement("script");
    script.src = "https://platform.twitter.com/widgets.js";
    script.async = true;
    script.defer = true;
    script.onload = () => {
      resolve();
    };
    document.head.appendChild(script);
  });
};

export const loadHeapAnalytics = (appId) => {
  return new Promise((resolve) => {
    window.heap = window.heap || [];
    heap.load = function (e, t) {
      window.heap.appid = e;
      window.heap.config = t = t || {};
      var r = document.createElement("script");
      r.type = "text/javascript";
      r.async = true;
      r.src = "https://cdn.heapanalytics.com/js/heap-" + e + ".js";
      var a = document.getElementsByTagName("script")[0];
      a.parentNode.insertBefore(r, a);
      for (
        var n = function (e) {
          return function () {
            heap.push([e].concat(Array.prototype.slice.call(arguments, 0)));
          };
        },
        p = [
          "addEventProperties",
          "addUserProperties",
          "clearEventProperties",
          "identify",
          "resetIdentity",
          "removeEventProperty",
          "setEventProperties",
          "track",
          "unsetEventProperty",
        ],
        o = 0;
        o < p.length;
        o++
      )
        heap[p[o]] = n(p[o]);
      r.onload = () => {
        resolve();
      };
    };
    heap.load(appId);
  });
};