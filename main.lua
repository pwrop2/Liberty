getgenv().SecureMode = true

if game.PlaceId == 2534724415 then
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    local mouse = player:GetMouse()
    local lighting = game:GetService("Lighting")

    local Window = Rayfield:CreateWindow({
        Name = "Liberty v1",
        LoadingTitle = "Liberty v1",
        LoadingSubtitle = "by Tworpet",
        ConfigurationSaving = {
            Enabled = false,
            FolderName = "Liberty", -- Create a custom folder for your hub/game
            FileName = "LibertyConfig"
        },
        Discord = {
            Enabled = true,
            Invite = "CME4FMb422", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
            RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
        KeySystem = true, -- Set this to true to use our key system
        KeySettings = {
            Title = "Liberty v1",
            Subtitle = "Liberty v1",
            Note = "discord.gg/CME4FMb422",
            FileName = "LibertyKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
            SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
            GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
            Key = {"https://pastebin.com/raw/iMze84QS"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
        }
    })

    local playerTab = Window:CreateTab("Player", nil) -- Title, Image
    local Section = playerTab:CreateSection("Reset Player")

    local resetButton = playerTab:CreateButton({
        Name = "Reset Player",
        Callback = function()
            player.Character:SetPrimaryPartCFrame(CFrame.new(0, -499, 0))
        end,
    })

    local Section = playerTab:CreateSection("Player Hacks")

    local speedToggle = playerTab:CreateToggle({
        Name = "Speed Hack",
        CurrentValue = false,
        Flag = "speed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
        end,
    })

    local jumpToggle = playerTab:CreateToggle({
        Name = "High Jump",
        CurrentValue = false,
        Flag = "speed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
        end,
    })

    local clickToggle = playerTab:CreateToggle({
        Name = "Click TP",
        CurrentValue = false,
        Flag = "click", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
        end,
    })

    local Section = playerTab:CreateSection("Vision Hacks")

    local espToggle = playerTab:CreateToggle({
        Name = "Player ESP",
        CurrentValue = false,
        Flag = "esp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
        end,
    })

    local carToggle = playerTab:CreateToggle({
        Name = "Car ESP",
        CurrentValue = false,
        Flag = "car", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
        end,
    })

    local fovSlider = playerTab:CreateSlider({
        Name = "FOV Slider",
        Range = {0, 120},
        Increment = 10,
        Suffix = "FOV",
        CurrentValue = 70,
        Flag = "fov", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
        end,
    })

    local vehicleTab = Window:CreateTab("Vehicle", nil) -- Title, Image
    local Section = vehicleTab:CreateSection("Vehicle Teleports")

    local function getCurrentVehicle()
        for _, v in ipairs(workspace.Vehicles:GetChildren()) do
            if v:FindFirstChild("Control_Values") and v:FindFirstChild("Control_Values").Owner.Value == player.Name then
                return v
            end
        end
    end

    local currentVehicle

    local bringButton = vehicleTab:CreateButton({
        Name = "Bring Vehicle",
        Callback = function()
            currentVehicle = getCurrentVehicle()
            currentVehicle:MoveTo(player.Character.PrimaryPart.CFrame.Position)
        end,
    })

    local repairButton = vehicleTab:CreateButton({
        Name = "Mechanic",
        Callback = function()
            currentVehicle = getCurrentVehicle()
            currentVehicle:MoveTo(Vector3.new(-770, 24, 210))
            player.Character:MoveTo(Vector3.new(-770, 24, 210))
        end,
    })

    local Section = vehicleTab:CreateSection("Vehicle Hacks")

    local accelerateToggle = vehicleTab:CreateToggle({
        Name = "Fast Accelerate",
        CurrentValue = false,
        Flag = "accelerate", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            currentVehicle = getCurrentVehicle()
        end,
    })

    local brakeToggle = vehicleTab:CreateToggle({
        Name = "Fast Brake",
        CurrentValue = false,
        Flag = "brake", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            currentVehicle = getCurrentVehicle()
        end,
    })

    local spinToggle = vehicleTab:CreateToggle({
        Name = "Car Spin",
        CurrentValue = false,
        Flag = "spin", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            currentVehicle = getCurrentVehicle()
        end,
    })

    local teleportTab = Window:CreateTab("Teleport", nil) -- Title, Image
    local Section = teleportTab:CreateSection("Locations")

    local spawnButton = teleportTab:CreateButton({
        Name = "Spawn",
        Callback = function()
            player.Character:MoveTo(Vector3.new(-479, 24, 656))
        end,
    })

    local mechanicButton = teleportTab:CreateButton({
        Name = "Mechanic",
        Callback = function()
            player.Character:MoveTo(Vector3.new(-770, 24, 210))
        end,
    })

    local bankButton = teleportTab:CreateButton({
        Name = "Bank",
        Callback = function()
            player.Character:MoveTo(Vector3.new(-1134, 24, 443))
        end,
    })

    local gunButton = teleportTab:CreateButton({
        Name = "Gun Store",
        Callback = function()
            player.Character:MoveTo(Vector3.new(-1170, 26, -195))
        end,
    })

    local toolButton = teleportTab:CreateButton({
        Name = "Tool Store",
        Callback = function()
            player.Character:MoveTo(Vector3.new(-447, 25, -686))
        end,
    })

    local campingButton = teleportTab:CreateButton({
        Name = "Camping Store",
        Callback = function()
            player.Character:MoveTo(Vector3.new(-1060, 25, -1095))
        end,
    })

    local hospitalButton = teleportTab:CreateButton({
        Name = "Hospital",
        Callback = function()
            player.Character:MoveTo(Vector3.new(-179, 24, -486))
        end,
    })

    local policeButton = teleportTab:CreateButton({
        Name = "Police Station",
        Callback = function()
            player.Character:MoveTo(Vector3.new(766, 4, -67))
        end,
    })

    local springButton = teleportTab:CreateButton({
        Name = "Springfield",
        Callback = function()
            player.Character:MoveTo(Vector3.new(2667, -12, -2050))
        end,
    })

    local Section = teleportTab:CreateSection("Players")

    for _, p in ipairs(Players:GetPlayers()) do
        local Button = teleportTab:CreateButton({
            Name = p.Name,
            Callback = function()
                player.Character:MoveTo(p.Character.PrimaryPart.CFrame.Position)
            end,
        })
    end

    local miscTab = Window:CreateTab("Misc", nil) -- Title, Image
    local Section = miscTab:CreateSection("Settings")

    local forceToggle = miscTab:CreateToggle({
        Name = "Force Time",
        CurrentValue = false,
        Flag = "force", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
        end,
    })

    local timeSlider = miscTab:CreateSlider({
        Name = "Time Of Day",
        Range = {0, 24},  -- Changed to 24 to cover a full day
        Increment = 1,     -- Adjusts by 1 hour per step
        Suffix = " Hours", -- Label for the slider
        CurrentValue = 12, -- Default value (Noon)
        Flag = "time",     -- Unique identifier for this slider
        Callback = function(Value)
        end,
    })

    local Section = miscTab:CreateSection("Unload Liberty")

    local unloadButton = miscTab:CreateButton({
        Name = "Unload Liberty",
        Callback = function()
            Rayfield:Destroy()
        end,
    })

    local Section = miscTab:CreateSection("Credits")

    local Label = miscTab:CreateLabel("Made by Tworpet")

    mouse.Button1Down:Connect(function()
        if clickToggle.CurrentValue then
            player.Character:MoveTo(mouse.Hit.Position)
        end
    end)

    RunService.RenderStepped:Connect(function()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            if speedToggle.CurrentValue then
                player.Character.PrimaryPart:ApplyImpulse(player.Character.PrimaryPart.CFrame.LookVector * 300)
            end
            if accelerateToggle.CurrentValue then
                currentVehicle.PrimaryPart:ApplyImpulse(currentVehicle.PrimaryPart.CFrame.LookVector * 200)
            end
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            if accelerateToggle.CurrentValue then
                currentVehicle.PrimaryPart:ApplyImpulse(currentVehicle.PrimaryPart.CFrame.LookVector * -200)
            end
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            if jumpToggle.CurrentValue then
                player.Character.PrimaryPart:ApplyImpulse(player.Character.PrimaryPart.CFrame.UpVector * 100)
            end
        end
        if spinToggle.CurrentValue then
            currentVehicle:SetPrimaryPartCFrame(currentVehicle.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(10), 0))
        end
        if espToggle.CurrentValue then
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Character:FindFirstChild("HumanoidRootPart") then
                    if not p.Character:FindFirstChildOfClass("Highlight") then
                        local highlight = Instance.new("Highlight", p.Character)
                    end
                end
            end
        else
            if not espToggle.CurrentValue then
                for _, p in ipairs(Players:GetPlayers()) do
                    if p.Character:FindFirstChildOfClass("Highlight") then
                        p.Character.Highlight:Destroy()
                    end
                end
            end
        end
        if carToggle.CurrentValue then
            for _, v in ipairs(workspace.Vehicles:GetChildren()) do
                if not v:FindFirstChild("Highlight") then
                    local highlight = Instance.new("Highlight", v)
                end
            end
        else
            if not carToggle.CurrentValue then
                for _, v in ipairs(workspace.Vehicles:GetChildren()) do
                    if v:FindFirstChild("Highlight") then
                        v.Highlight:Destroy()
                    end
                end
            end
        end
        if forceToggle.CurrentValue then
            lighting.TimeOfDay = string.format("%02d:%02d:00", math.floor(timeSlider.CurrentValue), (timeSlider.CurrentValue % 1) * 60)
        end
        camera.FieldOfView = fovSlider.CurrentValue
    end)
end
