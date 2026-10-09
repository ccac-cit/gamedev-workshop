function createAsteroid(window)
    local asteroid = {}
    asteroid.x = math.random(50, window.width - 50)
    asteroid.y = math.random(50, window.height - 50)
    asteroid.angle = math.pi / math.random(-16, 16)
    asteroid.velocity_x = 25 * math.cos(asteroid.angle)
    asteroid.velocity_y = 25 * math.sin(asteroid.angle)
    asteroid.points = createPoints()
    asteroid.size = 1
    return asteroid
end

function createPoints()
    --local points = {{x = 0, y = 0}}
    local points = {
        {x = 0, y = 0},
        {x = 30, y = 0},
        {x = 30, y = 20},
        {x = 25, y = 40},
        {x = 20, y = 45},
        {x = 15, y = 45},
        {x = 12, y = 35},
        {x = 5, y = 25},
        {x = 0, y = 20},
        {x = -10, y = 10},
        {x = -15, y = 5},
        {x = -20, y = 0},
        {x = -30, y = 0}
    }
        --[[for i = 2, 6 do 
            points[i] = {x = points[i - 1].x + math.random(5, 25), y = points[i - 1].y + math.random(5, 25)}
        end
        for i = 7, 10 do 
            points[i] = {x = points[i - 1].x - math.random(5, 25), y = points[i - 1].y - math.random(5, 25)}
        end
        for i = 11, 13 do 
            points[i] = {x = points[i - 1].x - math.random(5, 25), y = points[i - 1].y + math.random(5, 25)}
        end--]]
    return points
end

function updateAsteroids(asteroidTracker, window, dt)
    for i, asteroid in ipairs(asteroidTracker) do
        asteroid.x = asteroid.x + asteroid.velocity_x * dt
        asteroid.y = asteroid.y + asteroid.velocity_y * dt
    end
end

function drawAsteroids(asteroidTracker) -- position,.height, width and angle
    for i, asteroid in ipairs(asteroidTracker) do
        love.graphics.push()
        love.graphics.translate(asteroid.x, asteroid.y)
        love.graphics.rotate(asteroid.angle)
        love.graphics.polygon("line",
            asteroid.points[1].x, asteroid.points[1].y,
            asteroid.points[2].x, asteroid.points[2].y,
            asteroid.points[3].x, asteroid.points[3].y,
            asteroid.points[4].x, asteroid.points[4].y,
            asteroid.points[5].x, asteroid.points[5].y,
            asteroid.points[6].x, asteroid.points[6].y,
            asteroid.points[7].x, asteroid.points[7].y,
            asteroid.points[8].x, asteroid.points[8].y,
            asteroid.points[9].x, asteroid.points[9].y,
            asteroid.points[10].x, asteroid.points[10].y,
            asteroid.points[11].x, asteroid.points[11].y,
            asteroid.points[11].x, asteroid.points[12].y,
            asteroid.points[11].x, asteroid.points[13].y
    )
        love.graphics.pop()
    end
end