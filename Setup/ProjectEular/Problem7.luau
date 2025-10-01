local module = {}

local count = 0

local function isPrime(n)
	if n < 2 then return end
	for i = 2, math.sqrt(n) do
		if n % i == 0 then
			return false
		end
	end
	return true
end

local function certainPrime()
	local i = 1
	while true do 
		if isPrime(i) then
			count = count + 1
			if count == 10001 then
				print(i) 
				return   
			end
		end
		i = i + 1
	end
end

certainPrime()

return module
