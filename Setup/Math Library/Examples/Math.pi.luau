--[[
	READ-ONLY VALUE

	Math.pi is the mathematical constant for pi, for circles, angles, etc. It is used in wheels or orbital paths.
]]


local function piFunction()
	local center: Instance? = workspace:FindFirstChild("Part")
	local radius: number = 10
	local numPosts: number = 20
	
	--[[
		i goes from 0 to numPosts - 1
		Dividing it by numPosts converts that index into a fraction of the circle
		
		When i = 0 -> (0/20) = 0 -> angle = 0 radians
		When i = 1 -> (1/20) = 0.05 -> angle = 0.05 * 2π == 0.314rad (~18degrees)
		
		Multiplying by 2 * math.pi gives you a fraction of the full circle.
		Multiplying by 2π turns that fraction into an actual rotation angle in radians
		
	]]
	for i = 0, numPosts - 1 do
		local angle: number = (i / numPosts)
	end

end