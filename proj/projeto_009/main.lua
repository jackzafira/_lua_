local btn  = require('_lua_.proj.projeto_009.Button')
local anim8 = require('_lua_.megadrac.lib.components.anim8')

function love.load()
    bnt1_img = love.graphics.newImage("btn_jogar_001.png")
    background_img = love.graphics.newImage("background_0002_1280x720.png")
    
    btn1_grid = anim8.newGrid(
        240, 74,
        bnt1_img:getWidth(),
        bnt1_img:getHeight()
    )

    btn1 = btn.new(bnt1_img, btn1_grid, 10, 10)
    btn1.animations.hover = anim8.newAnimation(btn1.grid('2-2', 1), 0.1)
    
    btn1.onClick = function()
        print("Everybody's going to the party, have a real. Good Time")
    end
end

function love.update(dt)
    local mx, my = love.mouse.getPosition()

    btn1.hover = btn.mouseHover(btn1, mx, my)
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

function love.draw()
    love.graphics.draw(background_img)
    btn1.view:draw(btn1.spriteSheet, btn1.x, btn1.y, nil, 1)
   
end