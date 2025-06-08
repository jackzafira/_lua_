local btn = require('proj.projeto_009.Button')
local anim8 = require('megadrac.lib.components.anim8')

function love.load()
    img_btn1 = love.graphics.newImage("btn_jogar_001.png")
    btn_1 = btn.new(
        img_btn1,
        anim8.newGrid(
            240, 74, 
            img_btn1:getWidth(),
            img_btn1:getHeight()
        ),
        10, 10
    )
end