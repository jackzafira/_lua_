function love.load()
    love.window.setTitle("Projeto-005")
    sti = require('libraries/sti')
    anim8 = require 'libraries/anim8'
    gameMap = sti('maps/map001.lua')


    player = {
        x = 300,
        y = 300,
        speed = 1,
        sprite_sheet = love.graphics.newImage('assets/spritesheet_12.png')

    }
    player.grid = anim8.newGrid(
            138, 138,
            player.sprite_sheet:getWidth(),
            player.sprite_sheet:getHeight()
        )   
    

    player.animations = {}
    player.animations.left = anim8.newAnimation(player.grid('1-8', 8), 0.1)
    player.animations.right = anim8.newAnimation(player.grid('1-8', 1), 0.1)
    player.animations.up = anim8.newAnimation(player.grid('1-8', 2), 0.1)
    player.animations.down = anim8.newAnimation(player.grid('1-8', 5), 0.1)
    player.anim = player.animations.left

    camera = {
        x = 0,
        y = 0,
        scale = 1,
        dragging = false
    }
end


function love.mousepressed(x, y, button)
    if button == 1 then
        camera.dragging = true
        
    end
end

function love.mousereleased(x, y, button)
    if button == 1 then
        camera.dragging = false
 
    end
end

function love.mousemoved(x, y, dx, dy)
    if camera.dragging then
        -- Movimento simples sem conversão isométrica
        camera.x = camera.x - dx / camera.scale
        camera.y = camera.y - dy / camera.scale
    end
end

function love.update(dt)
    local isMoving = false

    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
        player.anim = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
        player.anim = player.animations.right
        isMoving = true
    end
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
        player.anim = player.animations.up
        isMoving = true
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
        player.anim = player.animations.down
        isMoving = true
    end

    player.anim:update(dt)

    if isMoving == false then
        player.anim:gotoFrame(3)
    end

end

function love.draw()

    love.graphics.push()

    gameMap:draw(
        -camera.x,
        -camera.y
    )

    love.graphics.print("Mouse L-Click: "..tostring(camera.dragging), 10, 10)
    love.graphics.print("camera-x: "..tostring(camera.x), 10, 25)
    love.graphics.print("camera-y: "..tostring(camera.y), 10, 35)
    love.graphics.print("camera-y: "..tostring(camera.y), 10, 35)


    player.anim:draw(
        player.sprite_sheet, 
        player.x , player.y, 
        nil, 
        0.6
    )
    

    love.graphics.pop()

    --love.graphics.print()
end