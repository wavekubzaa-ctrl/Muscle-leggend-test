--[[
    Muscle Legends: Aizen Sosuke Edition
    Features: Auto Farm, Auto Rebirth
    Theme: Deep Purple & Dark (Aizen Theme)
--]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Aizen Hub | Muscle Legends",
    LoadingTitle = "Welcome to my Soul Society...",
    LoadingSubtitle = "by Gemini Brother",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AizenMuscle",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "noinviteneeded",
        RememberJoins = true
    },
    KeySystem = false -- ตั้งเป็น false เพื่อความสะดวกของน้องชาย
})

-- // Variables //
local _G = getgenv()
_G.AutoFarm = false
_G.AutoRebirth = false

-- // UI Layout //
-- ใส่รูป Aizen ในหน้าแรก (ใช้ Image ID จาก Roblox)
local MainTab = Window:CreateTab("Aizen's Power", 4483362458) 

MainTab:CreateSection("Aizen Sosuke - The Ruler")

-- แสดงรูป Aizen (ใช้ภาพประกอบเท่ๆ)
MainTab:CreateLabel("Everything is going according to my plan.", 10837502488) -- Image ID ตัวอย่างรูป Aizen

-- // Auto Farm Logic //
local function startAutoFarm()
    task.spawn(function()
        while _G.AutoFarm do
            -- เช็คว่ามีเครื่องมือในตัวหรือในมือไหม
            local player = game.Players.LocalPlayer
            local char = player.Character
            local tool = char:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
            
            if tool then
                if tool.Parent ~= char then
                    tool.Parent = char -- สวมใส่ไอเทมถ้ายังไม่ถือ
                end
                tool:Activate() -- กดใช้งาน
            end
            task.wait(0.01) -- ความเร็วระดับยมทูต
        end
    end)
end

-- // Auto Rebirth Logic //
local function startAutoRebirth()
    task.spawn(function()
        while _G.AutoRebirth do
            -- เรียกใช้ Remote ของเกมเพื่อกด Rebirth
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            task.wait(1) -- เช็คทุกๆ 1 วินาที
        end
    end)
end

-- // Toggles //
MainTab:CreateToggle({
    Name = "Auto Lift (ยกน้ำหนัก)",
    CurrentValue = false,
    Flag = "AutoLift",
    Callback = function(Value)
        _G.AutoFarm = Value
        if Value then
            startAutoFarm()
            Rayfield:Notify({
                Title = "Power Awakening",
                Content = "You are getting stronger...",
                Duration = 3,
                Image = 10837502488,
            })
        end
    end,
})

MainTab:CreateToggle({
    Name = "Auto Rebirth (เกิดใหม่อัตโนมัติ)",
    CurrentValue = false,
    Flag = "AutoReb",
    Callback = function(Value)
        _G.AutoRebirth = Value
        if Value then
            startAutoRebirth()
        end
    end,
})

MainTab:CreateSection("Settings")

MainTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end,
})

-- // Notification //
Rayfield:Notify({
    Title = "Aizen Script Loaded",
    Content = "The sky is now mine.",
    Duration = 5,
    Image = 10837502488, -- รูปหน้าไอเซ็นตอนแจ้งเตือน
})
