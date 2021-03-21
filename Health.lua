Health = Class{}

function Health:init()
    self.full = love.graphics.newImage('fullHeart.png')
    self.empty = love.graphics.newImage('deadHeart.png')

    self.alive = true

    self.y = VIRTUAL_HEIGHT - 65
end

function Health:render(x)
    if self.alive then
        love.graphics.draw(self.full, x, self.y)
    else
        love.graphics.draw(self.empty, x, self.y)
    end
end