repeat
	io.write("What is your current age? ")
	CUR_AGE = tonumber(io.read())
until CUR_AGE

repeat
	io.write("At what age would you like to retire? ")
	RET_AGE = tonumber(io.read())
until RET_AGE

YEARS_LEFT = RET_AGE - CUR_AGE

CUR_YEAR = tonumber(os.date("%Y"))

if YEARS_LEFT > 0 then
	print("You have " .. YEARS_LEFT .. " years left until you can retire.")
	print("It's " .. CUR_YEAR .. ", so you can retire in " .. CUR_YEAR + YEARS_LEFT)
elseif YEARS_LEFT < 0 then
	print("You could have retired " .. math.abs(YEARS_LEFT) .. " years ago!")
	print("It's " .. CUR_YEAR .. ", so you could have retired in " .. CUR_YEAR - math.abs(YEARS_LEFT))
else
	print("You can retire now!")
end
