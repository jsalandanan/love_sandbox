Object = require 'libraries/classic/classic'
Bullet = require 'objects/Bullet'
Enemy = require 'objects/Enemy'

local Stage = Object:extend()

function Stage:new()
  -- might be better suited as a table of tables
  self.gameObjects = {}
  self.enemies = {}
end

-- bullets should check collision against enemies in an immediate area
function Stage:update(dt)
  for i = #self.gameObjects, 1, -1 do
    local gameObject = self.gameObjects[i]
    gameObject:update(dt)
    if gameObject:is(Bullet) then
      for idx = #self.enemies, 1, -1 do
        local enemy = self.enemies[idx]
        gameObject:checkCollision(enemy) -- need to change this
      end
    end
    if gameObject.dead then
      table.remove(self.gameObjects, i)
    end
  end

  -- simplify this later
  for i = #self.enemies, 1, -1 do
    local enemy = self.enemies[i]
    enemy:update(dt)
    if enemy.dead then
      table.remove(self.enemies, i)
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
  for _, enemy in ipairs(self.enemies) do
    enemy:draw()
  end
end

function Stage:addGameObject(gameObject)
  if gameObject:is(Enemy) then
    table.insert(self.enemies, gameObject)
  else
    table.insert(self.gameObjects, gameObject)
  end
end

function Stage:addEnemy(enemy)
  table.insert(self.enemies, enemy)
end

return Stage
