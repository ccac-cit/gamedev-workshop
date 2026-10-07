local player = {
    x = 400,
    y = 300,
    velocity_x = 0,
    velocity_y = 0,
    angular_velocity = 0,
    height = 25,
    width = 15,
    angle = 0,
    direction = 0
}

function getPlayer()
    return player
end

function updatePlayer(window, dt)
-- handle rotation for the player
    if love.keyboard.isDown("right") and (player.x + player.width) < window.width then
        player.angular_velocity = math.pi 
    end
    if love.keyboard.isDown("left") and (player.x) > 0 then
        player.angular_velocity = -math.pi 
    end
    player.angle = player.angle + player.angular_velocity * dt
    if player.angular_velocity > 0 then
        player.angular_velocity = player.angular_velocity - (math.pi / 8)
    elseif player.angular_velocity < 0 then
        player.angular_velocity = player.angular_velocity + (math.pi / 8)
    end

--handle x, y movement for player
--TODO add teleportation to opposite side of screen 
    if love.keyboard.isDown("down") then
        player.velocity_x = -75 * math.cos(player.angle)
        player.velocity_y = -75 * math.sin(player.angle)
    end
    if love.keyboard.isDown("up") then
        player.velocity_x = 125 * math.cos(player.angle)
        player.velocity_y = 125 * math.sin(player.angle)
    end

    player.y = player.y + player.velocity_y * dt
    player.x = player.x + player.velocity_x * dt

    if player.velocity_x > 0 then
        player.velocity_x = player.velocity_x - 1
    elseif player.velocity_x < 0 then
        player.velocity_x = player.velocity_x + 1
    end
    if player.velocity_y > 0 then
        player.velocity_y = player.velocity_y - 1
    elseif player.velocity_y < 0 then
        player.velocity_y = player.velocity_y + 1
    end
end

function drawPlayer() -- position,.height, width and angle
	love.graphics.push()
	love.graphics.translate(player.x, player.y)
	love.graphics.rotate(player.angle)
	love.graphics.polygon("line", -player.height/2, -player.width /2, -player.height/2, player.width /2, player.height/2, 0)
	love.graphics.pop()
end