local camera = {}
local cfg = require('megadrac.cfg')
camera.onView = "main_menu"
camera.scenes = {}



function camera.load()
    camera.scenes.main_menu = require('lib.menus.main_menu')
    camera.scenes.test_board_001 = require('lib.maps.test_board_001')
    camera.scenes.main_menu.load()
    camera.scenes.test_board_001.load()
    love.window.setMode(
        cfg.window.width, cfg.window.height
    )

end

function camera.view(scene)
    if camera.scenes[scene] then
        camera.onView = scene
    else
        print("Cena:" .. scene .. "Não encontrado")
    end
end

function camera.draw()
    camera.scenes[camera.onView].draw()
end


return camera