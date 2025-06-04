local main_menu = {}
local background
local button_1
local scale = 1

function main_menu.load()
     background = love.graphics.newImage("assets/background_0001_1280x720.png")
     button_1 = love.graphics.newImage("assets/jogar.png")
end

function main_menu.draw()
    love.graphics.draw(
        background, 0, 0, 0,
        love.graphics.getWidth()/ background:getWidth(),
        love.graphics.getHeight()/ background:getHeight()
    )
    love.graphics.draw(
        button_1, background:getWidth() * 0.15, 
        background:getHeight() * 0.05, 
        0
    )
end

return main_menu