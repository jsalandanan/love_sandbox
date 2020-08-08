Stage = require 'objects/Stage'
ShootingEnemy = require 'objects/ShootingEnemy'

function love.load()
  local waves = {
    Wave(
        {
          {ShootingEnemy, 400, -50},
          {ShootingEnemy, 300, -50},
        },
        14
      ),
    Wave(
        {
          {ShootingEnemy, 350, -50},
        },
        100
      ),
  }
  stage = Stage(waves)
end

function love.draw()
  if stage then stage:draw() end
end

function love.update(dt)
  if stage then stage:update(dt) end
end
