local STARTING_LEVEL = 1
local KILLS_TO_LEVEL_UP = 10
local COINS_PER_KILL = 5
local MAX_LEVEL = 2400

local function updateLeaderboard(player)
    local leaderstats = player:FindFirstChild("leaderstats")
    if not leaderstats then
        leaderstats = Instance.new("Folder")
        leaderstats.Name = "leaderstats"
        leaderstats.Parent = player
    end
    
    local level = leaderstats:FindFirstChild("Level")
    if not level then
        level = Instance.new("IntValue")
        level.Name = "Level"
        level.Value = STARTING_LEVEL
        level.Parent = leaderstats
    end
    
    local coins = leaderstats:FindFirstChild("Coins")
    if not coins then
        coins = Instance.new("IntValue")
        coins.Name = "Coins"
        coins.Value = 0
        coins.Parent = leaderstats
    end
    
    local kills = player:FindFirstChild("Kills")
    if not kills then
        kills = Instance.new("IntValue")
        kills.Name = "Kills"
        kills.Value = 0
        kills.Parent = player
    end
    
    kills.Value = kills.Value + 1
    coins.Value = coins.Value + COINS_PER_KILL

    if kills.Value % KILLS_TO_LEVEL_UP == 0 then
        level.Value = math.min(level.Value + 1, MAX_LEVEL)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        updateLeaderboard(player)
    end)
end)

-- put in startercharacterscripts as a LocalScript (make sure you have a leaderboard)
