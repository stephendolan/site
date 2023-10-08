// thirdPartyScripts.js
export const loadSavvyCal = () => {
  return new Promise((resolve) => {
    const script = document.createElement("script");
    script.src = "https://embed.savvycal.com/v1/embed.js";
    script.async = true;
    script.defer = true;
    script.onload = () => {
      resolve();
    };
    document.head.appendChild(script);
  });
};

export const initSavvyCal = () => {
  window.SavvyCal = window.SavvyCal || function () {
    (window.SavvyCal.q = window.SavvyCal.q || []).push(arguments);
  };
  window.SavvyCal('init');
};

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

export const loadConvertKit = () => {
  return new Promise((resolve) => {
    const script = document.createElement("script");
    script.src = "https://f.convertkit.com/ckjs/ck.5.js";
    script.async = true;
    script.defer = true;
    script.onload = () => {
      resolve();
    };
    document.head.appendChild(script);
  });
};

export const loadFathomAnalytics = () => {
  return new Promise((resolve) => {
    const script = document.createElement("script");
    script.src = "https://cdn.usefathom.com/script.js";
    script.defer = true;
    script.dataset.site = "VFRRSROW";
    script.onload = () => {
      resolve();
    };
    document.head.appendChild(script);
  });
};