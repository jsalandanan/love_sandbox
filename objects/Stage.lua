Object = require 'libraries/classic/classic'
Bullet = require 'objects/Bullet'
Enemy = require 'objects/Enemy'

local Stage = Object:extend()

function Stage:new()
  -- might be better suited as a table of tables
  self.gameObjects = {}
end

-- bullets should check collision against enemies in an immediate area
function Stage:update(dt)
  for i = #self.gameObjects, 1, -1 do
    local gameObject = self.gameObjects[i]
    gameObject:update(dt)
    if gameObject.dead then
      table.remove(self.gameObjects, i)
    end
  end
end

-- bullets can collide with enemies if they're from the player,
-- and with the Player if they're from enemies
-- now that a bullet has access to its stage, it need only get all objects of that class
-- in an area around it, no?
-- with an array of such objects, it can check collision against collidable classes
-- calling an onCollide method if so (which will handle killing the bullet and doing damage)

function Stage:draw()
  for _, gameObject in ipairs(self.gameObjects) do
    gameObject:draw()
  end
end

function Stage:addGameObject(gameObject)
    table.insert(self.gameObjects, gameObject)
end

function Stage:queryCircleArea(x, y, radius, targetClasses)
  local withinObjects = {}
  local rSquared = radius^2

  for _, gameObject in ipairs(self.gameObjects) do
    for _, targetClass in ipairs(targetClasses) do
      if gameObject:is(targetClass) then
        dSquared = (x - gameObject.x)^2 + (y - gameObject.y)^2
        if dSquared < rSquared then
          table.insert(withinObjects, gameObject)
        end
      end
    end
  end

  return withinObjects
end

return Stage