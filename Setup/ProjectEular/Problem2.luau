local sum = 0
local a, b = 1, 2 

while a <= 4000000 do
	if a % 2 == 0 then
		sum = sum + a
	end
	a, b = b, a + b 
end

print("The sum of the even-valued Fibonacci numbers is:", sum)
