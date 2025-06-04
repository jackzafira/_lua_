function love.load()
    love.window.setTitle("Projeto-004")
    sti = require('libraries/sti')
    gameMap = sti('maps/map_002.lua')

    screen_width = 800
    screen_height = 600
    love.window.setMode(screen_width, screen_height)

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
        camera.lastX, camera.lastY = x, y
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

function love.wheelmoved(x, y)
    -- Pega posição do mouse antes do zoom
    local mx, my = love.mouse.getPosition()
    local wx = (mx / camera.scale) + camera.x
    local wy = (my / camera.scale) + camera.y

    -- Aplica zoom
    if y > 0 then
        camera.scale = camera.scale * 1.1
    else
        camera.scale = math.max(0.5, camera.scale * 0.9)
    end

    -- Ajusta posição para manter o zoom no mouse
    camera.x = wx - (mx / camera.scale)
    camera.y = wy - (my / camera.scale)
end

function love.draw()
    love.graphics.push()
    
    -- Primeiro translada, depois escala (ordem importante!)
    love.graphics.translate(-camera.x * camera.scale, -camera.y * camera.scale)
    love.graphics.scale(camera.scale, camera.scale)
    
    -- Desenha o mapa sem parâmetros
    gameMap:draw()

    love.graphics.pop()
    
    -- Debug
    love.graphics.print(string.format("Camera X: %.2f | Y: %.2f", camera.x, camera.y), 10, 10)
    love.graphics.print("Scale: " .. camera.scale, 10, 30)
end