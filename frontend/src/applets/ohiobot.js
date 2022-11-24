// Simple twitch chatbot which types "!ohio" whenever Ohio is mentioned
import React from "react";

export default function OhioBot() {
    var [socket, setSocket] = React.useState(new WebSocket("wss://irc-ws.chat.twitch.tv:443"))

    socket.addEventListener('open', (event) => {
        console.log('Opening Ohio bot', event.data);
    });

    socket.addEventListener('message', (event) => {
        if ("PING" in event.data) {
            console.log('Recieved PING');
        }
    });


    return (
        <div>
            <p> Ohio bot loaded </p>
        </div>
    );
}