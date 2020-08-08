Object = require 'libraries/classic/classic'
Timer = require 'libraries/hump/timer'
Bullet = require 'objects/Bullet'
ShootingEnemy = require 'objects/ShootingEnemy'
Wave = require 'objects/Wave'

local Stage = Object:extend()

function Stage:new()
  -- might be better suited as a table of tables
  self.gameObjects = {}
  self.stagePlan = nil
  self.timer = Timer()

  self.waves = {
    Wave(
        {
          {ShootingEnemy, 400, -50},
          {ShootingEnemy, 300, -50},
        },
        100 -- duration
      ),
    Wave(
        {
          {ShootingEnemy, 350, -50},
        },
        100 -- duration
      ),
  }

  self.currentWave = nil
  self:getNextWave()

end

function Stage:processWave(wave)
  for i = #wave.enemy_details, 1, -1 do
    local enemy_detail = wave.enemy_details[i]
    local EnemyClass, x, y = unpack(enemy_detail)
    local enemy = EnemyClass(x, y, self)
    self:addGameObject(enemy)
    wave:addEnemy(enemy)
  end
end

-- revisit performance due to nature of "popping"
function Stage:getNextWave()
  self.currentWave = table.remove(self.waves, 1)
  self:processWave(self.currentWave)
end

function Stage:updateWave()
  if not self.currentWave then
    self.currentWave = self.waves[1]
  end
end

function Stage:update(dt)
  self.timer:update(dt)

  self.currentWave:update(dt)
  if self.currentWave.over then
    self:getNextWave()
  end

  for i = #self.gameObjects, 1, -1 do
    local gameObject = self.gameObjects[i]
    gameObject:update(dt)
    if gameObject.dead then
      table.remove(self.gameObjects, i)
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

function Stage:addStagePlan(stagePlan)
  self.stagePlan = stagePlan
end

function Stage:queryCircleArea(x, y, radius, targetClasses)
  local withinObjects = {}
  local rSquared = radius^2

  for _, gameObject in ipairs(self.gameObjects) do
    for _, targetClass in ipairs(targetClasses) do
      if gameObject:is(targetClass) then
        dSquared = (x - gameObject.x)^2 + (y - gameObject.y)^2
        if dSquared < rSquared then
          table.insert(withinObjects, gameObject)
        end
      end
    end
  end

  return withinObjects
end

return Stage