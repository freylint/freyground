// Static dependencies
import modern_normalize from "modern-normalize/modern-normalize.css";
import pure_css from "purecss/build/pure-min.css";
import style from "./style.css";
import {minify} from "terser";

const jquery= "node_modules/jquery/dist/jquery.slim.js";

/**
 * Global static data.
 */
export const Statics = {
    "title": "Freyground",
    "normalize_css": await Bun.file(modern_normalize).text(),
    "pure_css": await Bun.file(pure_css).text(),
    "style": await Bun.file(style).text(),
    "jquery": await Bun.file(jquery).text(),
    "stage3": await Bun.file("src/stage3.js").text(),
};

