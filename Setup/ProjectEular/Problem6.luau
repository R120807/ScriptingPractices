local module = {}

local tableofSquares = {}

local sum = 0
local finalVal = 0

local function sumSquareDiff()
	for i = 1, 100 do
		local squaredI = i ^ 2
		table.insert(tableofSquares, squaredI)
	end
	return tableofSquares
end

local function squareSumDiff()
	local v = 0
	for i = 1, 100 do
		v = v + i
	end
	return v
end

local tbl = sumSquareDiff()
local vVal = squareSumDiff()

for _, element in ipairs(tbl) do
	sum = sum + element
end

local finalVal = (vVal ^ 2) - sum 
-- 25164150
return module
