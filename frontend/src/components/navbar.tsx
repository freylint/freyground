import { Menu, Globe } from 'react-feather';
import NavSocialIcons from './socialbuttons';

export default function NavBar() {
  return(
    <nav className="
        relative w-full flex flex-wrap
        items-center justify-between py-3
        shadow-lg bg-violet-300 text-violet-900 items-center
    ">
      <div className="flex flex-row w-screen md:w-auto">
        <button className="mx-5 ">
          <Menu />
        </button>
        <div className="grow">
          <NavBranding />
        </div>
        <div className="visible md:hidden">
          <NavSocialIcons />
        </div>
      </div>
        <NavTabSelector />
        <div className="hidden md:block">
          <NavSocialIcons />
        </div>
    </nav>
  );
}

function NavBranding() {
  return (
    <button className="flex flex-row grow justify-center">
      <Globe className="ml-5" />
      <h1 className="ml-1">
        Freyground
      </h1>
    </button>
  );
}

function NavTabSelector() {
  return(
    <div className="relative w-full md:w-auto flex ml-5 grow justify-between">
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

