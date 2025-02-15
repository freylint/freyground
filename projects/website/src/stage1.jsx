import {Statics} from "./statics";


export function StageOne() {
    return (
        <>
        <Header/>
        <Main/>
        </>
    );
}


function Header() {
    return (
        <header className="header">
            <h1>{Statics.title}</h1>
            <button>
                About
            </button>
            <button>
                Blog
            </button>
            <button>
                Projects
            </button>
            <button>
                Contact
            </button>

        </header>
    );
}

function Main() {
    return (
        <main>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                deserunt mollit anim id est laborum
            </p>
        </main>
    );
}
