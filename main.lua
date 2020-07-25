Player = require 'objects/Player'
Stage = require 'objects/Stage'

function love.load()
  stage = Stage()
  player = Player(0, 0)

  stage:addGameObject(player)
end

function love.draw()
  if stage then stage:draw() end
end

function love.update(dt)
  if stage then stage:update(dt) end
end
