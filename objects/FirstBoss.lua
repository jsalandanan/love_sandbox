Enemy = require 'objects/Enemy'

local FirstBoss = Enemy:extend()

function FirstBoss:new(x, y, stage, collidables)
  FirstBoss.super.new(self, x, y, stage, {Player})

  self.width = 100
  self.height = 100
  self.red = 0.5
  self.green = 0.5
  self.blue = 1
  self.color = {255, 0, 0}  -- might want to differentiate
  self.hp = 2500

end

function FirstBoss:update(dt)
  FirstBoss.super.update(self, dt)
end

function FirstBoss:draw()
  FirstBoss.super.draw(self)
end

function FirstBoss:collide(obj)
  obj.hp = obj.hp - self.damage
end

function FirstBoss:aim()
  return self.stage:retrievePlayerCoordinates()
end

return FirstBoss
