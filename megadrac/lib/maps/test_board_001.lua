local test_board_001 = {}
local background

function test_board_001.load()
    background = love.graphics.newImage("assets/background_0002_1280x720.png")
end

function test_board_001.draw()
    love.graphics.draw(
        background, 0, 0, 0,
        love.graphics.getWidth()/ background:getWidth(),
        love.graphics.getHeight()/ background:getHeight()
    )
end

return test_board_001