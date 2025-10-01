local module = {}

local sumLimits = 1000

local function calculateSum()
	local sum: number = 0
	for i = 1, sumLimits - 1 do
		if i % 3 == 0 or i % 5 == 0 then
			sum = sum + i
		end
	end
	return sum
end

local result = calculateSum()

print(result)

return module
