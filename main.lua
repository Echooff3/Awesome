-- requirements
require("Ego")

p1 = Ego:new() 
p2 = Ego:new({name="villain"})

-- load
function love.load()
	text = "Hello"
	p1.name = "Hero"
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
	p1:print(10)
	p2:print(500)
end
