GameObject = require 'objects/GameObject'

local Laser = GameObject:extend()

function Laser:new(x, y, stage, collidables, duration)
  Laser.super.new(self, x, y, stage)

  self.collidables = collidables

  self.width = 30
  self.height = gh - y
  self.damage = 25
  self.duration = duration

end

function Laser:update(dt)
  self.duration = self.duration - dt
  -- print(self.duration)
  if self.duration <= 0 then self:die() end
  Laser.super.update(self, dt)
end

function Laser:draw()
  Laser.super.draw(self)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Laser:collide(obj)
  obj.hp = obj.hp - self.damage
end

function Laser:die()
  self.dead = true
end

return Laser
