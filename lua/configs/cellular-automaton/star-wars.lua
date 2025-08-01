local M = {
  fps = 8,
  name = "star_wars",
}

local frame = 0
local scene = {
  "                        ",
  "    \\       /          ",
  "     \\     /           ",
  "      \\   /            ",
  "       | |             ",
  "      / Darth \\        ",
  "     |   Vader |       ",
  "      \\       /        ",
  "       \\_____/         ",
  "         ||            ",
  "         ||            ",
  "     'Obi-Wan never    ",
  "      told you what    ",
  "      happened to      ",
  "      your father.'    ",
  "                      ",
  "   'He told me enough!'",
  "   'He told me YOU—'   ",
  "                      ",
  "   'No... I am your    ",
  "        father.'       ",
  "                      ",
  "       [ scream ]      ",
  "     'NOOOOOOO!'       ",
  "                      ",
}

M.init = function(grid)
  frame = 0
end

M.update = function(grid)
  frame = frame + 1

  local start_line = math.floor(#grid / 2) - math.floor(#scene / 2)

  if frame > #scene then
    return false
  end

  -- clear grid
  for i = 1, #grid do
    for j = 1, #grid[i] do
      grid[i][j].char = " "
    end
  end

  -- draw lines up to the current frame
  for i = 1, math.min(frame, #scene) do
    local text = scene[i]
    local row = start_line + i
    local start_col = math.floor((#grid[1] - #text) / 2)
    for j = 1, #text do
      local char = text:sub(j, j)
      grid[row][start_col + j].char = char
    end
  end

  return true
end

return M

