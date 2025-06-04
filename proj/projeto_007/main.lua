function love.load()
    -- Configurações iniciais
    larguraTela, alturaTela = 800, 600
    love.window.setMode(larguraTela, alturaTela)
    
    -- Posições iniciais
    caixa = {
        x = larguraTela/2,
        y = alturaTela/2,
        tamanho = 30
    }
    
    bola = {
        x = larguraTela/2,
        y = alturaTela/4,
        velocidadeX = 0,
        velocidadeY = 0,
        raio = 15,
        velocidadeMovimento = 100, -- Velocidade com teclado
        forcaGravidade = 200      -- Força da atração
    }
end

function love.update(dt)
    -- Movimento com teclado
    local movendo = false
    
    if love.keyboard.isDown('left') then
        bola.velocidadeX = -bola.velocidadeMovimento
        movendo = true
    end
    if love.keyboard.isDown('right') then
        bola.velocidadeX = bola.velocidadeMovimento
        movendo = true
    end
    if love.keyboard.isDown('up') then
        bola.velocidadeY = -bola.velocidadeMovimento
        movendo = true
    end
    if love.keyboard.isDown('down') then
        bola.velocidadeY = bola.velocidadeMovimento
        movendo = true
    end

    if not movendo then
        bola.velocidadeX = 0
    end

    -- Atualiza posição da bola
    bola.x = bola.x + bola.velocidadeX 

    bola.y = bola.y + bola.velocidadeY 
end

function love.draw()
    -- Desenha a caixa
    love.graphics.setColor(1, 0.5, 0)
    love.graphics.rectangle('fill', caixa.x - caixa.tamanho/2, caixa.y - caixa.tamanho/2, caixa.tamanho, caixa.tamanho)
    
    -- Desenha a bola
    love.graphics.setColor(0, 0.8, 1)
    love.graphics.circle('fill', bola.x, bola.y, bola.raio)
end