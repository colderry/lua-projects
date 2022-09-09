EventEmitter = {
	listeners = {}
}

function EventEmitter:Subscribe(name, fn)
	if self.listeners[name] then
		table.insert(
			self.listeners[name],
			table.maxn(self.listeners) + 1,
			fn
		)
	else
		self.listeners[name] = {fn}
	end
end

function EventEmitter:UnSubscribe(name, pos)
	if self.listeners[name] then
		if pos == nil then
			self.listeners[name] = nil
		else
			table.remove(self.listeners[name], nil, pos)
		end
	end
end

function EventEmitter:Fire(name, ...)
	if not(self.listeners[name]) then
		self.listeners[name] = {}
	end

	for _, fn in pairs(self.listeners[name]) do
		fn(...) 
	end
end

function EventEmitter:On(name, fn)
	self:Subscribe(name, fn)
end

function EventEmitter:Once(name, fn)
	self:Subscribe(name, function(...)
		fn(...)
		self:UnSubscribe(name, table.maxn(self.listeners[name]) + 1)
	end)
end

function EventEmitter:Off(name)
	self:UnSubscribe(name)
end

function EventEmitter:Emit(name, ...)
	self:Fire(name, ...)
end

function EventEmitter:new()
	o = {}
	setmetatable(o, self)
	self.__index = self
	self.listeners = {}
	
	return o
end

return EventEmitter