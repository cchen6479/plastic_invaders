Bullet = Class{}

local BULLET_IMAGE = love.graphics.newImage('bullet.png')

local VELOCITY = -20

function Bullet:init()
    self.x = Earth:getX()
    self.y = VIRTUAL_HEIGHT - 70

    self.width = BULLET_IMAGE:getWidth()
    self.height = BULLET_IMAGE:getHeight()

    self.dy = 0
    
    self.remove = false
end

function Bullet:collides(bottle)
    if (self.x + 2) + (self.width - 4) >= bottle.x and self.x + 2 <= bottle.x + bottle.width then
        if (self.y + 2) + (self.height - 4) >= bottle.y and self.y + 2 <= bottle.y + bottle.height then
            return true
        end
    end

    return false
end

function Bullet:update(dt)
    if self.y > -31 then
        self.dy = self.dy + VELOCITY * dt
        self.y = self.y + self.dy
    else
        self.remove = true
    end
end

function Bullet:render()
    love.graphics.draw(BULLET_IMAGE, self.x, self.y)
end