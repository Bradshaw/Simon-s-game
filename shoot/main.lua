function love.load(arg)
	require ("bullet")
	pos_x = 250
	pos_y = 200
end

function love.update(dt)
	pos_x = pos_x + (100 * dt)*love.joystick.getAxis(1, 1)
	pos_y = pos_y + (100 * dt)*love.joystick.getAxis(1, 2)
end

function love.draw()
	love.graphics.rectangle("fill", pos_x, pos_y, 20, 20)
end