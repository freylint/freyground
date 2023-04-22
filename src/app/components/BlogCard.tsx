//! A card for showing off the existing blogs as thumbnails

import { BlogPost } from "@site/interface/blog";

/// Component for display a shortform of a blog
export default function BlogCard(blog :{blog: BlogPost}) {
  return(
    <article className="card bg-base-100 shadow-xl">
      <div className="card-body">
        <h2 className="card-title">{blog.blog.title}</h2>
      </div>
    </article>
  ); 
}
