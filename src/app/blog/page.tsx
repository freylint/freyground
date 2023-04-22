//! Blog browsing page

import BlogCard from "../components/BlogCard";
import { BlogPost } from "@site/interface/blog";
import { Opener, IOpener } from "../components/Opener";

export default function Blog() {
  const opener: IOpener = {
      title: "Freyground Blog Page.",
      Content: () => {
        return(<p>Welcome to the RelayGround blog page!</p>);
      },
  }

  return (
    <main>
      <Opener title={opener.title} Content={opener.Content} />
      <BlogCard blog={STechExit} />
    </main>
  );
}


const STechExit: BlogPost = {
  title: "Exit Interview",
  date: new Date(2023, 4, 22),
  blurb: "Giving myself the exit interview I didn't earn.",
  draft: true,
  component: () => {
    return (
      <article>
        <p>This is the Stetch blogpost</p>
      </article>
    );
  },
};
