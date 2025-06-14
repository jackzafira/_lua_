local _ = {}
local background

function _.load()
    background = love.graphics.newImage("assets/background_0002_1280x720.png")
end


function _.update(dt)
    
end

function _.draw()
    love.graphics.draw(
        background, 0, 0, 0,
        love.graphics.getWidth()/ background:getWidth(),
        love.graphics.getHeight()/ background:getHeight()
    )
end

return _