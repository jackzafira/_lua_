local main_menu = {}
local anim8 = require('lib.components.anim8')
local btn = require('_lua_.megadrac.lib.components.Button')

local changeSceneFunction

function main_menu.load(onViewChange)
    background = love.graphics.newImage("assets/background_0001_1280x720.png")
    btn1_img = love.graphics.newImage('assets/btn_jogar_001.png')

    btn1_grid = anim8.newGrid(
        240, 74,
        btn1_img:getWidth(),
        btn1_img:getHeight()
    )

    btn1 = btn.new(btn1_img, btn1_grid, 10, 10)
    btn1.animations.hover = anim8.newAnimation(btn1.grid('2-2', 1), 0.1)

    changeSceneFunction = onViewChange

    btn1.onClick = function()
        if changeSceneFunction then
            changeSceneFunction('test_board_001')
        end
        print("Everybody's going to the party, have a real. Good Time")
    end
end

function main_menu.update(dt)
    local mX, mY = love.mouse.getPosition()

    btn.mouseHover(btn1, mX, mY)
    if btn1.hover then
        btn1.view = btn1.animations.hover
    else
        btn1.view = btn1.animations.default
    end

    btn1.view:update(dt)

end

function love.mousepressed(x, y, button)
    btn.check_leftClick(btn1, x, y, button)
end

function love.mousereleased()
    btn1.leftClick = false
end

function main_menu.draw()
    love.graphics.draw(
        background, 0, 0, 0,
        love.graphics.getWidth()/ background:getWidth(),
        love.graphics.getHeight()/ background:getHeight()
    )
    btn1.view:draw(
        btn1.spriteSheet,
        btn1.x, btn1.y,
        nil, 1
    )

    
end

return main_menu