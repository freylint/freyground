// Simple twitch chatbot which types "!ohio" whenever Ohio is mentioned
import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";

export default function OhioBotLoader() {
  const [active, setActive] = useState(false);
  const [nick, setNick] = useState("OhioBot");
  const [secret, setSecret] = useState("API Key");

  function render() {
    if (active) {
      return <OhioBot addr="wss://irc-ws.chat.twitch.tv:443" />;
    }
  }

  return (
    <div className="flex flex-col items-center">
      <hr className="w-screen"/>
      <h2 className="text-center">Twitch Ohio Bot</h2>
      <hr className="w-screen"/>
      <p className="mx-1">
        Simple twitch bot which executes the !ohio command on a stream.
      </p>
      <hr className="w-5/6"/>
      <div className="mx-2 my-1 flex flex-row">
        <h3>Alias</h3>
        <input />
      </div>
      <div className="mx-2 my-1 flex flex-row">
        <h3>Token</h3>
        <input />
      </div>
      <div className="mx-2 my-1 flex flex-row">
        <h3>Stream</h3>
        <input />
      </div>
      <hr className="w-5/6"/>
      <button onClick={() => setActive(!active)}>Start OhioBot</button>
      {render()}
      <hr className="w-5/6"/>
    </div>
  );
}

function OhioBot({ addr }) {
  const channel = "#allypandapants";
  const [searchParams] = useSearchParams();

  // Initialize the IRC websocket
  const effect = useEffect(() => {
    const socket = new WebSocket(addr);

    socket.addEventListener("open", () => {
      var auth = searchParams.get("auth");
      socket.send("CAP REQ :twitch.tv/commands");
      console.log("oauth:" + auth);
      socket.send("PASS oauth:" + auth);
      socket.send("NICK OhioBot");
      socket.send("JOIN " + channel);
    });

    socket.addEventListener("close", (event) => {
      console.log("Closing ohio bot: ", event.data);
    });

    socket.addEventListener("message", (event) => {
      var msg = event.data;
      const slice_index = 14;

      if (/NOTICE/.test(msg)) {
        console.error(msg.slice(slice_index));
      }
      // Handle Keepalive
      else if (/PING/.test(msg)) {
        socket.send("PONG :" + channel.slice(1) + ".twitch.tv");
      }
      // A private message was sent
      else if (/PRIVMSG/.test(msg)) {
        console.info("Message recieved: " + msg);
        // The message mentions ohio
        if (/(?<!!)\bohio/i.test(msg)) {
          console.trace("Sending ohio msg");
          socket.send("PRIVMSG " + channel + " !ohio");
        }
      }
      // Issue warning for messages we're not handling
      else {
        console.warn(msg);
      }
    });
  });

  return (
      <p>Welcome to Ohio!</p>
  );
}
