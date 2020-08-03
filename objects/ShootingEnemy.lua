Enemy = require 'objects/Enemy'

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

end

function ShootingEnemy:update(dt)
  ShootingEnemy.super.update(self, dt)
  self:handle_shooting(dt)
end

function ShootingEnemy:draw()
  ShootingEnemy.super.draw(self)
end

function ShootingEnemy:collide(obj)
end

function ShootingEnemy:aim()
  -- figure out how to access this properly
  return player.x, player.y
end

function ShootingEnemy:handle_shooting(dt)
  local target_x, target_y = self:aim()
  if self.delay <= 0 then
    bullet = Bullet(self.x, self.y, self.stage, self.collidables, target_x, target_y)
    self.stage:addGameObject(bullet)
    self.delay = self.rateOfFire
  else
    self.delay = self.delay - dt * 5
  end
end

return ShootingEnemy
