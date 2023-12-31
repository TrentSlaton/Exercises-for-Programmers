"use strict";

// import { apiKey, apiHost, love_and_relationships, category_list } from "./apiInfo.js";

async function fetchCookie() {
    // const url = "https://fortune-cookie2.p.rapidapi.com/fortune/by_category?category_key=love_and_relationships";
    const url = "https://fortune-cookie4.p.rapidapi.com/";
    const options = {
        method: "GET",
        headers: {
            "X-RapidAPI-Key": "05f800f464mshbce55dd916f91e2p184dafjsn1e0e1d9886cd",
            // "X-RapidAPI-Key": "x",
            "X-RapidAPI-Host": "fortune-cookie4.p.rapidapi.com"
            // "X-RapidAPI-Host": "x"
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
    // const url = "https://fortune-cookie4.p.rapidapi.com/fortune/category_list";
    const url = "https://fortune-cookie4.p.rapidapi.com/health";
    const options = {
        method: "GET",
        headers: {
            // "X-RapidAPI-Key": "x",
            "X-RapidAPI-Key": "05f800f464mshbce55dd916f91e2p184dafjsn1e0e1d9886cd",
            "X-RapidAPI-Host": "fortune-cookie4.p.rapidapi.com"
            // "X-RapidAPI-Host": "x"
        }
    };

    try {
        const response = await fetch(url, options);
        const result = await response.json();
        console.log(result);
        console.log(result.data.message);
    } catch (error) {
        console.error(error);
    }
}

// printList();

export { fetchCookie };
