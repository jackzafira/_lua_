local anim8 = require('lib.anim8')
local button = {}


function button.new(spriteSheet, grid, x, y)
    local _ = {
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

    _.mouseHover = function(self, mX, mY)
        self.hover = mX >= self.x and 
                    mX <= self.x + self.grid.frameWidth and
                    mY >= self.y and 
                    mY <= self.y + self.grid.frameHeight
        return self.hover
    end

    _.check_leftClick = function(self, mX, mY, mButton)
        if mButton == 1 and self:mouseHover(mX, mY) then
            self.leftClick = true
            if self.onClick then self.onClick() end
            return true
        end
        return false
    end

    return _
end

return button