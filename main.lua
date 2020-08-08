Player = require 'objects/Player'
Stage = require 'objects/Stage'
ShootingEnemy = require 'objects/ShootingEnemy'

function love.load()
  stage = Stage()
  -- level1 = StagePlan('placeholder', stage)
  player = Player(gw/2, gh-50, stage)
  stage:addGameObject(player)
end

function love.draw()
  if stage then stage:draw() end
end

function love.update(dt)
  if stage then stage:update(dt) end
end
