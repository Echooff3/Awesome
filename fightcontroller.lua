require("Ego")
require("Melee")

FightController = {}

FightController.lastmessage = "Fight init"
FightController.fightstatus = "Starting fight"
FightController.turn = 0 
FightController.fighter = 1 
FightController.fightStarted = false
FightController.state = 0
FightController.teama = {}
FightController.teamb = {}

function FightController.new(teama, teamb)
	FightController.teama = teama
	FightController.teamb = teamb
	print(FightController.teama, FightController.teamb)
end

-- TODO write reset

function FightController:getFighter ()
	local team
	if (self.turn % 2) == 0 then
		team = self.teama
	else
		team = self.teamb
	end
	self.lastmessage = "Getting fighter " .. team[self.fighter].name
	return team[self.fighter]
end

function FightController:incFighter () 
	self.fighter = self.fighter + 1
	local team
	if self.turn % 2 then
		team = self.teama
	else
		team = self.teamb
	end
	if table.getn(team) < self.fighter then
		self.turn = self.turn + 1
		self.fighter = 1
	end
end

function FightController:start ()
	if self.fightStarted == false then
		-- TODO Start fight
		self.state = 0
		self.fightStarted = true
	end
end

function FightController:advance (opt)
	if self.state == 0 then -- get options
		if opt == nil then 
			self.fightstatus = "1 melee 2 range 3 heal 4 special"
		else
			self:melee(opt)
		end
	elseif self.state == 1 then
		self.fightstatus = "state 1"
	elseif self.state == 2 then
		self.fightstatus = "state 2"
	elseif self.state == 3 then
		self.fightstatus = "state 3"
	end

end

function FightController:melee (opt)
	-- opt will contain melee data and fighter to be attacked
	-- TODO check badie state (blocking, riposting, reflecting)
	-- TODO figure out math for hits (def, exp, equipment, pts)
	opt.badie.hp = opt.badie.hp - opt.melee.hp
	opt.badie.def = opt.badie.def - opt.melee.def

	local current = {}
	current = self:getFighter()
	self.lastmessage = current.name .. " is using " .. opt.melee.name .. " on " .. opt.badie.name
	-- increment fighter
	self:incFighter()
end

function FightController:print(xpos)
	for v in pairs(self.teama) do
		self.teama[v]:print(10)
	end

	for v in pairs(self.teamb) do
		self.teamb[v]:print(300)
	end
	love.graphics.print(self.lastmessage, 300, 300)
	love.graphics.print(self.fightstatus, 300, 350)
end
