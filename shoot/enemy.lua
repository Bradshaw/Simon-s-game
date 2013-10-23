enemy = {}

enemyspeed = 100

function newEnemy(x, y)
	table.insert(enemy,
	{x = x,
	y = y}	)
end

function updateEnemy(dt)
	for i,v in ipairs(enemy) do
		local Vx = pos_x - v.x
		local Vy = pos_y - v.y
		local l = math.sqrt(Vx*Vx + Vy*Vy)
		local nx = Vx/l 
		local ny = Vy/l
		v.x = v.x + enemyspeed * dt * nx
		v.y = v.y + enemyspeed * dt * ny
	end
end

function drawEnemy()
	for i,v in ipairs(enemy) do
		love.graphics.circle("fill", v.x, v.y, 10) 
	end
end