Enemy = require 'objects/Enemy'

local RammingEnemy = Enemy:extend()

function RammingEnemy:new(x, y, stage, collidables)
  RammingEnemy.super.new(self, x, y, stage, {Player})

  self.width = 35
  self.height = 35
  self.red = 0
  self.green = 0
  self.blue = 1
  self.color = {255, 0, 0}  -- might want to differentiate
  self.hp = 25

  self.damage = 25
  self.speed = 300
  self.angle = nil
  self.dx = nil
  self.dy = nil


  local target_x, target_y = self:aim()

  self.angle = math.atan2((target_y - self.y), (target_x - self.x))
  self.dx = self.speed * math.cos(self.angle)
  self.dy = self.speed * math.sin(self.angle)

end

function RammingEnemy:update(dt)
  RammingEnemy.super.update(self, dt)
  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
  if not self:inBounds() then
    self:die()
  end
end

function RammingEnemy:inBounds()
  if self.x < 0 then
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

function RammingEnemy:draw()
  RammingEnemy.super.draw(self)
end

function RammingEnemy:collide(obj)
  obj.hp = obj.hp - self.damage
end

function RammingEnemy:aim()
  return self.stage:retrievePlayerCoordinates()
end

return RammingEnemy
