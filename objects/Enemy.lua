Object = require 'libraries/classic/classic'

local Enemy = Object:extend()

function Enemy:new(x, y)
  self.x = x
  self.y = y

  self.width = 50
  self.height = 50
  self.color = nil  -- might want to differentiate

  -- condition for removal
end

function Enemy:update(dt)
end

function Enemy:draw()
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

return Enemy
