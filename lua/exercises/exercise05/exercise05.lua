repeat
	io.write("Enter first number: ")
	NUM1 = tonumber(io.read())
until NUM1

repeat
	io.write("Enter second number: ")
	NUM2 = tonumber(io.read())
until NUM2

print(NUM1 .. " + " .. NUM2 .. " = " .. NUM1 + NUM2)
print(NUM1 .. " - " .. NUM2 .. " = " .. NUM1 - NUM2)
print(NUM1 .. " * " .. NUM2 .. " = " .. NUM1 * NUM2)
print(NUM1 .. " / " .. NUM2 .. " = " .. NUM1 / NUM2)
