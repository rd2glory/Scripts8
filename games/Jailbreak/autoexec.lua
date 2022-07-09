print("Jailbreak+ autoexec running...")

if not game:IsLoaded() then
	game.Loaded:Wait()
end

if game.PlaceId == 606849621 then
	repeat game:GetService("RunService").RenderStepped:Wait() until game.PlaceVersion ~= 0

    -- code
    local lastVersion = tonumber(isfile("last_jailbreak_version.txt") and readfile("last_jailbreak_version.txt") or 0)

    if game.PlaceVersion > lastVersion then
        -- Gui to Lua
        -- Version: 3.2

        -- Instances:

        local Jailbreak = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local Main = Instance.new("Frame")
        local Yes = Instance.new("TextButton")
        local UICorner_2 = Instance.new("UICorner")
        local TextLabel = Instance.new("TextLabel")
        local TextLabel_2 = Instance.new("TextLabel")
        local Update = Instance.new("TextLabel")
        local No = Instance.new("TextButton")
        local UICorner_3 = Instance.new("UICorner")
        local TextLabel_3 = Instance.new("TextLabel")
        local Reappear = Instance.new("Frame")
        local Update_2 = Instance.new("TextLabel")
        local Okay = Instance.new("TextButton")
        local UICorner_4 = Instance.new("UICorner")
        local TextLabel_4 = Instance.new("TextLabel")

        --Properties:

        Jailbreak.Name = "Jailbreak+"
        Jailbreak.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        Frame.Parent = Jailbreak
        Frame.BackgroundColor3 = Color3.fromRGB(214, 214, 214)
        Frame.Position = UDim2.new(0.853999972, 0, 0.55, 0)
        Frame.Size = UDim2.new(0.134500876, 0, 0.109506607, 0)

        UICorner.CornerRadius = UDim.new(0.100000001, 0)
        UICorner.Parent = Frame

        Main.Name = "Main"
        Main.Parent = Frame
        Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Main.BackgroundTransparency = 1.000
        Main.Size = UDim2.new(1, 0, 1, 0)

        Yes.Name = "Yes"
        Yes.Parent = Main
        Yes.AnchorPoint = Vector2.new(0.5, 0)
        Yes.BackgroundColor3 = Color3.fromRGB(11, 255, 100)
        Yes.Position = UDim2.new(0.270000011, 0, 0.648351729, 0)
        Yes.Size = UDim2.new(0.431883395, 0, 0.263736278, 0)
        Yes.Font = Enum.Font.SourceSans
        Yes.Text = ""
        Yes.TextColor3 = Color3.fromRGB(0, 0, 0)
        Yes.TextScaled = true
        Yes.TextSize = 14.000
        Yes.TextWrapped = true

        UICorner_2.CornerRadius = UDim.new(0.400000006, 0)
        UICorner_2.Parent = Yes

        TextLabel.Parent = Yes
        TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextLabel.Size = UDim2.new(0.899999976, 0, 0.649999976, 0)
        TextLabel.Font = Enum.Font.SourceSans
        TextLabel.Text = "Load JB+"
        TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.TextScaled = true
        TextLabel.TextSize = 14.000
        TextLabel.TextWrapped = true

        TextLabel_2.Parent = Main
        TextLabel_2.AnchorPoint = Vector2.new(0.5, 0)
        TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_2.BackgroundTransparency = 1.000
        TextLabel_2.Position = UDim2.new(0.5, 0, 0, 0)
        TextLabel_2.Size = UDim2.new(0.924137533, 0, 0.505494535, 0)
        TextLabel_2.Font = Enum.Font.GothamMedium
        TextLabel_2.Text = "Jailbreak Updated"
        TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel_2.TextScaled = true
        TextLabel_2.TextSize = 14.000
        TextLabel_2.TextWrapped = true

        Update.Name = "Update"
        Update.Parent = Main
        Update.AnchorPoint = Vector2.new(0.5, 0)
        Update.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Update.BackgroundTransparency = 1.000
        Update.Position = UDim2.new(0.496898085, 0, 0.35164839, 0)
        Update.Size = UDim2.new(0.924137533, 0, 0.219780236, 0)
        Update.Font = Enum.Font.Gotham
        Update.Text = "v1015 : v1016"
        Update.TextColor3 = Color3.fromRGB(0, 0, 0)
        Update.TextScaled = true
        Update.TextSize = 14.000
        Update.TextWrapped = true

        No.Name = "No"
        No.Parent = Main
        No.AnchorPoint = Vector2.new(0.5, 0)
        No.BackgroundColor3 = Color3.fromRGB(255, 56, 56)
        No.Position = UDim2.new(0.730000019, 0, 0.648351729, 0)
        No.Size = UDim2.new(0.431883395, 0, 0.263736278, 0)
        No.Font = Enum.Font.SourceSans
        No.Text = ""
        No.TextColor3 = Color3.fromRGB(0, 0, 0)
        No.TextScaled = true
        No.TextSize = 14.000
        No.TextWrapped = true

        UICorner_3.CornerRadius = UDim.new(0.400000006, 0)
        UICorner_3.Parent = No

        TextLabel_3.Parent = No
        TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_3.BackgroundTransparency = 1.000
        TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextLabel_3.Size = UDim2.new(0.899999976, 0, 0.649999976, 0)
        TextLabel_3.Font = Enum.Font.SourceSans
        TextLabel_3.Text = "Don't Load"
        TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel_3.TextScaled = true
        TextLabel_3.TextSize = 14.000
        TextLabel_3.TextWrapped = true

        Reappear.Name = "Reappear"
        Reappear.Parent = Frame
        Reappear.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Reappear.BackgroundTransparency = 1.000
        Reappear.Size = UDim2.new(1, 0, 1, 0)
        Reappear.Visible = false

        Update_2.Name = "Update"
        Update_2.Parent = Reappear
        Update_2.AnchorPoint = Vector2.new(0.5, 0)
        Update_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Update_2.BackgroundTransparency = 1.000
        Update_2.Position = UDim2.new(0.496898085, 0, 0.0687527359, 0)
        Update_2.Size = UDim2.new(0.924137533, 0, 0.579599023, 0)
        Update_2.Font = Enum.Font.Gotham
        Update_2.Text = "This prompt will reappear every time you log in until you choose to load JB+."
        Update_2.TextColor3 = Color3.fromRGB(0, 0, 0)
        Update_2.TextScaled = true
        Update_2.TextSize = 14.000
        Update_2.TextWrapped = true

        Okay.Name = "Okay"
        Okay.Parent = Reappear
        Okay.AnchorPoint = Vector2.new(0.5, 0)
        Okay.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        Okay.Position = UDim2.new(0.5, 0, 0.670000017, 0)
        Okay.Size = UDim2.new(0.349999994, 0, 0.263999999, 0)
        Okay.Font = Enum.Font.SourceSans
        Okay.Text = ""
        Okay.TextColor3 = Color3.fromRGB(0, 0, 0)
        Okay.TextScaled = true
        Okay.TextSize = 14.000
        Okay.TextWrapped = true

        UICorner_4.CornerRadius = UDim.new(0.400000006, 0)
        UICorner_4.Parent = Okay

        TextLabel_4.Parent = Okay
        TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_4.BackgroundTransparency = 1.000
        TextLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextLabel_4.Size = UDim2.new(0.899999976, 0, 0.649999976, 0)
        TextLabel_4.Font = Enum.Font.SourceSans
        TextLabel_4.Text = "Okay"
        TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_4.TextScaled = true
        TextLabel_4.TextSize = 14.000
        TextLabel_4.TextWrapped = true

        Yes.Activated:Connect(function()
            Jailbreak:Destroy()
            print("Place version ("..game.PlaceVersion..") is safe for launching JB+")
            writefile("last_jailbreak_version.txt",tostring(game.PlaceVersion))
            loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/games/Jailbreak/JailbreakPlus.lua"))()
        end)

        No.Activated:Connect(function()
            Main.Visible = false
            Reappear.Visible = true
        end)

        Okay.Activated:Connect(function()
            Jailbreak:Destroy()
            script:Destroy()
        end)

        Jailbreak.Parent = game:GetService("CoreGui")
        Jailbreak.Enabled = true
        Update.Text = "v"..lastVersion.." : v"..game.PlaceVersion
    else
        print("Place version ("..game.PlaceVersion..") is safe for launching JB+")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/games/Jailbreak/JailbreakPlus.lua"))()
    end
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/games/Jailbreak/JailbreakPlus.lua"))()
end
--[[ old
    
	if game.PlaceVersion > lastSafeVersion then
		warn("Jailbreak+ has not been tested with this version of Jailbreak, please contact the dev in order to test for any possible patches (Last tested for place version "..lastSafeVersion..", current is "..tostring(game.PlaceVersion)..")")
	else
		print("Place version ("..game.PlaceVersion..") is safe for launching JB+")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/games/Jailbreak/JailbreakPlus.lua"))()
	end
	task.wait(9e9)

]]--
