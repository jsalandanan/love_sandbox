Player = require 'objects/Player'

function love.load()
  player = Player(0, 0)

end

function love.draw()
  if player then player:draw() end
end

function love.update(dt)
  if player then player:update(dt) end
end

