--[[
    TITLE: BUKWAVE X AIZEN
    GAME: Muscle Legends
    CREDIT: BUKWAVE X PREMIER HUB
--]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BUKWAVE X AIZEN | Muscle Legends",
    LoadingTitle = "Everything according to plan...",
    LoadingSubtitle = "by Gemini Brother",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BukwaveAizen",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false
})

local _G = getgenv()
_G.AutoFarm = false
_G.AutoRebirth = false

local MainTab = Window:CreateTab("Aizen's Domain", 4483362458) 

MainTab:CreateSection("Lord Aizen - BUKWAVE Edition")
MainTab:CreateLabel("The sky is now mine.", 10837502488)

local function startAutoFarm()
    task.spawn(function()
        while _G.AutoFarm do
            local player = game.Players.LocalPlayer
            local char = player.Character
            local tool = char:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
            
            if tool then
                if tool.Parent ~= char then
                    tool.Parent = char
                end
                tool:Activate()
            end
            task.wait(0.01)
        end
    end)
end

local function startAutoRebirth()
    task.spawn(function()
        while _G.AutoRebirth do
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            task.wait(1)
        end
    end)
end

MainTab:CreateToggle({
    Name = "Auto Lift Weights",
    CurrentValue = false,
    Flag = "AutoLift",
    Callback = function(Value)
        _G.AutoFarm = Value
        if Value then
            startAutoFarm()
            Rayfield:Notify({
                Title = "Power Surge",
                Content = "Ascending to the next level...",
                Duration = 3,
                Image = 10837502488,
            })
        end
    end,
})

MainTab:CreateToggle({
    Name = "Auto Rebirth Loop",
    CurrentValue = false,
    Flag = "AutoReb",
    Callback = function(Value)
        _G.AutoRebirth = Value
        if Value then
            startAutoRebirth()
        end
    end,
})

MainTab:CreateSection("Client Settings")

MainTab:CreateButton({
    Name = "Unload Script",
    Callback = function()
        Rayfield:Destroy()
    end,
})

Rayfield:Notify({
    Title = "BUKWAVE X AIZEN Loaded",
    Content = "Welcome to the Soul Society.",
    Duration = 5,
    Image = 10837502488,
})
