GameObject = require 'objects/GameObject'

local Bullet = GameObject:extend()

function Bullet:new(x, y, stage, collidables)
  Bullet.super.new(self, x, y, stage)

  self.collidables = collidables

  self.speed = 40
  self.width = 10
  self.height = 15
  self.damage = 25

end

function Bullet:update(dt)
  Bullet.super.update(self, dt)
  self.y = self.y + self.speed * dt
  if not self:inBounds() then
    self:die()
  end

end

function Bullet:inBounds()
  if self.x < 0 then
    return false
  end
  if self.y < 0 then
    return false
  end
  if self.x > gw then
    return false
  end
  if self.y > gh then
    return false
  end
  return true
end

function Bullet:draw()
  Bullet.super.draw(self)
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

function Bullet:collide(obj)
  obj.hp = obj.hp - self.damage
  print(obj.hp)
  self:die()
end

function Bullet:die()
  print('oh wow!')
  self.dead = true
end

return Bullet
