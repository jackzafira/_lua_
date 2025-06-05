function love.load()
  love.window.setTitle("Projeto-002")

    x = 0
    y = 0
end

function love.update(dt)
  x, y = love.mouse.getPosition()

end

function love.draw()
    love.graphics.rectangle("line", x, 50, 200, 150)  -- Desenha um retângulo
    love.graphics.print("X: " .. x, 20, 20)  -- Mostra o valor de X na tela
    
end 