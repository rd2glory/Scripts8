--[[


░░░░░██╗░█████╗░██╗██╗░░░░░██████╗░██████╗░███████╗░█████╗░██╗░░██╗░░░░░░░
░░░░░██║██╔══██╗██║██║░░░░░██╔══██╗██╔══██╗██╔════╝██╔══██╗██║░██╔╝░░██╗░░
░░░░░██║███████║██║██║░░░░░██████╦╝██████╔╝█████╗░░███████║█████═╝░██████╗
██╗░░██║██╔══██║██║██║░░░░░██╔══██╗██╔══██╗██╔══╝░░██╔══██║██╔═██╗░╚═██╔═╝
╚█████╔╝██║░░██║██║███████╗██████╦╝██║░░██║███████╗██║░░██║██║░╚██╗░░╚═╝░░
░╚════╝░╚═╝░░╚═╝╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░░░░░░░

HOW TO USE:

a. https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/games/Jailbreak/Copy%26PasteIntoAutoExec.lua

b. https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/games/Jailbreak/UnwrappedJBP.lua

Copy and paste the code at link a into a script executor. This code includes a wrapper that is designed to be used in the autoexec folder of your executor.
It also has version update safety, so each time the developer updates the game, it must be approved by the developer that the script is safe for use
in the newly updated place.

To use the unwrapped module without any safeguard, execute the script at link b. That script cannot be used in the autoexec folder.

The unwrapped script and the safe script both have an "on teleport" queue script, so when teleported to the trade island or back, the unwrapped code will be ran
upon teleportation.

KEYBINDS:

Page Down (Page End) - toggle no-clip

Page Up (Page Home) - double tap to rejoin a server with the same place ID.

]]--

print("Initiating Jailbreak+...")

local Version = "4c"

repeat task.wait() until game:IsLoaded() -- i know this is bad coding practice, but i dont really care
task.wait(2) -- if i code it the right way, it will take more lines, and i dont feel like it tbh

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Run = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

-- Variables
local GameFolder = ReplicatedStorage:WaitForChild("Game")

local Vehicles = workspace:WaitForChild("Vehicles")
local VehicleData = require(GameFolder.Garage.VehicleData)

local Notification = require(ReplicatedStorage:WaitForChild("Game"):WaitForChild("Notification"))

local born = {}
local lastDrivenBy = {}

local player = Players.LocalPlayer
--local playerGui = player:WaitForChild("PlayerGui")
--local GarageUI = playerGui:WaitForChild("AppUI"):WaitForChild("Garage")

local NoClipEnabled = false
local Exiting = false

local robberyVehicles = {
    "BankTruck";
}

local addGuiOffsetByMake = {
	Arachnid = 0.8;
	BeamHybrid = 0.75;
    Heli = 3.1;
    Jeep = 2.5;
    BlackHawk = -3;
    LittleBird = -1.25;
    Jet = -1;
    Classic = 0.5;
    Camaro = 0.5;
    Bugatti = 1.5;
    Concept = 1.5;
    Model3 = 0.5;
    Roadster = 0.4;
    Chiron = 0.4;
    Volt = 0.5;
    Monster = 1.5;
	Drone = -1;
	R8 = 0.1;
	Torpedo = 1.15;
	Interrogator = 0.6;
}

local function makeInfoGui()
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local InfoGui = Instance.new("BillboardGui")
	local Frame = Instance.new("Frame")
	local Price = Instance.new("TextLabel")
	local CarName = Instance.new("TextLabel")
	local PlayerName = Instance.new("TextLabel")
	local Thumbnail = Instance.new("ImageLabel")
	local Age = Instance.new("TextLabel")
	local ExtraInfo = Instance.new("TextLabel")

	--Properties:

	InfoGui.Name = "InfoGui"
	InfoGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	InfoGui.Active = true
	InfoGui.MaxDistance = 512.000
	InfoGui.Size = UDim2.new(6, 0, 6, 0)
	InfoGui.StudsOffsetWorldSpace = Vector3.new(0, 6.5, 0)

	Frame.Parent = InfoGui
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.Size = UDim2.new(1, 0, 1, 0)

	Price.Name = "Price"
	Price.Parent = Frame
	Price.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Price.BackgroundTransparency = 1.000
	Price.Position = UDim2.new(0, 0, 0.790000021, 0)
	Price.Size = UDim2.new(1, 0, 0.180000007, 0)
	Price.Font = Enum.Font.SourceSansBold
	Price.Text = "$2,500,000"
	Price.TextColor3 = Color3.fromRGB(82, 238, 111)
	Price.TextScaled = true
	Price.TextSize = 42.000
	Price.TextStrokeColor3 = Color3.fromRGB(11, 35, 16)
	Price.TextStrokeTransparency = 0.800
	Price.TextWrapped = true

	CarName.Name = "CarName"
	CarName.Parent = Frame
	CarName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CarName.BackgroundTransparency = 1.000
	CarName.Position = UDim2.new(0, 0, 0.699999988, 0)
	CarName.Size = UDim2.new(1, 0, 0.125, 0)
	CarName.Font = Enum.Font.SourceSans
	CarName.Text = "Concept Car"
	CarName.TextColor3 = Color3.fromRGB(255, 255, 255)
	CarName.TextScaled = true
	CarName.TextSize = 42.000
	CarName.TextStrokeColor3 = Color3.fromRGB(11, 35, 16)
	CarName.TextStrokeTransparency = 0.800
	CarName.TextWrapped = true

	PlayerName.Name = "PlayerName"
	PlayerName.Parent = Frame
	PlayerName.AnchorPoint = Vector2.new(0.5, 0)
	PlayerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PlayerName.BackgroundTransparency = 1.000
	PlayerName.Position = UDim2.new(0.5, 0, 0.150000006, 0)
	PlayerName.Size = UDim2.new(1, 0, 0.125, 0)
	PlayerName.Font = Enum.Font.SourceSansSemibold
	PlayerName.Text = "Speedbird13"
	PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
	PlayerName.TextScaled = true
	PlayerName.TextSize = 42.000
	PlayerName.TextStrokeColor3 = Color3.fromRGB(11, 35, 16)
	PlayerName.TextStrokeTransparency = 0.800
	PlayerName.TextWrapped = true

	Thumbnail.Name = "Thumbnail"
	Thumbnail.Parent = Frame
	Thumbnail.AnchorPoint = Vector2.new(0.5, 0.5)
	Thumbnail.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Thumbnail.BackgroundTransparency = 1.000
	Thumbnail.BorderSizePixel = 0
	Thumbnail.Position = UDim2.new(0.5, 0, 0.449999988, 0)
	Thumbnail.Size = UDim2.new(0.400000006, 0, 0.400000006, 0)
	Thumbnail.Image = "rbxthumb://type=AvatarHeadShot&id=1350477738&w=420&h=420"

	Age.Name = "Age"
	Age.Parent = Frame
	Age.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Age.BackgroundTransparency = 1.000
	Age.Position = UDim2.new(0, 0, 0.949999988, 0)
	Age.Size = UDim2.new(1, 0, 0.100000001, 0)
	Age.Font = Enum.Font.SourceSansItalic
	Age.Text = "x seconds old"
	Age.TextColor3 = Color3.fromRGB(255, 255, 255)
	Age.TextScaled = true
	Age.TextSize = 42.000
	Age.TextStrokeColor3 = Color3.fromRGB(11, 35, 16)
	Age.TextStrokeTransparency = 0.800
	Age.TextWrapped = true

	ExtraInfo.Name = "ExtraInfo"
	ExtraInfo.Parent = Frame
	ExtraInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ExtraInfo.BackgroundTransparency = 1.000
	ExtraInfo.Position = UDim2.new(0, 0, 0.649999976, 0)
	ExtraInfo.Size = UDim2.new(1, 0, 0.0799999982, 0)
	ExtraInfo.Font = Enum.Font.SourceSans
	ExtraInfo.Text = "Season 2, Level 3"
	ExtraInfo.TextColor3 = Color3.fromRGB(0, 85, 255)
	ExtraInfo.TextScaled = true
	ExtraInfo.TextSize = 42.000
	ExtraInfo.TextStrokeColor3 = Color3.fromRGB(11, 35, 16)
	ExtraInfo.TextStrokeTransparency = 0.800
	ExtraInfo.TextWrapped = true

	return InfoGui
end

local function notify(text,duration)
	text = text or "nil"
	duration = duration or 3

	local e = Notification.new({
		["Text"] = text;
		["Duration"] = duration;
	})
	
	Notification.Hook(e)
end

local function makeNametag()
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local Nametag = Instance.new("BillboardGui")
	local Frame = Instance.new("Frame")
	local DisplayName = Instance.new("TextLabel")
	local Cash = Instance.new("TextLabel")
	local PlayerName = Instance.new("TextLabel")
	local UIListLayout = Instance.new("UIListLayout")
	local Health = Instance.new("Frame")
	local ImageLabel = Instance.new("ImageLabel")
	local ImageLabel_2 = Instance.new("ImageLabel")

	--Properties:

	Nametag.Name = "Nametag"
	Nametag.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Nametag.Active = true
	Nametag.MaxDistance = 100.000
	Nametag.Size = UDim2.new(7, 0, 3, 0)
	Nametag.StudsOffsetWorldSpace = Vector3.new(0, 2.8, 0)

	Frame.Parent = Nametag
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.Size = UDim2.new(1, 0, 1, 0)

	DisplayName.Name = "|DisplayName"
	DisplayName.Parent = Frame
	DisplayName.AnchorPoint = Vector2.new(0, 1)
	DisplayName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DisplayName.BackgroundTransparency = 1.000
	DisplayName.Position = UDim2.new(0, 0, 0.800000012, 0)
	DisplayName.Size = UDim2.new(1, 0, 0.219999999, 0)
	DisplayName.Font = Enum.Font.SourceSansSemibold
	DisplayName.Text = "Flamingo"
	DisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
	DisplayName.TextScaled = true
	DisplayName.TextSize = 42.000
	DisplayName.TextStrokeTransparency = 0.600
	DisplayName.TextWrapped = true

	Cash.Name = "Cash"
	Cash.Parent = Frame
	Cash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Cash.BackgroundTransparency = 1.000
	Cash.Position = UDim2.new(0, 0, 0.100000001, 0)
	Cash.Size = UDim2.new(1, 0, 0.174999997, 0)
	Cash.Font = Enum.Font.SourceSansSemibold
	Cash.Text = "$2M"
	Cash.TextColor3 = Color3.fromRGB(82, 238, 111)
	Cash.TextScaled = true
	Cash.TextSize = 42.000
	Cash.TextStrokeTransparency = 0.600
	Cash.TextWrapped = true

	PlayerName.Name = "||PlayerName"
	PlayerName.Parent = Frame
	PlayerName.AnchorPoint = Vector2.new(0, 1)
	PlayerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PlayerName.BackgroundTransparency = 1.000
	PlayerName.Position = UDim2.new(0, 0, 1, 0)
	PlayerName.Size = UDim2.new(1, 0, 0.125, 0)
	PlayerName.Font = Enum.Font.SourceSansSemibold
	PlayerName.Text = "iamtryingtofindname"
	PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
	PlayerName.TextScaled = true
	PlayerName.TextSize = 42.000
	PlayerName.TextStrokeTransparency = 0.600
	PlayerName.TextWrapped = true

	UIListLayout.Parent = Frame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout.Padding = UDim.new(-0.0199999996, 0)

	Health.Name = "|||Health"
	Health.Parent = Frame
	Health.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Health.BackgroundTransparency = 1.000
	Health.Size = UDim2.new(0.25, 0, 0.075000003, 0)

	ImageLabel.Parent = Health
	ImageLabel.AnchorPoint = Vector2.new(0, 1)
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.Position = UDim2.new(0, 0, 1, 0)
	ImageLabel.Size = UDim2.new(1, 0, 0.4, 0)
	ImageLabel.Image = "rbxassetid://5456843074"
	ImageLabel.ImageColor3 = Color3.fromRGB(193, 193, 193)
	ImageLabel.ImageTransparency = 0.6
	ImageLabel.ScaleType = Enum.ScaleType.Slice
	ImageLabel.SliceCenter = Rect.new(99, 99, 101, 101)

	ImageLabel_2.Parent = ImageLabel
	ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel_2.BackgroundTransparency = 1.000
	ImageLabel_2.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel_2.Image = "rbxassetid://5456843074"
	ImageLabel_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel_2.ScaleType = Enum.ScaleType.Slice
	ImageLabel_2.SliceCenter = Rect.new(99, 99, 101, 101)

	return Nametag
end

local function formatTime(seconds)
    local minutes = seconds/60
    local hours = minutes/60
    local days = hours/24

    if days >= 1 then
        return tostring(math.floor(days)).." day"..(math.floor(days)>1 and "s" or "")
    elseif hours >= 1 then
        return tostring(math.floor(hours)).." hour"..(math.floor(days)>1 and "s" or "")
    elseif minutes >= 1 then
        return tostring(math.floor(minutes)).." minute"..(math.floor(days)>1 and "s" or "")
    else
        return tostring(math.floor(seconds)).." second"..(math.floor(days)>1 and "s" or "")
    end
end

local function formatNumber(n)
	n = tostring(n)
	return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

local function formatCashShort(n)
	n = math.floor(n)

	if n < 100000 then
		return "$"..formatNumber(n)
	elseif n < 1000000 then
		return "$"..tostring(math.floor(n/1000*10)/10).."K"
	elseif n < 1000000000 then
		return "$"..tostring(math.floor(n/1000000*10)/10).."M"
	elseif n < 1000000000000 then
		return "$"..tostring(math.floor(n/1000000000*10)/10).."B"
	else
		return "$"..tostring(math.floor(n/1000000000000*10)/10).."T"
	end
end

local function getColor(percent)
	return Color3.new(percent<0.5 and 1 or (1-percent)*2,percent>0.5 and 1 or percent*2)
end

local function editInfo(v,info)
    --[[
        -CarName = v.Name;
        -Price = carInfo.Price;
        -BeingRidden = seat.Player.Value;
        -LastPlayer = seat.PlayerName.Value;
        -Age = formatTime(now-seat.Depart.Value);
        -CanAfford = carInfo.Price and carInfo.Price<= money;
        -Season = carInfo.Season;
        -Level = carInfo.Level;
        -Retired = carInfo.Retired;
        -Untradable = carInfo.NoTrade;
        -Owned = ...;
    ]]--

    local hiddenPrice = info.BeingRidden or not info.Price or not info._oldEnabled or info.CarName == "Camaro" or info.CarName == "Jeep"
    local extraInfo = info.Season or info.Retired or info.Untradable

	v.CarName.Text = info.CarName
	v.Age.Text = formatTime(info.Age)
    v.PlayerName.Text = info.LastPlayer or info.LastDrivenBy or "Unknown"
    v.Price.Text = hiddenPrice and "HIDDEN" or "$"..tostring(formatNumber(info.Price))

    v.Price.Visible = not hiddenPrice
    v.Age.Position = hiddenPrice and UDim2.new(0, 0,0.8, 0) or UDim2.new(0, 0,0.95, 0)

    -- extra info
    v.ExtraInfo.Visible = extraInfo

    if table.find(robberyVehicles,info.CarName) then
        -- robbery vehicle
        v.ExtraInfo.Text = "Robbery"
        v.ExtraInfo.TextColor3 = Color3.fromRGB(255, 255, 0)

    elseif info.CarName == "Camaro" or info.CarName == "Jeep" or info.CarName == "Heli" then
        -- free vehicle
        v.ExtraInfo.Text = "Free"
        v.ExtraInfo.TextColor3 = Color3.fromRGB(0, 255, 0)
    elseif info.Season then
        if info.Level then
            -- new season
            v.ExtraInfo.Text = "Season "..info.Season..", Level "..info.Level
            v.ExtraInfo.TextColor3 = Color3.fromRGB(0, 85, 255)
        else
            -- og season
            v.ExtraInfo.Text = "Season "..info.Season
            v.ExtraInfo.TextColor3 = Color3.fromRGB(174, 93, 255)
        end
    elseif info.Retired then
        -- retired
        v.ExtraInfo.Text = "Retired"
        v.ExtraInfo.TextColor3 = Color3.fromRGB(255, 46, 46)
    elseif info.Untradable then
        -- untradable
        v.ExtraInfo.Text = "Untradable"
        v.ExtraInfo.TextColor3 = Color3.fromRGB(255, 144, 46)
    end

	local lastPlayer = info.LastPlayer or info.LastDrivenBy

    v.PlayerName.Visible = lastPlayer and true or false
    v.Thumbnail.Visible = lastPlayer and true or false
	v.PlayerName.Font = info.LastPlayer and Enum.Font.SourceSansSemibold or Enum.Font.SourceSansLight
	v.Thumbnail.ImageTransparency = info.LastPlayer and 0 or 0.55

    local playerId = lastPlayer and Players:FindFirstChild(lastPlayer) and Players:FindFirstChild(lastPlayer).UserId

    v.Thumbnail.Image = playerId and "rbxthumb://type=AvatarHeadShot&id="..playerId.."&w=420&h=420" or "http://www.roblox.com/asset/?id=9883071856"

    v.PlayerName.Position =  UDim2.new(0.5, 0, extraInfo and 0.15 or 0.2, 0)
    v.Thumbnail.Position =  UDim2.new(0.5, 0, extraInfo and 0.45 or 0.5, 0)

    if not hiddenPrice then
        v.Price.TextColor3 = info.CanAfford and Color3.fromRGB(82, 238, 111) or Color3.fromRGB(238, 56, 56)
    end
end

Run.Heartbeat:Connect(function()
	local money = player.leaderstats.Money.Value

	local toUpdate = {}
	-- give every vehicle the gui
	for _,v in pairs(Vehicles:GetChildren()) do
		local boundingBox = v:FindFirstChild("BoundingBox")

        local old = boundingBox and boundingBox:FindFirstChild("MoneyBillboard")

        if old and old:FindFirstChild("Frame") then
            old.Frame.Visible = false
        end

		if boundingBox and not boundingBox:FindFirstChild("InfoGui") then
			local new = makeInfoGui()

            new.StudsOffsetWorldSpace = Vector3.new(0, boundingBox.Size.Y/2+3, 0) -- official formula is (sizeY/2+2)

			new.Parent = boundingBox
		end

		if boundingBox and boundingBox:FindFirstChild("InfoGui") then
			table.insert(toUpdate,v)
		end
	end

	local now = workspace:GetServerTimeNow()

	-- Update them
	for _,v in pairs(toUpdate) do
		local boundingBox = v:FindFirstChild("BoundingBox")
		local seat = v:FindFirstChild("Seat")
		local info = boundingBox:FindFirstChild("InfoGui")
		local make = v:FindFirstChild("Make") and v:FindFirstChild("Make").Value

        if make and seat then
            local carInfo = nil

            for _,data in pairs(VehicleData) do
                if data.Make == make then
                    carInfo = data
                    break
                end
            end
    
            if not carInfo then
                error("No car info found for vehicle: "..make)
            end
            
            info.StudsOffsetWorldSpace = Vector3.new(0, boundingBox.Size.Y/2+2.5+(addGuiOffsetByMake[carInfo.Make or ""] or 0), 0)
    
            local lastPlayer = seat:FindFirstChild("PlayerName") and seat.PlayerName.Value
    
            if lastPlayer == "" then
                lastPlayer = nil
            end

			local timeBorn = born[v]

			if not timeBorn then
				local departTimes = {}

				for _,j in pairs(v:GetDescendants()) do
					if j.Name == "Depart" and j:IsA("NumberValue") then
						table.insert(departTimes,j.Value)
					end
				end

				table.sort(departTimes)

				timeBorn = departTimes[1] or now
			end

            born[v] = timeBorn
			lastDrivenBy[v] = lastPlayer or lastDrivenBy[v]
    
            editInfo(info.Frame,{
                CarName = v.Name;
                Price = carInfo.Price;
                BeingRidden = seat:FindFirstChild("Player") and seat:FindFirstChild("Player").Value;
                LastPlayer = lastPlayer;
				LastDrivenBy = lastDrivenBy[v];
                Age = now-born[v];
                CanAfford = carInfo.Price and carInfo.Price <= money;
                Season = carInfo.Season;
                Level = carInfo.Level;
                Retired = carInfo.Retired;
                Untradable = carInfo.NoTrade;
    
                _oldEnabled = boundingBox:FindFirstChild("MoneyBillboard") and boundingBox:FindFirstChild("MoneyBillboard").Enabled or false;
            })
        end
	end

	-- Make nametags
	for _,v in pairs(Players:GetPlayers()) do
		local c = v.Character

		if c and c:FindFirstChild("Head") and c.PrimaryPart and c:FindFirstChild("Humanoid") then
			c.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

			if not c.Head:FindFirstChild("Nametag") then
				local new = makeNametag()
				new.Parent = c.Head
			end
		end
	end

	local playersInVehicles = {}

	for _,v in pairs(Vehicles:GetDescendants()) do
		if v.Name == "PlayerName" and v:IsA("StringValue") and v.Value ~= "" then
			table.insert(playersInVehicles,v.Value)
		end
	end

	-- Update Nametags
	for _,v in pairs(Players:GetPlayers()) do
		local c = v.Character

		if c and c:FindFirstChild("Humanoid") and c:FindFirstChild("Head") and c.Head:FindFirstChild("Nametag") and v:FindFirstChild("leaderstats") and v.leaderstats:FindFirstChild("Money") then
			local cash = v.leaderstats.Money.Value
			local percent = c.Humanoid.Health/c.Humanoid.MaxHealth
			local nametag = c.Head.Nametag.Frame

			nametag.Visible = not table.find(playersInVehicles,v.Name)

			if not table.find(playersInVehicles,v.Name) then
				nametag.Cash.Text = formatCashShort(cash)
				nametag:FindFirstChild("||PlayerName").Text = v.DisplayName or v.Name
				--nametag:FindFirstChild("|DisplayName").Text = v.DisplayName
				--nametag:FindFirstChild("|DisplayName").Visible = v.Name ~= v.DisplayName and true or false
				nametag:FindFirstChild("|DisplayName").Visible = false

				nametag:FindFirstChild("||PlayerName").TextColor3 = (v.Team.Name == "Police" and Color3.fromRGB(26, 156, 255)) or (v.Team.Name == "Criminal" and Color3.fromRGB(255, 66, 66)) or (v.Team.Name == "Prisoner" and Color3.fromRGB(255, 141, 26)) or Color3.fromRGB(255,255,255)

				if percent == 1 then
					nametag:FindFirstChild("|||Health").Visible = false
				else
					nametag:FindFirstChild("|||Health").Visible = true
					nametag:FindFirstChild("|||Health").ImageLabel.ImageLabel.Size = UDim2.new(percent, 0, 1, 0)
					nametag:FindFirstChild("|||Health").ImageLabel.ImageLabel.ImageColor3 = getColor(percent)
				end
			end
		end
	end
end)

local originalProperties = {}
local doorParts = {}
local specialNoClipPos = {
	Vector3.new(1159.342, 118.258, 1328.051); -- msm window
	Vector3.new(150.519, 64.907, 1267.75); -- jew store window
}

do -- init no-clip
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		local part = v.Name == "TheDoor" or v.Name == "TheGlass"

		if ((v.Name == "SwingDoor" or v.Name == "SlideDoor") and v:IsA("Model")) or part or v.Name == "Door" then
			if part and v:IsA("BasePart") then
				doorParts[v] = true
			elseif v.Name == "Door" then
				if not v:IsDescendantOf(Vehicles) then
					if v:IsA("BasePart") then
						doorParts[v] = true
					end

					for _,j in pairs(v:GetDescendants()) do
						if j:IsA("BasePart") then
							doorParts[j] = true
						end
					end
				end
			else
				for _,j in pairs(v:GetDescendants()) do
					if j:IsA("BasePart") then
						doorParts[j] = true
					end
				end
			end
		end

		if v:IsA("BasePart") then
			for _,e in pairs(specialNoClipPos) do
				if (v.Position-e).Magnitude < 0.01 then -- floating point error
					doorParts[v] = true
					break
				end
			end
		end
	end

	for v,_ in pairs(doorParts) do
		originalProperties[v] = {v.Anchored,v.CanCollide,v.Transparency}
	end
end

local lastUpPress = -1

UIS.InputBegan:Connect(function(input,gpe)
	if input.UserInputType == Enum.UserInputType.Keyboard and not Exiting then
		if input.KeyCode == Enum.KeyCode.PageDown then
			-- toggle no-clip
			NoClipEnabled = not NoClipEnabled

			for v,_ in pairs(doorParts) do
				local op = originalProperties[v]

				if NoClipEnabled then
					v.Anchored,v.CanCollide = true,false
				else
					v.Anchored,v.CanCollide,v.Transparency = op[1],op[2],op[3]
				end
			end

			notify("No-Clip toggled "..(NoClipEnabled and "on" or "off"))
		elseif input.KeyCode == Enum.KeyCode.PageUp then
			local now = os.clock()
			if now-lastUpPress < 0.8 then
				-- rejoin
				Exiting = true

				game:GetService("Players").LocalPlayer:Kick("Rejoining soon (DON'T LEAVE)")
				task.wait(5)
				game:GetService("TeleportService"):Teleport(game.PlaceId)
			end
			lastUpPress = now
		end
	end
end)

syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/games/Jailbreak/JailbreakPlus.lua"))()')

print("Jailbreak+ (v"..Version..") initiated sucessfully")
notify("Jailbreak+ (v"..Version..") initiated", 5)
