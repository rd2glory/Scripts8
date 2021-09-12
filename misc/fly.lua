do -- Fly Scripts
  local flying = false

  local localplayer = game.Players.LocalPlayer
  local mouse = plr:GetMouse()

	if workspace:FindFirstChild("Core") then
		workspace.Core:Destroy()
	end

	local Core = Instance.new("Part")
	Core.Name = "Core"
	Core.Size = Vector3.new(0.05, 0.05, 0.05)
	Core.Transparency = 1

	Core.Parent = workspace
	local Weld = Instance.new("Weld", Core)
	Weld.Part0 = Core
	Weld.Part1 = localplayer.Character:FindFirstChild("LowerTorso") or localplayer.Character:FindFirstChild("Torso")
	Weld.C0 = CFrame.new(0, 0, 0)

	local torso = workspace.Core
	local speed = 20
	local keys = {
		a = false,
		d = false,
		w = false,
		s = false
	}

	local b = Instance.new("BindableEvent")

	local function start()


		local pos = Instance.new("BodyPosition", torso)
		local gyro = Instance.new("BodyGyro", torso)
		pos.Name = "EPIXPOS"
		pos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		pos.Position = torso.Position
		gyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
		gyro.CFrame = torso.CFrame

		local speedModifier = 0.4

		local c = nil
		local db = false
		c = HB:Connect(function(dt)
			if db then return else db = true end

			local speedMod = speedModifier*60*dt

			if not flying then
				c:Disconnect()
				b:Fire()
				return
			end
			localplayer.Character.Humanoid.PlatformStand = true
			local new = gyro.cframe - gyro.cframe.p + pos.position
			if not keys.w and not keys.s and not keys.a and not keys.d then
				speed = 20
			end
			if keys.w then
				new = new + workspace.CurrentCamera.CFrame.LookVector * (speed*speedMod)
				speed = speed + 0
			end
			if keys.s then
				new = new - workspace.CurrentCamera.CFrame.LookVector * (speed*speedMod)
				speed = speed + 0
			end
			if keys.d then
				new = new * CFrame.new(speed*speedMod, 0, 0)
				speed = speed + 0
			end
			if keys.a then
				new = new * CFrame.new(-speed*speedMod, 0, 0)
				speed = speed + 0
			end
			if speed > 10 then
				speed = 20
			end
			pos.position = new.p
			if keys.w then
				gyro.CFrame = workspace.CurrentCamera.CFrame * CFrame.Angles(-math.rad(speed * 0), 0, 0)
			elseif keys.s then
				gyro.CFrame = workspace.CurrentCamera.CFrame * CFrame.Angles(math.rad(speed * 0), 0, 0)
			else
				gyro.CFrame = workspace.CurrentCamera.CFrame
			end

			db = false
		end)

		b.Event:Wait()
		task.wait()

		if gyro then
			gyro:Destroy()
		end
		if pos then
			pos:Destroy()
		end
		flying = false
		localplayer.Character.Humanoid.PlatformStand = false
		speed = 20
	end

	e1 = mouse.KeyDown:connect(function(key)
		if not torso or not torso.Parent then
			flying = false
			e1:disconnect()
			e2:disconnect()
			return
		end
		if key == "w" then
			keys.w = true
		elseif key == "s" then
			keys.s = true
		elseif key == "a" then
			keys.a = true
		elseif key == "d" then
			keys.d = true
		elseif key == "x" then
			if FlyEnabled then
				if flying == true then
					flying = false
				else
					flying = true
					start()
				end
			end
		end
	end)
	e2 = mouse.KeyUp:connect(function(key)
		if key == "w" then
			keys.w = false
		elseif key == "s" then
			keys.s = false
		elseif key == "a" then
			keys.a = false
		elseif key == "d" then
			keys.d = false
		end
	end)

	HB:Connect(function()
		local char = mobileCharacter()

		if not Weld or Weld.Parent ~= Core then
			local old = Weld or Core:FindFirstAncestorOfClass("Weld")

			if old then
				old:Destroy()
			end

			Weld = Instance.new("Weld", Core)
			Weld.Part0 = Core
			Weld.C0 = CFrame.new(0, 0, 0)
		end
		if char then
			Weld.Part1 = char:FindFirstChild("LowerTorso") or char:FindFirstChild("Torso")
		else
			flying = false
		end
	end)
end
