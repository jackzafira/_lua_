local main_menu = {}
local background
local button_1
local scale = 1
local Button = require('lib.components.buttons')
main_menu.btn = {}

function main_menu.load()
     background = love.graphics.newImage("assets/background_0001_1280x720.png")
     button_1 = love.graphics.newImage("assets/jogar.png")
     main_menu.btn.jogar = Button.new(
        button_1,
        background:getWidth() * 0.15,
        background:getHeight() * 0.05,
        button_1:getWidth(),
        button_1:getHeight()
        
     )

end

function main_menu.update(dt)
    local mX, mY = love.mouse.getPosition()
    local scaleX = love.graphics.getWidth() / background:getWidth()
    local scaleY = love.graphics.getHeight() / background:getHeight()

    local mX2 = mX / scaleX
    local mY2 = mY / scaleY

    Button.mouseHover(main_menu.btn.jogar, mX2, mY2)
end

function main_menu.draw()
    love.graphics.draw(
        background, 0, 0, 0,
        love.graphics.getWidth()/ background:getWidth(),
        love.graphics.getHeight()/ background:getHeight()
    )
    Button.draw(main_menu.btn.jogar)
    
end

return main_menu