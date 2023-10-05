local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "เย็ดแม่hub",
    LoadingTitle = "เกแก่",
    LoadingSubtitle = "by คนหล่อ",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "BLadeBallVinh"
    },
    Discord = {
       Enabled = true,
       Invite = "เย็ดแม่hub", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/GBbQMaDGZ7 would be GBbQMaDGZ7
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "เย็ดแม่ Blade ball | Key",
       Subtitle = "Key In Discord Server!",
       Note = "Join Server From Misc Tab",
       FileName = "examplehubkey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = True, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local MainTab = Window:CreateTab("Home", nil) -- Title, Image
 local MainSection = MainTab:CreateSection("Main")

 Rayfield:Notify({
    Title = "KichHoatScriptThanhCong",
    Content = "Thank Vi Da Su Dung",
    Duration = 5,
    Image = nil,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "CamOn!",
          Callback = function()
          print("The user tapped Okay!")
       end
    },
 },
 })

 local Button = MainTab:CreateButton({
    Name = "Auto Parry V1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/Circle"))()
    end,
 })


 local Slider = MainTab:CreateSlider({
    Name = "Range (TamDanh)",
    Range = {0, 50},
    Increment = 10,
    Suffix = "Range",
    CurrentValue = 1,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    -- The function that takes place when the slider changes
    -- The variable (Value) is a number which correlates to the value the slider is currently at
    end,
 })

 local Button = MainTab:CreateButton({
    Name = "Auto Parry V2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0",true))()
    end,
 })

 local Toggle = MainTab:CreateToggle({
    Name = "AutoRange",
    CurrentValue = false,
    Flag = "toggleexample", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    -- The function that takes place when the toggle is pressed
    -- The variable (Value) is a boolean on whether the toggle is true or false
    end,
 })

 local Toggle = MainTab:CreateToggle({
    Name = "Change Any Ability",
    CurrentValue = false,
    Flag = "toggleexample", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    local localPlayer = game.Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local abilitiesFolder = character:WaitForChild("Abilities")

local ChosenAbility = "Raging Deflection"

local function createGUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AbilityChooser"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 250)
    frame.Position = UDim2.new(0.5, -100, 0.5, -125)
    frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local isDragging = false
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    isDragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and isDragging then
            update(input)
        end
    end)

    local abilities = {"Dash", "Forcefield", "Invisibility", "Platform", "Raging Deflection", "Shadow Step", "Super Jump", "Telekinesis", "Thunder Dash"}
    local buttonHeight = 20
    for i, ability in ipairs(abilities) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, 0, 0, buttonHeight)
        button.Position = UDim2.new(0, 0, 0, (i - 1) * (buttonHeight + 5))
        button.Text = ability
        button.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
        button.BorderColor3 = Color3.new(1, 1, 1)
        button.Parent = frame
        
        button.MouseButton1Click:Connect(function()
            ChosenAbility = ability
        end)
    end
end

local function onCharacterAdded(newCharacter)
    character = newCharacter
    abilitiesFolder = character:WaitForChild("Abilities")
    createGUI()
end

localPlayer.CharacterAdded:Connect(onCharacterAdded)
createGUI()

while task.wait() do
    for _, obj in pairs(abilitiesFolder:GetChildren()) do
        if obj:IsA("LocalScript") then
            if obj.Name == ChosenAbility then
                obj.Disabled = false
            else
                obj.Disabled = true
            end
        end
    end
end
    end,
 })

 local Dropdown = MainTab:CreateDropdown({
    Name = "Auto Vote Map",
    Options = {"Solo","Team2","Team4"},
    CurrentOption = {"Random"},
    MultipleOptions = false,
    Flag = "Vote", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Option)
        print(Option)
    end,
 })
 local TeleportTab = Window:CreateTab("Teleport", nil) -- Title, Image
 local Section = TeleportTab:CreateSection("Map")

 local Button = TeleportTab:CreateButton({
    Name = "Teleport To Map (NotWork)",
    Callback = function()
    print('lobby')
    end,
 })
 local Button = TeleportTab:CreateButton({
    Name = "Teleport To Lobby (NotWork)",
    Callback = function()
    print('lobby')
    end,
 })

 local PlayerTab = Window:CreateTab("Player", nil) -- Title, Image
 local PlayerSection = PlayerTab:CreateSection("Character")

 local Slider = PlayerTab:CreateSlider({
    Name = "Walkspeed Player",
    Range = {0, 300},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
    end,
 })

 local Slider = PlayerTab:CreateSlider({
    Name = "JumpPower Player",
    Range = {0, 100},
    Increment = 1,
    Suffix = "Jump",
    CurrentValue = 16,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
    end,
 })

 local MiscTab = Window:CreateTab("Misc", nil) -- Title, Image
 local Section = MiscTab:CreateSection("Farm")

 local Toggle = MiscTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "toggleexample", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/frankblox/rbxscripts/main/0bladeball"))()
    end,
 })

local Toggle = MiscTab:CreateToggle({
    Name = "KeyBoard",
    CurrentValue = false,
    Flag = "toggleexample", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()

    end,
 })
 local InfoTab = Window:CreateTab("Info", nil) -- Title, Image
 local Section = InfoTab:CreateSection("Discord")
 local Button = InfoTab:CreateButton({
    Name = "Vinhsimulator1#9359",
    Callback = function()
        print("hi")
    end,
 })

 local Section = InfoTab:CreateSection("Name Roblox")
 local Button = InfoTab:CreateButton({
    Name = "Vinhsimulator1",
    Callback = function()
        print("hi")
    end,
 })

 local Section = InfoTab:CreateSection("My Discord Sever")
 local Button = InfoTab:CreateButton({
    Name = "https://discord.gg/unMBP9pW",
    Callback = function()
        print("hi")
    end,
 })

 local MorehackTab = Window:CreateTab("MoreHack", nil) -- Title, Image
 local Button = MorehackTab:CreateButton({
    Name = "Lightux Hub",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md'),true))()
    end,
 })

local Button = MorehackTab:CreateButton({
    Name = "Yon-Script (NoUpdate)",
    Callback = function()
       print("hello")
    end,
 })

local Button = MorehackTab:CreateButton({
    Name = "V2-Script Hub",
    Callback = function()
       repeat wait() until game:IsLoaded()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/yutv2e/main/afss"))()
    end,
 })

 local Button = MorehackTab:CreateButton({
    Name = "BingBong Hub",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ToTaiVn/BingBong/main/AllGames"))()
    end,
 })

 local Button = MorehackTab:CreateButton({
    Name = "Kidachi Hub",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/BladeBall"))()
    end,
 })
