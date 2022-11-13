import {Code, GitHub, Gitlab} from 'react-feather';

export default function NavSocialIcons() {
  const buttons = [Code, GitHub, Gitlab]; 
  return (
    <div className="mx-5">
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
