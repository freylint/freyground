import {StageOne} from "./stage1";
import {Statics} from "./statics";

export function StageTwo() {
    return (
        <html lang="en">
        <Head/>
        <body>
        <article id="first" display="none">
            <StageOne/>
        </article>
        <article id="second" display="none">
            <StageOne/>
        </article>
        </body>
        </html>
    );
}

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
            <script>{Statics.jquery}</script>
            <script>{Statics.stage3}</script>
            <title>{Statics.title}</title>
        </head>
    );
}
