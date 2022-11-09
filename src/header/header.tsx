// Splash page for an SPA

import React, { useState, useEffect } from 'react';
import { Circle, ArrowDown } from 'react-feather';

function HeaderBar() {
  return (
    <>
      <h1 className="grow flex items-end text-6xl">The Freyground</h1>
    </>
  );
}

function Logo() {
  return (
    <>
      <Circle size="40%" className="grow" />
    </>
  );
}

export interface MOTDModel {
  msgInterval: number
}
function MOTDPrompt({msgInterval}: MOTDModel) {
  const [msgIndex, setMsgIndex] = useState(0);
  const messages: string[] = [
    "Under construction",
    "Scratch built with React",
    "Personal playground",
    "Project hosting page",
    "Eccentric programming blog",
    "Ad and cookie free",
  ];

  // Wrapped increment the active message
  useEffect(() => {
    const interval = setInterval(() => {
      if (msgIndex < messages.length - 1) {
        // incremement index
        setMsgIndex(msgIndex + 1);
      } else {
        // wrap index
        setMsgIndex(0);
      }
    }, msgInterval);
    return () => clearInterval(interval);
  }, [messages.length, msgIndex, msgInterval]);

  return (
    <>
      <h2 className="text-4xl">{ messages[msgIndex] }</h2>
    </>
  );
}

function ScrollArrow() {
  return (
    <>
      <button className="grow" onClick={() => window.scrollBy(0, window.innerHeight)}>
        <ArrowDown className="w-screen"/>
      </button>
    </>
  );

}

export function SplashPage({msgInterval}: MOTDModel) {
  return (
    <header className="
      flex flex-col h-screen 
      items-center justify-center 
      bg-black text-white
      rounded-b-xl
    ">
      <HeaderBar />
      <Logo />
      <MOTDPrompt msgInterval={msgInterval}/>
      <ScrollArrow/>
    </header>

  );
}
