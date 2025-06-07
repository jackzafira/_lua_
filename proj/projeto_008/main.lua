local anim8 = require('anim8')

function love.load()
    
    background = {}
    background.img = love.graphics.newImage("background_0002_1280x720.png")
    background.x = 0
    background.y = 0

    btn1 = {}
    btn1.x = 50
    btn1.y = 50
    btn1.img = love.graphics.newImage("btn_jogar_001.png")
    btn1.grid = anim8.newGrid(
        240, 74,
        btn1.img:getWidth(), btn1.img:getHeight()
    )
    btn1.animations = {}
    btn1.animations.normal_state = anim8.newAnimation(btn1.grid(1,1), 0.1)
    btn1.animations.hover_state = anim8.newAnimation(btn1.grid(2,1), 0.1)

    btn1.view = btn1.animations.normal_state

    btn1.hover = btn1.hover or false
    btn1.mouseHover = function (button, mX, mY)
        button.hover = mX >= button.x and 
                    mX <= button.x + button.grid.frameWidth and
                    mY >= button.y and 
                    mY <= button.y + button.grid.frameHeight
        return button.hover
    end

    

end

function love.update(dt)
    local mX, mY = love.mouse.getPosition()
    btn1.mouseHover(btn1, mX, mY)

    if btn1.hover then
        btn1.view = btn1.animations.hover_state
    else
        btn1.view = btn1.animations.normal_state
    end
    btn1.view:update(dt)
end

function love.draw()
    love.graphics.draw(background.img)
    btn1.view:draw(
        btn1.img,
        btn1.x, btn1.y,
        nil, 1
    )
    print(btn1.hover)
end