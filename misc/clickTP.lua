local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()

local key = "H"

local toggle = true

pcall(function()
	shared.v:Disconnect()
end)

shared.v = game:GetService("UserInputService").InputBegan:Connect(function(input,gpe)
	if gpe then return end
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode[key] then
		toggle = not toggle
	elseif toggle and input.UserInputType == Enum.UserInputType.MouseButton1 then
		local goal = mouse.Hit
		local char = plr.Character
		if char then
			char.PrimaryPart.CFrame = goal*CFrame.new(0,3,0)
		end
	end
end)
