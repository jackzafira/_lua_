local camera


function  love.load()
    camera = require('components.camera')
    camera.load()
end

function love.update(dt)
    camera.update(dt)
    
end

function love.mousepressed(x, y, button)
    camera.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    camera.mousereleased(x, y, button)
end

function love.draw()
    camera.draw()
end