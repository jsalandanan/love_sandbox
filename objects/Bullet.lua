Object = require 'libraries/classic/classic'

local Bullet = Object:extend()

function Bullet:new(x, y)
  self.x = x
  self.y = y

  self.speed = 40
  self.width = 10
  self.height = 15

  self.damage = 25
end

function Bullet:update(dt)
  self.y = self.y + self.speed * dt
end

function Bullet:draw()
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

function Bullet:checkCollision(obj)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = obj.x
    local obj_right = obj.x + obj.width
    local obj_top = obj.y
    local obj_bottom = obj.y + obj.height

    if self_right > obj_left and
    self_left < obj_right and
    self_bottom > obj_top and
    self_top < obj_bottom then
        self.dead = true

        obj.hp = obj.hp - self.damage
        print(obj.hp)

        --Increase enemy speed
        -- obj.speed = obj.speed + 50
    end
end

return Bullet
