function love.load(arg)
	pos_x = 250
end

function love.update(dt)
	pos_x = pos_x + (100 * dt)
end

function love.draw()
	love.graphics.rectangle("fill", pos_x, 200, 150, 100)
end