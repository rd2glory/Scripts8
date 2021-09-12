local workspace = game:GetService("Workspace")
local plrs = game:GetService("Players")


local plr = game.Players.LocalPlayer

local function update()
	for i,v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
		if v:IsA("BoolValue") and v.Name == "kills" then
			v.Parent:Destroy()
		end
	end
end

--workspace.ChildAdded:Connect(update)
--workspace.ChildRemoved:Connect(update)

update()

print("cleaned kill parts")

local root = game.Players.LocalPlayer.Character.HumanoidRootPart

local function teleport(dest)
	root = game.Players.LocalPlayer.Character.HumanoidRootPart

	local TS = game:GetService("TweenService")

	local info = TweenInfo.new(
		((#workspace.tower.sections:GetChildren()-2)*12)+15,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.In,
		0,
		false,
		0
	)

	root.Anchored = true

	local old = {}

	for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("BasePart") then
			old[v] = v.CanCollide
			v.CanCollide = false
		end
	end

	local tween = TS:Create(root,info,{CFrame = goal})

	tween:Play()

	for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("BasePart") then
			old[v] = v.CanCollide
			v.CanCollide = false
		end
	end
	
	
	local tweenFinished = false
	local died = false
	
	local con1 = nil
	local con2 = nil
	
	con1 = tween.Completed:Connect(function()
		tweenFinished = true
		con1:Disconnect()
		con2:Disconnect()
	end)
	
	con2 = game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
		died = true
		con1:Disconnect()
		con2:Disconnect()
	end)
	
	repeat wait() until tweenFinished or died

	root.Anchored = false

	for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = old[v]
		end
	end
end

repeat wait() until game:IsLoaded()

wait(5)
print("e")
goal = workspace.tower.sections.finish.FinishGlow.CFrame:ToWorldSpace(CFrame.new(-12,-7,0))--CFrame.new(root.Position.X,goal.Y+10,root.Position.Z)

teleport(goal)

print("ok")

local humanoid = game.Players.LocalPlayer.Character.Humanoid

humanoid:MoveTo(workspace.tower.sections.finish.FinishGlow.Position)

humanoid.MoveToFinished:Wait()
