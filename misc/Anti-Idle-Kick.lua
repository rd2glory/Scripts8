-- Anti-Idle Kick
local VU = game:GetService("VirtualUser")

local clickLocation = Vector2.new()

local player = game:GetService("Players").LocalPlayer

local count = 1

player.Idled:Connect(function()
	VU:CaptureController()
	VU:ClickButton2(clickLocation)
	print("Simulated mouse click to prevent AFK kick ("..count..")")
	count = count + 1
end)
