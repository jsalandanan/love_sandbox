GameObject = require 'objects/GameObject'

local Bullet = GameObject:extend()

function Bullet:new(x, y, stage, collidables)
  Bullet.super.new(self, x, y, stage)

  self.collidables = collidables

  self.speed = 40
  self.width = 10
  self.height = 15
  self.damage = 25

end

function Bullet:update(dt)
  Bullet.super.update(self, dt)
  self.y = self.y + self.speed * dt

  -- call stage queryCircleArea on self position
  -- for returned list, check collisions against collidables
  -- on first collision, run collide
  nearbyObjects = self.stage:queryCircleArea(self.x, self.y, 50, self.collidables)
  for _, object in ipairs(nearbyObjects) do
    what = self:checkCollision(object)
    if self:checkCollision(object) then
      self:collide(object)
    end
  end

end

function Bullet:draw()
  Bullet.super.draw(self)
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

function Bullet:collide(obj)
        self.dead = true
        obj.hp = obj.hp - self.damage
        print(obj.hp)
end

return Bullet
