local Version = 1

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Run = game:GetService("RunService")

-- Variables
local GameFolder = ReplicatedStorage.Game

local Vehicles = workspace:WaitForChild("Vehicles")
local VehicleData = require(GameFolder.Garage.VehicleData)

local born = {}

local player = Players.LocalPlayer
--local playerGui = player:WaitForChild("PlayerGui")
--local GarageUI = playerGui:WaitForChild("AppUI"):WaitForChild("Garage")

local robberyVehicles = {
    "BankTruck";
}

local addGuiOffsetByMake = {
    Heli = 3;
    Jeep = 2.5;
    BlackHawk = -1;
    LittleBird = -1.25;
    Jet = -1;
    Classic = 0.5;
    Camaro = 0.5;
    Bugatti = 1;
    Concept = 1.5;
    Model3 = 0.5;
    Roadster = 0.4;
    Chiron = 0.4;
    Volt = 0.5;
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
	InfoGui.Parent = game.Workspace.Part
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

local formatNumber = (function (n)
	n = tostring(n)
	return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end)

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
    v.PlayerName.Text = info.LastPlayer or "Unknown"
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

    v.PlayerName.Visible = info.LastPlayer and true or false
    v.Thumbnail.Visible = info.LastPlayer and true or false

    local playerId = info.LastPlayer and Players:FindFirstChild(info.LastPlayer) and Players:FindFirstChild(info.LastPlayer).UserId

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

        local old = boundingBox:FindFirstChild("MoneyBillboard")

        if old then
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
		local make = v:FindFirstChild("Make").Value

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
    
            local lastPlayer = seat.PlayerName.Value
    
            if lastPlayer == "" then
                lastPlayer = nil
            end

            born[v] = born[v] or seat.Depart.Value
    
            editInfo(info.Frame,{
                CarName = v.Name;
                Price = carInfo.Price;
                BeingRidden = seat.Player.Value;
                LastPlayer = lastPlayer;
                Age = now-born[v];
                CanAfford = carInfo.Price and carInfo.Price<= money;
                Season = carInfo.Season;
                Level = carInfo.Level;
                Retired = carInfo.Retired;
                Untradable = carInfo.NoTrade;
    
                _oldEnabled = boundingBox:FindFirstChild("MoneyBillboard") and boundingBox:FindFirstChild("MoneyBillboard").Enabled or false;
            })
        end
	end
end)

print("Jailbreak+ (v"..Version..") initiated sucessfully")
