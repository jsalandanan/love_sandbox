Enemy = require 'objects/Enemy'
Bullet = require 'objects/Bullet'

local ShootingEnemy = Enemy:extend()

function ShootingEnemy:new(x, y, stage, collidables)
  ShootingEnemy.super.new(self, x, y, stage, {Player})

  self.width = 50
  self.height = 50
  self.red = 1
  self.green = 0
  self.blue = 0
  self.color = {255, 0, 0}  -- might want to differentiate
  self.hp = 100

  self.delay = 0
  self.rateOfFire = 5

  self.shooting = false

  self:behavior()

end

function ShootingEnemy:behavior()
  self.timer:after(2, function()
    self.timer:tween(2, self, {y = 150}, 'in-out-cubic', function() self.shooting = true end)
  end)
end

function ShootingEnemy:update(dt)
  ShootingEnemy.super.update(self, dt)
  if self.shooting then
    self:handle_shooting(dt)
  end
end

function ShootingEnemy:draw()
  ShootingEnemy.super.draw(self)
end

function ShootingEnemy:collide(obj)
end

function ShootingEnemy:aim()
  return self.stage:retrievePlayerCoordinates()
end

function ShootingEnemy:handle_shooting(dt)
  local target_x, target_y = self:aim()
  if self.delay <= 0 then
    local bullet = Bullet(self.x, self.y, self.stage, self.collidables, target_x, target_y)
    self.stage:addGameObject(bullet)
    self.delay = self.rateOfFire
  else
    self.delay = self.delay - dt * 5
  end
end

return ShootingEnemy
