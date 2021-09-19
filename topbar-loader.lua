local loader = {}
loader.__index = loader

local RunService = game:GetService("RunService")
local CoreGui = RunService:IsStudio() and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") or game:GetService("CoreGui")

local Gui = CoreGui:FindFirstChild("CustomTopbar") or Instance.new("ScreenGui")

local _w = warn
local function warn(message)
    _w("[Topbar Loader] ")
end

Gui.Name = "CustomTopbar"
Gui.IgnoreGuiInset = true
Gui.Parent = CoreGui

do
    -- Gui to Lua
    -- Version: 3.2

    -- Instances:

    local TopBarFrame = Instance.new("Frame")
    local RightFrame = Instance.new("Frame")
    local MoreMenu = Instance.new("Frame")
    local Layout = Instance.new("UIListLayout")
    local HealthBar = Instance.new("Frame")
    local LeftFrame = Instance.new("Frame")
    local Layout_2 = Instance.new("UIListLayout")
    local Placeholder2 = Instance.new("Frame")
    local Placeholder1 = Instance.new("Frame")

    --Properties:

    TopBarFrame.Name = "TopBarFrame"
    TopBarFrame.Parent = Gui
    TopBarFrame.BackgroundTransparency = 1.000
    TopBarFrame.Size = UDim2.new(1, 0, 0, 36)

    RightFrame.Name = "RightFrame"
    RightFrame.Parent = TopBarFrame
    RightFrame.AnchorPoint = Vector2.new(1, 0)
    RightFrame.BackgroundTransparency = 1.000
    RightFrame.Position = UDim2.new(1, -16, 0, 0)
    RightFrame.Size = UDim2.new(0.5, -16, 1, 0)

    MoreMenu.Name = "MoreMenu"
    MoreMenu.Parent = RightFrame
    MoreMenu.BackgroundTransparency = 1.000
    MoreMenu.LayoutOrder = 2
    MoreMenu.Size = UDim2.new(0, 32, 1, 0)

    Layout.Name = "Layout"
    Layout.Parent = RightFrame
    Layout.FillDirection = Enum.FillDirection.Horizontal
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.VerticalAlignment = Enum.VerticalAlignment.Center
    Layout.Padding = UDim.new(0, 12)

    HealthBar.Name = "HealthBar"
    HealthBar.Parent = RightFrame
    HealthBar.BackgroundTransparency = 1.000
    HealthBar.Size = UDim2.new(0, 80, 1, 0)
    HealthBar.Visible = false

    LeftFrame.Name = "LeftFrame"
    LeftFrame.Parent = TopBarFrame
    LeftFrame.BackgroundTransparency = 1.000
    LeftFrame.Position = UDim2.new(0, 16, 0, 0)
    LeftFrame.Size = UDim2.new(0.5, -16, 1, 0)

    Layout_2.Name = "Layout"
    Layout_2.Parent = LeftFrame
    Layout_2.FillDirection = Enum.FillDirection.Horizontal
    Layout_2.SortOrder = Enum.SortOrder.LayoutOrder
    Layout_2.VerticalAlignment = Enum.VerticalAlignment.Center
    Layout_2.Padding = UDim.new(0, 12)

    Placeholder2.Name = "Placeholder2"
    Placeholder2.Parent = LeftFrame
    Placeholder2.BackgroundTransparency = 1.000
    Placeholder2.LayoutOrder = 1
    Placeholder2.Size = UDim2.new(0, 32, 1, 0)

    Placeholder1.Name = "Placeholder1"
    Placeholder1.Parent = LeftFrame
    Placeholder1.BackgroundTransparency = 1.000
    Placeholder1.LayoutOrder = 1
    Placeholder1.Size = UDim2.new(0, 32, 1, 0)
end

local function makeButton()
    -- Gui to Lua
    -- Version: 3.2

    -- Instances:

    local Frame = Instance.new("Frame")
    local Background = Instance.new("ImageButton")
    local Icon = Instance.new("ImageLabel")
    local StateOverlay = Instance.new("ImageLabel")
    local Label = Instance.new("TextLabel")
    local Button = Instance.new("TextButton")

    --Properties:

    Frame.BackgroundTransparency = 1
    Frame.LayoutOrder = 1
    Frame.Size = UDim2.new(0, 32, 1, 0)

    Background.Name = "Background"
    Background.Parent = Frame
    Background.AnchorPoint = Vector2.new(0, 1)
    Background.BackgroundTransparency = 1
    Background.Position = UDim2.new(0, 0, 1, 0)
    Background.Size = UDim2.new(0, 32, 0, 32)
    Background.Image = "rbxasset://textures/ui/TopBar/iconBase.png"

    Icon.Name = "Icon"
    Icon.Parent = Background
    Icon.AnchorPoint = Vector2.new(0.5, 0.5)
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
    Icon.Size = UDim2.new(0, 24, 0, 24)
    Icon.Visible = false
    Icon.Image = "rbxasset://textures/ui/TopBar/coloredlogo.png"

    StateOverlay.Name = "StateOverlay"
    StateOverlay.Parent = Background
    StateOverlay.BackgroundTransparency = 1
    StateOverlay.Size = UDim2.new(1, 0, 1, 0)
    StateOverlay.ZIndex = 2
    StateOverlay.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_1.png"
    StateOverlay.ImageRectOffset = Vector2.new(454, 487)
    StateOverlay.ImageRectSize = Vector2.new(17, 17)
    StateOverlay.ImageTransparency = 1
    StateOverlay.ScaleType = Enum.ScaleType.Slice
    StateOverlay.SliceCenter = Rect.new(8, 8, 8, 8)

    Label.Name = "Label"
    Label.Parent = Background
    Label.AnchorPoint = Vector2.new(0.5, 0.5)
    Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0.5, -1, 0.5, 0)
    Label.Size = UDim2.new(0, 24, 0, 24)
    Label.Font = Enum.Font.GothamBold
    Label.Text = "NIL"
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextScaled = true
    Label.TextSize = 14
    Label.TextWrapped = true

    Button.Name = "Button"
    Button.Parent = Background
    Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundTransparency = 1
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.ZIndex = 256
    Button.Font = Enum.Font.SourceSans
    Button.Text = ""
    Button.TextColor3 = Color3.fromRGB(0, 0, 0)
    Button.TextSize = 14
    Button.TextTransparency = 1

    return Frame -- frame is not parented
end

function loader.new(buttonPreset)
    local button = makeButton()

    local self = setmetatable({
        hooks = {};
        instance = button;
    },loader)

    do
        local black = Color3.new(0,0,0)
        local white = Color3.new(1,1,1)
    
        local background = button.Background
    
        local overlay = background.StateOverlay
        local button = background.Button
    
        local pressing = false
    
        button.MouseButton1Down:Connect(function()
            pressing = true
            overlay.ImageColor3 = black
            overlay.ImageTransparency = 0.7
        end)
    
        button.MouseButton1Up:Connect(function()
            if pressing then
                pressing = false
                overlay.ImageColor3 = white
                overlay.ImageTransparency = 0.9
                self:Activate()
            end
        end)
    
        button.MouseEnter:Connect(function()
            overlay.ImageColor3 = white
            overlay.ImageTransparency = 0.9
        end)
    
        button.MouseLeave:Connect(function()
            overlay.ImageColor3 = white
            overlay.ImageTransparency = 1
        end)
    end

    local presets = {
        ["Toggle"] = function()
            local onColor = Color3.fromRGB(85, 255, 0)
            local offColor = Color3.fromRGB(255, 0, 85)

            self.toggle = false
            self.hookToggles = {}

            self:Hook(function()
                self.toggle = not self.toggle

                local label = button.Background.Label

                label.Text = self.toggle and "ON" or "OFF"
                label.TextColor3 = self.toggle and onColor or offColor

                for i,v in pairs(self.hookToggles) do
                    coroutine.wrap(v)(self.toggle)
                end
            end)

            self:Activate()
        end;
    }

    local presetFunction = presets[buttonPreset]

    if presetFunction then
        self.preset = buttonPreset
        presetFunction()
    end

    button.Parent = Gui.TopBarFrame.LeftFrame

    return self
end

function loader:IsA(preset)
    return self.preset == preset
end

function loader:Activate()
    for i,v in pairs(self.hooks) do
        coroutine.wrap(v)()
    end
end

function loader:Hook(onActivate)
    table.insert(self.hooks,onActivate)
end

function loader:HookToggle(onToggle)
    if self:IsA("Toggle") then
        table.insert(self.hookToggles,onToggle)
    else
        warn("Cannot hook a toggle if button is not a toggle!")
    end
end

shared.topbar = loader
