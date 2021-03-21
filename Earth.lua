Earth = Class{}

local RELOAD = 0.5
local BOTTLE_PAUSE = 1

function Earth:init()
    self.image = love.graphics.newImage('earth.png')
    self.x = VIRTUAL_WIDTH/2 - self.image:getWidth()
    self.y = VIRTUAL_HEIGHT - self.image:getHeight()
    
    self.bulletTimer = 2
    self.bottleTimer = 0
end

function Earth:update(dt)
    mouseX, mouseY = love.mouse.getPosition()    
    self.x = mouseX * 0.8 - 53

    self.bulletTimer = self.bulletTimer + dt
    self.bottleTimer = self.bottleTimer + dt

    if love.mouse.wasPressed(1) and self.bulletTimer > RELOAD then
        table.insert(bullets, Bullet())
        self.bulletTimer = 0
    end

    if self.bottleTimer > BOTTLE_PAUSE then
        table.insert(bottles, Bottle())
        self.bottleTimer = 0
    end

end

function Earth:render()
    love.graphics.draw(self.image, self.x, self.y)
end

function Earth:getX()
    return self.x + 53
end

function Earth:getY()
    return self.y
end
