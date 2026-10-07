require("bullet")
require("player")
require("asteroid")

local window = {height = love.graphics.getHeight( ), width = love.graphics.getWidth( )}
local bulletTracker = {}
local asteroidTracker = {}

-- runs at program start only 
function love.load()
    for i = 1, 15 do 
        table.insert(asteroidTracker, createAsteroid(window))
    end
end

function love.keypressed(key)
    -- spawn bullet at center of cube
    if key == "space" then
        table.insert(bulletTracker, createBullet(getPlayer()))
    end
end

function love.update(dt)
    updatePlayer(window, dt)
    updateBullet(bulletTracker, window, dt)
    updateAsteroids(asteroidTracker, window, dt)
end

-- handles draw calls, runs each frame 
function love.draw()
    drawPlayer()
    drawBullets(bulletTracker)
    drawAsteroids(asteroidTracker)
end

--[[
    local cube = {x = 0, y = 0, width = 12, height = 12, velocity_y = 0, velocity_x = 0, momentum = 0}

    love.graphics.rectangle("line", cube.x, cube.y, cube.width, cube.height)

    -- handle x movement for cube
    if love.keyboard.isDown("right") and (cube.x + cube.width) < window.width then
        cube.velocity_x = 100
    end
    if love.keyboard.isDown("left") and (cube.x) > 0 then
        cube.velocity_x = -100
    end
    cube.x = cube.x + cube.velocity_x * dt
    if cube.velocity_x > 0 then
        cube.velocity_x = cube.velocity_x - 1
    elseif cube.velocity_x < 0 then
        cube.velocity_x = cube.velocity_x + 1
    end

    --handle y movement for cube
    if love.keyboard.isDown("down") and (cube.y + cube.height) < window.height then
        cube.velocity_y = 100
    end
    if love.keyboard.isDown("up") and (cube.y) > 0 then
        cube.velocity_y = -100
    end
    cube.y = cube.y + cube.velocity_y * dt
    if cube.velocity_y > 0 then
        cube.velocity_y = cube.velocity_y - 1
    elseif cube.velocity_y < 0 then
        cube.velocity_y = cube.velocity_y + 1
    end
    ]]