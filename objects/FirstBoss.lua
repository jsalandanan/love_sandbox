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

  self.delay = 0
  self.rateOfFire = 3

  self.current_shoot = self.first_shooting
end

function FirstBoss:update(dt)
  FirstBoss.super.update(self, dt)
  self:handle_shooting(dt)
  if self.hp <= 2400 then
    self.current_shoot = self.second_shooting
  end
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

function FirstBoss:handle_shooting(dt)
  self.current_shoot(self, dt)
end

function FirstBoss:first_shooting(dt)
  local target_x, target_y = self:aim()
  if self.delay <= 0 then
    local bullet = Bullet(self.x, self.y, self.stage, self.collidables, target_x, target_y)
    self.stage:addGameObject(bullet)
    self.delay = self.rateOfFire
  else
    self.delay = self.delay - dt * 5
  end
end

function FirstBoss:second_shooting(dt)
  local target_x, target_y = self:aim()
  if self.delay <= 0 then
    local offsets = {0, 20, 40, 60}
    for _, offset in ipairs(offsets) do
      local bullet = Bullet(self.x+offset, self.y, self.stage, self.collidables, target_x+offset, target_y)
      self.stage:addGameObject(bullet)
    end
    self.delay = self.rateOfFire
  else
    self.delay = self.delay - dt * 5
  end
end

return FirstBoss
