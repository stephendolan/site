import "index.css";
import Alpine from "alpinejs";

// Optional, but can be useful for debugging.
// window.Alpine = Alpine

Alpine.start();

// Import all JavaScript & CSS files from src/_components
import components from "bridgetownComponents/**/*.{js,jsx,js.rb,css}";
