"use strict";

import { apiKey, apiHost, love_and_relationships, category_list } from "./apiInfo.js";

async function fetchCookie() {
    const url = love_and_relationships;
    const options = {
        method: "GET",
        headers: {
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": apiHost
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
    const url = category_list;
    const options = {
        method: "GET",
        headers: {
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": apiHost
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
