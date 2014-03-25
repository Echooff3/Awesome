Melee = {}

function Melee:new(o)
	o = o or {}
	o[0] = o[0] or { name = "Item 0", hp = 10, def = 10 }
	o[1] = o[1] or { name = "Item 1", hp = 10, def = 10 }
	o[2] = o[2] or { name = "Item 2", hp = 10, def = 10 }
	o[3] = o[3] or { name = "Item 3", hp = 10, def = 10 }
	setmetatable(o, self)
	self.__index = self
	return o
end
