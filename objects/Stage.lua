Object = require 'libraries/classic/classic'

local Stage = Object:extend()

function Stage:new()
  self.gameObjects = {}
end

function Stage:update(dt)
  for _, gameObject in ipairs(self.gameObjects) do
    gameObject:update(dt)
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
