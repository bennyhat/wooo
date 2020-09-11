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
        const woooooo = document.querySelector("wooo");

        const mute = document.getElementById("mute");
        const stylin = document.getElementById("stylin");

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
        const startStylin = () => {
            woooooo.classList.add("stylin");
        };
        const stopStylin = () => {
            woooooo.classList.remove("stylin");
        };

        wooo.playbackRate = 1.5;
        hahawooo.playbackRate = 1.5;
        stylin.playbackRate = 1.25;
        hahawooo.volume = 0.6;
        stylin.volume = 0.9;

        hahawooo.addEventListener("playing", startLaughin);
        hahawooo.addEventListener("ended", stopLaughin);
        wooo.addEventListener("playing", startJigglin);
        wooo.addEventListener("ended", stopJigglin);
        stylin.addEventListener("playing", startStylin);
        stylin.addEventListener("ended", stopStylin);

        this.handleEvent("wooo", () => {
            wooo.play();
        });

        woooo.addEventListener("click", () => {
            hahawooo.play();
            this.pushEvent("wooo");
        });

        mute.addEventListener("click", () => {
            stylin.play();
        });
    }
};


let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket('/live', Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}});
liveSocket.connect();

