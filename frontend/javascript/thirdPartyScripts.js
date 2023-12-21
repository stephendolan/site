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

export const loadAnalytics = () => {
  return new Promise((resolve) => {
    const script = document.createElement("script");
    script.defer = true;
    script.dataset.domain = "stephendolan.com";
    script.src = "https://analytics.stephendolan.com/js/script.js";
    script.onload = () => {
      resolve();
    };
    document.head.appendChild(script);
  });
};