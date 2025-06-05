local camera

function  love.load()
    camera = require('lib.components.camera')
    camera.load()
end

function love.update(dt)
    camera.update(dt)
    
end
function love.draw()
    camera.draw()
end