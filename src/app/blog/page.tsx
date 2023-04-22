//! Blog browsing page

import BlogCard from "../components/BlogCard";

import STechExit from "./posts/stech_exit";


export default function Blog() {
  return(
    <main>
      <Opener />
      <BlogCard blog={STechExit} />
    </main>
  );
}

/// Opening blurb for the blog page
function Opener() {
  return (
    <div className="card w-96 bg-base-100 shadow-xl">
      <div className="card-body">
        <h2 className="card-title">The Freyground Blog</h2>
        <p>
          Welcome to the Freyground blog!
          My personal place to talk about life, tech, and the struggles
          of an eccentric wannabe test engineer.
        </p>
      </div>
    </div>
  );
}
