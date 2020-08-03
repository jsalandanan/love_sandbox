GameObject = require 'objects/GameObject'

local Enemy = GameObject:extend()

function Enemy:new(x, y, stage, collidables)
  Enemy.super.new(self, x, y, stage, {Player})

  self.width = 50
  self.height = 50
  self.red = 0
  self.green = 0
  self.blue = 0
  self.hp = 100

end

function Enemy:update(dt)
  Enemy.super.update(self, dt)
  if self.hp <= 0 then self:die() end
end

function Enemy:draw()
  Enemy.super.draw(self)
  love.graphics.setColor(self.red, self.green, self.blue)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
  love.graphics.reset()
end

function Enemy:collide(obj)
end

function Enemy:die()
  self.dead = true
end

return Enemy
