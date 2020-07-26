Object = require 'libraries/classic/classic'

local Enemy = Object:extend()

function Enemy:new(x, y)
  self.x = x
  self.y = y

  self.width = 50
  self.height = 50
  self.color = nil  -- might want to differentiate
  self.hp = 100

  self.dead = false

  -- condition for removal
end

function Enemy:update(dt)
  if self.hp <= 0 then self.dead = true end
end

function Enemy:draw()
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

return Enemy
