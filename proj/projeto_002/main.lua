function love.load()
  love.window.setTitle("Projeto-002")

    x = 0
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    x = x + 100 * dt
  end
  
  if love.keyboard.isDown("left") then
    x = x - 100 * dt
  end

end

function love.draw()
    love.graphics.rectangle("line", x, 50, 200, 150)  -- Desenha um retângulo
    love.graphics.print("X: " .. x, 20, 20)  -- Mostra o valor de X na tela
    
end 