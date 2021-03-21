TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
    bullets = {}
    self.earth = love.graphics.newImage('earth.png')
    self.x = VIRTUAL_WIDTH/2 - self.earth:getWidth() / 2
    self.y = VIRTUAL_HEIGHT - self.earth:getHeight()
end

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function TitleScreenState:render()
    love.graphics.draw(self.earth, self.x, self.y)

    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(hugeFont)
    love.graphics.printf('Plastic Invaders', 0, 250, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(plasticFont)
    love.graphics.printf('Press Enter to Play', 0, 300, VIRTUAL_WIDTH, 'center')
end

function TitleScreenState:exit()
    bullets = {}
end