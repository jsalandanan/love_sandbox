Object = require 'libraries/classic/classic'
Timer = require 'libraries/hump/timer'

local GameObject = Object:extend()

function GameObject:new(x, y, stage)
    self.x = x
    self.y = y
    self.stage = stage
    self.creation_time = love.timer.getTime()
    self.dead = false
end

function GameObject:update(dt)
    if self.timer then self.timer:update(dt) end
end

function GameObject:draw()
end

return GameObject
