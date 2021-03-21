Bottle = Class{}

local BOTTLE = love.graphics.newImage('water.png')

local VELOCITY = 2.5

function Bottle:init() 
    self.x = math.random(VIRTUAL_WIDTH - 100) --subtract image width
    self.y = -100 --negative image height

    self.width = BOTTLE:getWidth()
    self.height = BOTTLE:getHeight()

    self.counter = -5

    self.remove = false
end

function Bottle:update(dt)
    self.y = self.y + VELOCITY

    self.counter = self.counter + dt

    if self.y > VIRTUAL_HEIGHT + 100 then --height of image
        self.remove = true
        
        lives = lives - 1
    end
end

function Bottle:render()
    love.graphics.draw(BOTTLE, self.x, self.y)
end