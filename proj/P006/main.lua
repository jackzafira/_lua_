function love.load()
    -- Configuração inicial
    love.window.setTitle("Card Hover Animation")
    
    -- Carrega os assets
    ui = {
        background = love.graphics.newImage("assets/background_0001_800x600.png")
    }
    
    -- Propriedades do card
    card = {
        img = love.graphics.newImage("assets/card-0002.png"),
        x = 100,
        y = 100,
        currentScale = 0.5,  -- Escala atual (pode variar)
        targetScale = 0.5,   -- Escala alvo (0.5 normal, 0.75 no hover)
        minScale = 0.5,
        hoverScale = 0.75,
        animationSpeed = 20   -- Velocidade da animação (ajuste conforme necessário)
    }
    
    -- Calcula dimensões iniciais
    updateCardDimensions()
end

function love.update(dt)
    -- Verifica se o mouse está sobre o card
    local mouseX, mouseY = love.mouse.getPosition()
    local isHovering = checkMouseHover(mouseX, mouseY)
    
    -- Define a escala alvo com base no hover
    card.targetScale = isHovering and card.hoverScale or card.minScale
    
    -- Animação suave da escala (interpolação linear)
    card.currentScale = card.currentScale + (card.targetScale - card.currentScale) * dt * card.animationSpeed
    
    -- Atualiza as dimensões do card
    updateCardDimensions()
end

function love.draw()
    -- Desenha o background
    love.graphics.draw(ui.background, 0, 0)
    
    -- Desenha o card com a escala atual
    love.graphics.draw(card.img, card.x, card.y, 0, card.currentScale, card.currentScale)
    
    -- Debug: mostra se está em hover (opcional)
    love.graphics.print("Hover: " .. tostring(checkMouseHover(love.mouse.getPosition())), 10, 10)
end

--- Função para verificar se o mouse está sobre o card
function checkMouseHover(mouseX, mouseY)
    return mouseX >= card.x and
           mouseX <= card.x + card.width and
           mouseY >= card.y and
           mouseY <= card.y + card.height
end

--- Atualiza as dimensões do card baseado na escala atual
function updateCardDimensions()
    card.width = card.img:getWidth() * card.currentScale
    card.height = card.img:getHeight() * card.currentScale
end