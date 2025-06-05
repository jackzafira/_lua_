local Button = {}

function Button.new(img, x, y, width, height)
    return {
        img  = img,
        x = x,
        y = y,
        width = width,
        height = height,
        hover = false
    }
end

function Button.mouseHover(button, mX, mY)
    button.hover = mX >= button.x and mX <= button.x + button.width and
                   mY >= button.y and mY <= button.y + button.height

    return button.hover
end

function Button.draw(self)
    love.graphics.draw(
        self.img,
        self.x,
        self.y
    )
    love.graphics.print(tostring(self.hover), 100, 100)
end
return Button