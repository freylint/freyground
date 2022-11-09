// Webapp root
//
// Dependencies:
// - react
//   - react-feather

//import React, { useState, useEffect } from 'react';
import { SplashPage} from '../header/header';
import './App.css';

function NavBar() {
  return(
    <nav>
      <p> Navbar Here </p>
    </nav>
  );
}

function SideBar() {
  return (
    <aside>
      <p> Sidebar Content</p>
    </aside>
  );
}

function SPARouter() {
  return (
    <main>
      <p> Main Section</p>
    </main>
  );
}

function Footer() {
  return (
    <footer>
      <p> Footer Here</p>
    </footer>
  );
}


function App() {
  const msg_interval = 5000;
  return (
    <div className="App">
      <SplashPage msgInterval={msg_interval}/>
      <NavBar/>
      <SideBar/>
      <SPARouter/>
      <Footer/>
    </div>

  );
}

export default App;
