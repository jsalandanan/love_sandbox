GameObject = require 'objects/GameObject'

local Enemy = GameObject:extend()

function Enemy:new(x, y, stage, collidables)
  Enemy.super.new(self, x, y, stage, {Player})

  self.width = 50
  self.height = 50
  self.color = nil  -- might want to differentiate
  self.hp = 100

end

function Enemy:update(dt)
  Enemy.super.update(self, dt)
  if self.hp <= 0 then self.dead = true end
end

function Enemy:draw()
  Enemy.super.draw(self)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Enemy:collide(obj)
end

return Enemy
