local Camera = {}
local cfg = require('_lua_.megadrac.cfg')
Camera.onView = "main_menu"
Camera.scenes = {}



function Camera.load()
    Camera.scenes.main_menu = require('menus.main_menu')
    Camera.scenes.test_board_001 = require('maps.test_board_001')
    Camera.scenes.main_menu.load(function(sceneName)
        Camera.view(sceneName)        
    end)
    Camera.scenes.test_board_001.load()

    love.window.setMode(
        cfg.window.width, cfg.window.height
    )

end

function Camera.mousepressed(x, y, button)
    local scene = Camera.scenes[Camera.onView]
    if scene.mousepressed then
        scene.mousepressed(x, y, button)
    end
end

function Camera.mousereleased(x, y, button)
    local scene = Camera.scenes[Camera.onView]
    if scene.mousereleased then
        scene.mousereleased()
    end
end

function Camera.view(scene)
    if Camera.scenes[scene] then
        Camera.onView = scene
    else
        print("Cena:" .. scene .. "Não encontrado")
    end
end

function Camera.update(dt)
    Camera.scenes[Camera.onView].update(dt)
end

function Camera.draw()
    Camera.scenes[Camera.onView].draw()
end


return Camera