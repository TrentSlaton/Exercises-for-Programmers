const url = "https://healthruwords.p.rapidapi.com/v1/quotes/?t=Wisdom&maxR=1&size=medium&id=731";
const options = {
    method: "GET",
    headers: {
        // "X-RapidAPI-Key": "05f800f464mshbce55dd916f91e2p184dafjsn1e0e1d9886cd",
        "X-RapidAPI-Key": "x",
        // "X-RapidAPI-Host": "healthruwords.p.rapidapi.com"
        "X-RapidAPI-Host": "x"
    }
};

try {
    const response = await fetch(url, options);
    const result = await response.text();
    console.log(result);
} catch (error) {
    console.error(error);
}
