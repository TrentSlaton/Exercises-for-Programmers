"use strict";

let catFact = null;

async function fetchCatFact() {
    try {
        const response = await fetch("https://catfact.ninja/fact");
        if (!response.ok) {
            throw new Error("Network response was not ok");
        }
        const data = await response.json();
        return data;
    } catch (error) {
        console.error("API request error:", error);
        return [];
    }
}

async function loadCatFact() {
    try {
        const data = await fetchCatFact();
        catFact = data.fact;
    } catch (error) {
        console.error("Error fetching cat fact:", error);
    }
}

export { catFact, loadCatFact };
