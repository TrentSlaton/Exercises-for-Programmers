print("Hello, what is your name?")
name = io.read()

if name and name ~= "" then
    print(string.format("Hello, %s!", name))
else
    print("Hello, stranger!")
end
