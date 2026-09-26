-- Buddy Hub UI - Blox Fruits (Premium Style)
-- Optimized for Delta Executor (iPad)

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("BuddyHub_UI") then
    CoreGui.BuddyHub_UI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BuddyHub_UI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Window Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -170)
MainFrame.Size = UDim2.new(0, 560, 0, 340)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(50, 50, 70)
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame

-- Top Bar / Header
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 45, 0, 0)
TitleLabel.Size = UDim2.new(0, 200, 1, 0)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "BUDDY HUB"
TitleLabel.TextColor3 = Color3.fromRGB(220, 225, 255)
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = TopBar
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0, 130, 0, 0)
SubTitle.Size = UDim2.new(0, 200, 1, 0)
SubTitle.Font = Enum.Font.SourceSans
SubTitle.Text = "Play Better . Faster . Together"
SubTitle.TextColor3 = Color3.fromRGB(120, 120, 150)
SubTitle.TextSize = 11
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

local StatusBadge = Instance.new("TextLabel")
StatusBadge.Parent = TopBar
StatusBadge.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
StatusBadge.Position = UDim2.new(1, -150, 0.5, -10)
StatusBadge.Size = UDim2.new(0, 90, 0, 20)
StatusBadge.Font = Enum.Font.SourceSans
StatusBadge.Text = "  🟢 Status : ปลอดภัย"
StatusBadge.TextColor3 = Color3.fromRGB(150, 220, 150)
StatusBadge.TextSize = 11
local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 4)
StatusCorner.Parent = StatusBadge

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.Size = UDim2.new(0, 35, 1, 0)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(180, 180, 200)
CloseBtn.TextSize = 14

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Sidebar Menu
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundTransparency = 1
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.Size = UDim2.new(0, 115, 1, -40)
Sidebar.CanvasSize = UDim2.new(0, 0, 1.2, 0)
Sidebar.ScrollBarThickness = 2

local function createMenuBtn(name, posY)
    local btn = Instance.new("TextButton")
    btn.Parent = Sidebar
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    btn.Position = UDim2.new(0, 8, 0, posY)
    btn.Size = UDim2.new(0, 100, 0, 28)
    btn.Font = Enum.Font.SourceSans
    btn.Text = "  " .. name
    btn.TextColor3 = Color3.fromRGB(180, 180, 210)
    btn.TextSize = 13
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    return btn
end

createMenuBtn("🏠 หน้าหลัก", 5)
createMenuBtn("⚔️ ฟาร์ม", 38)
createMenuBtn("🎯 ออโต้", 71)
createMenuBtn("⚡ สกิล", 104)
createMenuBtn("📦 ไอเทม", 137)
createMenuBtn("⚙️ ตั้งค่า", 170)
createMenuBtn("ℹ️ เกี่ยวกับ", 203)

-- Content Area (Grid Layout)
local ContentArea = Instance.new("Frame")
ContentArea.Parent = MainFrame
ContentArea.BackgroundTransparency = 1
ContentArea.Position = UDim2.new(0, 120, 0, 45)
ContentArea.Size = UDim2.new(1, -130, 1, -50)

local function createBox(title, posX, posY, sizeX, sizeY)
    local box = Instance.new("Frame")
    box.Parent = ContentArea
    box.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    box.Position = posX
    box.Size = sizeX
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = box
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(35, 35, 50)
    stroke.Parent = box
    
    local lbl = Instance.new("TextLabel")
    lbl.Parent = box
    lbl.BackgroundTransparency = 1
    lbl.Position = UDim2.new(0, 10, 0, 5)
    lbl.Size = UDim2.new(1, -20, 0, 20)
    lbl.Font = Enum.Font.SourceSansBold
    lbl.Text = title
    lbl.TextColor3 = Color3.fromRGB(200, 205, 230)
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    return box
end

local Box1 = createBox("⚔️ ฟาร์มมอนสเตอร์ในมิติ", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.48, 0))
local Box2 = createBox("⚡ ออโต้", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.48, 0))
local Box3 = createBox("🛡️ ตัวช่วย", UDim2.new(0, 0, 0.51, 0), UDim2.new(0.48, 0, 0.46, 0))
local Box4 = createBox("📦 ไอเทม & อาวุธ", UDim2.new(0.51, 0, 0.51, 0), UDim2.new(0.48, 0, 0.46, 0))

local function addToggle(parent, text, posY)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = parent
    lbl.BackgroundTransparency = 1
    lbl.Position = UDim2.new(0, 10, 0, posY)
    lbl.Size = UDim2.new(0, 130, 0, 20)
    lbl.Font = Enum.Font.SourceSans
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(160, 165, 190)
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Parent = parent
    toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    toggleBtn.Position = UDim2.new(1, -45, 0, posY + 2)
    toggleBtn.Size = UDim2.new(0, 35, 0, 16)
    toggleBtn.Text = ""
    
    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(1, 0)
    tCorner.Parent = toggleBtn
    
    local circle = Instance.new("Frame")
    circle.Parent = toggleBtn
    circle.BackgroundColor3 = Color3.fromRGB(200, 200, 220)
    circle.Position = UDim2.new(0, 2, 0, 2)
    circle.Size = UDim2.new(0, 12, 0, 12)
    local cCorner = Instance.new("UICorner")
    cCorner.CornerRadius = UDim.new(1, 0)
    cCorner.Parent = circle
    
    local active = false
    toggleBtn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 140, 240)
            circle.Position = UDim2.new(1, -14, 0, 2)
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
            circle.Position = UDim2.new(0, 2, 0, 2)
        end
    end)
end

addToggle(Box1, "ฟาร์มมอนสเตอร์", 28)
addToggle(Box1, "ฟาร์มเงินเวล", 52)
addToggle(Box1, "ฟาร์มเงิน/เบอร์รี่", 76)
addToggle(Box1, "สปีดโหมดอัตโนมัติ", 100)

addToggle(Box2, "ออโต้ตีคน", 28)
addToggle(Box2, "ออโต้ตีโค้ดเดลต้า", 52)
addToggle(Box2, "ออโต้ช่วยเหลือ", 76)

addToggle(Box3, "เปิดสะทะดูคีย์วาร์ป", 25)
addToggle(Box3, "ครอบคลุมคูล", 47)
addToggle(Box3, "อัฉริยะการตก", 69)
addToggle(Box3, "มองเห็นศัตรู (ESP)", 91)

addToggle(Box4, "เก็บไอเท็มอัตโนมัติ", 28)
addToggle(Box4, "เพิ่มความหายากไอเทม", 52)
addToggle(Box4, "ให้อาหารสัตว์ออโต้", 76)

print("Buddy Hub Custom UI Loaded Successfully!")
