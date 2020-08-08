Enemy = require 'objects/Enemy'
Laser = require 'objects/Laser'

local LaserEnemy = Enemy:extend()

function LaserEnemy:new(x, y, stage, collidables)
  LaserEnemy.super.new(self, x, y, stage, {Player})

  self.width = 50
  self.height = 50
  self.red = 0
  self.green = 1
  self.blue = 0
  self.color = {255, 0, 0}  -- might want to differentiate
  self.hp = 100

  self.delay = 0
  self.rateOfFire = 5
  self.laserDuration = 5

  self.shooting = false

  self:behavior()

end

function LaserEnemy:behavior()
  self.timer:after(2, function()
    self.timer:tween(2, self, {y = 75}, 'in-out-cubic', function() self.shooting = true end)
  end)
end

function LaserEnemy:update(dt)
  LaserEnemy.super.update(self, dt)
  if self.shooting then
    self:handle_shooting(dt)
  end
end

function LaserEnemy:draw()
  LaserEnemy.super.draw(self)
end

function LaserEnemy:collide(obj)
end

function LaserEnemy:handle_shooting(dt)
  if self.delay <= 0 then
    local laser = Laser(self.x + self.width/2, self.y+self.height, self.stage, self.collidables, self.laserDuration)
    self.stage:addGameObject(laser)
    self.delay = self.rateOfFire + self.laserDuration
  else
    self.delay = self.delay - dt
  end
end

return LaserEnemy
