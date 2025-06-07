local Button = {}

function Button.new(spriteSheet, grid, x, y, hover, state)
    _ = {
       spriteSheet = spriteSheet,
       grid = grid,
       x = x,
       y = y,
       hover = hover or false,
       state = state or 'normal',
       img = grid(1, 1),
       frameWidth = 240,
       frameHeight = 78
    }

    return _
end

function Button.mouseHover(button, mX, mY)
    button.hover = mX >= button.x and 
                   mX <= button.x + button.frameWidth and
                   mY >= button.y and 
                   mY <= button.y + button.frameHeight
    return button.hover
end


function Button.draw(self)
    love.graphics.draw(
        self.spriteSheet,
        self.img,
        self.x,
        self.y
    )
    love.graphics.print(tostring(self.hover), 100, 100)
end
return Button