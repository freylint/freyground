//! Blog browsing page

import BlogCard from "../components/BlogCard";
import { BlogPost } from "@site/interface/blog";
import { IOpener, Opener } from "../components/Opener";

export default function Blog() {
  const opener: IOpener = {
    title: "Freyground Blog",
    Content: () => {
      return <p>Welcome to the RelayGround blog page!</p>;
    },
  };

  return (
    <main>
      <Opener title={opener.title} Content={opener.Content} />
      <BlogCard blog={STechExit} />
    </main>
  );
}

const STechExit: BlogPost = {
  title: "Humility and Pride",
  date: new Date(2023, 4, 22),
  blurb: "Giving myself the exit interview I didn't earn.",
  draft: true,
  Component: () => {
    return (
      <article className="font-serif">
        <h3 className="font-sans font-bold">
          An Attitude Adjustment
        </h3>
        <p>
          When I was was 19 years old I got got really into a game called
          Tekken. I played and played, even to the point where I travelled
          around to fight in tournaments. The most frequent of which was
          my localish tournament, Downtown Beatdown, which mostly consisted of
          20 something men who viewed the game as a fun way to relax.
          I was not so wise.
        </p>
        <p>
          It was after these tournaments that I often found myself in emotional
          distress. After all, If I had put over 500 hours into a game, why am
          I not seeing any improvement?
        </p>
      </article>
    );
  },
};
