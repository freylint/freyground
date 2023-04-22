//! Exit interview for the service tech role

import { BlogPost } from "../../../interface/blog";

export default class STechExit implements BlogPost {
    title= "Exit Interview";
    date= new Date(2023, 4, 22);
    blurb= "Giving myself the exit interview I didn't earn.";
    draft = true;
    component = () => {
    return(
      <article>
        <p> This is the Stetch blogpost </p>
      </article>
    );
  };
    // Header
};
