-- Maru Hub - All-in-One Ultimate Script for Blox Fruits (Delta iPad Optimized)
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("MaruHub_Ultimate") then
    CoreGui.MaruHub_Ultimate:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MaruHub_Ultimate"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Floating Toggle Button (ปุ่มย่อ/ขยาย หน้าจอไม่ให้เกะกะ)
local OpenBtn = Instance.new("TextButton")
OpenBtn.Name = "OpenButton"
OpenBtn.Parent = ScreenGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
OpenBtn.Position = UDim2.new(0, 15, 0.4, 0)
OpenBtn.Size = UDim2.new(0, 45, 0, 45)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.Text = "MARU"
OpenBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
OpenBtn.TextSize = 11

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenBtn

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Color = Color3.fromRGB(255, 255, 255)
OpenStroke.Thickness = 1.5
OpenStroke.Parent = OpenBtn

-- Main Window Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -175)
MainFrame.Size = UDim2.new(0, 560, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(50, 50, 70)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- Top Bar
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
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 350, 1, 0)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "MARU HUB - All-in-One Ultimate Edition"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Hide & Close Buttons
local HideBtn = Instance.new("TextButton")
HideBtn.Parent = TopBar
HideBtn.BackgroundTransparency = 1
HideBtn.Position = UDim2.new(1, -70, 0, 0)
HideBtn.Size = UDim2.new(0, 35, 1, 0)
HideBtn.Font = Enum.Font.SourceSansBold
HideBtn.Text = "-"
HideBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
HideBtn.TextSize = 18

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
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
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.Size = UDim2.new(0, 130, 1, -40)
Sidebar.CanvasSize = UDim2.new(0, 0, 1.4, 0)
Sidebar.ScrollBarThickness = 2

local Pages = {}
local ContentPages = Instance.new("Folder")
ContentPages.Parent = MainFrame

local function createPage(name, posY, index)
    local btn = Instance.new("TextButton")
    btn.Parent = Sidebar
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
    btn.Position = UDim2.new(0, 8, 0, posY)
    btn.Size = UDim2.new(0, 114, 0, 30)
    btn.Font = Enum.Font.SourceSansBold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 220)
    btn.TextSize = 12
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    local pageFrame = Instance.new("ScrollingFrame")
    pageFrame.Parent = ContentPages
    pageFrame.BackgroundTransparency = 1
    pageFrame.Position = UDim2.new(0, 138, 0, 45)
    pageFrame.Size = UDim2.new(1, -145, 1, -55)
    pageFrame.CanvasSize = UDim2.new(0, 0, 1.5, 0)
    pageFrame.ScrollBarThickness = 3
    pageFrame.Visible = (index == 1)
    
    table.insert(Pages, {Button = btn, Frame = pageFrame})
    
    btn.MouseButton1Click:Connect(function()
        for _, p in ipairs(Pages) do
            p.Frame.Visible = false
            p.Button.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
        end
        pageFrame.Visible = true
        btn.BackgroundColor3 = Color3.fromRGB(50, 90, 160)
    end)
    
    if index == 1 then
        btn.BackgroundColor3 = Color3.fromRGB(50, 90, 160)
    end
    
    return pageFrame
end

local Page1 = createPage("⚔️ ระบบฟาร์ม", 5, 1)
local Page2 = createPage("⚡ ออโต้พิเศษ", 40, 2)
local Page3 = createPage("🔥 เผ่า & ดัน", 75, 3)
local Page4 = createPage("🌊 ซีอีเวนต์", 110, 4)
local Page5 = createPage("⚙️ ตั้งค่าระบบ", 145, 5)

-- Helper function to create feature sections & toggles
local function createSection(parent, title, posX, posY, sizeX, sizeY)
    local box = Instance.new("Frame")
    box.Parent = parent
    box.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    box.Position = posX
    box.Size = sizeX
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = box
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(40, 40, 55)
    stroke.Parent = box
    
    local lbl = Instance.new("TextLabel")
    lbl.Parent = box
    lbl.BackgroundTransparency = 1
    lbl.Position = UDim2.new(0, 10, 0, 5)
    lbl.Size = UDim2.new(1, -20, 0, 20)
    lbl.Font = Enum.Font.SourceSansBold
    lbl.Text = title
    lbl.TextColor3 = Color3.fromRGB(230, 235, 255)
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    return box
end

local function addToggle(parent, text, posY, callback)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = parent
    lbl.BackgroundTransparency = 1
    lbl.Position = UDim2.new(0, 10, 0, posY)
    lbl.Size = UDim2.new(0, 150, 0, 20)
    lbl.Font = Enum.Font.SourceSans
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(170, 175, 200)
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Parent = parent
    toggleBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    toggleBtn.Position = UDim2.new(1, -45, 0, posY + 2)
    toggleBtn.Size = UDim2.new(0, 35, 0, 16)
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
            toggleBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
            circle.Position = UDim2.new(0, 2, 0, 2)
        end
        if callback then callback(active) end
    end)
end

-- PAGE 1: ฟาร์มหลัก
local S1_Box1 = createSection(Page1, "⚔️ ระบบฟาร์มเลเวล & เควส", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.7, 0))
local S1_Box2 = createSection(Page1, "⚡ โหมดความเร็วการโจมตี", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.7, 0))

addToggle(S1_Box1, "ออโต้ฟาร์มเลเวล (Auto Farm)", 28, function(v)
    print("Auto Farm Level:", v)
    -- โค้ดรันฟาร์มจริงใส่ตรงนี้
end)
addToggle(S1_Box1, "ออโต้รับเควสอัตโนมัติ", 52)
addToggle(S1_Box1, "ออโต้ฟาร์มบอสใกล้เคียง", 76)
addToggle(S1_Box1, "ออโต้ฟาร์มกระดูก/อีเวนต์", 100)

addToggle(S1_Box2, "Fast Attack (ตีไวพิเศษ)", 28, function(v)
    print("Fast Attack:", v)
end)
addToggle(S1_Box2, "Bring Mobs (ดึงมอนสเตอร์มารวม)", 52)
addToggle(S1_Box2, "Auto Clicker (คลิกซ้ายออโต้)", 76)
addToggle(S1_Box2, "Anti AFK (กันหลุดขณะฟาร์ม)", 100)

-- PAGE 2: ออโต้พิเศษ
local S2_Box1 = createSection(Page2, "🎯 ฟังก์ชันเสริมและไอเทม", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.7, 0))
local S2_Box2 = createSection(Page2, "📦 ร้านค้า & สุ่มผล", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.7, 0))

addToggle(S2_Box1, "ออโต้เปิดฮาคิสังเกต (Ken)", 28)
addToggle(S2_Box1, "ออโต้เก็บกล่องสมบัติ (Chest)", 52)
addToggle(S2_Box1, "ออโต้ทำเควสไก่ตัน (Max)", 76)
addToggle(S2_Box1, "มองเห็นผู้เล่นอื่น (ESP)", 100)

addToggle(S2_Box2, "ออโต้สุ่มผลไม้อัตโนมัติ", 28)
addToggle(S2_Box2, "ออโต้ซื้อขาสลับ/หมัดเทพ", 52)
addToggle(S2_Box2, "ออโต้เก็บผลไม้ใต้ต้นไม้", 76)
addToggle(S2_Box2, "โยนผลไม้ทิ้งเมื่อเต็ม", 100)

-- PAGE 3: เผ่า & ดัน
local S3_Box1 = createSection(Page3, "🔥 ระบบเผ่า V3 / V4", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.7, 0))
local S3_Box2 = createSection(Page3, "🏰 ลงดันเจี้ยน/เรด", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.7, 0))

addToggle(S3_Box1, "ออโต้เปิดสกิลเผ่า V3/V4", 28)
addToggle(S3_Box1, "ออโต้ดึงคันโยกเกาะมิราจ", 52)
addToggle(S3_Box1, "ออโต้หาเกาะมิราจ/บลูฟลาวเวอร์", 76)

addToggle(S3_Box2, "ออโต้ลงดันเจี้ยน (Auto Raid)", 28)
addToggle(S3_Box2, "ออโต้ซื้อชิปลงดัน", 52)
addToggle(S3_Box2, "ออโต้ Awaken ผลไม้", 76)

-- PAGE 4: ซีอีเวนต์
local S4_Box1 = createSection(Page4, "🌊 ระบบล่าทะเล & ซีอีเวนต์", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.7, 0))
local S4_Box2 = createSection(Page4, "🦈 ล่าเต่า/เจ้าทะเล", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.7, 0))

addToggle(S4_Box1, "ออโต้ขับเรืออัจฉริยะ", 28)
addToggle(S4_Box1, "ออโต้ล่า Sea Beast", 52)
addToggle(S4_Box1, "ออโต้ฟาร์มฉลาม/เทอเรอร์ชาค", 76)

addToggle(S4_Box2, "ออโต้เก็บวัตถุดิบทำเรือ/หมัด", 28)
addToggle(S4_Box2, "วาร์ปไปโลกใต้ทะเล (Terror)", 52)
addToggle(S4_Box2, "ระบบเรดาร์หาเกาะเทียน", 76)

-- PAGE 5: ตั้งค่าระบบ
local S5_Box1 = createSection(Page5, "⚙️ ตั้งค่าทั่วไป & ปลอดภัย", UDim2.new(0, 0, 0, 0), UDim2.new(0.48, 0, 0.7, 0))
local S5_Box2 = createSection(Page5, "🎨 ปรับแต่งหน้าจอ UI", UDim2.new(0.51, 0, 0, 0), UDim2.new(0.48, 0, 0.7, 0))

addToggle(S5_Box1, "ป้องกันถูกเตะออกจากห้อง (Anti-Kicked)", 28)
addToggle(S5_Box1, "ซ่อนชื่อตัวละคร (Privacy Mode)", 52)
addToggle(S5_Box1, "เพิ่ม FPS ปิดเอฟเฟกต์กระตุก", 76)

addToggle(S5_Box2, "เปลี่ยนภาษาไทย UI หลัก", 28)
addToggle(S5_Box2, "ล็อกตำแหน่งหน้าต่าง UI", 52)

print("Maru Hub All-in-One Ultimate Loaded Successfully!")
