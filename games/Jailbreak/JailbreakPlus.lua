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

Keypad Plus - teleport forward (5 studs)

Keypad Multiply - toggle short vehicle info

Keypad Subtract - remove highway while driving on it (used on highway only)

Keypad Nine - hide all highway lifts and disable all elevators

]]--

print("Initiating Jailbreak+...")

local Version = "6i"

if not game:IsLoaded() then
	game.Loaded:Wait()
end

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Run = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TeleportService")
local VU = game:GetService("VirtualUser")

-- Variables
local GameFolder = ReplicatedStorage:WaitForChild("Game")

local Vehicles = workspace:WaitForChild("Vehicles")
local VehicleData = require(GameFolder:WaitForChild("Garage"):WaitForChild("VehicleData"))

--local Notification = require(ReplicatedStorage:WaitForChild("Game"):WaitForChild("Notification"))

local born = {}
local lastDrivenBy = {}

local player = Players.LocalPlayer
--local playerGui = player:WaitForChild("PlayerGui")
--local GarageUI = playerGui:WaitForChild("AppUI"):WaitForChild("Garage")

local NoClipEnabled = false
local Exiting = false
local SmallVehicleDetails = false
local LiftsEnabled = false

local inMainGame = game.PlaceId == 606849621

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
    Volt = 0.75;
    Monster = 1.5;
	Drone = -1.4;
	R8 = 0.1;
	Torpedo = 1.15;
	Interrogator = 0.6;
	Trailblazer = 0.175;
	Boxer = 0.75;
}

local platform = Instance.new("Model")

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
    local playerId = lastPlayer and Players:FindFirstChild(lastPlayer) and Players:FindFirstChild(lastPlayer).UserId

	local selfDriving = player.UserId == playerId and info.BeingRidden

    v.PlayerName.Visible = (lastPlayer and not SmallVehicleDetails and not selfDriving) and true or false
    v.Thumbnail.Visible = (lastPlayer and not SmallVehicleDetails and not selfDriving) and true or false
	v.PlayerName.Font = info.LastPlayer and Enum.Font.SourceSansSemibold or Enum.Font.SourceSansLight
	v.Thumbnail.ImageTransparency = (info.LastPlayer and playerId) and 0 or 0.55

    v.Thumbnail.Image = playerId and "rbxthumb://type=AvatarHeadShot&id="..playerId.."&w=420&h=420" or "http://www.roblox.com/asset/?id=9964662085"

    v.PlayerName.Position =  UDim2.new(0.5, 0, extraInfo and 0.15 or 0.2, 0)
    v.Thumbnail.Position =  UDim2.new(0.5, 0, extraInfo and 0.45 or 0.5, 0)

    if not hiddenPrice then
        v.Price.TextColor3 = info.CanAfford and Color3.fromRGB(82, 238, 111) or Color3.fromRGB(238, 56, 56)
    end
end

Run.Heartbeat:Connect(function()
	if not (player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Money")) then
		return
	end

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

			local dontRender = table.find(playersInVehicles,v.Name) or c:FindFirstChild("Head").LocalTransparencyModifier == 1

			nametag.Visible = not dontRender

			if not dontRender then
				nametag.Cash.Text = formatCashShort(cash)
				nametag:FindFirstChild("||PlayerName").Text = v.DisplayName or v.Name
				--nametag:FindFirstChild("|DisplayName").Text = v.DisplayName
				--nametag:FindFirstChild("|DisplayName").Visible = v.Name ~= v.DisplayName and true or false
				nametag:FindFirstChild("|DisplayName").Visible = false

				nametag:FindFirstChild("||PlayerName").TextColor3 = (v.Team.Name == "Police" and Color3.fromRGB(26, 156, 255)) or (v.Team.Name == "Criminal" and Color3.fromRGB(255, 66, 66)) or (v.Team.Name == "Prisoner" and Color3.fromRGB(255, 141, 26)) or Color3.fromRGB(255,255,255)

				nametag:FindFirstChild("||PlayerName").TextTransparency = c:FindFirstChild("Head").LocalTransparencyModifier
				nametag.Cash.TextTransparency = c:FindFirstChild("Head").LocalTransparencyModifier

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

	-- Update platform visibility
	if player.Character and player.Character.PrimaryPart then
		if player.Character.PrimaryPart.Position.Y < 380 then
			platform.Parent = nil
		end
	end
end)
local Notification = {}
do -- notif module
	-- Decompiled with the Synapse X Luau decompiler.
	local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
	local u1 = {};
	local u2 = false;
	local v2 = {};
	v2.__index = v2;
	local l__LocalPlayer__3 = game:GetService("Players").LocalPlayer;
	local u4 = require(l__ReplicatedStorage__1.Game.GameUtil);
	local u5 = require(l__ReplicatedStorage__1.Resource.Settings);
	local original = nil
	function v2.Init()
		--local l__em__3 = p1.em;
		original = l__LocalPlayer__3.PlayerGui:WaitForChild("NotificationGui",45)
		local l__NotificationGui__4 = original:Clone();
		l__NotificationGui__4.Parent = l__LocalPlayer__3.PlayerGui;
		l__NotificationGui__4.DisplayOrder = 9;
		v2.Gui = l__NotificationGui__4;
		local v5 = Instance.new("Sound");
		v5.SoundId = ("rbxassetid://%d"):format(215658476);
		v5.Parent = l__NotificationGui__4;
		v2.TypeWriterSound = v5;
		u4.OnTeamChanged:Connect(function(p2)
			v2.SetColor(u5.TeamColor[p2]);
		end);
		v2.SetColor(u5.TeamColor[u4.Team]);
	end;
	function v2.SetColor(p3)
		v2.Gui.ContainerNotification.ImageColor3 = p3;
	end;
	local u6 = nil;
	local u7 = require(l__ReplicatedStorage__1.Std.Maid);
	local function u8()
		if not (#u1 > 0) then
			u2 = false;
			return;
		end;
		u2 = true;
		table.remove(u1, 1):Hook();
	end;
	function v2.new(p4)
		assert(p4 ~= nil);
		assert(p4.Text ~= nil);
		if p4.Text == u6 then
			return;
		end;
		local v6 = u1[1];
		if v6 and v6.Text == p4.Text then
			return;
		end;
		if p4.Duration == nil then
			p4.Duration = math.min(5, 4 * utf8.len(p4.Text) / 50);
		end;
		assert(p4.Duration ~= nil);
		local v7 = {};
		setmetatable(v7, v2);
		v7.Maid = u7.new();
		v7.Text = p4.Text;
		v7.Duration = p4.Duration;
		table.insert(u1, v7);
		if u2 == false then
			u8();
		end;
		return v7;
	end;
	local u9 = require(l__ReplicatedStorage__1.Game.TypeWrite);
	local u10 = require(l__ReplicatedStorage__1.Std.Audio);
	function v2.Hook(p5)
		local l__Gui__8 = v2.Gui;
		l__Gui__8.Enabled = true;
		u6 = p5.Text;
		original.ContainerNotification.Visible = false
		local u11 = 1;
		p5.Maid:GiveTask(u9(p5.Text, function(p6)
			if p5.Maid == nil then
				return false;
			end;
			if u11 == 1 then
				v2.TypeWriterSound:Play();
			end;
			u11 = u11 % 3 + 1;
			l__Gui__8.ContainerNotification.Message.Text = p6;
		end, 50));
		u10.ObjectLocal(l__Gui__8, 700153902, {
			Volume = 0.25
		});
		task.delay(p5.Duration, function()
			p5:Destroy();
			original.ContainerNotification.Visible = true
		end);
	end;
	function v2.Destroy(p7)
		if p7.Maid ~= nil then
			v2.Gui.Enabled = false;
			p7.Maid:Destroy();
			p7.Maid = nil;
			u6 = nil;
			u8();
		end;
	end;

	v2.Init()

	Notification = v2
end

local function notify(text,duration)
	text = text or "nil"
	duration = duration or math.min(5, 4 * utf8.len(text) / 50);

	pcall(function()
		local e = Notification.new({
			["Text"] = text;
			["Duration"] = duration;
		})
		
		Notification.Hook(e)

		coroutine.resume(coroutine.create(function()
			for i=1,50 do
				pcall(function()
					task.wait(duration)
					e:Destroy()
				end)
			end
		end))

		for i=1,50 do
			coroutine.resume(coroutine.create(function()
				pcall(function()
					task.wait(duration)
					e:Destroy()
				end)
			end))
		end
	end)
end

local casino = inMainGame and workspace:WaitForChild("Casino")

local originalProperties = {}
local doorParts = {}
local specialNoClipPos = {
	Vector3.new(1159.342, 118.258, 1328.051); -- msm window
	Vector3.new(150.519, 64.907, 1267.75); -- jew store window
}

if inMainGame then -- init no-clip
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		local part = v.Name == "TheDoor" or v.Name == "TheGlass"

		if (((v.Name == "SwingDoor" or v.Name == "SlideDoor") and v:IsA("Model")) or part or v.Name == "Door") and not v:IsDescendantOf(casino) then
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

local inCancelPeriod = false

UIS.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard and not Exiting then
		if input.KeyCode == Enum.KeyCode.PageDown then
			if game.PlaceId ~= 606849621 then
				notify("No-Clip can only be used in the main Jailbreak server!",1.5)
			else
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
			end
		elseif input.KeyCode == Enum.KeyCode.PageUp then
			local now = os.clock()
			if now-lastUpPress < 0.8 and not inCancelPeriod then
				-- rejoin

				local savedLastPress = tonumber(tostring(lastUpPress))

				notify("Rejoin process commencing in 3 seconds, press PAGE UP to cancel",3)
				inCancelPeriod = true

				task.wait(3)

				if savedLastPress == lastUpPress then
					Exiting = true
					notify("Teleporting...",10)
					player:Kick("Rejoining... (DON'T LEAVE)")
					task.wait(4)
					TS:Teleport(game.PlaceId)
				end
			else
				if inCancelPeriod then
					inCancelPeriod = false
					notify("Rejoin process cancelled",3)
				end
				lastUpPress = now
			end
		elseif input.KeyCode == Enum.KeyCode.KeypadPlus then
			pcall(function()
				local character = player.Character
				character:PivotTo(character.PrimaryPart.CFrame*CFrame.new(0,0,-5))
			end)
		elseif input.KeyCode == Enum.KeyCode.KeypadMultiply then
			SmallVehicleDetails = not SmallVehicleDetails
		elseif input.KeyCode == Enum.KeyCode.KeypadMinus then
			if platform.Parent == workspace then
				platform.Parent = nil
			end
		elseif input.KeyCode == Enum.KeyCode.KeypadNine and inMainGame then
			LiftsEnabled = not LiftsEnabled
		end
	end
end)

if inMainGame then -- highway
	local liftSpeed = 46 -- stud per second
	local targetHeight = 387

	-- init
	local highway = Instance.new("Model")
	highway.Name = "Highway"

	local lifts = Instance.new("Model")
	lifts.Name = "Lifts"
	lifts.Parent = highway

	local function createPad(cframe)
		local model = Instance.new("Model")

		local pad = Instance.new("Part")
		pad.Name = "LiftPad"
		pad.Color = Color3.fromRGB(85, 255, 0)
		pad.Transparency = 0.5
		pad.Anchored = true
		pad.CanCollide = false
		pad.CanTouch = false
		pad.Material = Enum.Material.SmoothPlastic
		pad.Size = Vector3.new(30.9, 1, 17.8)
		pad.CFrame = cframe
		pad.CastShadow = false
		pad.Parent = model

		local lift = Instance.new("Model")
		lift.Name = "Lift"

		local liftPart = Instance.new("Part")
		liftPart.BrickColor = BrickColor.new("Earth blue")
		liftPart.Material = Enum.Material.Concrete
		liftPart.CanCollide = true
		liftPart.CanTouch = false
		liftPart.Anchored = true
		liftPart.CFrame = cframe-Vector3.new(0,3,0)
		liftPart.Size = Vector3.new(30.9, 2.1, 17.8)
		liftPart.Parent = lift

		local collisions = Instance.new("Part")
		collisions.CanCollide = false
		collisions.CanTouch = true
		collisions.Anchored = true
		collisions.Transparency = 1
		collisions.CFrame = cframe+Vector3.new(0,6.11,0)
		collisions.Size = Vector3.new(30.9, 12.8, 17.8)
		collisions.Parent = lift

		lift.PrimaryPart = liftPart

		lift.Parent = model
		model.Parent = lifts

		-- code

		local overlapParams = OverlapParams.new()
		overlapParams.FilterType = Enum.RaycastFilterType.Whitelist
		overlapParams.MaxParts = 1
		
		local timeEntered = nil
		local timeStartedLifting = nil
		local timeStartedLowering = nil
		local beginningHeight = nil
		
		local startingCFrame = liftPart.CFrame
		
		Run.Heartbeat:Connect(function(dt)
			if not LiftsEnabled then
				pad.Transparency = 1
				lift:PivotTo(startingCFrame)
				liftPart.CanCollide = false
				liftPart.Transparency = 1
				return
			else
				pad.Transparency = 0.5
			end

			if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.PrimaryPart then
				overlapParams.FilterDescendantsInstances = {player.Character.PrimaryPart}
				local result = workspace:GetPartBoundsInBox(collisions.CFrame,collisions.Size,overlapParams)
				
				if #result > 0 then
					timeEntered = timeEntered or os.clock()
					
					if os.clock()-timeEntered >= 3 and not timeStartedLifting then
						timeStartedLifting = timeStartedLifting or os.clock()
						timeStartedLowering = nil
						beginningHeight = liftPart.Position.Y
					end
				elseif timeEntered then
					timeEntered = nil
					timeStartedLifting = nil
					timeStartedLowering = os.clock()
					beginningHeight = nil
				end
				
				if timeStartedLifting then
					local check = math.clamp(dt,0,1/50)
					timeStartedLifting = dt-check+timeStartedLifting
					local newHeight = math.clamp(beginningHeight+(os.clock()-timeStartedLifting)*liftSpeed,startingCFrame.Position.Y,targetHeight)

					if newHeight == targetHeight then
						platform.Parent = workspace
						lift:PivotTo(startingCFrame)
						liftPart.CanCollide = false
						liftPart.Transparency = 1
					else
						lift:PivotTo(startingCFrame+Vector3.new(0,newHeight-startingCFrame.Position.Y,0))
						liftPart.CanCollide = true
						liftPart.Transparency = 0
					end
				elseif timeStartedLowering then
					--local newHeight = math.clamp(heightReached-((os.clock()-timeStartedLowering)*liftSpeed),startingCFrame.Position.Y,targetHeight)
					lift:PivotTo(startingCFrame)
					liftPart.CanCollide = false
					liftPart.Transparency = 1
				end
			end
		end)
	end

	local function createHighwayBlock(pos)
		local hw = Instance.new("Part")
		hw.CastShadow = false
		hw.BrickColor = BrickColor.new("Steel blue")
		hw.Material = Enum.Material.SmoothPlastic
		hw.Transparency = 0.725
		hw.Size = Vector3.new(2048, 1, 2048)
		hw.Position = pos
		hw.CanCollide = true
		hw.CanTouch = false
		hw.Anchored = true

		local top = Instance.new("Texture")
		top.Color3 = Color3.new(0,0,1)
		top.OffsetStudsU = 0
		top.OffsetStudsV = 0
		top.StudsPerTileU = 15
		top.StudsPerTileV = 15
		top.Texture = "rbxassetid://9933517096"
		top.ZIndex = 100000
		top.Face = Enum.NormalId.Top

		local bottom = Instance.new("Texture")
		bottom.Color3 = Color3.new(0,0,1)
		bottom.OffsetStudsU = 0
		bottom.OffsetStudsV = 0
		bottom.StudsPerTileU = 15
		bottom.StudsPerTileV = 15
		bottom.Texture = "rbxassetid://9933517096"
		bottom.ZIndex = 100000
		bottom.Face = Enum.NormalId.Bottom

		top.Parent = hw
		bottom.Parent = hw
		hw.Parent = platform
	end

	-- init pads
	createPad(CFrame.new(102.75, 15.1655579, 1448.80005, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	createPad(CFrame.new(147.949951, 14.6655579, 1119.09998, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	createPad(CFrame.new(66.7499542, 15.1655579, 734.400024, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	createPad(CFrame.new(23.749958, 16.2655582, 236.200027, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	createPad(CFrame.new(-122.730545, 14.8655586, 490.842194, 0.98480767, 0, 0.173648179, 0, 1, 0, -0.173648179, 0, 0.98480767))
	createPad(CFrame.new(746.767395, 14.8655586, 388.607086, 0.972369909, 0, 0.233445376, 0, 1, 0, -0.233445376, 0, 0.972369909))
	createPad(CFrame.new(883.967896, 14.965559, 604.544678, 0.972369909, 0, 0.233445376, 0, 1, 0, -0.233445376, 0, 0.972369909))
	createPad(CFrame.new(440.623108, 18.3655586, -365.25412, 0.972369909, 0, 0.233445376, 0, 1, 0, -0.233445376, 0, 0.972369909))
	createPad(CFrame.new(769.420105, 35.0655594, 964.017517, 0.878817081, 0, 0.477158785, 0, 1, 0, -0.477158785, 0, 0.87881708))
	createPad(CFrame.new(1037.37061, 98.765564, 1186.58984, 0.615661442, 0, 0.788010776, 0, 1, 0, -0.788010776, 0, 0.615661442))
	createPad(CFrame.new(34.2429619, 18.265564, 2286.05054, -0.601815045, 0, 0.798635483, 0, 1, 0, -0.798635483, 0, -0.601815045))
	createPad(CFrame.new(74.6213226, 18.265564, 2417.39917, -0.601815045, 0, 0.798635483, 0, 1, 0, -0.798635483, 0, -0.601815045))
	createPad(CFrame.new(588.863586, 36.5655594, 2373.85132, 0.669130564, 0, 0.74314487, 0, 1, 0, -0.74314487, 0, 0.669130564))
	createPad(CFrame.new(1443.43591, 82.265564, 1498.24268, 0.707106769, 0, 0.707106769, 0, 1, 0, -0.707106769, 0, 0.707106769))
	createPad(CFrame.new(1701.26648, 15.1655617, 250.531128, 0.0697564036, 0, -0.997563064, 0, 1, 0, 0.997563064, 0, 0.0697564036))
	createPad(CFrame.new(1501.33875, 15.1655617, -144.283997, -0.258819073, 0, 0.965925813, 0, 1, 0, -0.965925813, 0, -0.258819073))
	createPad(CFrame.new(865.29541, 18.4655628, 25.8327065, -0.258819073, 0, 0.965925813, 0, 1, 0, -0.965925813, 0, -0.258819073))
	createPad(CFrame.new(458.877411, 15.3655624, 300.272797, -0.258819073, 0, 0.965925813, 0, 1, 0, -0.965925813, 0, -0.258819073))
	createPad(CFrame.new(616.881226, 15.3655624, 729.607727, -0.173648193, 0, 0.98480773, 0, 1, 0, -0.98480773, 0, -0.173648193))
	createPad(CFrame.new(279.26358, 15.3655624, 910.327515, 0.978147626, 0, 0.2079117, 0, 1, 0, -0.2079117, 0, 0.978147626))
	createPad(CFrame.new(277.496704, 15.3655624, 1204.71643, -0.979924738, 0, -0.199367672, 0, 1, 0, 0.199367672, 0, -0.979924738)) -- moved: v6b
	--createPad(CFrame.new(589.684204, 34.9655647, 1652.88989, 0.936672211, 0, 0.350207388, 0, 1, 0, -0.350207388, 0, 0.936672211)) -- removed (mclaren spot): v6b
	createPad(CFrame.new(348.143036, 15.265564, 1720.86438, 0.978147626, 0, 0.2079117, 0, 1, 0, -0.2079117, 0, 0.978147626))
	createPad(CFrame.new(-257.635437, 15.265564, 1521.25977, 0.207911655, 0, 0.978147626, 0, 1, 0, -0.978147626, 0, 0.207911655))
	createPad(CFrame.new(-1150.39355, 30.3655643, 1465.61646, -0.42261833, 0, 0.906307757, 0, 1, 0, -0.906307757, 0, -0.42261833))
	createPad(CFrame.new(-411.521027, 17.9655647, 1924.94714, -0.0523359776, 0, 0.99862951, 0, 1, 0, -0.99862951, 0, -0.0523359776))
	createPad(CFrame.new(-1581.62671, 15.5655642, 757.421265, -0.990268052, 0, -0.139173195, 0, 1, 0, 0.139173195, 0, -0.990268052))
	createPad(CFrame.new(-1391.86377, 22.9655647, 182.967117, -0.978147626, 0, 0.207911611, 0, 1, 0, -0.207911611, 0, -0.978147626))
	createPad(CFrame.new(-1472.14136, 14.2655649, -1367.09607, -0.99862963, 0, -0.0523360372, 0, 1, 0, 0.0523360372, 0, -0.99862963))
	createPad(CFrame.new(-982.80304, 15.8655653, -1459.43262, -0.99862963, 0, -0.0523360372, 0, 1, 0, 0.0523360372, 0, -0.99862963))
	createPad(CFrame.new(-863.828918, 16.1655655, -1491.70349, -0.99862963, 0, -0.0523360372, 0, 1, 0, 0.0523360372, 0, -0.99862963))
	createPad(CFrame.new(-870.711243, 15.3655653, -562.569824, -0.99862963, 0, -0.0523360372, 0, 1, 0, 0.0523360372, 0, -0.99862963))
	createPad(CFrame.new(-447.101349, 25.3655663, 992.90918, 0.939692616, 0, -0.342020154, 0, 1, 0, 0.342020154, 0, 0.939692616))
	createPad(CFrame.new(-348.546967, 15.1655674, 1261.75671, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08 ))
	createPad(CFrame.new(-1416.56958, 38.1655579, 2857.61572, -1, 0, -4.37113883e-08, 0, 1, 0, 4.37113883e-08, 0, -1 ))
	createPad(CFrame.new(-1217.9696, 41.5655594, 2604.61597, -0.822237313, 0, 0.569144547, 0, 1, 0, -0.569144547, 0, -0.822237313))
	createPad(CFrame.new(-2923.72192, 21.6655579, 2318.51831, -0.84992826, 0, -0.526897788, 0, 1, 0, 0.526897788, 0, -0.84992826))
	createPad(CFrame.new(1603.17542, 34.8655624, -1199.89258, 0.0219938755, 0, 0.999758184, 0, 1, 0, -0.999758184, 0, 0.0219938755))
	createPad(CFrame.new(839.591431, 16.0655613, -1504.56055, 0.112321436, 0, 0.993672431, 0, 1, 0, -0.993672431, 0, 0.112321436)) -- updated orientation: v6b
	createPad(CFrame.new(-39.5492744, 16.0655613, -1760.46167, 0.997564018, 0, 0.0697565973, 0, 1, 0, -0.0697565973, 0, 0.997564018))
	createPad(CFrame.new(-1357.35217, 16.2139015, -1828.2373, -0.707106769, 0, -0.707106769, 0, 1, 0, 0.707106769, 0, -0.707106769)) -- moved: v6d
	createPad(CFrame.new(4.76502609, 16.0655613, -1431.66724, 0.292371839, 0, 0.956304729, 0, 1, 0, -0.956304729, 0, 0.292371839))
	createPad(CFrame.new(-171.14743, 16.1655807, -4585.14648, -0.961309791, 0, -0.275469601, 0, 1, 0, 0.275469601, 0, -0.961309791))
	createPad(CFrame.new(100.426575, 16.1655807, -4746.08398, -0.961309791, 0, -0.275469601, 0, 1, 0, 0.275469601, 0, -0.961309791))
	createPad(CFrame.new(-710.693115, 16.1655807, -5380.75146, 0.99939692, 0, 0.0347250775, 0, 1, 0, -0.0347250775, 0, 0.99939692))
	createPad(CFrame.new(-768.022583, 16.1655807, -5943.75977, 0.937023282, 0, 0.349267215, 0, 1, 0, -0.349267215, 0, 0.937023282))
	createPad(CFrame.new(64.8141632, 16.1655807, -5967.38867, 0.927118361, 0, -0.374768406, 0, 1, 0, 0.374768406, 0, 0.927118361))
	createPad(CFrame.new(2380.78735, 21.7655811, -3736.62036, -0.99256742, 0, -0.12169598, 0, 1, 0, 0.12169598, 0, -0.99256742))
	createPad(CFrame.new(-638.150696, 16.2655811, -4872.71924, 1, 0, 4.37113883e-08, 0, 1, 0, -4.37113883e-08, 0, 1))
	createPad(CFrame.new(-1285.35059, 25.3655815, -3604.01929, 0.969388247, 0, -0.245532796, 0, 1, 0, 0.245532796, 0, 0.969388247))
	-- added as of v6b
	createPad(CFrame.new(2008.4176, 16.7864494, -3194.76416, 0.560336292, 0, -0.828265309, 0, 1, 0, 0.828265309, 0, 0.560336292))
	createPad(CFrame.new(2334.08887, 16.2203369, -2076.00073, 0.983426809, 0, 0.181316912, 0, 1, 0, -0.181316912, 0, 0.983426809))
	createPad(CFrame.new(334.391815, 16.0655613, -1727.73938, 0.956304789, 0, -0.29237166, 0, 1, 0, 0.29237166, 0, 0.956304789))
	createPad(CFrame.new(1235.51904, 60.4853477, 1581.39197, 0.37770474, 0, 0.925926089, 0, 1, 0, -0.925926089, 0, 0.37770474))
	createPad(CFrame.new(-89.0017548, 15.3655653, -596.287476, -0.869870663, 0, -0.49328205, 0, 1, 0, 0.49328205, 0, -0.869870663))
	createPad(CFrame.new(-136.416748, 14.5321493, 1552.85034, 0.978147626, 0, -0.207911655, 0, 1, 0, 0.207911655, 0, 0.978147626))
	createPad(CFrame.new(613.840332, 16.5878544, -3571.29126, 0.978147626, 0, -0.207911655, 0, 1, 0, 0.207911655, 0, 0.978147626))
	createPad(CFrame.new(3084.35986, 61.8144341, -4543.9834, -0.999943376, 0, 0.0106301233, 0, 1, 0, -0.0106301233, 0, -0.999943376))
	-- added as of v6d
	createPad(CFrame.new(-1086.94995, 15.0561905, -1476.93274, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	createPad(CFrame.new(-1190.14062, 15.1176281, -1760.63, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	createPad(CFrame.new(-1341.69507, 15.1176281, -1634.91626, 1, 0, 0, 0, 1, 0, 0, 0, 1))

	createHighwayBlock(Vector3.new(-361.501, 387.53, -2239.6))
	createHighwayBlock(Vector3.new(1686.499, 387.53, 1856.4))
	createHighwayBlock(Vector3.new(-361.501, 387.53, 1856.4))
	createHighwayBlock(Vector3.new(3734.499, 387.53, -4287.6))
	createHighwayBlock(Vector3.new(1686.499, 387.53, 3904.4))
	createHighwayBlock(Vector3.new(-2409.501, 387.53, 3904.4))
	createHighwayBlock(Vector3.new(1686.499, 387.53, -191.6))
	createHighwayBlock(Vector3.new(1686.499, 387.53, -6335.6))
	createHighwayBlock(Vector3.new(3734.499, 387.53, -6335.6))
	createHighwayBlock(Vector3.new(1686.499, 387.53, -4287.6))
	createHighwayBlock(Vector3.new(3734.499, 387.53, 1856.4))
	createHighwayBlock(Vector3.new(-2409.501, 387.53, 1856.4))
	createHighwayBlock(Vector3.new(3734.499, 387.53, 3904.4))
	createHighwayBlock(Vector3.new(-361.501, 387.53, -6335.6))
	createHighwayBlock(Vector3.new(-361.501, 387.53, -191.6))
	createHighwayBlock(Vector3.new(-2409.501, 387.53, -191.6))
	createHighwayBlock(Vector3.new(-2409.501, 387.53, -4287.6))
	createHighwayBlock(Vector3.new(3734.499, 387.53, -191.6))
	createHighwayBlock(Vector3.new(-2409.501, 387.53, -6335.6))
	createHighwayBlock(Vector3.new(-361.501, 387.53, -4287.6))
	createHighwayBlock(Vector3.new(-2409.501, 387.53, -2239.6))
	createHighwayBlock(Vector3.new(1686.499, 387.53, -2239.6))
	createHighwayBlock(Vector3.new(-361.501, 387.53, 3904.4))
	createHighwayBlock(Vector3.new(3734.499, 387.53, -2239.6))

	highway.Parent = workspace
end

do -- init anti-idle kick
    local clickLocation = Vector2.new()

    local count = 1

    player.Idled:Connect(function()
        VU:CaptureController()
        VU:ClickButton2(clickLocation)
        --print("Simulated mouse click to prevent AFK kick ("..count..")")
        count = count + 1
    end)
end

syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/games/Jailbreak/JailbreakPlus.lua"))()')

print("Jailbreak+ (v"..Version..") initiated sucessfully")
notify("Jailbreak+ (v"..Version..") initiated", 6.5)
