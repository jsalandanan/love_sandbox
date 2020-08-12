GameObject = require 'objects/GameObject'

local Bullet = GameObject:extend()

function Bullet:new(x, y, stage, collidables, target_x, target_y)
  Bullet.super.new(self, x, y, stage)

  self.collidables = collidables
  self.target_x = target_x
  self.target_y = target_y

  self.speed = 200
  self.width = 10
  self.height = 15
  self.damage = 25

  self.angle = math.atan2((self.target_y - self.y), (self.target_x - self.x))

  self.dx = self.speed * math.cos(self.angle)
  self.dy = self.speed * math.sin(self.angle)

end

function Bullet:update(dt)
  Bullet.super.update(self, dt)
  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
  if not self:inBounds() then
    self:die()
  end
end

function Bullet:draw()
  Bullet.super.draw(self)
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

function Bullet:collide(obj)
  obj.hp = obj.hp - self.damage
  love.audio.stop(bullet_sound)
  love.audio.play(bullet_sound)
  self:die()
end

function Bullet:die()
  self.dead = true
end

return Bullet
