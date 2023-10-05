local workspace = game:GetService("Workspace")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local heartbeatConnection
 
local Window = Rayfield:CreateWindow({
   Name = "Blade Ball เย็ดแม่hub",
   LoadingTitle = "เย็ดแม่ hub",
   LoadingSubtitle = "by สุดหล่อสักคน",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "เย็ดแม่ Scripts",
      FileName = "เย็ดแม่ Scripts"
   },
   Discord = {
      Enabled = true,
      Invite = "72X4UYGmJ6",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "เย็ดแม่ Scripts",
      Subtitle = "Key System",
      Note = "https://discord.gg/72X4UYGmJ6",
      FileName = "เย็ดแม่Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = "Hello"
   }
})
 
local AutoParry = Window:CreateTab("ตีมากูตีกลับ", 13014537525)
 
local function startAutoParry()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local runService = game:GetService("RunService")
    local parryButtonPress = replicatedStorage.Remotes.ParryButtonPress
    local ballsFolder = workspace:WaitForChild("Balls")
 
    print("Script successfully ran.")
 
    local function onCharacterAdded(newCharacter)
        character = newCharacter
    end
 
    player.CharacterAdded:Connect(onCharacterAdded)
 
    local focusedBall = nil  
 
    local function chooseNewFocusedBall()
        local balls = ballsFolder:GetChildren()
        focusedBall = nil
        for _, ball in ipairs(balls) do
            if ball:GetAttribute("realBall") == true then
                focusedBall = ball
                break
            end
        end
    end
 
    chooseNewFocusedBall()
 
    local function timeUntilImpact(ballVelocity, distanceToPlayer, playerVelocity)
        local directionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
        local velocityTowardsPlayer = ballVelocity:Dot(directionToPlayer) - playerVelocity:Dot(directionToPlayer)
 
        if velocityTowardsPlayer <= 0 then
            return math.huge
        end
 
        local distanceToBeCovered = distanceToPlayer - 40
        return distanceToBeCovered / velocityTowardsPlayer
    end
 
    local BASE_THRESHOLD = 0.15
    local VELOCITY_SCALING_FACTOR = 0.002
 
    local function getDynamicThreshold(ballVelocityMagnitude)
        local adjustedThreshold = BASE_THRESHOLD - (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR)
        return math.max(0.12, adjustedThreshold)
    end
 
    local function checkBallDistance()
        if not character:FindFirstChild("Highlight") then return end
        local charPos = character.PrimaryPart.Position
        local charVel = character.PrimaryPart.Velocity
 
        if focusedBall and not focusedBall.Parent then
            chooseNewFocusedBall()
        end
 
        if not focusedBall then return end
 
        local ball = focusedBall
        local distanceToPlayer = (ball.Position - charPos).Magnitude
 
        if distanceToPlayer < 10 then
            parryButtonPress:Fire()
            return
        end
 
        local timeToImpact = timeUntilImpact(ball.Velocity, distanceToPlayer, charVel)
        local dynamicThreshold = getDynamicThreshold(ball.Velocity.Magnitude)
 
        if timeToImpact < dynamicThreshold then
            parryButtonPress:Fire()
        end
    end
    heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
        checkBallDistance()
    end)
end
 
local function stopAutoParry()
    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end
end
 
local AutoParryToggle = AutoParry:CreateToggle({
    Name = "Auto Parry",
    CurrentValue = false,
    Flag = "AutoParryFlag",
    Callback = function(Value)
        if Value then
            startAutoParry()
        else
            stopAutoParry()
        end
    end,
})