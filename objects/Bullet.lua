Object = require 'libraries/classic/classic'

local Bullet = Object:extend()

function Bullet:new(x, y)
  self.x = x
  self.y = y

  self.speed = 40
  self.width = 10
  self.height = 15

  -- condition for removal
end

function Bullet:update(dt)
  self.y = self.y + self.speed * dt
end

function Bullet:draw()
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

return Bullet
