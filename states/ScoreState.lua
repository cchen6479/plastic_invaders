ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function ScoreState:render()
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(hugeFont)
    love.graphics.printf('Plastic has taken over!', 0, 180, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(plasticFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 220, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Enter to Play Again!', 0, 280, VIRTUAL_WIDTH, 'center')
end