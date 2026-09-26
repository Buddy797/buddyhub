-- โครงสร้างสคริปต์สไตล์ Maru Hub / Buddy Hub (Native UI สำหรับ Delta iPad)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")

-- แถบเมนูซ้าย (Categories)
local TabList = Instance.new("ScrollingFrame")
local Tab1 = Instance.new("TextButton")
local Tab2 = Instance.new("TextButton")
local Tab3 = Instance.new("TextButton")

-- หน้าต่างเนื้อหาขวา (Content Container)
local ContentFrame = Instance.new("Frame")

-- หน้าที่ 1: ฟาร์ม
local FarmContent = Instance.new("ScrollingFrame")
local FarmToggle = Instance.new("TextButton")
local ChestToggle = Instance.new("TextButton")

-- หน้าที่ 2: ออโต้ & ต่อสู้
local CombatContent = Instance.new("ScrollingFrame")
local BossToggle = Instance.new("TextButton")
local SkillToggle = Instance.new("TextButton")

-- หน้าที่ 3: วาร์ป & ตั้งค่า
local TeleportContent = Instance.new("ScrollingFrame")
local TpButton = Instance.new("TextButton")

-- ตั้งค่าหน้าจอหลัก
ScreenGui.Name = "MaruHubStyle_UI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -150)
MainFrame.Size = UDim2.new(0, 480, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

-- หัวข้อ Hub
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "   MARU HUB - Blox Fruits (iPad Version)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left

-- ปุ่มปิด (X)
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Position = UDim2.new(1, -35, 0, 4)
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- แถบเมนูด้านซ้าย
TabList.Parent = MainFrame
TabList.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TabList.Position = UDim2.new(0, 0, 0, 40)
TabList.Size = UDim2.new(0, 130, 1, -40)
TabList.CanvasSize = UDim2.new(0, 0, 0, 0)

Tab1.Parent = TabList
Tab1.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
Tab1.Position = UDim2.new(0, 10, 0, 10)
Tab1.Size = UDim2.new(0, 110, 0, 35)
Tab1.Font = Enum.Font.SourceSansBold
Tab1.Text = "1. ฟาร์มหลัก"
Tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1.TextSize = 14

Tab2.Parent = TabList
Tab2.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
Tab2.Position = UDim2.new(0, 10, 0, 55)
Tab2.Size = UDim2.new(0, 110, 0, 35)
Tab2.Font = Enum.Font.SourceSansBold
Tab2.Text = "2. ต่อสู้ & บอส"
Tab2.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab2.TextSize = 14

Tab3.Parent = TabList
Tab3.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
Tab3.Position = UDim2.new(0, 10, 0, 100)
Tab3.Size = UDim2.new(0, 110, 0, 35)
Tab3.Font = Enum.Font.SourceSansBold
Tab3.Text = "3. วาร์ปเกาะ"
Tab3.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab3.TextSize = 14

-- พื้นที่แสดงเนื้อหาด้านขวา
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 40)
ContentFrame.Position = UDim2.new(0, 130, 0, 40)
ContentFrame.Size = UDim2.new(1, -130, 1, -40)

-- ตั้งค่าหน้า 1 (ฟาร์ม)
FarmContent.Parent = ContentFrame
FarmContent.Size = UDim2.new(1, 0, 1, 0)
FarmContent.BackgroundTransparency = 1
FarmContent.Visible = true

FarmToggle.Parent = FarmContent
FarmToggle.BackgroundColor3 = Color3.fromRGB(45, 140, 255)
FarmToggle.Position = UDim2.new(0.05, 0, 0.08, 0)
FarmToggle.Size = UDim2.new(0.9, 0, 0, 40)
FarmToggle.Font = Enum.Font.SourceSansBold
FarmToggle.Text = "[ปิด] ออโต้ฟาร์มเลเวล + เควสต์"
FarmToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmToggle.TextSize = 14

local fActive = false
FarmToggle.MouseButton1Click:Connect(function()
    fActive = not fActive
    if fActive then
        FarmToggle.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
        FarmToggle.Text = "[เปิด] กำลังออโต้ฟาร์มเลเวล"
    else
        FarmToggle.BackgroundColor3 = Color3.fromRGB(45, 140, 255)
        FarmToggle.Text = "[ปิด] ออโต้ฟาร์มเลเวล + เควสต์"
    end
end)

ChestToggle.Parent = FarmContent
ChestToggle.BackgroundColor3 = Color3.fromRGB(45, 140, 255)
ChestToggle.Position = UDim2.new(0.05, 0, 0.3, 0)
ChestToggle.Size = UDim2.new(0.9, 0, 0, 40)
ChestToggle.Font = Enum.Font.SourceSansBold
ChestToggle.Text = "[ปิด] ออโต้เก็บกล่องสมบัติ (หาเงิน)"
ChestToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ChestToggle.TextSize = 14

local cActive = false
ChestToggle.MouseButton1Click:Connect(function()
    cActive = not cActive
    if cActive then
        ChestToggle.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
        ChestToggle.Text = "[เปิด] กำลังเก็บกล่องสมบัติ"
    else
        ChestToggle.BackgroundColor3 = Color3.fromRGB(45, 140, 255)
        ChestToggle.Text = "[ปิด] ออโต้เก็บกล่องสมบัติ (หาเงิน)"
    end
end)

-- ตั้งค่าหน้า 2 (ต่อสู้)
CombatContent.Parent = ContentFrame
CombatContent.Size = UDim2.new(1, 0, 1, 0)
CombatContent.BackgroundTransparency = 1
CombatContent.Visible = false

BossToggle.Parent = CombatContent
BossToggle.BackgroundColor3 = Color3.fromRGB(45, 140, 255)
BossToggle.Position = UDim2.new(0.05, 0, 0.08, 0)
BossToggle.Size = UDim2.new(0.9, 0, 0, 40)
BossToggle.Font = Enum.Font.SourceSansBold
BossToggle.Text = "[ปิด] ออโต้ล่าบอสประจำเกาะ"
BossToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
BossToggle.TextSize = 14

local bActive = false
BossToggle.MouseButton1Click:Connect(function()
    bActive = not bActive
    if bActive then
        BossToggle.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
        BossToggle.Text = "[เปิด] กำลังล่าบอสอัตโนมัติ"
    else
        BossToggle.BackgroundColor3 = Color3.fromRGB(45, 140, 255)
        BossToggle.Text = "[ปิด] ออโต้ล่าบอสประจำเกาะ"
    end
end)

SkillToggle.Parent = CombatContent
SkillToggle.BackgroundColor3 = Color3.fromRGB(45, 140, 255)
SkillToggle.Position = UDim2.new(0.05, 0, 0.3, 0)
SkillToggle.Size = UDim2.new(0.9, 0, 0, 40)
SkillToggle.Font = Enum.Font.SourceSansBold
SkillToggle.Text = "[เปิด] ออโต้กดสกิล (Z X C V)"
SkillToggle.TextColor3 = Color3.fromRGB(50, 205, 50)
SkillToggle.TextSize = 14

-- ตั้งค่าหน้า 3 (วาร์ป)
TeleportContent.Parent = ContentFrame
TeleportContent.Size = UDim2.new(1, 0, 1, 0)
TeleportContent.BackgroundTransparency = 1
TeleportContent.Visible = false

TpButton.Parent = TeleportContent
TpButton.BackgroundColor3 = Color3.fromRGB(70, 70, 95)
TpButton.Position = UDim2.new(0.05, 0, 0.08, 0)
TpButton.Size = UDim2.new(0.9, 0, 0, 40)
TpButton.Font = Enum.Font.SourceSansBold
TpButton.Text = "วาร์ปไปเกาะถัดไปอัตโนมัติ"
TpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TpButton.TextSize = 14
TpButton.MouseButton1Click:Connect(function()
    TpButton.Text = "กำลังวาร์ป..."
    task.wait(1)
    TpButton.Text = "วาร์ปไปเกาะถัดไปอัตโนมัติ"
end)

-- ระบบสลับหน้าจอแท็บซ้าย
Tab1.MouseButton1Click:Connect(function()
    FarmContent.Visible = true
    CombatContent.Visible = false
    TeleportContent.Visible = false
    Tab1.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    Tab2.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    Tab3.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
end)

Tab2.MouseButton1Click:Connect(function()
    FarmContent.Visible = false
    CombatContent.Visible = true
    TeleportContent.Visible = false
    Tab1.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    Tab2.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    Tab3.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
end)

Tab3.MouseButton1Click:Connect(function()
    FarmContent.Visible = false
    CombatContent.Visible = false
    TeleportContent.Visible = true
    Tab1.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    Tab2.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    Tab3.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
end)
