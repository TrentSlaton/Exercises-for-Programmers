"use strict";

// users "database"
const users = {
    user1: "abc123",
    user2: "$AbC123"
};

// get UI elements
const username = document.querySelector("#username");
const password = document.querySelector("#password");
const login = document.querySelector("#login");
const message = document.querySelector("#message");

// validate username and password
const isValidUsername = (users, username) => {
    return users.hasOwnProperty(username);
};

const isValidPassword = (users, username, password) => {
    return users[username] == password;
};

login.addEventListener("click", () => {
    const usernameValue = username.value;
    const passwordValue = password.value;

    if (!isValidUsername(users, usernameValue)) {
        username.value = "";
        password.value = "";
        message.innerHTML = "Invalid Username";
    } else if (!isValidPassword(users, usernameValue, passwordValue)) {
        username.value = "";
        password.value = "";
        message.innerHTML = "Invalid password";
    } else {
        username.value = "";
        password.value = "";
        message.innerHTML = "Welcome!";
    }
});
