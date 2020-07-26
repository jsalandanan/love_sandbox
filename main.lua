Player = require 'objects/Player'
Stage = require 'objects/Stage'
Enemy = require 'objects/Enemy'

function love.load()
  stage = Stage()
  player = Player(0, 0)
  enemy = Enemy(300, 400)

  stage:addGameObject(player)
  stage:addGameObject(enemy)
  stage:addGameObject(Enemy(400, 300))
end

function love.draw()
  if stage then stage:draw() end
end

function love.update(dt)
  if stage then stage:update(dt) end
end
