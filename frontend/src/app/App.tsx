// Webapp root
//
// Dependencies:
// - react
//   - react-feather

//import React, { useState, useEffect } from 'react';
import { useState } from 'react';
import { SplashPage } from '../components/header';
import { createBrowserRouter, RouterProvider, Route } from "react-router-dom";

import { HomePage } from "../pages/home";
import NavBar from '../components/navbar';
import NavSocialIcons from '../components/socialbuttons';

const router = createBrowserRouter([{
  path: "/",
  element: <p>hello-world</p>
}])


function SideBar() {
  function SetPrimRule() {
    return(
      <>
        <hr className="center w-5/6"/>
      </>
    );
  }

  function SetSecRule() {
    return(
      <>
        <hr className="w-4/5"/>
      </>
    );
  }

  function TabNavGroup() {
    const tabs = [
      "Home", "Projects", "Blog", "Utils"
    ]

    return (
      <>
        {tabs.map((tname: string, i: number) => {
          return (<h1 key={tname + i}>{tname}</h1>);
        })}
      </>
    );
  }


  return (
    <aside className="
      flex flex-col
      w-screen md:w-1/4
      bg-neutral-800
     ">
      <h2 className="my-3"> Sidebar Content</h2>
      <SetPrimRule />
        <p>Settings</p>
      <SetSecRule/>
      <nav className="grow">
        <TabNavGroup />
      </nav>
      <SetPrimRule />
      <div className="mt-2">
        <NavSocialIcons />
      </div>
    </aside>
  );
}

function SPARouter() {
  return (
    <main className="bg-neutral-900">
      <RouterProvider router={router}/>
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


export default function App() {
  function renderSidebar(shouldShow: boolean) {
    if (shouldShow) {
      return (<SideBar />);
    }
  }

  function renderRouter() {
    let shouldSidebarExpand: boolean = window.innerWidth <= 1280;
    if (!shouldSidebarExpand) {
      return (<SPARouter />);
    }
  }

  // TODO reactively show sidebar on widescreen
  const [showSidebar, setShowSidebar] = useState(false);
  const msg_interval = 5000;
  return (
    <div className="App bg-neutral-900 text-violet-100">
      <SplashPage msgInterval={msg_interval}/>
      <div className="flex flex-col min-h-screen">
        <NavBar/>
        <div className="flex flex-row grow">
          {renderSidebar(showSidebar)}
          {renderRouter()}
        </div>
        <Footer/>
      </div>
    </div>
  );
}

