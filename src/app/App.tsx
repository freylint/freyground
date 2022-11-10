// Webapp root
//
// Dependencies:
// - react
//   - react-feather

//import React, { useState, useEffect } from 'react';
import { useState } from 'react';
import { SplashPage} from '../components/header';
import NavBar from '../components/navbar';
import './App.css';


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
