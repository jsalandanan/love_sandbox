Stage = require 'objects/Stage'
ShootingEnemy = require 'objects/ShootingEnemy'
RammingEnemy = require 'objects/RammingEnemy'
LaserEnemy = require 'objects/LaserEnemy'
FirstBoss = require 'objects/FirstBoss'

function love.load()
  bullet_sound = love.audio.newSource('sounds/thud.wav', 'static')
  bullet_sound:setVolume(0.2)

  local waves = {
    -- Wave(
    --     {
    --       {ShootingEnemy, 400, -50},
    --       {ShootingEnemy, 300, -50},
    --       {LaserEnemy, 350, -50},
    --     },
    --     14
    --   ),
    -- Wave(
    --     {
    --       {ShootingEnemy, 350, -50},
    --     },
    --     100
    --   ),
    -- Wave(
    --     {
    --       {RammingEnemy, 50, -50},
    --       {ShootingEnemy, 450, -50},
    --     },
    --     100
    --   ),
    Wave({
          {FirstBoss, 350, 100},
        },
        1000
      )
  }
  stage = Stage(waves)
end

function love.draw()
  if stage then stage:draw() end
end

function love.update(dt)
  if stage then stage:update(dt) end
end
