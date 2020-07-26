Object = require 'libraries/classic/classic'
Timer = require 'libraries/hump/timer'
Bullet = require 'objects/Bullet'

local Player = Object:extend()

function Player:new(x, y)
  self.x = x
  self.y = y

  self.timer = Timer()

  self.width = 50
  self.height = 50
  self.speed = 300
  self.rateOfFire = 0.25  -- in seconds

  self.timer:every(self.rateOfFire, function() self:shoot() end)

end

function Player:update(dt)
  self:handle_movement(dt)
  if self.timer then self.timer:update(dt) end
end

function Player:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:handle_movement(dt)
  if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
    self.x = self.x + self.speed * dt
  elseif love.keyboard.isDown('a') or love.keyboard.isDown('left') then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown('s') or love.keyboard.isDown('down') then
    self.y = self.y + self.speed * dt
  elseif love.keyboard.isDown('w') or love.keyboard.isDown('up') then
    self.y = self.y - self.speed * dt
  end
end

function Player:shoot()
  bullet = Bullet(self.x, self.y)
  stage:addGameObject(bullet)  -- not a fan
end

return Player
