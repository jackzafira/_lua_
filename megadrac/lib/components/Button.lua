local anim8 = require('lib.components.anim8')
local button = {}

function button.new(spriteSheet, grid, x, y)
    _ = {
       spriteSheet = spriteSheet,
       grid = grid,
       x = x,
       y = y,
       animations = {},
       hover = false,
       leftClick = false,
       onClick = nil
    }
    _.animations.default = anim8.newAnimation(grid('1-1', 1), 0.1)
    _.view = _.animations.default

    return _

end

button.mouseHover = function (button, mX, mY)
        button.hover = mX >= button.x and 
                    mX <= button.x + button.grid.frameWidth and
                    mY >= button.y and 
                    mY <= button.y + button.grid.frameHeight
        return button.hover
    end

button.check_leftClick = function(button, mX, mY, mButton)
    if mButton == 1 and button.mouseHover(button, mX, mY) then
        button.leftClick = true
        if button.onClick then button.onClick() end
        return true
    end
    return false
end

return button