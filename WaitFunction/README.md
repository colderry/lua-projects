# WaitFunction
A function that takes number of seconds as first argument then does a repeat-until loop stack for the `os.time()` to reach the seconds passed.

# Code
```lua
function wait(sec)
	assert(
		type(sec) == "number",
		string.format("Bad argument #1 - expected 'number' instead got '%s'", type(sec))
	)

	local t = os.time() + sec

	repeat
		-- This is an empty repeat-until loop for stack
	until os.time() >= t

	return true
end

return wait
```

# Example
```lua
wait(5)
print("Printed after 5 seconds")
```