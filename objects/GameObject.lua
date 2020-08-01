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

function GameObject:checkCollision(obj)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = obj.x
    local obj_right = obj.x + obj.width
    local obj_top = obj.y
    local obj_bottom = obj.y + obj.height


    if self_right > obj_left and
    self_left < obj_right and
    self_bottom > obj_top and
    self_top < obj_bottom then
      return true
    else
      return false
  end
end

return GameObject
