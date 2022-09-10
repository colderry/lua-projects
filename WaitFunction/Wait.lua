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