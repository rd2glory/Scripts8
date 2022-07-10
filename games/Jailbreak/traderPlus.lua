local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/misc/kavo.lua"))()

-- temp
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local HB = game:GetService("RunService").Heartbeat

local player = Players.LocalPlayer

-- init
local defaultTheme = "Midnight"
local trader = Library.CreateLib("Trader+", defaultTheme)

-- variables
local updateOffering = RS.TradeUpdateOffering

local autoReady = false
local items = {}
local itemCategories = {}

local categories = {"vehicle","furniture","weapon skin","texture","rim","spoiler","tire","horn","color"}

-- pages
local replacer = trader:NewTab("Replacer")
local ui = trader:NewTab("UI")

-- sections
local replaceMain = replacer:NewSection("Main")
local keybindsMain = ui:NewSection("Keybinds")
local themeMain = ui:NewSection("Theme")

local Replacing

do
    -- Gui to Lua
    -- Version: 3.2

    -- Instances:

    Replacing = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Frame_2 = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TextLabel = Instance.new("TextLabel")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

    --Properties:

    Replacing.Name = "Replacing"
    Replacing.Parent = game:GetService("CoreGui")
    Replacing.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Replacing.DisplayOrder = 3
    Replacing.ResetOnSpawn = false
    Replacing.Enabled = false

    Frame.Parent = Replacing
    Frame.Active = true
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BackgroundTransparency = 1.000
    Frame.Position = UDim2.new(0.5, 0, 0.550000012, 0)
    Frame.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
    Frame.ZIndex = 2

    Frame_2.Parent = Frame
    Frame_2.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    Frame_2.BackgroundTransparency = 0.400
    Frame_2.Size = UDim2.new(1, 0, 1, 0)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Frame_2

    TextLabel.Parent = Frame_2
    TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel.Size = UDim2.new(0.75, 0, 0.600000024, 0)
    TextLabel.Font = Enum.Font.Bangers
    TextLabel.Text = "Replacing..."
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true

    UIAspectRatioConstraint.Parent = Frame
    UIAspectRatioConstraint.AspectRatio = 1.600

end

task.wait(0.05)

local function replace()
    local function errorReplacing(reason)
        trader:Notify("Replace Error",reason)
    end

    local plrGui = player:FindFirstChild("PlayerGui")
    local tradeApp = plrGui and plrGui:FindFirstChild("AppUI") or false

    if tradeApp then
        local function tradeFrame(dontYield)
            if dontYield then
                return tradeApp:FindFirstChild("Trade")
            else
                return tradeApp:WaitForChild("Trade")
            end
        end

        if tradeFrame(true) then
            Replacing.Enabled = true

            if not tradeFrame():FindFirstChild("ItemsContainer") then
                local e = getconnections(tradeApp.Buttons.Sidebar.Trade.Trade.MouseButton1Down)
                e[1]:Fire()
            end

            while tradeFrame():FindFirstChild("ItemsContainer") == nil do
                HB:Wait()
            end

            local scroll = tradeFrame():FindFirstChild("ItemTypesContainer").ScrollingGrid

            local itemIDs = {}

            for i,v in ipairs(items) do
                local num = tostring(table.find(categories,itemCategories[i]) or 1)

                while scroll[num].UIStroke.Enabled == false do
                    local e = getconnections(scroll[num].Activated)
                    e[1]:Fire()
                    HB:Wait()
                end

                local container = tradeFrame().ItemsContainer.ScrollingGrid

                for _,j in pairs(container:GetChildren()) do
                    local thisId = j.Name
                    local thisModel = j.Title.Text.Text

                    if string.lower(thisModel) == string.lower(v) and not table.find(itemIDs,thisId) then
                        table.insert(itemIDs,thisId)
                        break
                    end
                end
            end

            do
                local e = getconnections(tradeApp.Buttons.Sidebar.Trade.Trade.MouseButton1Down)
                e[1]:Fire()
            end

            if #itemIDs == #items then
                updateOffering:FireServer(autoReady,itemIDs)
                task.wait(0.5)
            else
                errorReplacing("Could not find all items in inventory")
            end
        else
            errorReplacing("Not in a trade")
        end


    else
        errorReplacing("App UI not fully loaded in yet")
    end

    Replacing.Enabled = false
end
task.wait(0.5)
-- elements
replaceMain:NewToggle("Auto-Ready","Ready the trade after replacing",function(value)
    autoReady = value
end)
replaceMain:NewButton("Replace","Replace current offerings with values given",replace)
keybindsMain:NewKeybind("Toggle UI", "Default is LeftCtrl", Enum.KeyCode.LeftControl, function()
	Library:ToggleUI()
end)
--[[
themeMain:NewDropdown("Current Theme", "Default is "..defaultTheme, {    LightTheme
DarkTheme
GrapeTheme
BloodTheme
Ocean
Midnight
Sentinel
Synapse}, function(currentOption)
    print(currentOption)
end)
]]--

-- add item slots
for i=1,8 do
    HB:Wait()
    local thisItemSection = replacer:NewSection("Item "..tostring(i))

    thisItemSection:NewTextBox("Item Name","Use name in inventory, leave blank for nothing",function(value)
        value = string.lower(value)

        if value == "" then
            items[i] = nil
        else
            items[i] = value
        end
    end)

    itemCategories[i] = "vehicle"

    thisItemSection:NewTextBox("Category","What category to search for the item in (default: vehicle)",function(value)
        value = string.lower(value)

        if value == "" then
            value = "vehicle"
        end

        itemCategories[i] = value
    end)
end
