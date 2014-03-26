require("Melee")

Ego = {}

function Ego:new (o)
	o = o or {}
	o.name = o.name or "default" -- create object if user does not provide one
	o.hp = o.hp or 100
	o.def = o.def or 100
	o.exp = o.exp or 10
	o.melee = o.melee or Melee:new() 
	o.points = o.points or 0
	setmetatable(o, self)
	self.__index = self
	return o
end

function Ego:print(xpos)
	local offset = 15
	for v in pairs(self) do
			love.graphics.print(v .. " : " .. tostring(self[v]), xpos, offset)
			offset = offset + 15
  end
end
