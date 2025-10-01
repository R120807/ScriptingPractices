local module = {}

local numbersRanging = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}

local function GCD(num: number, i: number)
	while num ~= 0 do
		num, i = i % num, num
	end
	return math.abs(i)
end

local function LCM(num: number, i: number)
	local gcd = GCD(num, i)
	return math.abs(num * i) / gcd
end

local function findSmallestMultiple()
	local smallestMultiple = 1
	for _, num in ipairs(numbersRanging) do
		smallestMultiple = LCM(smallestMultiple, num)
	end
	return smallestMultiple
end

local result = findSmallestMultiple()

return module
