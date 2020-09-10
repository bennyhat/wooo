import normalize_css from 'normalize.css';
import scss from "../css/stylin.scss";

import "phoenix_html";

import { Socket } from 'phoenix';
import { LiveSocket } from 'phoenix_live_view';

let Hooks = {};

Hooks.Wooo = {
    mounted() {
        const wooo = document.getElementById("wooo");
        const woooo = document.getElementById("woooo");
        const hahawooo = document.getElementById("hahawooo");

        const startJigglin = () => {
            woooo.classList.add("wooo");
        };
        const stopJigglin = () => {
            woooo.classList.remove("wooo");
        };
        const startLaughin = () => {
            woooo.classList.add("hahawooo");
        };
        const stopLaughin = () => {
            woooo.classList.remove("hahawooo");
        };

        wooo.playbackRate = 1.5;
        hahawooo.playbackRate = 1.5;
        hahawooo.volume = 0.6;

        hahawooo.addEventListener("playing", startLaughin);
        hahawooo.addEventListener("ended", stopLaughin);
        wooo.addEventListener("playing", startJigglin);
        wooo.addEventListener("ended", stopJigglin);

        this.handleEvent("wooo", () => {
            wooo.play();
        });

        woooo.addEventListener("click", () => {
            hahawooo.play();
            this.pushEvent("wooo");
        });
    }
};


let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket('/live', Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}});
liveSocket.connect();

