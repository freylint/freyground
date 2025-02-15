/** Freyground website entry script.
 * See file://../README.md for architectural overview.
 */

// Server Dependencies
import {renderToReadableStream} from "react-dom/server";
import {memo} from "react";
import style from "./style.css";

import {StageOne} from "./stage1";
import {Statics} from "./statics";

function Head() {
    return (
        <head>
            <meta charSet="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <meta httpEquiv="X-UA-Compatible" content="ie=edge"/>
            <meta name="description" content=""/>
            <style>{Statics.normalize_css}</style>
            <style>{Statics.pure_css}</style>
            <style>{Statics.style}</style>
            <script>{Statics.mithril}</script>
            <title>{Statics.title}</title>
        </head>
    );
}

export function StageTwo() {
    return (
        <html lang="en">
        <Head/>
        <body>
            <StageOne/>
            <StageOne/>
            <StageOne/>
            <StageOne/>
        </body>
        </html>
    );
}


/**
 * Prerendered static page components.
 * @type {{About: React.NamedExoticComponent<object>}}
 */
const Rendered = {
    "About": memo(StageTwo)
}


Bun.serve({
    async fetch() {
        return new Response(await renderToReadableStream(<Rendered.About/>), {
            headers: {"Content-Type": "text/html"},
        });
    },
});
