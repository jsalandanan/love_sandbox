function love.draw()
  -- draw the "player"
  love.graphics.rectangle("fill", player_x, player_y, PLAYER_WIDTH, PLAYER_HEIGHT)
end

function love.update()
  handle_movement()
end

-- todo: better input handling for multiple .isDown()
function handle_movement()
  if love.keyboard.isDown('d') then
    player_x = player_x + RIGHT_MOVEMENT
  elseif love.keyboard.isDown('a') then
    player_x = player_x - LEFT_MOVEMENT
  elseif love.keyboard.isDown('s') then
    player_y = player_y + DOWN_MOVEMENT
  elseif love.keyboard.isDown('w') then
    player_y = player_y - UP_MOVEMENT
  end
end

function love.load()
  -- load the player's "location"
  player_x = 0
  player_y = 0

  -- some parameters about the player
  PLAYER_WIDTH = 50
  PLAYER_HEIGHT = 50
  GENERAL_PLAYER_SPEED = 5
  LEFT_MOVEMENT = GENERAL_PLAYER_SPEED
  RIGHT_MOVEMENT = GENERAL_PLAYER_SPEED
  UP_MOVEMENT = GENERAL_PLAYER_SPEED
  DOWN_MOVEMENT = GENERAL_PLAYER_SPEED
end
