--!strict
--[[
Created by R1 (7/17/25)

This module defines a generic `EventDispatcher<T>` type in Luau, which enables type-safe
event broadcasting using Roblox's `BindableEvent`.

Key Features:
- `createDispatcher<T>()`: creates a new dispatcher for values of type `T`.
- `dispatcher.fire(value: T)`: fires the event with a typed value.
- `dispatcher.connect(callback: (T) -> ())`: connects a listener with strict typing.

Also includes `mergeDispatchers<T>`, which combines two dispatchers so that:
- `fire()` broadcasts to both
- `connect()` connects to both and returns a joint disconnector
]]

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
			disp1.fire(value)
			disp2.fire(value)
		end,
		connect = function(callback: (T) ->()): RBXScriptConnection
			local conn1 = disp1.connect(callback)
			local conn2 = disp2.connect(callback)

			return {
				Disconnect = function()
					conn1:Disconnect()
					conn2:Disconnect()
				end,
			} :: any
		end,
	}
end

local dispatcher = createDispatcher()
local connection = dispatcher.connect(function(message: string)
	print("Received message:", message)
end)

dispatcher.fire("Test")

