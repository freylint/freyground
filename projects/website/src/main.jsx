/** Freyground website entry script.
 * See file://../README.md for architectural overview.
 */

// Server Dependencies
import {renderToReadableStream, renderToStaticMarkup} from "react-dom/server";
import {memo} from "react";
import {StageTwo} from "./stage2";



Bun.serve({
    async fetch() {
        return new Response(renderToStaticMarkup(<StageTwo />), {
            headers: {"Content-Type": "text/html"},
        });
    },
});
