--function to create points for a n sided polygon
--calculuate 
--  interior and central angles
--  side lengths 
--  height and width 

function load()
end

function update()
end

function draw()

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