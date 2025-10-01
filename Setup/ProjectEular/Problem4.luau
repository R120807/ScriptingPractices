local module = {}

local function findPalindromicNum()
	local largestPalindrome = 0

	for	i = 999, 100, -1 do
		for j = i, 100, -1 do
			local product = i * j
			local productString = tostring(product)
			local reversedProduct = string.reverse(productString)

			if productString ==  reversedProduct then
				if product > largestPalindrome then
					largestPalindrome = product
				end
			end
		end
	end
	return largestPalindrome
end


local result = findPalindromicNum()
print("The larget palindromic made from the product of two 3-digit numbers is:", result)


return module
