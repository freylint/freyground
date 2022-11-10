import { Menu, Code, GitHub, Gitlab } from 'react-feather';
export default function NavBar() {
  return(
    <nav className="
        relative w-full flex flex-wrap
        items-center justify-between py-3
        shadow-lg bg-violet-300 text-violet-900 items-center
    ">
      <button className="ml-5">
        <Menu />
      </button>
      <NavTabSelector />
      <NavSocialsIcons />
    </nav>
  );
}

function NavTabSelector() {
  return(
    <div className="relative grow flex ml-5 justify-between">
      <button className="grow">
        <p>Home</p>
      </button>
      <button className="grow">
        <p>Projects</p>
      </button>
      <button className="grow">
        <p>Blog</p>
      </button>
      <button className="grow">
        <p>Utils</p>
      </button>
    </div>
  );
}

function NavSocialsIcons() {
  return (
    <>
      <div className="mr-5">
        <button>
          <Code />
        </button>
        <button>
          <GitHub />
        </button>
        <button>
          <Gitlab />
        </button>
      </div>
    </>
  );
}
