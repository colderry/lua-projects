# EventEmitter
`EventEmitter` lets you set a key-paired function and then allows you to call the function by the set key at any time.

:wave: **Congratulate me as it is my first project in Lua.**

# Example
```lua
require "EventEmitter"

local PlayerEmitter = EventEmitter:new()
PlayerEmitter:Subscribe("Henlo", function(name)
	print("Henlo", name)
end)

PlayerEmitter:Fire("Henlo", "Colderry")

-- Subscribe to an event once
PlayerEmitter:Once("HenloOnce", function(name)
	print("Henlo", name, "Once")
end)

PlayerEmitter:Fire("HenloOnce", "Colderry")
PlayerEmitter:Fire("HenloOnce", "Colderry") -- This won't fire as it was removed on the first.
```