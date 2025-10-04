--[[
	READ-ONLY VALUE

	Math.pi is the mathematical constant for pi, for circles, angles, etc. It is used in wheels or orbital paths.
]]
local RunService = game:GetService("RunService")

--[[
	piFunction
	
	Purpose: To create a static ring of parts once
]]

local function piFunction()
	local center: Instance? = workspace:FindFirstChild("Part")
	local radius: number = 10
	local numPosts: number = 20

	--[[
		i goes from 0 to numPosts - 1
		Dividing it by numPosts converts that index into a fraction of the circle (between 0 and 1)
		
		When i = 0 -> (0/20) = 0 -> angle = 0 radians
		When i = 1 -> (1/20) = 0.05 -> angle = 0.05 * 2π == 0.314rad (~18degrees)
		
		Multiplying by 2 * math.pi gives you a fraction of the full circle.
		Multiplying by 2π turns that fraction into an actual rotation angle in radians
	]]
	for i: number = 0, numPosts - 1 do
		local angle: number = (i / numPosts) * 2 * math.pi

		local post = Instance.new("Part")
		post.Position = center.Position + Vector3.new(math.cos(angle) * radius, 0, math.sin(angle) * radius)
		post.CanCollide = false
		post.Anchored = true
		post.Parent = workspace
	end

end

--[[
	rotatePlatform

	Purpose: To create continuous motion forever
]]
local function rotatePlatform()
	local center: Instance? = workspace:WaitForChild("Part")
	local platform = Instance.new("Part")
	local model = Instance.new("Model")

	platform.Anchored = true
	platform.Name = "Platform"
	platform.Parent = workspace

	local radius: number = 10
	local rotationSpeed: number = 2
	local currentTime: number = 0

	RunService.Heartbeat:Connect(function(deltaTime)
		currentTime = currentTime + deltaTime

		local currentAngle: number = currentTime * rotationSpeed


		local xOffset = math.cos(currentAngle) * radius
		local zOffset = math.sin(currentAngle) * radius

		local newPosition: Vector3 = center.Position + Vector3.new(xOffset, 0, zOffset)
		platform.Position =  newPosition

		platform.CFrame = CFrame.new(platform.Position, center.Position)
	end)
end


local function spiralParts()
	local center: Instance? = workspace:WaitForChild("Part")
	local radius: number = 10
	local numPosts: number = 20


	for i = 0, numPosts - 1 do
		local angle: number = (i / numPosts) * 2 * math.pi

		local post = Instance.new("Part")
		post.Position = center.Position + Vector3.new(math.cos(angle) * radius, 0, math.sin(angle) * radius)
		post.Anchored = true
		post.CanCollide = false
		post.Parent = workspace
	end
end

spiralParts()
