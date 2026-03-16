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

        hahawooo.addEventListener("ended", stopLaughin);
        wooo.addEventListener("ended", stopJigglin);
        stylin.addEventListener("ended", stopStylin);

        woooo.addEventListener("animationend", stopJigglin);
        woooo.addEventListener("animationend", stopLaughin);

        this.handleEvent("wooo", () => {
            woooo.classList.remove("wooo");
            void woooo.offsetWidth;
            startJigglin();
            wooo.currentTime = 0;
            wooo.play().catch(() => { });
        });

        woooo.addEventListener("click", () => {
            woooo.classList.remove("hahawooo");
            void woooo.offsetWidth;
            startLaughin();
            hahawooo.currentTime = 0;
            hahawooo.play().catch(() => { });
            this.pushEvent("wooo");
        });

        mute.addEventListener("click", () => {
            woooooo.classList.remove("stylin");
            void woooooo.offsetWidth;
            startStylin();
            stylin.currentTime = 0;
            stylin.play().catch(() => { });
        });
    }
};


let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket('/live', Socket, { hooks: Hooks, params: { _csrf_token: csrfToken } });
liveSocket.connect();

