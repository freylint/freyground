[](#website)
# Freyground **Webpage**

The Freyground webpage is a (mostly) static site intended to
serve as a Blog, Service Dashboard, and Contact Page for myself
and my public projects

## Architecture
This site is implemented with Bun + React SSR + JQuery.
Rendering is done in three phases:
- [Stage One](file://src/stage1.js): A React server side render of each individual page into a React component.
- [Stage Two](file://src/stage2.js): A React server side render combining all pages into a single document. Hiding inactive pages. This is equivalent to prefetching all static html, ignoring http requests.
- [Stage Three](file://src/stage3.js): A JQuery script handle routing and dynamic dispatch.
