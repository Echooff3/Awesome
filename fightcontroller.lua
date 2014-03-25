require("Ego")
require("Melee")

FightController = {}

function FightController:new(o, teama, teamb)
	o.teama = teama;
	o.teamb = teamb;
	o.lastmessage = "Fight init"
	o.fightstatus = "Starting fight"
	setmetatable(o, self)
	self.__index = self
	return o;
end

function FightController:print(xpos)
	-- self.teama:print(xpos)
	-- self.teamb:print(xpos + 300)
	love.graphics.print(self.lastmessage, 300, 300)
	love.graphics.print(self.fightstatus, 300, 350)
end
