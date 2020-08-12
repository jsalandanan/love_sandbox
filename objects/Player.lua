GameObject = require 'objects/GameObject'
Timer = require 'libraries/hump/timer'
Bullet = require 'objects/Bullet'

local Player = GameObject:extend()

function Player:new(x, y, stage, collidables)
  Player.super.new(self, x, y, stage, {Enemy})

  self.timer = Timer()

  self.width = 50
  self.height = 50
  self.speed = 300
  self.rateOfFire = 0.1
  self.delay = 0
  self.hp = 1

end

function Player:update(dt)
  Player.super.update(self, dt)
  self:handle_movement(dt)
  self:handle_shooting(dt)
  if self.timer then self.timer:update(dt) end
  if self.hp <= 0 then self:die() end
end

function Player:draw()
  Player.super.draw(self)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:__tostring()
  return "Player"
end

function Player:handle_movement(dt)
  if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
    self.x = math.min(self.x + self.speed * dt, gw-self.width)
  elseif love.keyboard.isDown('a') or love.keyboard.isDown('left') then
    self.x = math.max(self.x - self.speed * dt, 0)
  elseif love.keyboard.isDown('s') or love.keyboard.isDown('down') then
    self.y = math.min(self.y + self.speed * dt, gh-self.height)
  elseif love.keyboard.isDown('w') or love.keyboard.isDown('up') then
    self.y = math.max(self.y - self.speed * dt, 0)
  end
end

function Player:handle_shooting(dt)
  if love.keyboard.isDown('z') then
    if self.delay <= 0 then
      self:shoot()
      self.delay = 1
    else
      self.delay = self.delay - dt * 5
    end
  else
    self.delay = 0
  end
end

function Player:aim()
  return self.x, 0
end

function Player:shoot()
  local target_x, target_y = self:aim()
  bullet = Bullet(self.x, self.y, self.stage, self.collidables, target_x, target_y)
  self.stage:addGameObject(bullet)  -- not a fan
end

function Player:collide(obj)
  self:die()
end

function Player:die()
  self.dead = true
end

return Player
