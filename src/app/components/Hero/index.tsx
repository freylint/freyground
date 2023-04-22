//! Hero / SplasPage designed for website homepages

import "./Hero.css";

export default function Hero() {
  return (
    <div className="hero min-h-screen bg-base-200 splash-grid">
      <div className="hero-overlay " />
      <div className="hero-content text-center">
        <div className="max-w-md">
          <h1 className="text-5xl font-bold">Welcome to the RelayGround!</h1>
          <p className="py-6">
            A personal playground, blog, and project hosting site.
          </p>
          <button className="btn btn-primary">To Projects</button>
        </div>
      </div>
    </div>
  );
}
