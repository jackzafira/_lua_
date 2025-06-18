function  love.load()
    love.window.setTitle("Projeto-003")
    tileset = love.graphics.newImage("assets/grassland_tiles.png")
    map = {
        gridSize = 20
    }

    grassQuad = love.graphics.newQuad(0,0, 64, 32, tileset:getDimensions())
    graveQuad = love.graphics.newQuad(896,416, 64, 64, tileset:getDimensions())
    treeQuad = love.graphics.newQuad(0,1152, 128, 192, tileset:getDimensions())
    love.window.setMode(800, 600)

    camera = {
        x=0, 
        y=0,
        scale = 1,
        dragging = false,
        lastX = 0,
        lastY = 0
    }
end

function love.mousepressed(x, y, button)
    if button == 1 then
        camera.dragging = true
        camera.lastX = x
        camera.lastY = y
    end
end

function love.mousemoved(x, y, dx, dy)
    if camera.dragging then
        local deltaX = (x - camera.lastX) / camera.scale
        local deltaY = (y - camera.lastY) / camera.scale

        camera.x = camera.x + deltaX
        camera.y = camera.y + deltaY

        camera.lastX = x
        camera.lastY = y
    end
    
end

function love.mousereleased(x, y, button)
    if button == 1 then
        camera.dragging = false
    end
end

function love.wheelmoved(x, y)
    -- Zoom com a roda do mouse
    local zoomAmount = 0.1
    if y > 0 then
        camera.scale = camera.scale + zoomAmount
    elseif y < 0 then
        camera.scale = math.max(0.1, camera.scale - zoomAmount)
    end
end

function love.update(dt)
end

function love.draw()

    love.graphics.push()
    
    love.graphics.scale(camera.scale or 1)

    love.graphics.translate(camera.x, camera.y)

    for x = 1, map.gridSize do
        for y = 1, map.gridSize do

            local screenX = (x - y) * (64/2)
            local screenY = (x + y) * (32/2)

            love.graphics.draw(tileset, grassQuad, screenX, screenY)
        end
    end
    love.graphics.draw(tileset, graveQuad, 2, 100)
    love.graphics.draw(tileset, treeQuad, -150, 60)

    love.graphics.pop()
end