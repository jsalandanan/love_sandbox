Object = require 'libraries/classic/classic'

local Wave = Object:extend()

function Wave:new(enemy_details, duration)
  self.enemy_details = enemy_details
  self.enemies = {}
  self.duration = duration
  self.over = false
end

function Wave:addEnemy(enemy)
  table.insert(self.enemies, enemy)
end

function Wave:numEnemies()
  return #self.enemies
end

-- needs to know the number of not dead enemies
function Wave:checkDeadEnemies()
  for i = #self.enemies, 1, -1 do
    local enemy = self.enemies[i]
    if enemy.dead then
      table.remove(self.enemies, i)
    end
  end
end

function Wave:update(dt)
  self.duration = self.duration - dt
  self:checkDeadEnemies()
  self:checkIsOver()
end

function Wave:checkIsOver()
  -- if self.duration <= 0 then
  --   self.over = true
  if self:numEnemies() == 0 then
    self.over = true
  end
end

function Wave:draw()
end

return Wave
