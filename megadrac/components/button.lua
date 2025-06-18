local anim8 = require('lib.anim8')
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

button.mouseHover = function (_, mX, mY)
        _.hover = mX >= _.x and 
                  mX <= _.x + _.grid.frameWidth and
                  mY >= _.y and 
                  mY <= _.y + _.grid.frameHeight
        return _.hover
    end

button.check_leftClick = function(_, mX, mY, mButton)
    if mButton == 1 and button.mouseHover(_, mX, mY) then
        _.leftClick = true
        if _.onClick then _.onClick() end
        return true
    end
    return false
end

return button