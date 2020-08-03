Player = require 'objects/Player'
Stage = require 'objects/Stage'
ShootingEnemy = require 'objects/ShootingEnemy'

function love.load()
  stage = Stage()
  player = Player(gw/2, gh-50, stage)
  enemy = ShootingEnemy(300, 200, stage)

  stage:addGameObject(player)
  stage:addGameObject(enemy)
  stage:addGameObject(ShootingEnemy(400, 150, stage))
end

function love.draw()
  if stage then stage:draw() end
end

function love.update(dt)
  if stage then stage:update(dt) end
end
