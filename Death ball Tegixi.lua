--[[
    DEATH BALL | CUSTOM INTERFACE (NEON RED)
]]

if getgenv().CustomInterfaceLoaded then return end
getgenv().CustomInterfaceLoaded = true

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- ======================== НАСТРОЙКИ ========================
local themeColor = Color3.fromRGB(255, 0, 0) -- Неоново-красный
local bgTransparency = 0.3 -- Прозрачность фона
local cornerRadius = 12 -- Закругление углов

-- ======================== СОЗДАЁМ GUI ========================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomDeathBallGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- ======================== ГЛАВНОЕ ОКНО ========================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 350, 0, 450)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.BackgroundTransparency = bgTransparency
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = themeColor
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Закруглённые углы
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, cornerRadius)
mainCorner.Parent = mainFrame

-- Неоновая обводка
local mainStroke = Instance.new("UIStroke")
mainStroke.Color = themeColor
mainStroke.Thickness = 2
mainStroke.Transparency = 0.3
mainStroke.Parent = mainFrame

-- Заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "⚡ DEATH BALL | CLIENT"
title.TextColor3 = themeColor
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Кнопка закрытия (минус)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
closeBtn.Text = "—"
closeBtn.TextColor3 = themeColor
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    circleBtn.Visible = true
end)

-- ======================== КРУЖОК «Т» (КОГДА МЕНЮ ЗАКРЫТО) ========================
local circleBtn = Instance.new("TextButton")
circleBtn.Name = "CircleBtn"
circleBtn.Size = UDim2.new(0, 50, 0, 50)
circleBtn.Position = UDim2.new(0, 20, 0, 20)
circleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
circleBtn.Text = "Т"
circleBtn.TextColor3 = themeColor
circleBtn.TextScaled = true
circleBtn.Font = Enum.Font.GothamBold
circleBtn.Parent = screenGui

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0)
circleCorner.Parent = circleBtn

local circleStroke = Instance.new("UIStroke")
circleStroke.Color = themeColor
circleStroke.Thickness = 2
circleStroke.Parent = circleBtn

circleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    circleBtn.Visible = false
end)

-- ======================== СОЗДАЁМ ПЕРЕКЛЮЧАТЕЛЬ ========================
local function createToggle(parent, text, y, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 35)
    frame.Position = UDim2.new(0, 10, 0, y)
    frame.BackgroundTransparency = 1
    frame.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 60, 0, 30)
    btn.Position = UDim2.new(0.7, 0, 0, 2)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.Text = "OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and themeColor or Color3.fromRGB(60, 60, 60)
        btn.Text = state and "ON" or "OFF"
        callback(state)
    end)
end

-- ======================== ДОБАВЛЯЕМ ФИЧИ ========================
createToggle(mainFrame, "⚡ Auto-Parry", 50, function(state) print("Auto-Parry:", state) end)
createToggle(mainFrame, "👁️ Ball ESP", 90, function(state) print("Ball ESP:", state) end)
createToggle(mainFrame, "💨 Auto Dodge", 130, function(state) print("Auto Dodge:", state) end)
createToggle(mainFrame, "💀 Auto Boss Farm", 170, function(state) print("Auto Boss:", state) end)
createToggle(mainFrame, "⚡ ENEL PACK", 210, function(state) print("Enel Pack:", state) end)

-- ======================== ИНФО ========================
local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, 0, 0, 40)
infoLabel.Position = UDim2.new(0, 0, 0, 260)
infoLabel.BackgroundTransparency = 1
infoLabel.Text = "⚡ DEATH BALL CLIENT\nby DeepSeek & Vision"
infoLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
infoLabel.TextScaled = true
infoLabel.Font = Enum.Font.Gotham
infoLabel.Parent = mainFrame

print("⚡ Custom Interface загружен!")
