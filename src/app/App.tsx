// Webapp root
//
// Dependencies:
// - react
//   - react-feather

//import React, { useState, useEffect } from 'react';
import { useState } from 'react';
import { SplashPage} from '../header/header';
import { Menu, GitHub, Gitlab } from 'react-feather';
import './App.css';

function NavBar() {
  return(
    <nav className="flex flex-nowrap bg-violet-300 text-violet-900 items-center">
      <button>
        <Menu />
      </button>
      <p className="mx-5"> Freyground </p>
      <NavTabSelector />
      <NavSocialsIcons />
    </nav>
  );
}

function NavTabSelector() {
  return(
    <>
      <div className="ml-5">
        <button className="grow">
          <p>Home</p>
        </button>
        <button className="grow">
          <p>About</p>
        </button>
      </div>
    </>
  );
}

function NavSocialsIcons() {
  return (
    <>
      <div className="mr-5">
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

function SideBar() {
  return (
    <aside className=" bg-neutral-800">
      <p> Sidebar Content</p>
    </aside>
  );
}

function SPARouter() {
  return (
    <main className="min-h-screen bg-neutral-900">
      <p> Main Section</p>
    </main>
  );
}

function Footer() {
  return (
    <footer className="bg-neutral-700">
      <p> Footer Here</p>
    </footer>
  );
}


function App() {
  // TODO reactively show sidebar on widescreen
  const [showSidebar, setShowSidebar] = useState(false);
  const msg_interval = 5000;
  return (
    <div className="App bg-neutral-900 text-violet-100">
      <SplashPage msgInterval={msg_interval}/>
      <NavBar/>
      <div className="flex flex-row">
        {showSidebar ? <SideBar/> : null}
        <SPARouter/>
      </div>
      <Footer/>
    </div>

  );
}

export default App;
