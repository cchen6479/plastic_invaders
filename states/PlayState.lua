PlayState = Class{__includes = BaseState}

TOTAL_HEALTH = 3
lives = TOTAL_HEALTH

function PlayState:init()
    bullets = {}
    bottles = {}
    hearts = {}

    self.score = 0
end

function PlayState:enter()
    hearts = {}
    for i = 1, lives do
        table.insert(hearts, Health())
    end
end

function PlayState:update(dt)
    Earth:update(dt)

    for k, bullet in pairs(bullets) do
        bullet:update(dt)

        for k, bottle in pairs(bottles) do
            if bullet:collides(bottle) then
                bullet.remove = true
                bottle.remove = true
                
                self.score = self.score + 1
            end
        end
    end

    for k, bottle in pairs(bottles) do
        bottle:update(dt)
    end

    if TOTAL_HEALTH - lives ~= 0 then
        for j = 1, TOTAL_HEALTH - lives do
            hearts[j].alive = false
        end
    end

    for k, bullet in pairs(bullets) do
        if bullet.remove then
            table.remove(bullets, k)
        end
    end

    for k, bottle in pairs(bottles) do
        if bottle.remove then
            table.remove(bottles, k)
        end
    end

    if lives == 0 then
        gStateMachine:change('score', {
            score = self.score
        })
    end

end

function PlayState:render()
    Earth:render()

    for k, bullet in pairs(bullets) do
        bullet:render()
    end

    for k, bottle in pairs(bottles) do
        bottle:render()
    end

    for k, heart in pairs(hearts) do
        heart:render(-55 * (k - 1) + 55 * TOTAL_HEALTH)
    end

    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(plasticFont)
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)

end

function PlayState:exit()
    bottles = {}
    bullets = {}

    lives = TOTAL_HEALTH
end