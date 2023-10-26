"use strict";

// import { apiKey, apiHost, love_and_relationships, category_list } from "./apiInfo.js";

async function fetchCookie() {
    const url = "https://fortune-cookie2.p.rapidapi.com/fortune/by_category?category_key=love_and_relationships";
    const options = {
        method: "GET",
        headers: {
            "X-RapidAPI-Key": "05f800f464mshbce55dd916f91e2p184dafjsn1e0e1d9886cd",
            "X-RapidAPI-Host": "fortune-cookie2.p.rapidapi.com"
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
    const url = "https://fortune-cookie2.p.rapidapi.com/fortune/category_list";
    const options = {
        method: "GET",
        headers: {
            "X-RapidAPI-Key": "05f800f464mshbce55dd916f91e2p184dafjsn1e0e1d9886cd",
            "X-RapidAPI-Host": "fortune-cookie2.p.rapidapi.com"
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
