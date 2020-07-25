Object = require 'libraries/classic/classic'

local Player = Object:extend()

function Player:new(x, y)
  self.x = x
  self.y = y

  self.width = 50
  self.height = 50
  self.speed = 5
end

function Player:update(dt)
  self:handle_movement(dt)
end

function Player:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:handle_movement(dt)
  if love.keyboard.isDown('d') then
    self.x = self.x + self.speed
  elseif love.keyboard.isDown('a') then
    self.x = self.x - self.speed
  elseif love.keyboard.isDown('s') then
    self.y = self.y + self.speed
  elseif love.keyboard.isDown('w') then
    self.y = self.y - self.speed
  end
end

return Player