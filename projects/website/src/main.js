/** Freyground website entry script.
 * See file://../README.md for architectural overview.
 */

// Server Dependencies
import {renderToStaticMarkup} from "react-dom/server";
import {StageTwo} from "./stage2";


Bun.serve({
    port: 3000,
    static: {
        "/public/favicon.svg": new Response(await Bun.file("public/favicon.svg").text(), {headers: {"Content-Type": "image/svg+xml"}})
    },
    async fetch(req) {
        return new Response("<!DOCTYPE html>".concat(renderToStaticMarkup(<StageTwo/>)), {
            headers: {"Content-Type": "text/html"},
        });
    },
    error() {
        return new Response(null, {status: 503});
    }
});
