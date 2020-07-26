Object = require 'libraries/classic/classic'
Bullet = require 'objects/Bullet'

local Stage = Object:extend()

function Stage:new()
  self.gameObjects = {}
end

function Stage:update(dt)
  for _, gameObject in ipairs(self.gameObjects) do
    gameObject:update(dt)
    if gameObject:is(Bullet) then
      gameObject:checkCollision(enemy) -- need to change this
    end
  end
end

function Stage:draw()
  for _, gameObject in ipairs(self.gameObjects) do
    gameObject:draw()
  end
end

function Stage:addGameObject(gameObject)
  table.insert(self.gameObjects, gameObject)
end

return Stage
