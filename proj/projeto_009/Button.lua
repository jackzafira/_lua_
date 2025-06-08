local anim8 = require('megadrac.lib.components.anim8')
local Button = {}

function Button.new(spriteSheet, grid, x, y)
    _ = {
       spriteSheet = spriteSheet,
       grid = grid,
       x = x,
       y = y,
       animations = {},
       hover = false
       
       
    }
    _.animations.default = anim8.newAnimation(grid('1-1', 1), 0.1)
    _.view = _.animations.default

    return _

end

Button.mouseHover = function (button, mX, mY)
        button.hover = mX >= button.x and 
                    mX <= button.x + button.grid.frameWidth and
                    mY >= button.y and 
                    mY <= button.y + button.grid.frameHeight
        return button.hover
    end
    
return Button