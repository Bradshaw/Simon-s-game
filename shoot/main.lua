--[[
	Cette fonction est appelée au lancement du jeu

	On se sert de cette fonction pour créer tous les objets qu'on va utiliser
	et initialiser les paramètres du jeu.
]]
function love.load(arg)
	require ("bullet") 
	require ("enemy")

	playerspeed = 110
	spawntime = 2
	lastspawn = 0
	pos_x = 250
	pos_y = 200
end


--[[
	Cette fonction est appelée chaque fois qu'un joueur appuie sur un bouton
	de la manette

	On peut donc utiliser cette fonction pour executer les commandes.

]]
function love.joystickpressed(joy, btn)
	if joy==1 and btn==6 then 
		newBullet(
			pos_x,
			pos_y,
			love.joystick.getAxis (1,5),
			love.joystick.getAxis (1,4)
		)
	end
end


--[[
	Cette fonction est appelée à chaque trame de jeu

	Elle sert à simuler chaque trame, on met à jour tous les objets dans le jeu.

]]
function love.update(dt)
	pos_x = pos_x + (playerspeed * dt)*love.joystick.getAxis(1, 1)
	pos_y = pos_y + (playerspeed * dt)*love.joystick.getAxis(1, 2)
	if (pos_x < 10) then 
		pos_x = 10
	end	

	if ( pos_x > love.graphics.getWidth()-10) then
		pos_x = love.graphics.getWidth()-10
	end
	
	if ( pos_y < 10 ) then 
		pos_y = 10
	end
	
	if ( pos_y > love.graphics.getHeight()-10) then
		pos_y = love.graphics.getHeight()-10
	end		
	updateBullets(dt)
	updateEnemy (dt)
	lastspawn = lastspawn + dt
	if lastspawn > spawntime then
		newEnemy( 100, 100)
		lastspawn = 0
	end	
end


--[[
	Cette fonction est aussi appelée à chaque trame.

	Elle sert à dessiner tous les objets qu'on souhaite afficher

]]
function love.draw()
	love.graphics.rectangle("fill", pos_x-10, pos_y-10, 20, 20)
	drawBullets()
	drawEnemy()
end