--!strict

type Tree<T> = {
	value: T,
	children: {Tree<T>}
}

local function findValue<T>(tree: Tree<T>, predicate: (T) -> boolean): Tree<T>?
	if predicate(tree.value) then
		return tree	
	end
	for _, child in tree.children do
		local result = findValue(child, predicate)
		if result then
			return result 
		end
	end
	return nil
end


local numberTree: Tree<number> = {
	value = 1,
	children = {
		{ value = 3, children = {} },
		{ value = 7, children = { { value = 9, children = {} } } }
	}
}
local foundNumber = findValue(numberTree, function(value: number): boolean
	return value > 5 
end)