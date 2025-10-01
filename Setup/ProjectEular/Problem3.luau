local module = {}

local toCalculate = 600851475143

local function is_Prime(n)
	if n <= 1 then return false end
	for i = 2, math.sqrt(n) do
		if n % i == 0 then
			return false
		end
	end
	return true
end

local function largest_prime_factor(num: number)
	local factor = 2
	while num > 2 do
		if num % factor == 0 then
			num = num / factor
		else
			repeat
				factor = factor + 1
			until is_Prime(factor)
		end
	end
	return factor
end

local largestFactor = largest_prime_factor(600851475143)
print("The larget prime factor of "..toCalculate.." is "..largestFactor)


return module
