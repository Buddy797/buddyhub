-- ==========================================
-- BUDDY HUB - Ultimate Edition (Maru Style)
-- Optimized for Delta iPad & Roblox Blox Fruits
-- ==========================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("BuddyHub_Ultimate_Full") then
    CoreGui.BuddyHub_Ultimate_Full:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BuddyHub_Ultimate_Full"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Floating Toggle Button (ปุ่มเปิด-ปิด UI ลอยตัว)
local OpenBtn = Instance.new("TextButton")
OpenBtn.Name = "OpenButton"
OpenBtn.Parent = ScreenGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
OpenBtn.Position = UDim2.new(0, 15, 0.4, 0)
OpenBtn.Size = UDim2.new(0, 48, 0, 48)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.Text = "BUDDY"
OpenBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
OpenBtn.TextSize = 10

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenBtn

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Color = Color3.fromRGB(0, 170, 255)
OpenStroke.Thickness = 2
OpenStroke.Parent = OpenBtn

-- Main Window Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
MainFrame.Position = UDim2.new(0.5, -290, 0.5, -180)
MainFrame.Size = UDim2.new(0, 580, 0, 360)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 45, 65)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
TopBar.Size = UDim2.new(1, 0, 0, 36)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 10)
TopCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 380, 1, 0)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "BUDDY HUB - Blox Fruits (Ultimate Edition)"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Hide & Close Buttons
local HideBtn = Instance.new("TextButton")
HideBtn.Parent = TopBar
HideBtn.BackgroundTransparency = 1
HideBtn.Position = UDim2.new(1, -75, 0, 0)
HideBtn.Size = UDim2.new(0, 35, 1, 0)
HideBtn.Font = Enum.Font.SourceSansBold
HideBtn.Text = "-"
HideBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
HideBtn.TextSize = 20

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -38, 0, 0)
CloseBtn.Size = UDim2.new(0, 35, 1, 0)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
CloseBtn.TextSize = 14

HideBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Sidebar Menu Pages
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundTransparency = 1
Sidebar.Position = UDim2.new(0, 0, 0, 42)
Sidebar.Size = UDim2.new(0, 140, 1, -42)
Sidebar.CanvasSize = UDim2.new(0, 0, 1.6, 0)
Sidebar.ScrollBarThickness = 2

local Pages = {}
local ContentPages = Instance.new("Folder")
ContentPages.Parent = MainFrame

local function createPage(name, posY, index)
    local btn = Instance.new("TextButton")
    btn.Parent = Sidebar
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
    btn.Position = UDim2.new(0, 8, 0, posY)
    btn.Size = UDim2.new(0, 124, 0, 32)
    btn.Font = Enum.Font.SourceSansBold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(190, 195, 220)
    btn.TextSize = 12
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    local pageFrame = Instance.new("ScrollingFrame")
    pageFrame.Parent = ContentPages
    pageFrame.BackgroundTransparency = 1
    pageFrame.Position = UDim2.new(0, 148, 0, 46)
    pageFrame.Size = UDim2.new(1, -155, 1, -55)
    pageFrame.CanvasSize = UDim2.new(0, 0, 1.8, 0)
    pageFrame.ScrollBarThickness = 3
    pageFrame.Visible = (index == 1)
    
    table.insert(Pages, {Button = btn, Frame = pageFrame})
    
    btn.MouseButton1Click:Connect(function()
        for _, p in ipairs(Pages) do
            p.Frame.Visible = false
            p.Button.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
            p.Button.TextColor3 = Color3.fromRGB(190, 195, 220)
        end
        pageFrame.Visible = true
        btn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    if index == 1 then
        btn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
    
    return pageFrame
end

local Page1 = createPage("⚔️ ตั้งค่าฟาร์ม", 5, 1)
local Page2 = createPage("⚡ ออโต้พิเศษ", 42, 2)
local Page3 = createPage("🔥 เผ่า V3/V4", 79, 3)
local Page4 = createPage("🌊 ซีอีเวนต์/ทะเล", 116, 4)
local Page5 = createPage("⚙️ ตั้งค่าระบบ", 153, 5)

-- Helper: Create Box Section
local function createSection(parent, title, posX, posY, sizeX, sizeY)
    local box = Instance.new("Frame")
    box.Parent = parent
    box.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
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
    lbl.TextColor3 = Color3.fromRGB(220, 225, 255)
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    return box
end

-- Helper: Add Toggle Switch
local function addToggle(parent, text, posY, callback)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = parent
    lbl.BackgroundTransparency = 1
    lbl.Position = UDim2.new(0, 10, 0, posY)
    lbl.Size = UDim2.new(0, 145, 0, 22)
    lbl.Font = Enum.Font.SourceSans
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(160, 165, 190)
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Parent = parent
    toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    toggleBtn.Position = UDim2.new(1, -42, 0, posY + 3)
    toggleBtn.Size = UDim2.new(0, 32, 0, 16)
    toggleBtn.Text = ""
    
    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(1, 0)
    tCorner.Parent = toggleBtn
    
    local circle = Instance.new("Frame")
    circle.Parent = toggleBtn
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.Position = UDim2.new(0, 2, 0, 2)
    circle.Size = UDim2.new(0, 12, 0, 12)
    local cCorner = Instance.new("UICorner")
    cCorner.CornerRadius = UDim.new(1, 0)
    cCorner.Parent = circle
    
    local active = false
    toggleBtn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            circle.Position = UDim2.new(1, -14, 0, 2)
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
            circle.Position = UDim2.new(0, 2, 0, 2)
        end
        if callback then callback(active) end
    end)
end

-- PAGE 1: ตั้งค่าฟาร์ม (Farm Settings)
local S1_B1 = createSection(Page1, "⚔️ เลือกอาวุธ & ระบบฟาร์ม", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.52, 0))
local S1_B2 = createSection(Page1, "⚡ ความเร็ว & โจมตีออโต้", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.52, 0))

addToggle(S1_B1, "ออโต้ฟาร์มเลเวล (Auto Farm Level)", 28, function(v) print("Farm Level:", v) end)
addToggle(S1_B1, "ออโต้รับเควสหลัก (Auto Quest)", 54, function(v) print("Auto Quest:", v) end)
addToggle(S1_B1, "ใช้อาวุธหมัด/เมลี (Select Melee)", 80, function(v) print("Use Melee:", v) end)
addToggle(S1_B1, "ใช้อาวุธปืน (Select Gun)", 106, function(v) print("Use Gun:", v) end)
addToggle(S1_B1, "ใช้อาวุธผลไม้ (Select Fruit)", 132, function(v) print("Use Fruit:", v) end)

addToggle(S1_B2, "Fast Attack (ตีเร็วสุดพิเศษ)", 28, function(v) print("Fast Attack:", v) end)
addToggle(S1_B2, "Bring Mobs (ดึงมอนสเตอร์รอบเกาะ)", 54, function(v) print("Bring Mobs:", v) end)
addToggle(S1_B2, "ออโต้เปิดฮาคิสังเกต (Ken Haki)", 80, function(v) print("Ken Haki:", v) end)
addToggle(S1_B2, "ออโต้เปิดเกราะบอดี้ (Busoshoku)", 106, function(v) print("Buso Haki:", v) end)
addToggle(S1_B2, "Anti AFK (กันหลุดห้อง)", 132, function(v) print("Anti AFK:", v) end)

-- PAGE 2: ออโต้พิเศษ (Special & Max Level)
local S2_B1 = createSection(Page2, "🎯 ฟังก์ชันปั้นไก่ตัน & กล่อง", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.48, 0))
local S2_B2 = createSection(Page2, "📦 ร้านค้า & สุ่มผลไม้", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.48, 0))

addToggle(S2_B1, "ออโต้ทำเควสไก่ตัน (Max Level)", 28)
addToggle(S2_B1, "ออโต้ฟาร์มกล่องสมบัติ (Chest)", 54)
addToggle(S2_B1, "ออโต้ฟาร์มกระดูก/อีเวนต์", 80)
addToggle(S2_B1, "มองเห็นผู้เล่น (ESP Player)", 106)

addToggle(S2_B2, "ออโต้สุ่มผลไม้อัตโนมัติ", 28)
addToggle(S2_B2, "ออโต้เก็บผลไม้ใต้ต้นไม้", 54)
addToggle(S2_B2, "ออโต้ซื้อหมัดเทพ/ขาโหด", 80)
addToggle(S2_B2, "โยนผลไม้ทิ้งเมื่อช่องเต็ม", 106)

-- PAGE 3: เผ่า V3/V4 (Race & Awakening)
local S3_B1 = createSection(Page3, "🔥 ระบบเผ่า V3 / V4 ออโต้", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.48, 0))
local S3_B2 = createSection(Page3, "🏰 ลงดันเจี้ยน & ดรากอน", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.48, 0))

addToggle(S3_B1, "ออโต้เปิดสกิลเผ่า V3/V4", 28)
addToggle(S3_B1, "ออโต้ดึงคันโยกเกาะมิราจ", 54)
addToggle(S3_B1, "ออโต้หาบลูฟลาวเวอร์/เกาะเทียน", 80)
addToggle(S3_B1, "ออโต้ทำเควสเผ่ากูน/เงือก/ไซบอก", 106)

addToggle(S3_B2, "ออโต้ลงดันเจี้ยน (Auto Raid)", 28)
addToggle(S3_B2, "ออโต้ซื้อชิปดันเจี้ยนออโต้", 54)
addToggle(S3_B2, "ออโต้ Awaken ผลไม้", 80)
addToggle(S3_B2, "ปลดล็อกเผ่าใหม่ (Dragon/อื่นๆ)", 106)

-- PAGE 4: ซีอีเวนต์/ทะเล (Sea Event)
local S4_B1 = createSection(Page4, "🌊 ระบบล่าทะเล & เรืออัจฉริยะ", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.48, 0))
local S4_B2 = createSection(Page4, "🦈 ล่า Sea Beast & ฉลาม", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.48, 0))

addToggle(S4_B1, "ออโต้ขับเรืออัจฉริยะ (Smart Boat)", 28)
addToggle(S4_B1, "ออโต้ค้นหาเกาะเทียน/เลเวียธาน", 54)
addToggle(S4_B1, "ออโต้เก็บวัตถุดิบทำเรือทาร์ค", 80)

addToggle(S4_B2, "ออโต้ล่า Sea Beast อัตโนมัติ", 28)
addToggle(S4_B2, "ออโต้ฟาร์มฉลาม/เทอเรอร์ชาค", 54)
addToggle(S4_B2, "วาร์ปไปโลกใต้ทะเลลึก", 80)

-- PAGE 5: ตั้งค่าระบบ (Settings & Language)
local S5_B1 = createSection(Page5, "⚙️ ภาษาและการแสดงผล UI", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.48, 0))
local S5_B2 = createSection(Page5, "🛡️ ความปลอดภัย & ซ่อนตัว", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.48, 0))

addToggle(S5_B1, "เปลี่ยนภาษาไทย UI (Thai Language)", 28, function(v) print("Language Thai:", v) end)
addToggle(S5_B1, "เปลี่ยนภาษาอังกฤษ (English)", 54)
addToggle(S5_B1, "ธีมสีมืดพรีเมียม (Dark Theme)", 80)
addToggle(S5_B1, "ล็อกตำแหน่งหน้าต่าง UI", 106)

addToggle(S5_B2, "ป้องกันถูกเตะออกจากห้อง (Anti-Kick)", 28)
addToggle(S5_B2, "ซ่อนชื่อตัวละคร (Privacy Name)", 54)
addToggle(S5_B2, "โหมดประหยัดแรม/เพิ่ม FPS", 80)

print("BUDDY HUB - Ultimate Edition Loaded Successfully!")
