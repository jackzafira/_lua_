local Camera = {}
local cfg = require('megadrac.cfg')
Camera.onView = "main_menu"
Camera.scenes = {}



function Camera.load()
    Camera.scenes.main_menu = require('lib.menus.main_menu')
    Camera.scenes.test_board_001 = require('lib.maps.test_board_001')
    Camera.scenes.main_menu.load()
    Camera.scenes.test_board_001.load()
    love.window.setMode(
        cfg.window.width, cfg.window.height
    )

end

function Camera.update(dt)
    Camera.scenes[Camera.onView].update()
end

function Camera.view(scene)
    if Camera.scenes[scene] then
        Camera.onView = scene
    else
        print("Cena:" .. scene .. "Não encontrado")
    end
end

function Camera.draw()
    Camera.scenes[Camera.onView].draw()
end


return Camera