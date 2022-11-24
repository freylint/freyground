// Simple twitch chatbot which types "!ohio" whenever Ohio is mentioned
import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";

export default function OhioBotLoader() {
  var [active, setActive] = useState(false);

  function render() {
    if (active) {
      return <OhioBot addr="wss://irc-ws.chat.twitch.tv:443" />;
    }
  }

  return (
    <>
      <button onClick={() => setActive(!active)}>Load bot</button>
      {render()}
    </>
  );
}

function OhioBot({ addr }) {
  const channel = "#freylint";
  var [searchParams] = useSearchParams();

  // Initialize the IRC websocket
  var effect = useEffect(() => {
    var socket = new WebSocket(addr);

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
