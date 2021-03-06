Object = require 'libraries/classic/classic'
Timer = require 'libraries/hump/timer'

local GameObject = Object:extend()

function GameObject:new(x, y, stage, collidables)
    self.x = x
    self.y = y
    self.stage = stage
    self.collidables = collidables
    self.creation_time = love.timer.getTime()
    self.dead = false
    self.timer = Timer()
end

function GameObject:update(dt)
  if self.timer then self.timer:update(dt) end
  -- local nearbyObjects = self.stage:queryCircleArea(self.x, self.y, 500, self.collidables)
  local nearbyObjects = self.stage.gameObjects
  for _, object in ipairs(nearbyObjects) do
    if self:checkCollision(object) then
      self:collide(object)
    end
  end
end

function GameObject:draw()
end

function GameObject:collide(obj)
  print(self, 'collided with', obj)
end


function GameObject:__tostring()
  return "GameObject"
end

function GameObject:inBounds()
  if self.x < 0 then
    return false
  end
  if self.y < 0 then
    return false
  end
  if self.x > gw then
    return false
  end
  if self.y > gh then
    return false
  end
  return true
end

function GameObject:checkCollision(obj)
  for _, collidable in ipairs(self.collidables) do
    if obj:is(collidable) then
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
        return true
      else
        return false
      end
    end
  end
end

return GameObject
