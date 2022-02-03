module.exports = {
  content: [
    "./src/**/*.{html,md,liquid,erb,serb}",
    "./frontend/javascript/**/*.js",
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/line-clamp"),
    require("@tailwindcss/typography"),
  ],
};
