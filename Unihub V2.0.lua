local function createNotificationSystem()
    local NotificationSystem = {}
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    -- Create the notification container if it doesn't exist
    local function ensureNotificationContainer()
        if playerGui:FindFirstChild("UHubNotifications") then
            return playerGui:FindFirstChild("UHubNotifications")
        end
        
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "UHubNotifications"
        screenGui.ResetOnSpawn = false
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        screenGui.Parent = playerGui
        
        local notificationContainer = Instance.new("Frame")
        notificationContainer.Name = "NotificationContainer"
        notificationContainer.AnchorPoint = Vector2.new(1, 0)
        notificationContainer.Position = UDim2.new(1, -20, 0, 60)
        notificationContainer.Size = UDim2.new(0, 320, 1, -100)
        notificationContainer.BackgroundTransparency = 1
        notificationContainer.Parent = screenGui
        
        local uiListLayout = Instance.new("UIListLayout")
        uiListLayout.Padding = UDim.new(0, 12)
        uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        uiListLayout.SortOrder = Enum.SortOrder.Name
        uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        uiListLayout.Parent = notificationContainer
        
        return screenGui
    end
    
    -- Create icon for different notification types
    local function createIcon(status, parent)
        local iconFrame = Instance.new("Frame")
        iconFrame.Name = "IconFrame"
        iconFrame.Size = UDim2.new(0, 32, 0, 32)
        iconFrame.Position = UDim2.new(0, 16, 0, 16)
        iconFrame.BackgroundTransparency = 1
        iconFrame.Parent = parent
        
        local iconLabel = Instance.new("TextLabel")
        iconLabel.Name = "IconLabel"
        iconLabel.Size = UDim2.new(1, 0, 1, 0)
        iconLabel.BackgroundTransparency = 1
        iconLabel.Font = Enum.Font.GothamBold
        iconLabel.TextSize = 18
        iconLabel.TextXAlignment = Enum.TextXAlignment.Center
        iconLabel.TextYAlignment = Enum.TextYAlignment.Center
        iconLabel.TextTransparency = 1
        iconLabel.Parent = iconFrame
        
        -- Icon background circle
        local iconBg = Instance.new("Frame")
        iconBg.Name = "IconBackground"
        iconBg.Size = UDim2.new(1, 0, 1, 0)
        iconBg.BackgroundTransparency = 0.8
        iconBg.BorderSizePixel = 0
        iconBg.Parent = iconFrame
        
        local iconCorner = Instance.new("UICorner")
        iconCorner.CornerRadius = UDim.new(0.5, 0)
        iconCorner.Parent = iconBg
        
        -- Set icon based on status
        local icons = {
            success = {icon = "✓", color = Color3.fromRGB(34, 197, 94)},
            error = {icon = "✕", color = Color3.fromRGB(239, 68, 68)},
            warning = {icon = "⚠", color = Color3.fromRGB(245, 158, 11)},
            info = {icon = "ℹ", color = Color3.fromRGB(59, 130, 246)}
        }
        
        local iconData = icons[status] or icons.info
        iconLabel.Text = iconData.icon
        iconLabel.TextColor3 = iconData.color
        iconBg.BackgroundColor3 = iconData.color
        
        return iconFrame
    end
    
    -- Create circular timer
    local function createCircularTimer(parent, duration, statusColor)
        local timerFrame = Instance.new("Frame")
        timerFrame.Name = "TimerFrame"
        timerFrame.Size = UDim2.new(0, 20, 0, 20)
        timerFrame.Position = UDim2.new(1, -48, 0, 12)
        timerFrame.BackgroundTransparency = 1
        timerFrame.Parent = parent
        
        -- Timer background circle
        local timerBg = Instance.new("Frame")
        timerBg.Name = "TimerBackground"
        timerBg.Size = UDim2.new(1, 0, 1, 0)
        timerBg.BackgroundColor3 = Color3.fromRGB(51, 65, 85)
        timerBg.BackgroundTransparency = 0.7
        timerBg.BorderSizePixel = 0
        timerBg.Parent = timerFrame
        
        local timerBgCorner = Instance.new("UICorner")
        timerBgCorner.CornerRadius = UDim.new(0.5, 0)
        timerBgCorner.Parent = timerBg
        
        -- Timer progress circle (using ImageLabel for circular progress)
        local timerProgress = Instance.new("Frame")
        timerProgress.Name = "TimerProgress"
        timerProgress.Size = UDim2.new(0.8, 0, 0.8, 0)
        timerProgress.Position = UDim2.new(0.1, 0, 0.1, 0)
        timerProgress.BackgroundColor3 = statusColor
        timerProgress.BackgroundTransparency = 0.3
        timerProgress.BorderSizePixel = 0
        timerProgress.Parent = timerFrame
        
        local timerProgressCorner = Instance.new("UICorner")
        timerProgressCorner.CornerRadius = UDim.new(0.5, 0)
        timerProgressCorner.Parent = timerProgress
        
        -- Timer text
        local timerText = Instance.new("TextLabel")
        timerText.Name = "TimerText"
        timerText.Size = UDim2.new(1, 0, 1, 0)
        timerText.BackgroundTransparency = 1
        timerText.Font = Enum.Font.GothamBold
        timerText.TextSize = 8
        timerText.TextColor3 = Color3.fromRGB(248, 250, 252)
        timerText.TextXAlignment = Enum.TextXAlignment.Center
        timerText.TextYAlignment = Enum.TextYAlignment.Center
        timerText.Text = string.format("%.1f", duration)
        timerText.TextTransparency = 1
        timerText.Parent = timerFrame
        
        -- Timer control variables
        local startTime = nil
        local connection = nil
        local timerStarted = false
        
        local function updateTimer()
            if not timerStarted or not startTime then return end
            
            local elapsed = tick() - startTime
            local remaining = math.max(0, duration - elapsed)
            local progress = remaining / duration
            
            -- Update text with proper decimal formatting
            if remaining > 0 then
                timerText.Text = string.format("%.1f", remaining)
            else
                timerText.Text = "0.0"
            end
            
            -- Update circular progress by scaling
            timerProgress.Size = UDim2.new(0.8 * progress, 0, 0.8 * progress, 0)
            timerProgress.Position = UDim2.new(0.1 + (0.8 * (1 - progress)) / 2, 0, 0.1 + (0.8 * (1 - progress)) / 2, 0)
            
            if remaining <= 0 then
                connection:Disconnect()
            end
        end
        
        connection = RunService.Heartbeat:Connect(updateTimer)
        
        -- Function to start the timer
        local function startTimer()
            startTime = tick()
            timerStarted = true
        end
        
        return timerFrame, connection, startTimer
    end
    
    -- Create a notification
    function NotificationSystem:Notify(title, message, status, duration)
        local screenGui = ensureNotificationContainer()
        local container = screenGui.NotificationContainer
        
        -- Default parameters
        title = title or "Universal Hub"
        message = message or "Notification"
        status = status or "info"
        duration = duration or 4
        
        -- Status colors with better contrast
        local statusColors = {
            success = Color3.fromRGB(34, 197, 94),
            error = Color3.fromRGB(239, 68, 68),
            warning = Color3.fromRGB(245, 158, 11),
            info = Color3.fromRGB(59, 130, 246)
        }
        
        local statusColor = statusColors[status] or statusColors.info
        
        -- Create notification frame
        local notificationId = tick() .. math.random(1000, 9999)
        local notification = Instance.new("Frame")
        notification.Name = tostring(notificationId)
        notification.Size = UDim2.new(1, 0, 0, 0)
        notification.BackgroundColor3 = Color3.fromRGB(17, 24, 39) -- Dark slate background
        notification.BorderSizePixel = 0
        notification.BackgroundTransparency = 1
        notification.ClipsDescendants = true
        notification.Parent = container
        
        -- Modern rounded corners
        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0, 12)
        uiCorner.Parent = notification
        
        -- Subtle border/glow effect
        local uiStroke = Instance.new("UIStroke")
        uiStroke.Color = statusColor
        uiStroke.Thickness = 1
        uiStroke.Transparency = 0.7
        uiStroke.Parent = notification
        
        -- Glass effect overlay
        local glassOverlay = Instance.new("Frame")
        glassOverlay.Name = "GlassOverlay"
        glassOverlay.Size = UDim2.new(1, 0, 1, 0)
        glassOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        glassOverlay.BackgroundTransparency = 0.95
        glassOverlay.BorderSizePixel = 0
        glassOverlay.Parent = notification
        
        local glassCorner = Instance.new("UICorner")
        glassCorner.CornerRadius = UDim.new(0, 12)
        glassCorner.Parent = glassOverlay
        
        -- Gradient background
        local uiGradient = Instance.new("UIGradient")
        uiGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 41, 59)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 23, 42))
        }
        uiGradient.Rotation = 45
        uiGradient.Parent = notification
        
        -- Status accent bar (left side)
        local statusBar = Instance.new("Frame")
        statusBar.Name = "StatusBar"
        statusBar.Size = UDim2.new(0, 4, 1, -16)
        statusBar.Position = UDim2.new(0, 8, 0, 8)
        statusBar.BackgroundColor3 = statusColor
        statusBar.BorderSizePixel = 0
        statusBar.BackgroundTransparency = 1
        statusBar.Parent = notification
        
        local statusCorner = Instance.new("UICorner")
        statusCorner.CornerRadius = UDim.new(0, 2)
        statusCorner.Parent = statusBar
        
        -- Create icon
        local iconFrame = createIcon(status, notification)
        
        -- Create circular timer
        local timerFrame, timerConnection, startTimer = createCircularTimer(notification, duration, statusColor)
        
        -- Create title with better positioning
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "Title"
        titleLabel.Size = UDim2.new(1, -120, 0, 24)
        titleLabel.Position = UDim2.new(0, 60, 0, 16)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 15
        titleLabel.TextColor3 = Color3.fromRGB(248, 250, 252)
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Text = title
        titleLabel.TextTransparency = 1
        titleLabel.Parent = notification
        
        -- Create message with better styling
        local messageLabel = Instance.new("TextLabel")
        messageLabel.Name = "Message"
        messageLabel.Size = UDim2.new(1, -120, 0, 36)
        messageLabel.Position = UDim2.new(0, 60, 0, 40)
        messageLabel.BackgroundTransparency = 1
        messageLabel.Font = Enum.Font.Gotham
        messageLabel.TextSize = 13
        messageLabel.TextColor3 = Color3.fromRGB(148, 163, 184)
        messageLabel.TextXAlignment = Enum.TextXAlignment.Left
        messageLabel.TextYAlignment = Enum.TextYAlignment.Top
        messageLabel.TextWrapped = true
        messageLabel.Text = message
        messageLabel.TextTransparency = 1
        messageLabel.Parent = notification
        
        -- Enhanced close button
        local closeButton = Instance.new("TextButton")
        closeButton.Name = "CloseButton"
        closeButton.Size = UDim2.new(0, 20, 0, 20)
        closeButton.Position = UDim2.new(1, -28, 0, 44)
        closeButton.BackgroundColor3 = Color3.fromRGB(100, 116, 139)
        closeButton.BackgroundTransparency = 0.9
        closeButton.BorderSizePixel = 0
        closeButton.Font = Enum.Font.GothamBold
        closeButton.TextSize = 11
        closeButton.TextColor3 = Color3.fromRGB(148, 163, 184)
        closeButton.Text = "×"
        closeButton.TextTransparency = 1
        closeButton.Parent = notification
        
        local closeCorner = Instance.new("UICorner")
        closeCorner.CornerRadius = UDim.new(0, 6)
        closeCorner.Parent = closeButton
        
        -- Animated progress bar
        local progressContainer = Instance.new("Frame")
        progressContainer.Name = "ProgressContainer"
        progressContainer.Size = UDim2.new(1, -16, 0, 3)
        progressContainer.Position = UDim2.new(0, 8, 1, -8)
        progressContainer.BackgroundColor3 = Color3.fromRGB(51, 65, 85)
        progressContainer.BackgroundTransparency = 0.8
        progressContainer.BorderSizePixel = 0
        progressContainer.Parent = notification
        
        local progressContainerCorner = Instance.new("UICorner")
        progressContainerCorner.CornerRadius = UDim.new(0, 2)
        progressContainerCorner.Parent = progressContainer
        
        local progressBar = Instance.new("Frame")
        progressBar.Name = "ProgressBar"
        progressBar.Size = UDim2.new(1, 0, 1, 0)
        progressBar.Position = UDim2.new(0, 0, 0, 0)
        progressBar.BackgroundColor3 = statusColor
        progressBar.BorderSizePixel = 0
        progressBar.BackgroundTransparency = 1
        progressBar.Parent = progressContainer
        
        local progressCorner = Instance.new("UICorner")
        progressCorner.CornerRadius = UDim.new(0, 2)
        progressCorner.Parent = progressBar
        
        -- Animation functions with much faster timing
        local function fadeIn()
            -- Expand height quickly
            local sizeTween = TweenService:Create(
                notification,
                TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0),
                {Size = UDim2.new(1, 0, 0, 88)}
            )
            sizeTween:Play()
            
            -- Fade in background quickly
            local bgTween = TweenService:Create(
                notification,
                TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0.15}
            )
            
            -- Fade in stroke quickly
            local strokeTween = TweenService:Create(
                uiStroke,
                TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                {Transparency = 0.6}
            )
            
            -- Fade in all elements with minimal staggered timing
            local elements = {
                {statusBar, {BackgroundTransparency = 0.2}, 0.05},
                {progressBar, {BackgroundTransparency = 0.3}, 0.05},
                {titleLabel, {TextTransparency = 0}, 0.05},
                {messageLabel, {TextTransparency = 0}, 0.1},
                {closeButton, {TextTransparency = 0, BackgroundTransparency = 0.85}, 0.1},
                {iconFrame:FindFirstChild("IconLabel"), {TextTransparency = 0}, 0.05},
                {iconFrame:FindFirstChild("IconBackground"), {BackgroundTransparency = 0.85}, 0.05},
                {timerFrame:FindFirstChild("TimerText"), {TextTransparency = 0}, 0.1}
            }
            
            bgTween:Play()
            strokeTween:Play()
            
            for _, elementData in ipairs(elements) do
                local element, props, delay = elementData[1], elementData[2], elementData[3]
                if element then
                    task.wait(delay)
                    local tween = TweenService:Create(
                        element,
                        TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                        props
                    )
                    tween:Play()
                end
            end
        end
        
        local function fadeOut()
            -- Disconnect timer
            if timerConnection then
                timerConnection:Disconnect()
            end
            
            -- Create slide mask
            local slideMask = Instance.new("Frame")
            slideMask.Name = "SlideMask"
            slideMask.Size = UDim2.new(1, 0, 1, 0)
            slideMask.BackgroundTransparency = 1
            slideMask.ClipsDescendants = true
            slideMask.Parent = notification
            
            -- Move content to mask
            for _, child in ipairs(notification:GetChildren()) do
                if child ~= slideMask and child.Name ~= "SlideMask" and child.ClassName ~= "UICorner" and child.ClassName ~= "UIStroke" and child.ClassName ~= "UIGradient" then
                    child.Parent = slideMask
                end
            end
            
            -- Smooth slide out animation
            local slideOutTween = TweenService:Create(
                slideMask,
                TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                {Position = UDim2.new(1.2, 0, 0, 0)}
            )
            
            -- Fade background
            local fadeTween = TweenService:Create(
                notification,
                TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                {BackgroundTransparency = 1}
            )
            
            local strokeFadeTween = TweenService:Create(
                uiStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                {Transparency = 1}
            )
            
            slideOutTween:Play()
            fadeTween:Play()
            strokeFadeTween:Play()
            
            slideOutTween.Completed:Connect(function()
                local shrinkTween = TweenService:Create(
                    notification,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                    {Size = UDim2.new(1, 0, 0, 0)}
                )
                shrinkTween:Play()
                shrinkTween.Completed:Connect(function()
                    notification:Destroy()
                end)
            end)
        end
        
        -- Enhanced progress animation
        local progressTween = TweenService:Create(
            progressBar,
            TweenInfo.new(duration, Enum.EasingStyle.Linear),
            {Size = UDim2.new(0, 0, 1, 0)}
        )
        
        -- Close button hover effects
        closeButton.MouseEnter:Connect(function()
            TweenService:Create(closeButton, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
                BackgroundTransparency = 0.7,
                TextColor3 = Color3.fromRGB(248, 250, 252)
            }):Play()
        end)
        
        closeButton.MouseLeave:Connect(function()
            TweenService:Create(closeButton, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
                BackgroundTransparency = 0.85,
                TextColor3 = Color3.fromRGB(148, 163, 184)
            }):Play()
        end)
        
        closeButton.MouseButton1Click:Connect(function()
            fadeOut()
        end)
        
        -- Start animations and timer immediately
        startTimer() -- Start timer immediately when notification is created
        fadeIn()
        task.wait(0.2) -- Much shorter wait
        progressTween:Play()
        
        -- Auto close
        task.delay(duration, function()
            if notification.Parent then
                fadeOut()
            end
        end)
        
        return notification
    end
    
    -- Convenience methods
    function NotificationSystem:Success(title, message, duration)
        return self:Notify(title, message, "success", duration)
    end
    
    function NotificationSystem:Error(title, message, duration)
        return self:Notify(title, message, "error", duration)
    end
    
    function NotificationSystem:Warning(title, message, duration)
        return self:Notify(title, message, "warning", duration)
    end
    
    function NotificationSystem:Info(title, message, duration)
        return self:Notify(title, message, "info", duration)
    end
    
    return NotificationSystem
end

-- Create the notification system
local Notifications = createNotificationSystem()


if getgenv().UniversalHubRunning then
    Notifications:Warning("Universal Hub Lite", "Instance Already Running Please Rejoin To Rexecute", 6)
    return
end

getgenv().UniversalHubRunning = true

local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Name = "StartupAnimation"
screenGui.Parent = playerGui

-- Blur effect
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game:GetService("Lighting")

-- Big Centered Logo
local logo = Instance.new("ImageLabel")
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.Position = UDim2.new(0.5, 0, 0.5, 0) -- Back to original center position
logo.Size = UDim2.new(0.5, 0, 0.5, 0) -- Start smaller
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://132892738480261"
logo.ScaleType = Enum.ScaleType.Fit
logo.ImageTransparency = 1
logo.Parent = screenGui

-- Loading Bar Background
local loadingBg = Instance.new("Frame")
loadingBg.AnchorPoint = Vector2.new(0.5, 0.5)
loadingBg.Position = UDim2.new(0.5, 0, 0.75, 0)
loadingBg.Size = UDim2.new(0.25, 0, 0, 3) -- Made smaller
loadingBg.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
loadingBg.BorderSizePixel = 0
loadingBg.BackgroundTransparency = 1
loadingBg.Parent = screenGui

-- Loading Bar Corner
local loadingBgCorner = Instance.new("UICorner")
loadingBgCorner.CornerRadius = UDim.new(0, 2)
loadingBgCorner.Parent = loadingBg

-- Loading Bar Fill
local loadingFill = Instance.new("Frame")
loadingFill.Position = UDim2.new(0, 0, 0, 0)
loadingFill.Size = UDim2.new(0, 0, 1, 0)
loadingFill.BackgroundColor3 = Color3.new(1, 1, 1)
loadingFill.BorderSizePixel = 0
loadingFill.Parent = loadingBg

-- Loading Bar Fill Corner
local loadingFillCorner = Instance.new("UICorner")
loadingFillCorner.CornerRadius = UDim.new(0, 2)
loadingFillCorner.Parent = loadingFill

-- Loading Percentage Text
local loadingText = Instance.new("TextLabel")
loadingText.AnchorPoint = Vector2.new(0.5, 0.5)
loadingText.Position = UDim2.new(0.5, 0, 0.8, 0)
loadingText.Size = UDim2.new(0, 100, 0, 30)
loadingText.BackgroundTransparency = 1
loadingText.Text = "0%"
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.TextScaled = true
loadingText.Font = Enum.Font.Gotham
loadingText.TextTransparency = 1
loadingText.Parent = screenGui

-- Startup Sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://2001510350"
sound.Volume = 1 -- Set to full volume, we'll play it later
sound.Parent = SoundService

-- Smooth easing info
local easeIn = TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local easeOut = TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

-- Fade in with smooth easing and subtle movement
TweenService:Create(logo, easeIn, {
    ImageTransparency = 0,
    Size = UDim2.new(0.6, 0, 0.6, 0) -- Scale up slightly but stay centered
}):Play()
TweenService:Create(blur, easeIn, {Size = 24}):Play()
TweenService:Create(loadingBg, easeIn, {BackgroundTransparency = 0}):Play()
TweenService:Create(loadingText, easeIn, {TextTransparency = 0}):Play()

-- Realistic loading progression
local function updateLoading()
    local totalTime = 4.5 -- Total loading time
    local startTime = tick()
    local connection
    
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        local elapsed = tick() - startTime
        local progress = math.min(elapsed / totalTime, 1)
        
        -- Realistic loading curve (starts fast, slows down, speeds up at end)
        local smoothProgress
        if progress < 0.7 then
            smoothProgress = progress * 0.8 -- Quick progress to 56%
        elseif progress < 0.95 then
            smoothProgress = 0.56 + (progress - 0.7) * 0.6 -- Slower progress to 71%
        else
            smoothProgress = 0.71 + (progress - 0.95) * 5.8 -- Fast finish to 100%
        end
        
        smoothProgress = math.min(smoothProgress, 1)
        local percentage = math.floor(smoothProgress * 100)
        
        -- Update loading bar and text
        loadingFill.Size = UDim2.new(smoothProgress, 0, 1, 0)
        loadingText.Text = percentage .. "%"
        
        if progress >= 1 then
            loadingText.Text = "100%"
            loadingFill.Size = UDim2.new(1, 0, 1, 0)
            connection:Disconnect()
            
            -- Wait a moment then fade out loading bar
            task.wait(0.5)
            TweenService:Create(loadingBg, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
            TweenService:Create(loadingFill, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
            TweenService:Create(loadingText, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
            
            -- Wait for loading bar to fade then play sound
            task.wait(0.8)
            sound:Play()
            
            -- Wait for sound to play a bit then fade everything
            task.wait(4) -- Wait longer for sound to finish
            TweenService:Create(logo, easeOut, {ImageTransparency = 1}):Play()
            TweenService:Create(blur, easeOut, {Size = 0}):Play()
            TweenService:Create(sound, easeOut, {Volume = 0}):Play()
            
            -- Wait for final fade out
            task.wait(1.5)
            
            -- Cleanup
            screenGui:Destroy()
            blur:Destroy()
            sound:Destroy()
        end
    end)
end

-- Start loading animation after initial fade in
task.wait(0.5)
updateLoading()

task.wait(11)
local ChatService = game:GetService("Chat")

-- Function to display bold text in chat




Notifications:Info("Universal Hub Lite V1.1 Loaded !", "Goto Our Website For Updates And Other Cool Scripts ! (Copied)", 6)
setclipboard("https://angxers2.github.io/Unihub/")
Notifications:Info("Command Bar", "Press T For Command Bar Toggle", 4.5)






local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Variables
local savedPosition = nil
local clickTpKey = nil
local isInfJumpEnabled = false
local isSpinning = false
local spinConnection = nil
local spinSpeed = 0
local viewedPlayer = nil
local viewConnection = nil
local clickTpConnection = nil
local flyConnection = nil
local noClipConnection = nil
local isFlying = false
_G.CmdBarKeybind = Enum.KeyCode.T





-- Function to find a player by partial name (case-insensitive)
local function findPlayer(nameSegment)
    if not nameSegment or nameSegment == "" then return nil end
    nameSegment = nameSegment:lower()
    
    for _, player in pairs(Players:GetPlayers()) do
        if player.Name:lower():sub(1, #nameSegment) == nameSegment or 
           player.DisplayName:lower():sub(1, #nameSegment) == nameSegment then
            return player
        end
    end
    return nil
end

-- NoClip function
local function setNoClip(enabled)
    if noClipConnection and noClipConnection.Connected then
        noClipConnection:Disconnect()
        noClipConnection = nil
    end
    
    if not enabled then
        return
    end
    
    
    noClipConnection = RunService.Stepped:Connect(function()
        local character = LocalPlayer.Character
        if not character then return end
        
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

-- Improved Fly function using CFrame
local function toggleFly(speed)
    -- If already flying, disable it
    if isFlying then
        if flyConnection and flyConnection.Connected then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        
        -- Restore gravity and character state
        workspace.Gravity = 196.2
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
        
        -- Disable NoClip
        setNoClip(false)
        
        isFlying = false

        return
    end
    
    -- Enable flying
    speed = speed or 50
    local character = LocalPlayer.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    -- Set up for flying
    workspace.Gravity = 0
    humanoid.PlatformStand = true
    
    -- Enable NoClip when flying
    setNoClip(true)
    
    isFlying = true
    
    flyConnection = RunService.RenderStepped:Connect(function()
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then
            flyConnection:Disconnect()
            isFlying = false
            return
        end
        
        local flyDirection = Vector3.new()
        
        -- Get movement direction based on camera
        local lookVector = Camera.CFrame.LookVector
        local rightVector = Camera.CFrame.RightVector
        
        -- Forward/Backward
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            flyDirection = flyDirection + lookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            flyDirection = flyDirection - lookVector
        end
        
        -- Left/Right
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            flyDirection = flyDirection - rightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            flyDirection = flyDirection + rightVector
        end
        
        -- Up/Down
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            flyDirection = flyDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            flyDirection = flyDirection + Vector3.new(0, -1, 0)
        end
        
        -- Normalize and apply speed
        if flyDirection.Magnitude > 0 then
            flyDirection = flyDirection.Unit * speed
        end
        
        -- Apply movement
        rootPart.Velocity = flyDirection
    end)
    
end

-- Toggle view player function
local function viewPlayer(player)
    if viewConnection and viewConnection.Connected then
        viewConnection:Disconnect()
        viewConnection = nil
        Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        viewedPlayer = nil
        return
    end
    
    if not player then
        return
    end
    
    local character = player.Character
    if not character then
        return
    end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return
    end
    
    Camera.CameraSubject = humanoid
    viewedPlayer = player
    
    -- Create connection to handle when player leaves or dies
    viewConnection = player.CharacterRemoving:Connect(function()
        Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        viewConnection:Disconnect()
        viewConnection = nil
        viewedPlayer = nil
    end)
end

-- Infinite Jump function
local function toggleInfJump()
    isInfJumpEnabled = not isInfJumpEnabled
    if isInfJumpEnabled then
        UserInputService.JumpRequest:Connect(function()
            if isInfJumpEnabled and LocalPlayer.Character then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
    end
end

-- Click Teleport function
local function setupClickTeleport(key)
    if clickTpConnection and clickTpConnection.Connected then
        clickTpConnection:Disconnect()
        clickTpConnection = nil
        clickTpKey = nil
        return
    end
    
    local keyCode = Enum.KeyCode[key]
    if not keyCode then
        return
    end
    
    clickTpKey = keyCode
    
    -- Create the connections for click teleporting
    clickTpConnection = UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == clickTpKey then
            local mouse = LocalPlayer:GetMouse()
            
            -- Create a connection for when the mouse is clicked while key is held
            local mouseConnection
            mouseConnection = UserInputService.InputBegan:Connect(function(mouseInput)
                if mouseInput.UserInputType == Enum.UserInputType.MouseButton1 then
                    local character = LocalPlayer.Character
                    if character then
                        local rootPart = character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local targetPos = mouse.Hit.Position
                            rootPart.CFrame = CFrame.new(targetPos + Vector3.new(0, 3, 0))
                        end
                    end
                end
            end)
            
            -- Remove the connection when key is released
            local keyReleasedConnection
            keyReleasedConnection = UserInputService.InputEnded:Connect(function(endInput)
                if endInput.KeyCode == clickTpKey then
                    mouseConnection:Disconnect()
                    keyReleasedConnection:Disconnect()
                end
            end)
        end
    end)
end

-- Spin function
local function toggleSpin(speed)
    if isSpinning then
        if spinConnection and spinConnection.Connected then
            spinConnection:Disconnect()
        end
        isSpinning = false
        return
    end
    
    spinSpeed = tonumber(speed) or 10
    isSpinning = true
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    local angle = 0
    spinConnection = RunService.Heartbeat:Connect(function(dt)
        if not isSpinning or not character or not character:FindFirstChild("HumanoidRootPart") then
            if spinConnection then spinConnection:Disconnect() end
            isSpinning = false
            return
        end
        
        angle = angle + math.rad(spinSpeed * dt * 60)
        rootPart.CFrame = CFrame.new(rootPart.Position) * CFrame.Angles(0, angle, 0)
    end)
end

-- Bang function (just placeholder as requested)
local function toggleBang(targetPlayer)
    if not targetPlayer then
        return
    end
    
    -- Implementation would go here
end

-- Set time of day function
local function setTimeOfDay(timeString)
    if not game:GetService("Lighting") then
        return
    end
    
    local times = {
        ["night"] = 0,
        ["midnight"] = 0,
        ["morning"] = 6,
        ["day"] = 12,
        ["noon"] = 12,
        ["afternoon"] = 15,
        ["evening"] = 18
    }
    
    local timeValue = times[timeString:lower()]
    if timeValue then
        game:GetService("Lighting").TimeOfDay = timeValue .. ":00:00"
    else
        local hourValue = tonumber(timeString)
        if hourValue and hourValue >= 0 and hourValue < 24 then
            game:GetService("Lighting").TimeOfDay = math.floor(hourValue) .. ":00:00"
        else
        end
    end
end

local prefix = "!"

-- Reusable command processing function
local function processCommand(msg)
    -- Split by space
    local args = string.split(msg, " ")
    -- Check if the first argument has a command prefix
    if #args > 0 and string.sub(args[1], 1, 1) == prefix then
        -- Remove the prefix from the command
        local command = string.sub(args[1], 2):lower()
        -- Process commands
        if command == "fly" then
            local speed = tonumber(args[2]) or 50
            toggleFly(speed)
            Notifications:Success("Universal Hub Lite", "Fly Enabled, Speed: " .. (args[2] and tostring(args[2]) or "50"), 4.5)

           
        elseif command == "unfly" then
            if isFlying then
                toggleFly()
                Notifications:Success("Universal Hub Lite", "Stopped Flying", 4.5)

            else
                Notifications:Error("Universal Hub Lite", "User Is Not Flying", 4.5)
            end

        elseif command == "fov" then
            local camera = workspace.CurrentCamera
            local fovValue = tonumber(args[2]) or 70
        
            if camera and fovValue then
                camera.FieldOfView = math.clamp(fovValue, 1, 120)
                Notifications:Success("Universal Hub Lite", "Fov Set To " .. (args[2] and tostring(args[2]) or "70"), 4.5)
            end
        

        elseif command == "rj" or command == "rejoin" then
            
            Notifications:Success("Universal Hub Lite", "Rejoining Please Wait ...", 4.5)

            task.wait(4.5)
        
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)


        elseif command == "uhub" then
            
            Notifications:Success("Universal Hub Lite", "Executing Universal Hub V2.0 Please Wait ...", 4.5)
            task.wait(4.5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Angxers2/Unihub/main/Unihub%20V2.0.lua",true))()
            
        elseif command == "noclip" then
            setNoClip(true)
            Notifications:Success("Universal Hub Lite", "NoClip Active !", 4.5)

        elseif command == "clip" then
            setNoClip(false)
            Notifications:Success("Universal Hub Lite", "NoClip Deactivated !", 4.5)

        elseif command == "walkspeed" or command == "ws" then
            local speed = tonumber(args[2]) or 16
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = speed
                Notifications:Success("Universal Hub Lite", "Walkspeed Set To: " .. (args[2] and tostring(args[2]) or "16"), 4.5)

            end
            
        elseif command == "jump" then
            local height = tonumber(args[2]) or 50
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.JumpPower = height
                Notifications:Success("Universal Hub Lite", "JumpPower Set To: " .. (args[2] and tostring(args[2]) or "50"), 4.5)
              end
            
        elseif command == "view" or command == "unview" then
            if command == "unview" or viewedPlayer then
                viewPlayer(nil) -- This will disconnect the current view
                Notifications:Success("Universal Hub Lite", "Stopped Viewing", 4.5)

            else
                local target = findPlayer(args[2])
                viewPlayer(target)
                Notifications:Success("Universal Hub Lite", "Viewing: " .. target.Name, 4.5)

            end
            
        elseif command == "infjump" then
            toggleInfJump()
            Notifications:Success("Universal Hub Lite", "Infinite Jump Active !", 4.5)

            
        elseif command == "goto" or command == "tp" or command == "to" then
            local target = findPlayer(args[2])
            if target and target.Character and LocalPlayer.Character then
                local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                local localHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if targetHRP and localHRP then
                    localHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3) -- Teleport 3 studs behind the target
                    Notifications:Success("Universal Hub Lite", "Telported To: " .. target.Name, 4.5)

                end
            else
                Notifications:Error("Universal Hub Lite", "Player not found or not loaded !", 4.5)

            end
            
        elseif command == "bypassvc" or command == "bvc" or command == "rvc" then
            Notifications:Success("Universal Hub Lite", "Bypassing Voice Chat Will Take A Moment ...", 4.5)

            local VoiceChatInternal = cloneref and cloneref(game:GetService("VoiceChatInternal")) or game:GetService("VoiceChatInternal")
            local VoiceChatService = cloneref and cloneref(game:GetService("VoiceChatService")) or game:GetService("VoiceChatService")
    
            VoiceChatInternal:Leave()
            wait(0.2)
            VoiceChatService:rejoinVoice()
            wait(0.1)
            VoiceChatService:joinVoice()
            wait(0.3)
            VoiceChatInternal:Leave()
            wait(0.3)
            VoiceChatService:rejoinVoice()
            VoiceChatService:joinVoice()
       
            
        elseif command == "infyield" or command == "ify" then
            Notifications:Success("Universal Hub Lite", "Executing Infinite Yield Please Wait ...", 4.5)
            task.wait(4.5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            
        elseif command == "savepos" then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                savedPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
                Notifications:Success("Universal Hub Lite", "Saved Position " .. tostring(savedPosition), 4.5)

            end
            
        elseif command == "topos" then
            if savedPosition and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = savedPosition
                Notifications:Success("Universal Hub Lite", "Teleported To Saved Position " .. tostring(savedPosition), 4.5)
            else
                Notifications:Error("Universal Hub Lite", "No position saved or character not loaded !", 4.5)

            end
            
        elseif command == "clicktp" then
            local key = args[2]
            if key then
                setupClickTeleport(key:upper())
                Notifications:Success("Universal Hub Lite", "ClickTP Activated With Key: " .. key, 4.5)

            else
                Notifications:Error("Universal Hub Lite", "Please specify a key, e.g. !ClickTp K", 4.5)

            end
            
        elseif command == "spin" then
            local speed = tonumber(args[2]) or 10
            toggleSpin(speed)
            Notifications:Success("Universal Hub Lite", "Spin Activated With Speed: " .. (args[2] and tostring(args[2]) or "10"), 4.5)

            
        elseif command == "unspin" then
            if isSpinning then
                toggleSpin()
            Notifications:Success("Universal Hub Lite", "Stopped Spinning !", 4.5)
            else
            Notifications:Error("Universal Hub Lite", "Not Currently Spinning !", 4.5)

            end
            
        elseif command == "bang" then
            -- Check if args[2] is a number (changing speed of existing bang)
            if tonumber(args[2]) then
                local newSpeed = tonumber(args[2])
                
                -- If there's an active bang animation, just change its speed
                if _G.BangingActive and _G.BangAnimation then
                    _G.BangAnimation:AdjustSpeed(newSpeed)
                    Notifications:Success("Universal Hub Lite", "Bang speed changed to: " .. tostring(newSpeed), 4.5)
                else
                    Notifications:Error("Universal Hub Lite", "No active banging to change speed!", 4.5)
                end
                return
            end
            
            -- Otherwise, find the target player to bang
            local target = findPlayer(args[2])
            
            if not target then
                return Notifications:Error("Universal Hub Lite", "Error Target Not Found !", 4.5)
            end
            
            -- Get animation speed from args[3] or use default
            local bangSpeed = tonumber(args[3]) or 3
            Notifications:Success("Universal Hub Lite", "Banging: " .. tostring(target) .. " With Speed : " .. tostring(bangSpeed), 5)
            
            -- Stop any existing bang animation first
            if _G.BangingActive then
                -- Stop the animation
                if _G.BangAnimation then
                    _G.BangAnimation:Stop(0.5)
                end
                
                -- Disconnect the loop
                if _G.BangLoop then
                    _G.BangLoop:Disconnect()
                end
                
                -- Disconnect the died event
                if _G.BangDied then
                    _G.BangDied:Disconnect()
                end
                
                -- Clean up animation
                if _G.BangAnim then
                    _G.BangAnim:Destroy()
                end
            end
            
            -- Global variables to track state
            _G.BangingActive = true
            
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local localPlayer = Players.LocalPlayer
            
            -- Utility functions to get the root part of a character
            local function getRoot(character)
                return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso")
            end
            
            local humanoid = localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            if not humanoid then
                return Notifications:Error("Universal Hub Lite", "Humanoid not found!", 4.5)
            end
            
            -- Determine animation based on the character rig type (R6 or R15)
            _G.BangAnim = Instance.new("Animation")
            _G.BangAnim.AnimationId = humanoid.RigType == Enum.HumanoidRigType.R15 and "rbxassetid://5918726674" or "rbxassetid://148840371"
            
            -- Load and play the bang animation
            _G.BangAnimation = humanoid:LoadAnimation(_G.BangAnim)
            _G.BangAnimation:Play(0.1, 1, 1)
            _G.BangAnimation:AdjustSpeed(bangSpeed)  -- Use the speed from args[3]
            
            -- Define offset to position behind the target player
            local bangOffset = CFrame.new(0, 0, 1.1)
            
            -- Connect to the humanoid's Died event to clean up
            _G.BangDied = humanoid.Died:Connect(function()
                if _G.BangAnimation then _G.BangAnimation:Stop() end
                if _G.BangAnim then _G.BangAnim:Destroy() end
                if _G.BangDied then _G.BangDied:Disconnect() end
                if _G.BangLoop then _G.BangLoop:Disconnect() end
                _G.BangingActive = false
            end)
            
            -- Continuously position localPlayer behind targetPlayer while playing animation
            _G.BangLoop = RunService.Stepped:Connect(function()
                if not _G.BangingActive then
                    -- Stop the bang effect if toggle is off
                    if _G.BangAnimation then _G.BangAnimation:Stop() end
                    if _G.BangAnim then _G.BangAnim:Destroy() end
                    if _G.BangLoop then _G.BangLoop:Disconnect() end
                    if _G.BangDied then _G.BangDied:Disconnect() end
                    return
                end
                
                pcall(function()
                    local targetRoot = getRoot(target.Character)
                    local localRoot = getRoot(localPlayer.Character)
                    if targetRoot and localRoot then
                        localRoot.CFrame = targetRoot.CFrame * bangOffset
                    end
                end)
            end)
        
        elseif command == "unbang" then
            if _G.BangingActive then
                -- Stop the animation
                if _G.BangAnimation then
                    _G.BangAnimation:Stop(0.5)
                end
                
                -- Disconnect the loop
                if _G.BangLoop then
                    _G.BangLoop:Disconnect()
                end
                
                -- Disconnect the died event
                if _G.BangDied then
                    _G.BangDied:Disconnect()
                end
                
                -- Clean up animation
                if _G.BangAnim then
                    _G.BangAnim:Destroy()
                end
                
                -- Reset the global state
                _G.BangingActive = false
                Notifications:Success("Universal Hub Lite", "Banging stopped successfully", 4.5)
            else
                Notifications:Error("Universal Hub Lite", "No active banging to stop", 4.5)
            end
        
            
        elseif command == "settime" or command == "tod" then
            local timeArg = args[2] or "day"
            setTimeOfDay(timeArg)
            Notifications:Success("Universal Hub Lite", "Time Of Day Set To: " .. tostring(timeArg), 4.5)

        elseif command == "exbp" or command == "extendbaseplate" then 
            
            Notifications:Success("Universal Hub Lite", "Extending Baseplate (Game May Lag A Bit) ... ", 4.5)
            task.wait(4.5)
            local Workspace = game:GetService("Workspace");
            local Players = game:GetService("Players");
            local Player = Players.LocalPlayer
            local Terrain = Workspace.Terrain

            Terrain:FillBlock(CFrame.new(66, -10, 72.5), Vector3.new(10000, 16, 10000), Enum.Material.Asphalt)

        elseif command == "prefix" or command == "pfx" and args[2] then

            prefix = args[2] and tostring(args[2]) or "!"
            Notifications:Success("Universal Hub Lite", "Prefix Set To " .. (args[2] and tostring(args[2]) or "!"), 4.5)
           
            
        elseif command == "fpsboost" then
            local Terrain = workspace:FindFirstChildOfClass('Terrain')
        if Terrain then
            Terrain.WaterWaveSize = 0
            Terrain.WaterWaveSpeed = 0
            Terrain.WaterReflectance = 0
            Terrain.WaterTransparency = 0
        end

        local Lighting = game:GetService("Lighting")
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        settings().Rendering.QualityLevel = 1

        -- Modify all parts to improve FPS
        for i, v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            end
        end

        -- Disable unnecessary lighting effects
        for i, v in pairs(Lighting:GetDescendants()) do
            if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
                v.Enabled = false
            end
        end

        -- Monitor new descendants and destroy specific items to keep FPS boost intact
        local RunService = game:GetService("RunService")
        workspace.DescendantAdded:Connect(function(child)
            task.spawn(function()
                if child:IsA('ForceField') or child:IsA('Sparkles') or child:IsA('Smoke') or child:IsA('Fire') then
                    RunService.Heartbeat:Wait()
                    child:Destroy()
                end
            end)
        end)  -- <-- End the DescendantAdded connection here
       
        Notifications:Success("Universal Hub Lite", "FPS Boost Activated", 4.5)


        elseif command == "uesp" then 
            Notifications:Success("Universal Hub Lite", "Executing Unamed ESP Please Wait ...", 4.5)
            task.wait(4.5)
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()

        elseif command == "emotes" then
            Notifications:Success("Universal Hub Lite", "Executing Free Emotes Script Press , To Toggle ... ", 5.5)
            task.wait(2)
            loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Gi7331/scripts/main/Emote.lua"))()

        elseif command == "sbroken" then 
            Notifications:Success("Universal Hub Lite", "Executing SystemBroken Please Wait ... ", 4.5)
            task.wait(4.5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()

        elseif command == "shop" or command == "serverhop" then 
            local PlaceId = game.PlaceId
            local AllIDs = {}
            local foundAnything = ""
            local actualHour = os.date("!*t").hour
        
            local function TPReturner()
                local Site
                if foundAnything == "" then
                    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                else
                    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                end
        
                if Site.nextPageCursor then
                    foundAnything = Site.nextPageCursor
                end
        
                local eligibleServers = {}
                for _, v in pairs(Site.data) do
                    if tonumber(v.maxPlayers) > tonumber(v.playing) then
                        table.insert(eligibleServers, v.id)
                    end
                end
        
                if #eligibleServers > 0 then
                    local randomServerID = eligibleServers[math.random(1, #eligibleServers)]
                    table.insert(AllIDs, randomServerID)
        
                    Notifications:Success("Universal Hub Lite", "Hopping Wait A Sec ...", 4.5)
                    task.wait(4.5)
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, randomServerID, game.Players.LocalPlayer)
                else
                    Notifications:Info("Universal Hub Lite", "No empty servers found.", 3)
                end
            end
        
            TPReturner() -- Call the function to actually hop


        elseif command == "antiafk" or command == "antidle" then
            Notifications:Success("Universal Hub Lite", "Anti Idle Activated !", 4.5)
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)  -- ✅ This line was missing

        elseif command == "CopyUser" or command == "copyuser" then 
            local target = findPlayer(args[2])
            if not target then 
                Notifications:Success("Universal Hub Lite", "Target Not Found!", 4.5)
                return
            end
            Notifications:Success("Universal Hub Lite", "Copied Username : " .. tostring(target.Name), 4.5)
            setclipboard(tostring(target.Name))
        
        elseif command == "CopyDisplay" or command == "copydisplay" then
            local target = findPlayer(args[2])
            if not target then 
                Notifications:Success("Universal Hub Lite", "Target Not Found!", 4.5)
                return
            end
            Notifications:Success("Universal Hub Lite", "Copied Display : " .. tostring(target.DisplayName), 4.5)
            setclipboard(tostring(target.DisplayName))
        
        elseif command == "CopyUserId" or command == "copyuserid" or command == "copyid" then 
            local target = findPlayer(args[2])
            if not target then 
                Notifications:Success("Universal Hub Lite", "Target Not Found!", 4.5)
                return
            end
            Notifications:Success("Universal Hub Lite", "Copied UserId : " .. tostring(target.UserId), 4.5)
            setclipboard(tostring(target.UserId))
-- This part should be inside an existing if-elseif structure
elseif command == "Orbit" or command == "orbit" then
    -- Remove the fixed orbit radius and use the argument for speed.
    _G.isOrbiting = false
    _G.orbitSpeed = tonumber(args[3]) or 1  -- Set orbit speed from args[3], default to 1 if not provided.
    if _G.orbitSpeed < 1 then _G.orbitSpeed = 1 end
    if _G.orbitSpeed > 5 then _G.orbitSpeed = 5 end
    
    _G.orbitTarget = function(targetPlayer)  -- Pass targetPlayer as an argument
        local angle = 0
        while _G.isOrbiting and targetPlayer do
            local targetPos = targetPlayer.Character.HumanoidRootPart.Position
            local orbitPos = targetPos + Vector3.new(
                math.cos(angle) * 5,  -- Fixed radius of 5 (or another value you prefer)
                0,
                math.sin(angle) * 5
            )
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(orbitPos, targetPos)
            angle = angle + _G.orbitSpeed * 0.1
            game:GetService("RunService").Heartbeat:Wait()
        end
    end

    local targetPlayer = findPlayer(args[2]) -- Find the target player

    if targetPlayer then
        _G.isOrbiting = true  -- Set the orbiting state to true
        Notifications:Success("Universal Hub Lite", "Orbiting: " .. targetPlayer.Name .. " with speed " .. _G.orbitSpeed, 4.5)  -- Notify user
        spawn(function() _G.orbitTarget(targetPlayer) end) -- Start the orbiting function in a new thread, passing targetPlayer
    else
        Notifications:Error("Universal Hub Lite", "Target player not found!", 4.5)  -- Notify if no player is found
    end

elseif command == "Unorbit" or command == "unorbit" then
    -- Stop the orbiting
    _G.isOrbiting = false
    Notifications:Success("Universal Hub Lite", "Orbiting Stopped", 4.5)  -- Optional: notify the user

elseif command == "ShowImg" or command == "showimg" then 
    local targetPlayer = findPlayer(args[2]) -- Find the target player

    -- Check if targetPlayer is found
    if not targetPlayer then
        Notifications:Error("Universal Hub Lite", "Target player not found!", 4.5)  -- Notify if no player found
        return
    end

    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local ImageButton = Instance.new("ImageButton")
    local ImageLabel = Instance.new("ImageLabel")

    -- ScreenGui Properties
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Frame Properties
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BackgroundTransparency = 0.5
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.635, 0, 0.43, 0)
    Frame.Size = UDim2.new(0, 187, 0, 196)
    Frame.Active = true
    Frame.Draggable = true  -- Makes the frame draggable

    UICorner.CornerRadius = UDim.new(0, 35)
    UICorner.Parent = Frame

    -- Exit Button (ImageButton)
    ImageButton.Parent = Frame
    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton.BackgroundTransparency = 1
    ImageButton.BorderSizePixel = 0
    ImageButton.Position = UDim2.new(0.84, 0, 0.05, 0)
    ImageButton.Size = UDim2.new(0, 23, 0, 22)
    ImageButton.Image = "rbxassetid://75885882003801"

    -- Player Image Display (ImageLabel)
    ImageLabel.Parent = Frame
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Position = UDim2.new(0.12, 0, 0.16, 0)
    ImageLabel.Size = UDim2.new(0, 143, 0, 143)

    -- Check if the targetPlayer is set and not the local player
    if targetPlayer and targetPlayer ~= game.Players.LocalPlayer then
        -- If there is a valid targetPlayer, show their image
        ImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. targetPlayer.UserId .. "&width=420&height=420&format=png"
    else
        -- If no targetPlayer or the local player is the target, show the default image
        ImageLabel.Image = "rbxassetid://122802938843781"
    end

    -- Exit Button with Fade-out Effect
    ImageButton.MouseButton1Click:Connect(function()
        for transparency = 0.5, 1, 0.05 do
            Frame.BackgroundTransparency = transparency
            ImageLabel.ImageTransparency = transparency
            ImageButton.ImageTransparency = transparency  -- Fade the button as well
            wait(0.05)
        end
        ScreenGui:Destroy()  -- Remove the GUI after fading out
    end)

elseif command == "Headless" or command == "headless" then
    local character = game.Players.LocalPlayer.Character
    if character then
        local head = character:FindFirstChild("Head")
        if head then
            -- Make the headless
            head.Transparency = 1
            local face = head:FindFirstChild("face")
            if face then
                face.Transparency = 1
            end
            Notifications:Success("Universal Hub Lite", "Headless Equipped (Client-Side)", 4.5)
        end
    end

elseif command == "Unheadless" or command == "unheadless" or command == "noheadless" then
    local character = game.Players.LocalPlayer.Character
    if character then
        local head = character:FindFirstChild("Head")
        if head then
            -- Make the head visible again
            head.Transparency = 0
            local face = head:FindFirstChild("face")
            if face then
                face.Transparency = 0
            end
            Notifications:Success("Universal Hub Lite", "Headless Disabled (Client-Side)", 4.5)
        end
    end

elseif command == "CopyInv" or command == "copyinv" then
    -- Copy the invite link to the clipboard
    setclipboard("https://discord.gg/ZNfKFyuUEd")
    Notifications:Success("Universal Hub Lite", "Invite Link Copied To Clipboard !", 4.5)

elseif command == "CopyWebLink" or command == "copywebsitelink" or command == "copyweblink" then
    -- Copy the website link to the clipboard
    setclipboard("https://angxers2.github.io/Unihub/")
    Notifications:Success("Universal Hub Lite", "Website Link Copied To Clipboard!", 4.5)



elseif command == "ShowStats" or command == "Stats" or command == "stats" or command == "showstats" then 
    Notifications:Success("Universal Hub Lite", "Stats GUI ", 2.5)
    loadstring(game:HttpGet("https://pastebin.com/raw/ZKw8UCT5",true))()

elseif command == "CmdBarKeybind" or command == "barkeybind" or command == "cmdbarkeybind" or command == "cmdbarbind" or command == "barbind" then
    local keybind = args[2]
    local keycode = Enum.KeyCode[keybind:upper()] -- Make it case-insensitive

    if keycode then
        _G.CmdBarKeybind = keycode
        Notifications:Success("Universal Hub Lite", "Command Bar Keybind set to " .. keycode.Name, 4.5)
    else
        Notifications:Error("Universal Hub Lite", "Invalid keybind: " .. tostring(keybind), 4.5)
    end



elseif command == "Cmds" or command == "cmds" or command == "Commands" or command == "commands" then 
    Notifications:Success("Universal Hub Lite", "Executing Command List, Wait A Sec ...", 4.5)
    task.wait(4.5)
    -- Universal Hub Lite - Enhanced Command List GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Services
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UniversalHubLiteCommands"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main Frame with gradient background
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 520, 0, 420)
mainFrame.Position = UDim2.new(0.5, -260, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Add gradient to main frame
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
}
gradient.Rotation = 45
gradient.Parent = mainFrame

-- Add corner radius and shadow
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 10, 1, 10)
shadow.Position = UDim2.new(0, -5, 0, -5)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.8
shadow.BorderSizePixel = 0
shadow.ZIndex = -1
shadow.Parent = mainFrame
local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 12)
shadowCorner.Parent = shadow

-- Enhanced Title Bar (using TextButton for dragging)
local titleBar = Instance.new("TextButton")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
titleBar.BorderSizePixel = 0
titleBar.Text = ""
titleBar.Parent = mainFrame

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 85)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 60))
}
titleGradient.Parent = titleBar

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

-- Title with icon and collapse button
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -80, 1, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "⚡ Universal Hub Lite"
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 18
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Position = UDim2.new(0, 15, 0, 0)
titleText.Parent = titleBar

-- Collapse Button
local collapseButton = Instance.new("TextButton")
collapseButton.Size = UDim2.new(0, 35, 0, 35)
collapseButton.Position = UDim2.new(1, -75, 0, 2.5)
collapseButton.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
collapseButton.Text = "−"
collapseButton.Font = Enum.Font.GothamBold
collapseButton.TextSize = 18
collapseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
collapseButton.Parent = titleBar

local collapseCorner = Instance.new("UICorner")
collapseCorner.CornerRadius = UDim.new(0, 8)
collapseCorner.Parent = collapseButton

-- Stylized Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 35, 0, 35)
closeButton.Position = UDim2.new(1, -40, 0, 2.5)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeButton.Text = "✕"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

-- Make frame draggable (smooth version)
local dragging = false
local dragStart = nil
local startPos = nil
local currentTween = nil

-- Smooth position updating
local function smoothDrag(targetPos)
    if currentTween then
        currentTween:Cancel()
    end
    
    local tweenInfo = TweenInfo.new(
        0.1, -- Duration
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    )
    
    currentTween = TweenService:Create(mainFrame, tweenInfo, {Position = targetPos})
    currentTween:Play()
end

titleBar.MouseButton1Down:Connect(function()
    dragging = true
    dragStart = UserInputService:GetMouseLocation()
    startPos = mainFrame.Position
end)

titleBar.MouseButton1Up:Connect(function()
    dragging = false
    if currentTween then
        currentTween:Cancel()
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local mousePos = UserInputService:GetMouseLocation()
        local delta = mousePos - dragStart
        local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        smoothDrag(targetPos)
    end
end)

-- Enhanced Search Bar
local searchBar = Instance.new("Frame")
searchBar.Size = UDim2.new(1, -30, 0, 35)
searchBar.Position = UDim2.new(0, 15, 0, 55)
searchBar.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
searchBar.BorderSizePixel = 0
searchBar.Parent = mainFrame

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 8)
searchCorner.Parent = searchBar

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -20, 1, -10)
searchBox.Position = UDim2.new(0, 10, 0, 5)
searchBox.BackgroundTransparency = 1
searchBox.Text = ""
searchBox.PlaceholderText = "🔍 Search commands..."
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
searchBox.TextXAlignment = Enum.TextXAlignment.Left
searchBox.Parent = searchBar

-- Enhanced Category Frame
local categoryFrame = Instance.new("ScrollingFrame")
categoryFrame.Size = UDim2.new(0.28, 0, 1, -105)
categoryFrame.Position = UDim2.new(0, 15, 0, 105)
categoryFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
categoryFrame.BorderSizePixel = 0
categoryFrame.ScrollBarThickness = 4
categoryFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120)
categoryFrame.Parent = mainFrame

local catCorner = Instance.new("UICorner")
catCorner.CornerRadius = UDim.new(0, 8)
catCorner.Parent = categoryFrame

-- Enhanced Command List Frame
local commandListFrame = Instance.new("ScrollingFrame")
commandListFrame.Size = UDim2.new(0.68, -15, 1, -105)
commandListFrame.Position = UDim2.new(0.32, 0, 0, 105)
commandListFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
commandListFrame.BorderSizePixel = 0
commandListFrame.ScrollBarThickness = 4
commandListFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120)
commandListFrame.ScrollingDirection = Enum.ScrollingDirection.Y
commandListFrame.Parent = mainFrame

local cmdCorner = Instance.new("UICorner")
cmdCorner.CornerRadius = UDim.new(0, 8)
cmdCorner.Parent = commandListFrame

-- Collapse/Expand functionality
local isCollapsed = false
local originalSize = mainFrame.Size
local collapsedSize = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 40)

local function toggleCollapse()
    local tweenInfo = TweenInfo.new(
        0.4,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    )
    
    if isCollapsed then
        -- Expand
        collapseButton.Text = "−"
        local expandTween = TweenService:Create(mainFrame, tweenInfo, {Size = originalSize})
        expandTween:Play()
        
        -- Show content after a short delay
        expandTween.Completed:Connect(function()
            searchBar.Visible = true
            categoryFrame.Visible = true
            commandListFrame.Visible = true
        end)
    else
        -- Collapse
        collapseButton.Text = "+"
        searchBar.Visible = false
        categoryFrame.Visible = false
        commandListFrame.Visible = false
        
        local collapseTween = TweenService:Create(mainFrame, tweenInfo, {Size = collapsedSize})
        collapseTween:Play()
    end
    
    isCollapsed = not isCollapsed
end

collapseButton.MouseButton1Click:Connect(toggleCollapse)

-- Close functionality (with smooth animation)
closeButton.MouseButton1Click:Connect(function()
    local fadeInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local fadeTween = TweenService:Create(mainFrame, fadeInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    })
    fadeTween:Play()
    
    fadeTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end)

local commandCategories = {
    {
        name = "All",
        commands = {}
    },
    {
        name = "Player Manipulation",
        commands = {
            {cmd = "!fly", desc = "Enable fly mode", example = "!fly, !fly 100"},
            {cmd = "!unfly", desc = "Disable fly mode", example = "!unfly"},
            {cmd = "!walkspeed or !ws", desc = "Set player walk speed", example = "!walkspeed 25"},
            {cmd = "!jump", desc = "Set player jump power", example = "!jump 60"},
            {cmd = "!noclip", desc = "Enable NoClip mode", example = "!noclip"},
            {cmd = "!clip", desc = "Disable NoClip mode", example = "!clip"},
            {cmd = "!goto or !tp or !to", desc = "Teleport to another player", example = "!goto PlayerName"},
            {cmd = "!spin", desc = "Enable character spin", example = "!spin, !spin 20"},
            {cmd = "!unspin", desc = "Disable character spin", example = "!unspin"},
            {cmd = "!infjump", desc = "Enable infinite jump", example = "!infjump"},
            {cmd = "!bang", desc = "Play bang animation on player", example = "!bang TargetPlayer, !bang TargetPlayer 5"},
            {cmd = "!unbang", desc = "Stop bang animation", example = "!unbang"},
            {cmd = "!orbit", desc = "Orbit around a player", example = "!orbit TargetPlayer 2"},
            {cmd = "!unorbit", desc = "Stop orbiting player", example = "!unorbit"},
            {cmd = "!headless", desc = "Make player head invisible", example = "!headless"},
            {cmd = "!unheadless or !noheadless", desc = "Make player head visible", example = "!unheadless"}
        }
    },
    {
        name = "Camera Control",
        commands = {
            {cmd = "!fov", desc = "Change camera FOV", example = "!fov 90"},
            {cmd = "!view or !unview", desc = "View another player's camera", example = "!view OtherPlayer, !unview"}
        }
    },
    {
        name = "Teleportation",
        commands = {
            {cmd = "!rj or !rejoin", desc = "Rejoin the server", example = "!rj"},
            {cmd = "!savepos", desc = "Save current position", example = "!savepos"},
            {cmd = "!topos", desc = "Teleport to saved position", example = "!topos"},
            {cmd = "!clicktp", desc = "Click to teleport", example = "!clicktp K"},
            {cmd = "!shop or !serverhop", desc = "Hop to another server", example = "!shop"}
        }
    },
    {
        name = "World",
        commands = {
            {cmd = "!settime or !tod", desc = "Set the time of day", example = "!settime morning, !tod 14"},
            {cmd = "!exbp or !extendbaseplate", desc = "Extend the baseplate", example = "!exbp"},
            {cmd = "!fpsboost", desc = "Boost client FPS", example = "!fpsboost"}
        }
    },
    {
        name = "Utility",
        commands = {
            {cmd = "!prefix or !pfx", desc = "Change command prefix", example = "!prefix ."},
            {cmd = "!antiafk or !antidle", desc = "Prevent AFK kick", example = "!antiafk"},
            {cmd = "!bypassvc or !bvc or !rvc", desc = "Attempt bypass voice chat", example = "!bypassvc"},
            {cmd = "!cmds", desc = "Show this command GUI", example = "!cmds"}
        }
    },
    {
        name = "Script Execution",
        commands = {
            {cmd = "!uhub", desc = "Execute UniHub script", example = "!uhub"},
            {cmd = "!infyield or !ify", desc = "Execute InfYield script", example = "!infyield"},
            {cmd = "!uesp", desc = "Execute Unnamed ESP script", example = "!uesp"},
            {cmd = "!emotes", desc = "Execute Emotes script", example = "!emotes"},
            {cmd = "!sbroken", desc = "Execute SBroken script", example = "!sbroken"},
            {cmd = "!showstats or !Stats or !stats or !showstats", desc = "Show player stats GUI", example = "!showstats"}
        }
    },
    {
        name = "Information",
        commands = {
            {cmd = "!CopyUser or !copyuser", desc = "Copy player username", example = "!copyuser TargetPlayer"},
            {cmd = "!CopyDisplay or !copydisplay", desc = "Copy player display name", example = "!copydisplay TargetPlayer"},
            {cmd = "!CopyUserId or !copyuserid or !copyid", desc = "Copy player user ID", example = "!copyuserid TargetPlayer"},
            {cmd = "!ShowImg or !showimg", desc = "Show player headshot image", example = "!showimg TargetPlayer"},
            {cmd = "!CopyInv or !copyinv", desc = "Copy Discord invite link", example = "!copyinv"},
            {cmd = "!CopyWebLink or !copywebsitelink or !copyweblink", desc = "Copy website link", example = "!copyweblink"}
        }
    }
}

-- Add all to first category
for i=2, #commandCategories do
    for _, cmd in ipairs(commandCategories[i].commands) do
        table.insert(commandCategories[1].commands, cmd)
    end
end

-- Enhanced button creation
local function createCategoryButton(category, index)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 32)
    button.Position = UDim2.new(0, 5, 0, (index - 1) * 37 + 5)
    button.BackgroundColor3 = category.name == "All" and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(60, 60, 80)
    button.Text = category.name
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = categoryFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = button
    
    button.MouseButton1Click:Connect(function()
        for _, child in pairs(categoryFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
            end
        end
        button.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
        refreshCommandList(category.name, searchBox.Text)
    end)
    
    return button
end

-- Enhanced command item creation  
local function createCommandItem(command, index)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -15, 0, 70)
    frame.Position = UDim2.new(0, 8, 0, (index - 1) * 75 + 5)
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    frame.BorderSizePixel = 0
    frame.Parent = commandListFrame
    
    local itemCorner = Instance.new("UICorner")
    itemCorner.CornerRadius = UDim.new(0, 6)
    itemCorner.Parent = frame
    
    local cmdLabel = Instance.new("TextLabel")
    cmdLabel.Size = UDim2.new(1, -15, 0, 20)
    cmdLabel.Position = UDim2.new(0, 8, 0, 5)
    cmdLabel.BackgroundTransparency = 1
    cmdLabel.Text = command.cmd
    cmdLabel.Font = Enum.Font.GothamBold
    cmdLabel.TextSize = 15
    cmdLabel.TextColor3 = Color3.fromRGB(120, 200, 255)
    cmdLabel.TextXAlignment = Enum.TextXAlignment.Left
    cmdLabel.Parent = frame
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(1, -15, 0, 18)
    descLabel.Position = UDim2.new(0, 8, 0, 25)
    descLabel.BackgroundTransparency = 1
    descLabel.Text = command.desc
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextSize = 13
    descLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Parent = frame
    
    local exampleLabel = Instance.new("TextLabel")
    exampleLabel.Size = UDim2.new(1, -15, 0, 16)
    exampleLabel.Position = UDim2.new(0, 8, 0, 46)
    exampleLabel.BackgroundTransparency = 1
    exampleLabel.Text = "💡 " .. command.example
    exampleLabel.Font = Enum.Font.GothamSemibold
    exampleLabel.TextSize = 12
    exampleLabel.TextColor3 = Color3.fromRGB(150, 220, 150)
    exampleLabel.TextXAlignment = Enum.TextXAlignment.Left
    exampleLabel.Parent = frame
end

-- Refresh function (simplified)
function refreshCommandList(categoryName, searchTerm)
    for _, child in pairs(commandListFrame:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    local selectedCategory = commandCategories[1]
    for _, category in ipairs(commandCategories) do
        if category.name == categoryName then
            selectedCategory = category
            break
        end
    end
    
    local filteredCommands = {}
    for _, cmd in ipairs(selectedCategory.commands) do
        if searchTerm == "" or string.find(string.lower(cmd.cmd), string.lower(searchTerm)) then
            table.insert(filteredCommands, cmd)
        end
    end
    
    for i, cmd in ipairs(filteredCommands) do
        createCommandItem(cmd, i)
    end
    
    commandListFrame.CanvasSize = UDim2.new(0, 0, 0, #filteredCommands * 75 + 5)
end

-- Initialize
local buttonHeight = 0
for i, category in ipairs(commandCategories) do
    createCategoryButton(category, i)
    buttonHeight = buttonHeight + 37
end
categoryFrame.CanvasSize = UDim2.new(0, 0, 0, buttonHeight + 5)

refreshCommandList("All", "")

searchBox.Changed:Connect(function(prop)
    if prop == "Text" then
        local activeCategory = "All"
        for _, child in pairs(categoryFrame:GetChildren()) do
            if child:IsA("TextButton") and child.BackgroundColor3 == Color3.fromRGB(100, 150, 255) then
                activeCategory = child.Text -- Fixed: use Text instead of Name
                break
            end
        end
        refreshCommandList(activeCategory, searchBox.Text)
    end
end)

return screenGui
    

else
    print("Unknown command:", command)
end
end
end

print([[
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@JrrrrrrrQ@@@@@@@@@@@@@@@$xrrrrrrrB@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-      .}@@@@@@@@@@@@@@@B`       #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-.      }@@@@@@@@@@@@@@@B`.      #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-   .   }@@@@@@@@@@@@@@@B`.     .#@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@- .     }@@@@@@@@@@@@@@@B`.      #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-      .}@@@@@@@@@@@@@@@B`       #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-       }@@@@@@@@@@@@@@@B`  .  . #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-      .}@@@@@@@@@@@@@@@B`       #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-       }@@@@@@@@@@@@@@@B`   .   #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-      .}@@@@@@@@@@@@@@@B`  .    #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-.      }@@@@@@@@@@@@@@@B`       #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-       }@@@@@@@@@@@@@@@B`       #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-       }@@@@@@@@@@@@@@@B`   .   #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@-       }@@@@@@@@@@@@@@@B`       #@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@] . ..  -@@@@@@@@@@@@@@@B`     . M@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@j      .:@@@@@@@@@@@@@@@C.      ^@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@$..      !@@@@@@@@@@@@@d      . 1@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@/.        0@@@@@@@@@M]        '*@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@|          '>1|)];.  .      .h@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@Z   .         .           iB@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@O`                   .~$@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@Y<`           .;1*@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$*hkkaM@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@(   'o@@@@@@@0   .a@@@@X` . :@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@I   -@@@@@@$^  .|@@ai.     :@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@Q  . p@@@@@z   `@@M.  I#.  :@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@[  ._@@@@$"   Z@@M"Y@@W.  :@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@a.   Z@@@f   <@@@@@@@@W.  :@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@z   <@@@"  'M@@@@@@@@W. .:@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@$'   0@}   f@@@@@@@@@W.  :@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@a.  lB`  I@@@@@@@@@@W'  :@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@-   ;   m@@@@@@@@@@W.  :@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@"     }@@@@@@@@@@@W.  :@@a@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@v''''`#@@@@@@@@@@@W`''I@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
]])

-- Get required services
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- This should match your existing prefix variable from your main script
local prefix = "!" -- Default prefix, this should be the same variable as your main script

-- Command Bar GUI (toggle with T key)
local commandBarGui = Instance.new("ScreenGui")
commandBarGui.Name = "UHubCommandBar"
commandBarGui.ResetOnSpawn = false
commandBarGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
commandBarGui.Parent = playerGui

local commandBarFrame = Instance.new("Frame")
commandBarFrame.Name = "CommandBarFrame"
commandBarFrame.Size = UDim2.new(0.4, 0, 0, 40)
commandBarFrame.Position = UDim2.new(0.3, 0, 0.05, 0)
commandBarFrame.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
commandBarFrame.BackgroundTransparency = 1 -- Start hidden
commandBarFrame.BorderSizePixel = 0
commandBarFrame.Visible = false
commandBarFrame.Parent = commandBarGui

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 10)
barCorner.Parent = commandBarFrame

local barStroke = Instance.new("UIStroke")
barStroke.Color = Color3.fromRGB(59, 130, 246)
barStroke.Thickness = 1.5
barStroke.Transparency = 1 -- Start hidden
barStroke.Parent = commandBarFrame

local commandTextBox = Instance.new("TextBox")
commandTextBox.Name = "CommandTextBox"
commandTextBox.Size = UDim2.new(1, -20, 1, -10)
commandTextBox.Position = UDim2.new(0, 10, 0, 5)
commandTextBox.BackgroundTransparency = 1
commandTextBox.Text = ""
commandTextBox.PlaceholderText = "Type a command... (Enter to autocomplete, Enter again to execute)"
commandTextBox.Font = Enum.Font.GothamSemibold
commandTextBox.TextSize = 18
commandTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
commandTextBox.PlaceholderColor3 = Color3.fromRGB(148, 163, 184)
commandTextBox.TextXAlignment = Enum.TextXAlignment.Left
commandTextBox.ClearTextOnFocus = false
commandTextBox.TextTransparency = 1 -- Start hidden
commandTextBox.Parent = commandBarFrame

-- Autocomplete dropdown container
local autocompleteFrame = Instance.new("Frame")
autocompleteFrame.Name = "AutocompleteFrame"
autocompleteFrame.Size = UDim2.new(1, 0, 0, 0) -- Start with 0 height
autocompleteFrame.Position = UDim2.new(0, 0, 1, 2)
autocompleteFrame.BackgroundColor3 = Color3.fromRGB(25, 35, 50)
autocompleteFrame.BackgroundTransparency = 0.05
autocompleteFrameBorderSizePixel = 0
autocompleteFrame.Visible = false
autocompleteFrame.Parent = commandBarFrame

local autocompleteCorner = Instance.new("UICorner")
autocompleteCorner.CornerRadius = UDim.new(0, 8)
autocompleteCorner.Parent = autocompleteFrame

local autocompleteStroke = Instance.new("UIStroke")
autocompleteStroke.Color = Color3.fromRGB(59, 130, 246)
autocompleteStroke.Thickness = 1
autocompleteStroke.Transparency = 0.7
autocompleteStroke.Parent = autocompleteFrame

-- Scrolling frame for suggestions
local suggestionScrollFrame = Instance.new("ScrollingFrame")
suggestionScrollFrame.Name = "SuggestionScrollFrame"
suggestionScrollFrame.Size = UDim2.new(1, -10, 1, -10)
suggestionScrollFrame.Position = UDim2.new(0, 5, 0, 5)
suggestionScrollFrame.BackgroundTransparency = 1
suggestionScrollFrame.BorderSizePixel = 0
suggestionScrollFrame.ScrollBarThickness = 4
suggestionScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(59, 130, 246)
suggestionScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
suggestionScrollFrame.Parent = autocompleteFrame

local suggestionLayout = Instance.new("UIListLayout")
suggestionLayout.SortOrder = Enum.SortOrder.LayoutOrder
suggestionLayout.Padding = UDim.new(0, 2)
suggestionLayout.Parent = suggestionScrollFrame

-- List of all commands and aliases for autocomplete
local commandList = {
    "fly", "unfly", "fov", "rj", "rejoin", "uhub", "noclip", "clip", "walkspeed", "ws", "jump", "view", "unview", "infjump", "goto", "tp", "to", "bypassvc", "bvc", "rvc", "infyield", "ify", "savepos", "topos", "clicktp", "spin", "unspin", "bang", "unbang", "settime", "tod", "exbp", "extendbaseplate", "prefix", "pfx", "fpsboost", "uesp", "emotes", "sbroken", "shop", "serverhop", "antiafk", "antidle", "copyuser", "copydisplay", "copyuserid", "copyid", "orbit", "unorbit", "showimg", "headless", "unheadless", "noheadless", "copyinv", "copyweblink", "copywebsitelink", "showstats", "stats", "cmds", "commands"
}

-- Autocomplete logic
local autocompleteMatches = {}
local selectedIndex = 1
local suggestionButtons = {}

-- Track command bar visibility
local barVisible = false

-- Tween info for fade animations
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local function clearSuggestions()
    for _, button in pairs(suggestionButtons) do
        button:Destroy()
    end
    suggestionButtons = {}
    autocompleteFrame.Visible = false
end

local function createSuggestionButton(command, index)
    local button = Instance.new("TextButton")
    button.Name = "SuggestionButton" .. index
    button.Size = UDim2.new(1, 0, 0, 30)
    button.BackgroundColor3 = Color3.fromRGB(35, 45, 65)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Text = command
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.LayoutOrder = index
    
    -- FIXED: Use PaddingLeft instead of Left
    local buttonPadding = Instance.new("UIPadding")
    buttonPadding.PaddingLeft = UDim.new(0, 15)
    buttonPadding.PaddingTop = UDim.new(0, 5)
    buttonPadding.PaddingBottom = UDim.new(0, 5)
    buttonPadding.Parent = button
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        selectedIndex = index
        updateSelectedSuggestion()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundTransparency = 0.7}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        if selectedIndex ~= index then
            TweenService:Create(button, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play()
        end
    end)
    
    -- Click to select
    button.MouseButton1Click:Connect(function()
        selectSuggestion(command)
    end)
    
    button.Parent = suggestionScrollFrame
    return button
end

local function updateSelectedSuggestion()
    for i, button in pairs(suggestionButtons) do
        if i == selectedIndex then
            TweenService:Create(button, TweenInfo.new(0.1), {
                BackgroundTransparency = 0.7,
                TextColor3 = Color3.fromRGB(59, 130, 246)
            }):Play()
        else
            TweenService:Create(button, TweenInfo.new(0.1), {
                BackgroundTransparency = 1,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        end
    end
end

function selectSuggestion(command)
    local text = commandTextBox.Text
    local args = text:match("^%S*(.*)") or ""
    commandTextBox.Text = command .. args
    commandTextBox.CursorPosition = #command + 1
    clearSuggestions()
end

local function updateAutocomplete()
    local text = commandTextBox.Text
    print("Updating autocomplete for text: '" .. text .. "'") -- Debug print
    
    -- Extract just the first word (command)
    local commandWord = text:match("^(%S*)") or ""
    print("Command word extracted: '" .. commandWord .. "'") -- Debug print
    
    if commandWord == "" or #commandWord < 1 then
        print("Command word is empty, clearing suggestions") -- Debug print
        clearSuggestions()
        autocompleteMatches = {}
        selectedIndex = 1
        return
    end
    
    -- Find all matches (case insensitive)
    local matches = {}
    local lowerCommandWord = commandWord:lower()
    print("Looking for matches with: '" .. lowerCommandWord .. "'") -- Debug print
    
    for _, cmd in ipairs(commandList) do
        local cmdLower = cmd:lower()
        if cmdLower:sub(1, #lowerCommandWord) == lowerCommandWord then
            table.insert(matches, cmd)
            print("Found match: " .. cmd) -- Debug print
        end
    end
    
    autocompleteMatches = matches
    selectedIndex = 1
    
    print("Total matches found: " .. #matches) -- Debug print
    
    if #matches > 0 then
        clearSuggestions()
        
        -- Limit to max 6 suggestions for better UX
        local maxSuggestions = math.min(#matches, 6)
        print("Creating " .. maxSuggestions .. " suggestion buttons") -- Debug print
        
        for i = 1, maxSuggestions do
            local button = createSuggestionButton(matches[i], i)
            table.insert(suggestionButtons, button)
        end
        
        -- Update dropdown size
        local dropdownHeight = maxSuggestions * 32
        autocompleteFrame.Size = UDim2.new(1, 0, 0, dropdownHeight)
        suggestionScrollFrame.CanvasSize = UDim2.new(0, 0, 0, maxSuggestions * 32)
        
        autocompleteFrame.Visible = true
        updateSelectedSuggestion()
        
        -- Fade in effect
        autocompleteFrame.BackgroundTransparency = 1
        TweenService:Create(autocompleteFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0.05}):Play()
        
        print("Autocomplete dropdown should now be visible") -- Debug print
    else
        print("No matches found, clearing suggestions") -- Debug print
        clearSuggestions()
    end
end

local function fadeIn()
    commandBarFrame.Visible = true
    
    -- Fade in the frame background
    local frameTween = TweenService:Create(commandBarFrame, tweenInfo, {
        BackgroundTransparency = 0.15
    })
    
    -- Fade in the stroke
    local strokeTween = TweenService:Create(barStroke, tweenInfo, {
        Transparency = 0.5
    })
    
    -- Fade in the text
    local textTween = TweenService:Create(commandTextBox, tweenInfo, {
        TextTransparency = 0,
        PlaceholderColor3 = Color3.fromRGB(148, 163, 184)
    })
    
    frameTween:Play()
    strokeTween:Play()
    textTween:Play()
end

local function fadeOut()
    -- Fade out the frame background
    local frameTween = TweenService:Create(commandBarFrame, tweenInfo, {
        BackgroundTransparency = 1
    })
    
    -- Fade out the stroke
    local strokeTween = TweenService:Create(barStroke, tweenInfo, {
        Transparency = 1
    })
    
    -- Fade out the text
    local textTween = TweenService:Create(commandTextBox, tweenInfo, {
        TextTransparency = 1,
        PlaceholderColor3 = Color3.fromRGB(148, 163, 184)
    })
    
    -- Fade out suggestion
    if autocompleteFrame.Visible then
        TweenService:Create(autocompleteFrame, tweenInfo, {
            BackgroundTransparency = 1
        }):Play()
    end
    
    frameTween:Play()
    strokeTween:Play()
    textTween:Play()
    
    -- Hide the frame after animation completes
    frameTween.Completed:Connect(function()
        if not barVisible then
            commandBarFrame.Visible = false
            clearSuggestions()
        end
    end)
end

-- Handle T key press to toggle command bar
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    -- Ignore input if it's already being processed by Roblox (e.g., typing in a chat box)
    if gameProcessedEvent then return end

    if input.KeyCode == _G.CmdBarKeybind then
        barVisible = not barVisible
        
        if barVisible then
            fadeIn()
            wait(0.1) -- Small delay to ensure animation starts
            commandTextBox:CaptureFocus() -- Automatically focus the textbox when it appears
            updateAutocomplete() -- Update autocomplete in case there's existing text
        else
            commandTextBox:ReleaseFocus() -- Release focus when hidden
            commandTextBox.Text = "" -- Clear text when hidden
            clearSuggestions() -- Hide suggestions when hidden
            fadeOut()
        end
    end
end)

-- Connect autocomplete update to text changes
commandTextBox:GetPropertyChangedSignal("Text"):Connect(function()
    print("Text changed to: '" .. commandTextBox.Text .. "'") -- Debug print
    updateAutocomplete()
end)

-- Track if we're autocompleting to prevent premature closing
local isAutocompleting = false

-- Handle other navigation keys when textbox is focused
commandTextBox.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Return or input.KeyCode == Enum.KeyCode.KeypadEnter then
        -- Use Enter to accept first suggestion if available, otherwise submit command
        if #autocompleteMatches > 0 and commandTextBox.Text ~= "" then
            local firstWord = commandTextBox.Text:match("^(%S*)") or ""
            if firstWord ~= autocompleteMatches[1] then -- Only autocomplete if it's not already complete
                isAutocompleting = true
                selectSuggestion(autocompleteMatches[selectedIndex])
                -- Refocus the textbox after autocomplete
                task.wait(0.05)
                commandTextBox:CaptureFocus()
                isAutocompleting = false
                return -- Don't submit the command yet
            end
        end
    elseif input.KeyCode == Enum.KeyCode.Down then
        -- Navigate down in suggestions
        if #autocompleteMatches > 0 then
            selectedIndex = selectedIndex + 1
            if selectedIndex > #autocompleteMatches then
                selectedIndex = 1
            end
            updateSelectedSuggestion()
        end
    elseif input.KeyCode == Enum.KeyCode.Up then
        -- Navigate up in suggestions
        if #autocompleteMatches > 0 then
            selectedIndex = selectedIndex - 1
            if selectedIndex < 1 then
                selectedIndex = #autocompleteMatches
            end
            updateSelectedSuggestion()
        end
    elseif input.KeyCode == Enum.KeyCode.Escape then
        -- Close suggestions
        clearSuggestions()
    end
end)

-- Hide suggestion on focus lost or command submit
commandTextBox.FocusLost:Connect(function(enterPressed)
    -- Don't close if we're in the middle of autocompleting
    if isAutocompleting then
        return
    end
    
    -- Small delay to allow clicks on suggestions
    task.wait(0.1)
    clearSuggestions()
    
    if enterPressed and commandTextBox.Text ~= "" then
        local command = commandTextBox.Text:gsub("^%s+", ""):gsub("%s+$", "") -- Trim whitespace
        
        -- Add prefix and process the command
        local fullCommand = prefix .. command
        
        -- Process the command using your existing processCommand function
        processCommand(fullCommand)
        
        commandTextBox.Text = ""
        barVisible = false
        fadeOut()
    end
end)

-- Main command processing function (chat) - your existing chat handler
LocalPlayer.Chatted:Connect(function(msg)
    processCommand(msg)
end)
