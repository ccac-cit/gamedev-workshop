function createBullet(player)
    local bullet = {}
    bullet.x =player.x + (player.width / 2)
    bullet.y =player.y 
    bullet.velocity_x = 500 * math.cos(player.angle)
    bullet.velocity_y = 500 * math.sin(player.angle)
    bullet.height = 5
    bullet.width = 1
    return bullet
end

--handle x, y for bullet movement
function updateBullet(bulletTracker, window, dt)
    for i, bullet in ipairs(bulletTracker) do
        if bullet.x + bullet.width > window.width or bullet.y + bullet.height > window.height then
            table.remove(bulletTracker, i)
        end
        if bullet.x < 0 or bullet.y < 0 then
            table.remove(bulletTracker, i)
        end
        bullet.x = bullet.x + bullet.velocity_x * dt
        bullet.y = bullet.y + bullet.velocity_y * dt
    end
end

--TODO make bullets rotate with the player
function drawBullets(bulletTracker)
    for i, bullet in ipairs(bulletTracker) do
        love.graphics.rectangle("line", bullet.x, bullet.y, bullet.width, bullet.height)
    end
end