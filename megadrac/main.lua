local camera

function  love.load()
    camera = require('lib.camera')
    camera.load()
end

function love.draw()
    camera.draw()
end