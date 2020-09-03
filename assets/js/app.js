import normalize_css from 'normalize.css';
import scss from "../css/app.scss";

import "phoenix_html";

import { Socket } from 'phoenix';
import { LiveSocket } from 'phoenix_live_view';

let Hooks = {};
Hooks.Wooo = {
    mounted() {
        this.handleEvent("wooo", () => {
            var wooo = document.getElementById("wooo");
            var woooo = document.getElementById("woooo");

            wooo.playbackRate = 1.5;
            wooo.play();
            setTimeout(() => {
                woooo.classList.toggle("wooo");
            }, 100);
            setTimeout(() => {
                woooo.classList.toggle("wooo");
                wooo.pause();
                wooo.currentTime = 0;
            }, 900);
        });
    }
};


let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket('/live', Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}});
liveSocket.connect();

