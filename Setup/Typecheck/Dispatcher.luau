--!strict
type EventDispatcher<T> = {
	fire: (T) -> (),
	connect: ((T) -> ()) -> RBXScriptConnection
}

local function createDispatcher<T>(): EventDispatcher<T>
	local bindable = Instance.new("BindableEvent")
	return {
		fire = function(value: T)
			bindable:Fire(value) 
		end,
		connect = function(callback: (T) -> ()): RBXScriptConnection
			return bindable.Event:Connect(function(...)
				callback(... :: T)
			end)
		end
	}
end

local function mergeDispatchers<T>(disp1: EventDispatcher<T>, disp2: EventDispatcher<T>): EventDispatcher<T>
	return {
		fire = function(value: T)
			disp1:fire(value)
			disp2:fire(value)
		end,
		connect = function(callback: (T) ->()): RBXScriptConnection
			local conn1 = disp1:connect(callback)
			local conn2 = disp2:connect(callback)

			return {
				Disconnect = function()
					conn1:Disconnect()
					conn2:Disconnect()
				end,
			} :: any
		end,
	}
end



