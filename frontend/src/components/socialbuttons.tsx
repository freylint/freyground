import {Code, GitHub, Gitlab} from 'react-feather';

export default function NavSocialIcons() {
  const buttons = [Code, GitHub, Gitlab]; 
  return (
    <div className="mr-5 hidden md:block">
      {
        buttons.map((IconButton, i)=>{
            return (
              <button key={"navSocButt" + i}>
                <IconButton />
              </button>
            );
        })
      }
    </div>
  );
}
