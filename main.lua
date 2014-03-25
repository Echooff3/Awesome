-- requirements
require("Ego")
require("FightController")


-- load
function love.load()
	text = "Hello"
	p1 = Ego:new({name="hero"}) 
	p2 = Ego:new({name="villain"})
	fc = FightController:new({},{p1},{p2})
end

-- update
function love.update(dt)

end

-- key press
function love.keypressed(key)
	if key == 'b' then
		text = "The B key was pressed."
	end
end

function love.keyreleased(key)
	if key == 'b' then
		text = "The B key was released."
	elseif key == 'a' then
		a_down = false
	end
end

-- draw stuff
function love.draw()
	love.graphics.print(text, 400, 300)
  fc:print(10)
end
