"use strict";

import { apiKey, apiHost, love_and_relationships, category_list } from "./apiInfo.js";

async function fetchCookie() {
    const url = process.env.FORTUNE_COOKIE_API_URL;
    const apiKey = process.env.FORTUNE_COOKIE_API_KEY;
    console.log(apiKey);
    const options = {
        method: "GET",
        headers: {
            "X-RapidAPI-Key": process.env.FORTUNE_COOKIE_API_KEY,
            "X-RapidAPI-Host": process.env.FORTUNE_COOKIE_API_HOST
        }
    };

    try {
        const response = await fetch(url, options);
        if (!response.ok) {
            throw new Error("Network response was not ok");
        }
        const cookie = await response.json();
        return cookie;
    } catch (error) {
        return error;
    }
}

async function printList() {
    const url = x;
    const options = {
        method: "GET",
        headers: {
            "X-RapidAPI-Key": x,
            "X-RapidAPI-Host": x
        }
    };

    try {
        const response = await fetch(url, options);
        const result = await response.json();
        console.log(result);
    } catch (error) {
        console.error(error);
    }
}

// printList();

export { fetchCookie };
