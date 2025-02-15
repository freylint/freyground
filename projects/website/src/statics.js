// Static dependencies
import modern_normalize from "modern-normalize/modern-normalize.css";
import pure_css from "purecss/build/pure-min.css";
import style from "./style.css";
const mithriljs = "node_modules/mithril/mithril.min.js";

/**
 * Global static data.
 */
export const Statics = {
    "title": "Freyground",
    "normalize_css": await Bun.file(modern_normalize).text(),
    "pure_css": await Bun.file(pure_css).text(),
    "style": await Bun.file(style).text(),
    "mithril": await Bun.file(mithriljs).text(),
};

