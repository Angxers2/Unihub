
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local startTime = tick()
local latestVersion = loadstring(game:HttpGet("https://raw.githubusercontent.com/Angxers2/Unihub/refs/heads/main/version.lua", true))()

-- Create a sound object
local sound = Instance.new("Sound")

-- Set the sound's parent to the game's workspace or any desired part
sound.Parent = game.Workspace
sound.Volume = 1
-- Set the sound ID
local soundIds = {
    "rbxassetid://9085027122",
    "rbxassetid://488265234",
    "rbxassetid://6069108501",
    "rbxassetid://410609839"
}

-- Get a random sound ID from the array
local randomIndex = math.random(1, #soundIds)
local selectedSoundId = soundIds[randomIndex]

-- Set the randomly selected sound ID
sound.SoundId = selectedSoundId

-- Add fade-out functionality (doesn't automatically start or stop the sound)
local function fadeOutSound(sound, fadeTime)
    fadeTime = fadeTime or 2 -- Default fade time of 2 seconds if not specified
    
    -- Store the original volume to restore it later if needed
    local originalVolume = sound.Volume
    local fadeOutSteps = 20 -- Number of steps for smooth fade-out
    local volumeDecrement = originalVolume / fadeOutSteps
    
    -- Create a coroutine for the fading process
    spawn(function()
        -- Wait until sound is almost finished
        local soundLength = sound.TimeLength
        if soundLength > 0 then
            wait(soundLength - fadeTime)
        else
            -- Fallback for sounds with unknown length
            -- You can adjust this behavior as needed
            wait(5) -- Adjust this to a reasonable wait time
        end
        
        -- Gradually decrease volume
        for i = 1, fadeOutSteps do
            sound.Volume = originalVolume - (volumeDecrement * i)
            wait(fadeTime / fadeOutSteps)
        end
        
        -- Ensure volume is 0 at the end
        sound.Volume = 0
    end)
end

-- Connect the fade-out function to the sound's Played event
sound.Played:Connect(function()
    fadeOutSound(sound, 2) -- Fade out over 2 seconds
end)






local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local Version = "V3.0"
-- List of Logo IDs
local LogoIDs = {
    "139581664357521"
}
local Date = os.date("%B %d")

local LatestReleaseDate = loadstring(game:HttpGet("https://raw.githubusercontent.com/Angxers2/Unihub/refs/heads/main/version.lua",true))()


local Errors = loadstring(game:HttpGet("https://pastebin.com/raw/R3NSxp0r",true))()



 

-- Randomly select a Logo ID from the list
local LogoID = LogoIDs[math.random(1, #LogoIDs)]

local UsercreationKey = loadstring(game:HttpGet("https://pastebin.com/raw/9Ev9QSVu",true))()


-- Create a BlurEffect
local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 25 -- Set initial blur size to 30
blurEffect.Parent = Lighting




-- Function to load other things
local function loadAdditionalThings()

	
	

	

	local games = {
		[155615604] = "Prison Life 🏢", -- Fully Complete
		[142823291] = "MM2 🔪",          -- Fully Complete
		[2788229376] = "Da Hood 🔫",     -- Fully Complete
		[606849621] = "Jailbreak 🚔",
		[292439477] = "Phantom Forces 💥",
		[537413528] = "Build A Boat For Treasure 🚤",
		[2041312716] = "Super Golf ⛳",
		[189707] = "Natural Disaster Survival 🌪️",
		[3260590327] = "Arsenal 🔫",
		[292439477] = "Tower of Hell 🗼",
		[185655149] = "Bloxburg 🏡",
		[4616652839] = "Adopt Me! 🐶",
		[321541178] = "Anime Fighting Simulator 💪",
		[3233893879] = "Shindo Life 🍥",
		[4954755078] = "All Star Tower Defense 🌟",
		[12109643] = "Work at a Pizza Place 🍕",
		[286090429] = "Bee Swarm Simulator 🐝",
		[920587237] = "Rogue Lineage ⚔️",
		[4442272183] = "Ro Ghoul 👻",
		[13772394625] = "Blade Ball ⚔️",
		[488667523] = "Royale High 👑",
		[3306021185] = "Brookhaven 🏠",
		[552500546] = "Flee the Facility 🏃",
		[4605918737] = "King Piece 👑",
		[2046441765] = "Ninja Legends 🥷",
		[6884319169] = "Mic Up 🎙", -- Fully Complete
		[3840352284] = "Volleyball 4.2 🏐", -- Done
	}


	
	
-- Gui to Lua



-- Instances:
local TweenService = game:GetService("TweenService")
local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")

-- Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.5, -400, 0.45, -225) -- Adjusted position to be lower
ImageLabel.Size = UDim2.new(0, 800, 0, 450) -- Size remains larger
ImageLabel.Image = "http://www.roblox.com/asset/?id=".. LogoID

-- Tween settings
local fadeInTween = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
local fadeOutTween = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

-- Fade In
ImageLabel.ImageTransparency = 1 -- Start fully transparent
local fadeIn = TweenService:Create(ImageLabel, fadeInTween, {ImageTransparency = 0}) -- Create fade in tween
fadeIn:Play() -- Play the tween
fadeIn.Completed:Wait() -- Wait for the tween to complete

-- Wait before fading out
wait(5) -- Adjust the wait time as needed for loading

-- Fade Out
local fadeOut = TweenService:Create(ImageLabel, fadeOutTween, {ImageTransparency = 1}) -- Create fade out tween
fadeOut:Play() -- Play the tween
fadeOut.Completed:Wait() -- Wait for the tween to complete
wait(1.5)
-- Optionally, remove the GUI after fading out
ScreenGui:Destroy()

-- Add your loading tasks here 

    -- You can add more loading tasks as needed

    
	sound:Play()



	local Window = Rayfield:CreateWindow({
		Name = "Universal Hub " .. Version,
		LoadingTitle = "Universal Hub " .. Version,
		LoadingSubtitle = "by angxers",
		Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes
	 
		DisableRayfieldPrompts = false,
		DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
	 
		ConfigurationSaving = {
		   Enabled = false,
		   FolderName = "Universal Hub", -- Create a custom folder for your hub/game
		   FileName = "UniHub"
		},
	 
		Discord = {
		   Enabled = false,
		   Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
		   RememberJoins = true -- Set this to false to make them join the discord every time they load it up
		},
	 
		KeySystem = false, -- Set this to true to use our key system
		KeySettings = {
		   Title = "Untitled",
		   Subtitle = "Key System",
		   Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
		   FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		   SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		   GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		   Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
		}
	 })
	 
	 
	 

local player = game.Players.LocalPlayer

_G.key = loadstring(game:HttpGet("https://pastebin.com/raw/Fp6GwTF3",true))()

loadstring(game:HttpGet("https://pastebin.com/raw/ZKw8UCT5",true))()
local currentHour = tonumber(os.date("%H"))
local currentMinute = os.date("%M")
local currentTime = os.date("%I:%M %p") -- 12-hour format with AM/PM

-- Determine the greeting based on time of day
local greeting

if currentHour >= 6 and currentHour < 12 then
    greeting = "Good morning"
elseif currentHour >= 12 and currentHour < 18 then
    greeting = "Good afternoon"
elseif currentHour >= 18 and currentHour < 21 then
    greeting = "Good evening"
else
    greeting = "Good night"
end

local MarketplaceService = game:GetService("MarketplaceService")

-- Get the game info
local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
local currentGameName = gameInfo.Name

-- Create Welcome Tab
local WelcomeTab = Window:CreateTab("Welcome", "door-open") -- Title, Image

--==[ Welcome Section ]==--
local WelcomeSection = WelcomeTab:CreateSection("Welcome")

local displayText = player.DisplayName
if player.UserId == 7332803063 or player.UserId == 7846406408 then
    displayText = displayText .. " My Slave Arshvir"
end

local LabelGreeting = WelcomeTab:CreateLabel(greeting .. ", " .. displayText, "smile") -- added icon

WelcomeTab:CreateLabel("Executor: " .. (identifyexecutor() or "Unknown"), "cpu") -- added icon

WelcomeTab:CreateLabel(string.format("Version %s | Released: %s", Version, LatestReleaseDate), "tag") -- added icon

local UserInputService = game:GetService("UserInputService")

-- Detect platform and choose icon
local platformName = "Unknown"
local platformIcon = "monitor" -- default icon

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    platformName = "Mobile"
    platformIcon = "smartphone"
elseif UserInputService.KeyboardEnabled then
    platformName = "PC"
    platformIcon = "monitor"
elseif UserInputService.GamepadEnabled then
    platformName = "Console"
    platformIcon = "gamepad"
end

-- Create the label with dynamic icon
local PlatformLabel = WelcomeTab:CreateLabel("Platform: " .. platformName, platformIcon)

-- Create the location label
LocationLabel = WelcomeTab:CreateLabel("Location: Loading...")

-- Create the weather label
WeatherLabel = WelcomeTab:CreateLabel("Weather: Loading...", "cloud")



local function runWithTimeout(func, timeout)
    local completed = false
    local result = nil
    local success = false
    
    -- Run the function in a coroutine
    coroutine.wrap(function()
        success, result = pcall(func)
        completed = true
    end)()
    
    -- Wait for completion or timeout
    local startTime = tick()
    while not completed and (tick() - startTime) < timeout do
        wait(0.1)
    end
    
    if completed then
        return success, result
    else
        return false, "Timeout"
    end
end

-- Function to update server location, ISP info, and weather
function updateLocationAndWeather()
    LocationLabel:Set("Fetching location...", "map-pin")
    WeatherLabel:Set("Fetching weather...", "cloud")
    
    -- Fetch location with 8 second timeout
    local locationSuccess, locationResult = runWithTimeout(function()
        return game:HttpGet("https://ipinfo.io/json")
    end, 8)
    
    if locationSuccess and locationResult ~= "Timeout" then
        local parseSuccess, jsonData = pcall(function()
            return game:GetService("HttpService"):JSONDecode(locationResult)
        end)
        
        if parseSuccess then
            local city = jsonData.city or "Unknown"
            local region = jsonData.region or "Unknown"
            local country = jsonData.country or "Unknown"
            local isp = jsonData.org or "Unknown"
            local loc = jsonData.loc or "" -- latitude,longitude

            -- Set the location label with all info
            LocationLabel:Set(
                city .. ", " .. region .. ", " .. country .. " | ISP: " .. isp,
                "map-pin"
            )
            
            -- Fetch weather if location is available
            if loc ~= "" then
                local weatherSuccess, weatherResult = runWithTimeout(function()
                    return game:HttpGet("https://wttr.in/" .. loc .. "?format=j1")
                end, 8)
                
                if weatherSuccess and weatherResult ~= "Timeout" then
                    local weatherParseSuccess, weatherData = pcall(function()
                        return game:GetService("HttpService"):JSONDecode(weatherResult)
                    end)
                    
                    if weatherParseSuccess then
                        local currentCondition = weatherData.current_condition[1]
                        
                        local temp = currentCondition.temp_C .. "°C / " .. currentCondition.temp_F .. "°F"
                        local condition = currentCondition.weatherDesc[1].value
                        local humidity = currentCondition.humidity .. "%"
                        local feelsLike = currentCondition.FeelsLikeC .. "°C"
                        
                        -- Choose appropriate weather icon
                        local weatherIcon = "cloud"
                        local conditionLower = condition:lower()
                        if conditionLower:find("clear") or conditionLower:find("sunny") then
                            weatherIcon = "sun"
                        elseif conditionLower:find("rain") then
                            weatherIcon = "cloud-rain"
                        elseif conditionLower:find("snow") then
                            weatherIcon = "cloud-snow"
                        elseif conditionLower:find("thunder") or conditionLower:find("storm") then
                            weatherIcon = "cloud-lightning"
                        elseif conditionLower:find("cloud") then
                            weatherIcon = "cloud"
                        end
                        
                        WeatherLabel:Set(
                            temp .. " | " .. condition .. " | Humidity: " .. humidity,
                            weatherIcon
                        )
                    else
                        WeatherLabel:Set("Weather: N/A", "cloud")
                    end
                else
                    WeatherLabel:Set("Weather: N/A", "cloud")
                end
            else
                WeatherLabel:Set("Weather: N/A", "cloud")
            end
        else
            LocationLabel:Set("Location: N/A | ISP: N/A", "map-pin")
            WeatherLabel:Set("Weather: N/A", "cloud")
        end
    else
        LocationLabel:Set("Location: N/A | ISP: N/A", "map-pin")
        WeatherLabel:Set("Weather: N/A", "cloud")
    end
end

-- Initial fetch
updateLocationAndWeather()

-- Optional: Auto-refresh every 10 minutes (600 seconds)
spawn(function()
    while true do
        wait(600)
        updateLocationAndWeather()
    end
end)







--==[ Date & Time Section ]==--
local DateTimeSection = WelcomeTab:CreateSection("Date & Time")

TimeLabel = WelcomeTab:CreateLabel("Time: " .. os.date("%A, %I:%M %p"), "clock") -- added icon
DateLabel = WelcomeTab:CreateLabel("Date: " .. os.date("%B %d, %Y"), "calendar") -- added icon
DaysUntilNextMonthLabel = WelcomeTab:CreateLabel("Days until next month: " .. (tonumber(os.date("%d")) - 1), "arrow-right") -- added icon
TimezoneLabel = WelcomeTab:CreateLabel("Timezone: ", "map-pin") -- added icon

TimezoneMap = {
    -- North America
    PST = "Pacific Standard Time (PST)",
    PDT = "Pacific Daylight Time (PDT)",
    MST = "Mountain Standard Time (MST)",
    MDT = "Mountain Daylight Time (MDT)",
    CST = "Central Standard Time (CST)",
    CDT = "Central Daylight Time (CDT)",
    EST = "Eastern Standard Time (EST)",
    EDT = "Eastern Daylight Time (EDT)",
    AST = "Atlantic Standard Time (AST)",
    NST = "Newfoundland Standard Time (NST)",

    -- Europe
    GMT = "Greenwich Mean Time (GMT)",
    BST = "British Summer Time (BST)",
    CET = "Central European Time (CET)",
    CEST = "Central European Summer Time (CEST)",
    EET = "Eastern European Time (EET)",
    EEST = "Eastern European Summer Time (EEST)",

    -- Asia
    IST = "India Standard Time (IST)",
    CST_China = "China Standard Time (CST)",
    JST = "Japan Standard Time (JST)",
    KST = "Korea Standard Time (KST)",
    HKT = "Hong Kong Time (HKT)",
    SGT = "Singapore Time (SGT)",

    -- Oceania
    AEST = "Australian Eastern Standard Time (AEST)",
    AEDT = "Australian Eastern Daylight Time (AEDT)",
    ACST = "Australian Central Standard Time (ACST)",
    ACDT = "Australian Central Daylight Time (ACDT)",
    AWST = "Australian Western Standard Time (AWST)",

    -- Other
    UTC = "Coordinated Universal Time (UTC)"
}

spawn(function()
    while true do
        TimeLabel:Set("Time: " .. os.date("%A, %I:%M %p"))
        wait(1)
    end
end)

spawn(function()
    while true do
        local current_day = tonumber(os.date("%d"))
        local current_month = tonumber(os.date("%m"))
        local current_year = tonumber(os.date("%Y"))

        local next_month = current_month + 1
        local next_year = current_year
        if next_month > 12 then
            next_month = 1
            next_year = current_year + 1
        end

        local last_day = os.date("*t", os.time{year=next_year, month=next_month, day=0}).day
        DaysUntilNextMonthLabel:Set("Days until next month: " .. (last_day - current_day))
        wait(60)
    end
end)

spawn(function()
    while true do
        local shortTz = os.date("%Z")
        TimezoneLabel:Set("Timezone: " .. (TimezoneMap[shortTz] or shortTz))
        wait(60)
    end
end)



--==[ Game Status Section ]==--

--==[ Current Game Section ]==--
local GameSection = WelcomeTab:CreateSection("Current Game")

local LabelCurrentGame = WelcomeTab:CreateLabel("Current Game: N/A", "gamepad") -- default icon

local function checkGame()
    local currentGameId = game.PlaceId
    if games[currentGameId] then
        if currentGameId == 155615604 or currentGameId == 3840352284 or currentGameId == 142823291 or currentGameId == 2788229376 or currentGameId == 6884319169 or currentGameId == 189707 then
            -- Supported game → green indicator icon
            LabelCurrentGame:Set("Current Game: " .. currentGameName .. " | Supported", "check-circle")
        else
            -- Partially supported → orange indicator icon
            LabelCurrentGame:Set("Current Game: " .. currentGameName .. " | Partial", "alert-circle")
        end
    else
        -- Unsupported → red indicator icon
        LabelCurrentGame:Set("Current Game: " .. currentGameName .. " | Unsupported", "x-circle")
    end
end

checkGame()

--==[ Error Info Section ]==--
local ErrorSection = WelcomeTab:CreateSection("Known Issues")

local LabelMessage = WelcomeTab:CreateLabel("Known Errors/Bugs: " .. Errors .. Date, "alert-triangle")

--==[ Discord & Website Section ]==--
local LinksSection = WelcomeTab:CreateSection("Links")

local DiscordButton = WelcomeTab:CreateButton({
	Name = "Copy Discord Invite",
	Callback = function()
		if setclipboard then
			setclipboard("https://discord.gg/ZNfKFyuUEd")
			print("Copied to clipboard: https://discord.gg/ZNfKFyuUEd")
			Rayfield:Notify({
				Title = "Copied Discord Invite",
				Content = "Join the Discord for suggestions, bugs, and more!",
				Duration = 5,
				Image = "bell"
			})
		else
			print("setclipboard function is not available.")
		end
	end,
})

local WebsiteButton = WelcomeTab:CreateButton({
	Name = "Copy Website Link (New)",
	Callback = function()
		if setclipboard then
			setclipboard("https://angxers2.github.io/Unihub/")
			print("Copied to clipboard: https://angxers2.github.io/Unihub/")
			Rayfield:Notify({
				Title = "Copied Website Link",
				Content = "Visit the website for more information on updates and more!",
				Duration = 6,
				Image = "bell"
			})
		else
			print("setclipboard function is not available.")
		end
	end,
})

--==[ Utility Section ]==--
local UtilitySection = WelcomeTab:CreateSection("Tools")

WelcomeTab:CreateButton({
	Name = "Execute Universal Hub Lite",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Angxers2/Unihub/refs/heads/lite/Unihub%20Lite%20V1.2", true))()
	end,
})


--==[ About Section ]==--

local AboutSection = WelcomeTab:CreateSection("About This Hub")

local Paragraph = WelcomeTab:CreateParagraph({
    Title = "Welcome", 
    Content = "Welcome to Universal Hub (BETA)! We're excited to have you explore all the features and tools available. This hub is designed to enhance your in-game experience with custom commands, settings, and more. Feel free to navigate through the tabs, and don’t hesitate to reach out if you have any feedback. Enjoy your time and stay tuned for future updates!"
})



local MainTab = Window:CreateTab("Main", "layout-dashboard") -- Title, Image
local PlayerSection = MainTab:CreateSection("Player")

local Button = MainTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
       local infjmp = true
game:GetService("UserInputService").jumpRequest:Connect(function()
    if infjmp then
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("Jumping")
    end
end)
   end,
})

local Sprint = False
-- Rayfield button to activate sprinting (when Shift key is held)
local SprintButton = MainTab:CreateButton({
    Name = "Activate Sprint (Hold Shift)",
    Callback = function()

		Rayfield:Notify({
			Title = "Sprint Activated",
			Content = "Sprint Activated (Hold Left Shift To Sprint)",
			Duration = 5,
			Image = "bell",
		 })

		local SprintSpeed = 35
		local Sprint = True
        local UserInputService = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Store the default FOV
local defaultFOV = Camera.FieldOfView

-- Function to tween the FOV
local function setFOV(targetFOV)
    game:GetService("TweenService"):Create(Camera, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {FieldOfView = targetFOV}):Play()
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        -- Increase WalkSpeed
     Humanoid.WalkSpeed = SprintSpeed
		

        -- Animate FOV to sprinting value (e.g., 90)
        setFOV(90)
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        -- Reset WalkSpeed
        Humanoid.WalkSpeed = 16

        -- Animate FOV back to normal value
        setFOV(defaultFOV)
    end
end)

    end
})






local Button = MainTab:CreateButton({
   Name = "Fly (X)",
   Callback = function()
      -- Services
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

-- Variables
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local flying = false

-- Fly function
local function fly()
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.P = 1250
    bodyVelocity.Parent = character.HumanoidRootPart

    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.CFrame = character.HumanoidRootPart.CFrame
    bodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000)
    bodyGyro.P = 3000
    bodyGyro.Parent = character.HumanoidRootPart

    flying = true

    -- Flying loop
    while flying do
        local camera = workspace.CurrentCamera
        local lookVector = camera.CFrame.LookVector
        local moveDirection = Vector3.new()

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + lookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - lookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end

        bodyVelocity.Velocity = moveDirection * 50
        bodyGyro.CFrame = CFrame.new(camera.CFrame.Position, camera.CFrame.Position + lookVector)

        wait()
    end

    bodyVelocity:Destroy()
    bodyGyro:Destroy()
end

-- Input handler
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.X then
        if flying then
            flying = false
        else
            fly()
        end
    end
end)

   end,
})

local Slider = MainTab:CreateSlider({
    Name = "Walkspeed",
    Range = {0, 300},
    Increment = 1,
    Suffix = " Walkspeed",
    CurrentValue = 16,
    Flag = "walkspeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        -- The function that takes place when the slider changes
        -- The variable (Value) is a number which correlates to the value the slider is currently at
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end,
})

local Toggle = MainTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "noclip", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        -- The function that takes place when the toggle is pressed
        -- The variable (Value) is a boolean on whether the toggle is true or false
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        if Value then
            -- Enable noclip
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end

            -- Keep noclip enabled
            noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end)
        else
            -- Disable noclip
            if noclipConnection then
                noclipConnection:Disconnect()
            end

            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and not part.CanCollide then
                    part.CanCollide = true
                end
            end
        end
    end,
})

local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local humanoid = player.Character:WaitForChild("Humanoid")
local rootPart = player.Character:WaitForChild("HumanoidRootPart")

local jumpPower = 50 -- Default value, will be updated by the slider

-- Custom jump logic
local function onJumpRequest()
    if humanoid:GetState() == Enum.HumanoidStateType.Jumping then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, jumpPower, 0)
        bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
        bodyVelocity.P = 1250 -- Adjust this as necessary
        bodyVelocity.Parent = rootPart

        -- Remove the BodyVelocity after a short delay
        game:GetService("Debris"):AddItem(bodyVelocity, 0.1)
    end
end

UIS.JumpRequest:Connect(onJumpRequest)

local Slider = MainTab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 300},
    Increment = 1,
    Suffix = " Jump Power",
    CurrentValue = 50,
    Flag = "jumpower",
    Callback = function(Value)
        jumpPower = Value
    end
})


-- Reapply Jump Power after respawn
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    applyJumpPower(Slider.CurrentValue)
end)

local camera = game.Workspace.CurrentCamera

local defaultFOV = camera.FieldOfView

local FOVSlider = MainTab:CreateSlider({
    Name = "FOV",
    Range = {30, 120},
    Increment = 1,
    Suffix = "°",
    CurrentValue = camera.FieldOfView,
    Flag = "FOVSlider",
    Callback = function(Value)
        camera.FieldOfView = Value
    end,
})

-- Add a button to reset FOV to default
MainTab:CreateButton({
    Name = "Reset FOV",
    Callback = function()
        camera.FieldOfView = defaultFOV
        FOVSlider:Set(defaultFOV)
    end,
})









local PlayerSection = MainTab:CreateSection("Game")

local Button = MainTab:CreateButton({
   Name = "Xray(E)",
   Callback = function()
                
local xrayHotkey = Enum.KeyCode.E

local uis = game:GetService("UserInputService")


local xrayOn = false


uis.InputBegan:Connect(function(inp, processed)
	
	
	if processed then return end
	
	
	if inp.KeyCode == xrayHotkey then
		
		
		xrayOn = not xrayOn
		
		
		for i, descendant in pairs(workspace:GetDescendants()) do
				
			if descendant:IsA("BasePart") then
				
				if xrayOn then
					
					if not descendant:FindFirstChild("OriginalTransparency") then
						
						local originalTransparency = Instance.new("NumberValue")
						originalTransparency.Name = "OriginalTransparency"
						originalTransparency.Value = descendant.Transparency
						originalTransparency.Parent = descendant
					end
					
					descendant.Transparency = 0.5
					
				else
					descendant.Transparency = descendant.OriginalTransparency.Value
				end
			end
		end
	end
end)

            Rayfield:Notify({
   Title = "Click E To Toggle Xray",
   Content = "Xray",
   Duration = 5,
   Image = "bell",
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})
    end,
})

local Button = MainTab:CreateButton({
    Name = "Universal Aimbot",
    Callback = function()
        -- Load and execute the Aimbot script
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua"))()
        
    end,
})

local Button = MainTab:CreateButton({
       Name = "CTRL Click Tp",
   Callback = function()
            local UIS = game:GetService("UserInputService")

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()


function GetCharacter()
   return game.Players.LocalPlayer.Character
end

function Teleport(pos)
   local Char = GetCharacter()
   if Char then
       Char:MoveTo(pos)
   end
end


UIS.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
       Teleport(Mouse.Hit.p)
   end
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Vehicle Fly",
   Callback = function()
            FLYING = false
local Mouse = game:GetService'Players'.LocalPlayer:GetMouse()
local Players = game:GetService'Players'
local vfly = false
_G.fs = 1
Mouse.KeyDown:Connect(function(k)
	if k == "l" or k == "p" then
		if not FLYING then
			if k == "l" then _G.fs = 6.4; vfly = false end
			if k == "p" then _G.fs = 6.4; vfly = true end
			repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			repeat wait() until Mouse

			local T = Players.LocalPlayer.Character.HumanoidRootPart
			local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			local SPEED = 0

			local function FLY()
				FLYING = true
				local BG = Instance.new('BodyGyro')
				local BV = Instance.new('BodyVelocity')
				BG.P = 9e4
				BG.Parent = T
				BV.Parent = T
				BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				BG.cframe = T.CFrame
				BV.velocity = Vector3.new(0, 0, 0)
				BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
				spawn(function()
					repeat wait()
						if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
							Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
						end
						if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
							SPEED = 50
						elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
							SPEED = 0
						end
						if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
							BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
							lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
						elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
							BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
						else
							BV.velocity = Vector3.new(0, 0, 0)
						end
						BG.cframe = workspace.CurrentCamera.CoordinateFrame
					until not FLYING
					CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
					lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
					SPEED = 0
					BG:Destroy()
					BV:Destroy()
					if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
						Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
					end
				end)
			end
			Mouse.KeyDown:Connect(function(KEY)
				if KEY:lower() == 'w' then
					CONTROL.F = _G.fs
				elseif KEY:lower() == 's' then
					CONTROL.B = -_G.fs
				elseif KEY:lower() == 'a' then
					CONTROL.L = -_G.fs
				elseif KEY:lower() == 'd' then 
					CONTROL.R = _G.fs
				end
			end)
			Mouse.KeyUp:Connect(function(KEY)
				if KEY:lower() == 'w' then
					CONTROL.F = 0
				elseif KEY:lower() == 's' then
					CONTROL.B = 0
				elseif KEY:lower() == 'a' then
					CONTROL.L = 0
				elseif KEY:lower() == 'd' then
					CONTROL.R = 0
				end
			end)
			FLY()
		else
			FLYING = false
			if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end
	end
end)

            Rayfield:Notify({
   Title = "Vehicle Fly",
   Content = "Press P For Vehicle Fly",
   Duration = 5,
   Image = "bell",
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

   end,
})

local ScriptsTab = Window:CreateTab("Scripts", "scroll-text") -- Title, Image
local AdminsSection = ScriptsTab:CreateSection("Admins & Chat Interfaces")

ScriptsTab:CreateButton({
	Name = "Universal Hub Lite",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Angxers2/Unihub/refs/heads/lite/Unihub%20Lite%20V1.2",true))()
	end,
 })

ScriptsTab:CreateButton({
	Name = "AK Admin, Key: " .. _G.key, 
	Callback = function()
		setclipboard(_G.key)
		Rayfield:Notify({
			Title = "Copied Key To Clipboard !",
			Content = "Copied Key, Just Paste The Key In And Enjoy !",
			Duration = 4,
		})
		loadstring(game:HttpGet("https://angelical.me/ak.lua"))()
	end,
 })

local Button = ScriptsTab:CreateButton({
	Name = "Nameless Admin",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()

	end,
 })

local Button = ScriptsTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
            
   end,
})



local Button = ScriptsTab:CreateButton({
   Name = "Reviz Admin",
   Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/C7GF6XRn",true))()
   end,
})


local FeSection = ScriptsTab:CreateSection("FE Scripts")

local Button = ScriptsTab:CreateButton({
   Name = "UTG V3",
   Callback = function()
            local UTG = loadstring(game:HttpGet("https://raw.githubusercontent.com/killermaster9999mega/UTG-V3/main/FE%20UTG%20V3.txt"))()
            UTG.Load()
    end,
})

local Button = ScriptsTab:CreateButton({
   Name = "Syntax FE (Key: Syntaxontop)",
   Callback = function()
      local Syntax = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vallater/SyntaxFE/fbbffe71caabfa5341bb0e09865c0659574978e8/GG.txt"))()
      Syntax.Load()

      Rayfield:Notify({
         Title = "Syntax Key",
         Content = "Key: Syntaxontop",
         Duration = 5.0,
         Image = "bell",
         Actions = {
            Ignore = {
               Name = "Okay",
               Callback = function()
                  print("The user tapped Okay!")
               end
            }
         }
      })
   end,
})

local Button = ScriptsTab:CreateButton({
   Name = "FE Fling All",
   Callback = function()
                Rayfield:Notify({
   Title = "Fling",
   Content = "Flinging All Now",
   Duration = 5,
   Image = "bell",
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

            local Targets = {"All"} -- "All", "Target Name", "arian_was_here"

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end

local Message = function(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local SkidFling = function(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle

    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end

    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit and not AllBool then
            return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        
        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
        
        local SFBasePart = function(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0

            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        
        workspace.FallenPartsDestroyHeight = 0/0
        
        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("Error Occurred", "Target is missing everything", 5)
        end
        
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
        
        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("Error Occurred", "Random error", 5)
    end
end

if not Welcome then Message("Script by AnthonyIsntHere reworked by Angxers", "Enjoy!", 5) end
getgenv().Welcome = true
if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end

for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 1414978355 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("Error Occurred", "This user is whitelisted! (Owner)", 5)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("Error Occurred", "Username Invalid", 5)
    end
end
   end,
})

local Button = ScriptsTab:CreateButton({
   Name = "FE Hidden Underground Mic/Chat",
   Callback = function()
                
   _G.Snail_Config = {
	Speed = 0.4,
	TunnelSpeed = 1,

	--// Offsets
	Offset = CFrame.new(0,3,0),
	TunnelOffset = CFrame.new(0,-6,0), -- This is added to the Offset

	--// Control
	Teleport = Enum.KeyCode.E,
	Tunnel = Enum.KeyCode.Q,
	ResetCamera = Enum.KeyCode.R,

	TunnelIsToggle = true,
	DistanceChangesSpeed = true,
	UseCameraRotaton = false, -- Old movement
	Distance = 5,

	--// Animations
	Enabled = true, -- If disabled, the script will not run after death
	Sounds = true,

	--// Sounds
	Audios = {
		Teleport = {
			SoundId = 507863457
		}
	},

	--// Misc (Advanced)
	Max_Height = 15,
	Root_Height = 4,
}

------------------------------

if _G.Snail_Ran then return end
loadstring(game:HttpGet('https://raw.githubusercontent.com/MastersMZ-Scripts/Scripts/main/Snail%20Script/Snail%20Limbs%20Version.lua'))()
   end,
})

local Button = ScriptsTab:CreateButton({
   Name = "FE Gui",
   Callback = function()
                -- Gui to Lua
-- Version: 3.2

-- Instances:

local MainScreenGUI = Instance.new("ScreenGui")
local BypassFrame = Instance.new("Frame")
local TopBorder = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local Animations = Instance.new("TextLabel")
local TrollCmds = Instance.new("TextLabel")
local Local = Instance.new("TextLabel")
local _3rdPlayer = Instance.new("TextButton")
local Dead = Instance.new("TextButton")
local FF = Instance.new("TextButton")
local FollowAll = Instance.new("TextButton")
local Invis = Instance.new("TextButton")
local Morph = Instance.new("TextButton")
local RagdollDeath = Instance.new("TextButton")
local RespawnV3 = Instance.new("TextButton")
local Reviz = Instance.new("TextButton")
local Seizure = Instance.new("TextButton")
local ToolMorph = Instance.new("TextButton")
local Twerk = Instance.new("TextButton")
local Unanimation = Instance.new("TextButton")
local Yay = Instance.new("TextButton")
local Zombie = Instance.new("TextButton")
local Warning = Instance.new("TextLabel")

--Properties:
MainScreenGUI.Parent = game.CoreGui

BypassFrame.Name = "BypassFrame"
BypassFrame.Parent = MainScreenGUI
BypassFrame.BackgroundColor3 = Color3.fromRGB(81, 82, 82)
BypassFrame.BorderSizePixel = 0
BypassFrame.Position = UDim2.new(0.247151628, 0, 0.240634009, 0)
BypassFrame.Size = UDim2.new(0, 577, 0, 360)
BypassFrame.Active = true
BypassFrame.Draggable = true

TopBorder.Name = "TopBorder"
TopBorder.Parent = BypassFrame
TopBorder.BackgroundColor3 = Color3.fromRGB(125, 184, 255)
TopBorder.BorderColor3 = Color3.fromRGB(27, 42, 53)
TopBorder.BorderSizePixel = 0
TopBorder.Size = UDim2.new(0, 577, 0, 44)

TextLabel.Parent = TopBorder
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0, 0, -0.0443767011, 0)
TextLabel.Size = UDim2.new(0, 63, 0, 57)
TextLabel.Font = Enum.Font.SourceSansItalic
TextLabel.Text = "Bypass"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = TopBorder
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.0814558044, 0, 0.361111104, 0)
TextLabel_2.Size = UDim2.new(0, 44, 0, 19)
TextLabel_2.Font = Enum.Font.Fantasy
TextLabel_2.Text = "Z"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

TextLabel_3.Parent = TopBorder
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.31889081, 0, 0.370257437, 0)
TextLabel_3.Size = UDim2.new(0, 326, 0, 24)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "#1 Bypassed Gui ( PEOPLE CAN SEE! )"
TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

TextLabel_4.Parent = TopBorder
TextLabel_4.BackgroundColor3 = Color3.fromRGB(175, 205, 255)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0, 0, -0.0415990204, 0)
TextLabel_4.Size = UDim2.new(0, 577, 0, 14)
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = ""
TextLabel_4.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.TextSize = 14.000

Animations.Name = "Animations"
Animations.Parent = BypassFrame
Animations.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Animations.BackgroundTransparency = 1.000
Animations.Position = UDim2.new(0.65337956, 0, 0.122222222, 0)
Animations.Size = UDim2.new(0, 200, 0, 50)
Animations.Font = Enum.Font.Garamond
Animations.Text = "Animations"
Animations.TextColor3 = Color3.fromRGB(0, 0, 0)
Animations.TextSize = 30.000

TrollCmds.Name = "TrollCmds"
TrollCmds.Parent = BypassFrame
TrollCmds.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TrollCmds.BackgroundTransparency = 1.000
TrollCmds.Position = UDim2.new(0.341421157, 0, 0.122222222, 0)
TrollCmds.Size = UDim2.new(0, 200, 0, 50)
TrollCmds.Font = Enum.Font.Garamond
TrollCmds.Text = "Troll Cmds"
TrollCmds.TextColor3 = Color3.fromRGB(0, 0, 0)
TrollCmds.TextSize = 30.000

Local.Name = "Local"
Local.Parent = BypassFrame
Local.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Local.BackgroundTransparency = 1.000
Local.Position = UDim2.new(0.00173310377, 0, 0.122222222, 0)
Local.Size = UDim2.new(0, 200, 0, 50)
Local.Font = Enum.Font.Garamond
Local.Text = "Local"
Local.TextColor3 = Color3.fromRGB(0, 0, 0)
Local.TextSize = 30.000

_3rdPlayer.Name = "3rdPlayer"
_3rdPlayer.Parent = BypassFrame
_3rdPlayer.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
_3rdPlayer.BorderColor3 = Color3.fromRGB(206, 208, 255)
_3rdPlayer.BorderSizePixel = 2
_3rdPlayer.Position = UDim2.new(0.0542572774, 0, 0.260606349, 0)
_3rdPlayer.Size = UDim2.new(0, 139, 0, 39)
_3rdPlayer.Font = Enum.Font.Gotham
_3rdPlayer.Text = "3rd Person"
_3rdPlayer.TextColor3 = Color3.fromRGB(0, 0, 0)
_3rdPlayer.TextSize = 20.000
_3rdPlayer.TextWrapped = true
_3rdPlayer.MouseButton1Down:connect(function()
game.Players.LocalPlayer.CameraMaxZoomDistance = 600
end)

Dead.Name = "Dead"
Dead.Parent = BypassFrame
Dead.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
Dead.BorderColor3 = Color3.fromRGB(206, 208, 255)
Dead.BorderSizePixel = 2
Dead.Position = UDim2.new(0.705002904, 0, 0.736624897, 0)
Dead.Size = UDim2.new(0, 139, 0, 39)
Dead.Font = Enum.Font.Gotham
Dead.Text = "Cool Dance"
Dead.TextColor3 = Color3.fromRGB(0, 0, 0)
Dead.TextScaled = true
Dead.TextSize = 14.000
Dead.TextWrapped = true
Dead.MouseButton1Down:connect(function()
Player = "LocalPlayer"
AnimationId = "35634514"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local Anim = game.Players[Player].Character.Humanoid:LoadAnimation(Anim)
Anim:Play()
Anim:AdjustSpeed(1)
end)

FF.Name = "FF"
FF.Parent = BypassFrame
FF.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
FF.BorderColor3 = Color3.fromRGB(206, 208, 255)
FF.BorderSizePixel = 2
FF.Position = UDim2.new(0.0542572737, 0, 0.577649295, 0)
FF.Size = UDim2.new(0, 139, 0, 39)
FF.Font = Enum.Font.Gotham
FF.Text = "ForceField"
FF.TextColor3 = Color3.fromRGB(0, 0, 0)
FF.TextSize = 20.000
FF.MouseButton1Down:connect(function()
--[[ The ForceField will not show in lots of games
or will sometimes disappear or reappear
but will show in quite a few games as well.
You will still not be able to die if there is
no ForceField on your character.
If it stops working, execute the script again.
Note: Some tools will be buggy in certain
games when the ForceField is running
]]

plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)
if key == " " then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)
end
end)
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyUp:connect(function(key)
if key == " " then
jumping = false
end
end)

FF = true

while wait() do
if FF then
game.Players.LocalPlayer.Character.Humanoid.Name = 1
local l = game.Players.LocalPlayer.Character["1"]:Clone()
l.Parent = game.Players.LocalPlayer.Character
l.Name = "Humanoid"
wait()
game.Players.LocalPlayer.Character["1"]:Destroy()
game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character.Animate.Disabled = true
wait()
game.Players.LocalPlayer.Character.Animate.Disabled = false
game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
wait(4.85)
workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(.4)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
workspace.CurrentCamera.CameraType = Enum.CameraType.Track
end
end
end)

FollowAll.Name = "FollowAll"
FollowAll.Parent = BypassFrame
FollowAll.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
FollowAll.BorderColor3 = Color3.fromRGB(206, 208, 255)
FollowAll.BorderSizePixel = 2
FollowAll.Position = UDim2.new(0.0535200834, 0, 0.873456538, 0)
FollowAll.Size = UDim2.new(0, 139, 0, 39)
FollowAll.Font = Enum.Font.Gotham
FollowAll.Text = "Follow All"
FollowAll.TextColor3 = Color3.fromRGB(0, 0, 0)
FollowAll.TextSize = 20.000
FollowAll.TextWrapped = true
FollowAll.MouseButton1Down:connect(function()
local RobloxReplicatedStorage = game:GetService('RobloxReplicatedStorage')
RemoteEvent_NewFollower = RobloxReplicatedStorage:WaitForChild('NewFollower')
while wait(0) do
for i,v in pairs(game.Players:GetChildren()) do
RemoteEvent_NewFollower:FireServer(v, true)
end
end
end)

Invis.Name = "Invis"
Invis.Parent = BypassFrame
Invis.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
Invis.BorderColor3 = Color3.fromRGB(206, 208, 255)
Invis.BorderSizePixel = 2
Invis.Position = UDim2.new(0.0542572737, 0, 0.735022008, 0)
Invis.Size = UDim2.new(0, 139, 0, 39)
Invis.Font = Enum.Font.Gotham
Invis.Text = "Invisible"
Invis.TextColor3 = Color3.fromRGB(0, 0, 0)
Invis.TextSize = 20.000
Invis.MouseButton1Down:connect(function()
local player = game.Players.LocalPlayer
position     = player.Character.HumanoidRootPart.Position
wait(0.2)
player.Character:MoveTo(position + Vector3.new(0, 1000000, 0))
wait(0.2)
humanoidrootpart = player.Character.HumanoidRootPart:clone()
wait(0.2)
player.Character.HumanoidRootPart:Destroy()
humanoidrootpart.Parent = player.Character
player.Character:MoveTo(position)
wait()
-- Remove this if you want to see yourself (others still won't see you)
game.Players.LocalPlayer.Character.Torso.Transparency = 1
game.Players.LocalPlayer.Character.Head.Transparency  = 1
game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
game.Players.LocalPlayer.Character["Right Arm"].Transparency = 1
game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1
game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
game.Players.LocalPlayer.Character.Humanoid:RemoveAccessories()
game.Players.LocalPlayer.Character.Head.face:Remove()
end)

Morph.Name = "Morph"
Morph.Parent = BypassFrame
Morph.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
Morph.BorderColor3 = Color3.fromRGB(206, 208, 255)
Morph.BorderSizePixel = 2
Morph.Position = UDim2.new(0.405339807, 0, 0.737721622, 0)
Morph.Size = UDim2.new(0, 139, 0, 39)
Morph.Font = Enum.Font.Gotham
Morph.Text = "Weird Morph ( You can Unequip or Equip Tools )"
Morph.TextColor3 = Color3.fromRGB(0, 0, 0)
Morph.TextScaled = true
Morph.TextSize = 14.000
Morph.TextWrapped = true
Morph.MouseButton1Down:connect(function()
--[[Note, tools cannot be used and will be
removed in case some people do not know that]]

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
wait()
game.Players.LocalPlayer.Character.Animate.Disabled = true
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") then
v.Parent = workspace
end
end
game.Players.LocalPlayer.Character.Animate.toolnone.ToolNoneAnim.AnimationId = 0
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Accessory") then
local ArmRemove = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
ArmRemove.Name = "Arm"
v.Handle.Transparency = 1
v.Handle.Parent = ArmRemove
ArmRemove.Handle.Massless = true
ArmRemove.Grip = CFrame.new(Vector3.new(-1.5,-5.062,.11875)) * CFrame.Angles(math.rad(-90), 0, 0)
ArmRemove.Parent = game.Players.LocalPlayer.Character
end
end
game.Players.LocalPlayer.Character.Arm.Parent = workspace
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
game.Players.LocalPlayer.Character.Head.Mesh:Remove()
game.Players.LocalPlayer.Character.Head:FindFirstChildOfClass("Decal"):Remove()
game.Players.LocalPlayer.Character.Humanoid:RemoveAccessories()
if game.Players.LocalPlayer.Character.Shirt then
game.Players.LocalPlayer.Character.Shirt:Remove()
else
end
if game.Players.LocalPlayer.Character.Pants then
game.Players.LocalPlayer.Character.Pants:Remove()
else
end
if game.Players.LocalPlayer.Character["Shirt Graphic"] then
game.Players.LocalPlayer.Character["Shirt Graphic"]:Remove()
else
end
game.Players.LocalPlayer.Character["Shirt Graphic"]:Remove()
end)

RagdollDeath.Name = "RagdollDeath"
RagdollDeath.Parent = BypassFrame
RagdollDeath.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
RagdollDeath.BorderColor3 = Color3.fromRGB(206, 208, 255)
RagdollDeath.BorderSizePixel = 2
RagdollDeath.Position = UDim2.new(0.402610838, 0, 0.258444965, 0)
RagdollDeath.Size = UDim2.new(0, 139, 0, 39)
RagdollDeath.Font = Enum.Font.Gotham
RagdollDeath.Text = "RAGDOLL DEATH ( LEGENDARY )"
RagdollDeath.TextColor3 = Color3.fromRGB(0, 0, 0)
RagdollDeath.TextScaled = true
RagdollDeath.TextSize = 14.000
RagdollDeath.TextWrapped = true
RagdollDeath.MouseButton1Down:connect(function()
--Credit to CyclicaIIy for this amazing script
LocalPlayer = game:GetService("Players").LocalPlayer
LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 10)
LocalPlayer.Character.Humanoid.Jump = true
wait(0.5)
function Iterate(instance, func)
for i, v in next, instance:GetChildren() do
func(v)
end
end
limbs = {
["Right Leg"] = true;
["Right Arm"] = true;
["Left Leg"] = true;
["Left Arm"] = true; 
}
Iterate(LocalPlayer.Character, function(v)
if v:IsA("BasePart") then
local attachment = Instance.new("Attachment")
attachment.Parent = v
attachment.Name = (v.Name .. "[Attachment]")
if limbs[v.Name] then
attachment.Position = Vector3.new(0, v.Size.Y/2, 0)
elseif v.Name == "Head" then
attachment.Position = Vector3.new(0, -v.Size.Y/2, 0)
attachment.Rotation = Vector3.new(0, 0, -90)
end
end
end)
local leftLegAttachment = Instance.new("Attachment")
leftLegAttachment.Position = Vector3.new(-.5, -1, 0)
leftLegAttachment.Rotation = Vector3.new(0, -90, 0)
local rightLegAttachment = Instance.new("Attachment")
rightLegAttachment.Position = Vector3.new(.5, -1, 0)
rightLegAttachment.Rotation = Vector3.new(0, -90, 0)
rightLegAttachment.Parent, leftLegAttachment.Parent = LocalPlayer.Character.Torso, LocalPlayer.Character.Torso
jointAttachments = {
['Head'] = {
['Attachment0'] = LocalPlayer.Character.Torso['NeckAttachment'];
['Attachment1'] = LocalPlayer.Character.Head['Head[Attachment]'];
};
['Left Arm'] = {
['Attachment0'] = LocalPlayer.Character.Torso['LeftCollarAttachment'];
['Attachment1'] = LocalPlayer.Character['Left Arm']['Left Arm[Attachment]'];
};
['Right Arm'] = {
['Attachment0'] = LocalPlayer.Character.Torso['RightCollarAttachment'];
['Attachment1'] = LocalPlayer.Character['Right Arm']['Right Arm[Attachment]'];
};
['Left Leg'] = {
['Attachment0'] = leftLegAttachment;
['Attachment1'] = LocalPlayer.Character['Left Leg']['Left Leg[Attachment]'];
};
['Right Leg'] = {
['Attachment0'] = rightLegAttachment;
['Attachment1'] = LocalPlayer.Character['Right Leg']['Right Leg[Attachment]'];
};
}
LocalPlayer.Character.Humanoid.PlatformStand = true
Iterate(LocalPlayer.Character, function(v)
if v:IsA("BasePart") then
if jointAttachments[v.Name] then
local ballSocketJoint = Instance.new("BallSocketConstraint")
ballSocketJoint.Parent = v
ballSocketJoint.Radius = 0.15
ballSocketJoint.Attachment0, ballSocketJoint.Attachment1 = jointAttachments[v.Name]['Attachment0'], jointAttachments[v.Name]['Attachment1']
end
end
end)
Iterate(LocalPlayer.Character.Torso, function(v)
if v:IsA("Motor") then
v:Remove()
end
end)
end)

RespawnV3.Name = "RespawnV3"
RespawnV3.Parent = BypassFrame
RespawnV3.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
RespawnV3.BorderColor3 = Color3.fromRGB(206, 208, 255)
RespawnV3.BorderSizePixel = 2
RespawnV3.Position = UDim2.new(0.0542572737, 0, 0.42051667, 0)
RespawnV3.Size = UDim2.new(0, 139, 0, 39)
RespawnV3.Font = Enum.Font.Gotham
RespawnV3.Text = "Respawn"
RespawnV3.TextColor3 = Color3.fromRGB(0, 0, 0)
RespawnV3.TextScaled = true
RespawnV3.TextSize = 14.000
RespawnV3.TextWrapped = true
RespawnV3.MouseButton1Down:connect(function()
Character = game:GetService("Players").LocalPlayer.Character
respawn = 0
Character.Head.Died:Remove()
Character:FindFirstChild("Humanoid").BreakJointsOnDeath = false
Character:FindFirstChild("Humanoid").Health = respawn
end)

Reviz.Name = "Reviz"
Reviz.Parent = BypassFrame
Reviz.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
Reviz.BorderColor3 = Color3.fromRGB(206, 208, 255)
Reviz.BorderSizePixel = 2
Reviz.Position = UDim2.new(0.405339807, 0, 0.875649989, 0)
Reviz.Size = UDim2.new(0, 139, 0, 39)
Reviz.Font = Enum.Font.Gotham
Reviz.Text = "Reviz Admin ( FUN CMDS )"
Reviz.TextColor3 = Color3.fromRGB(0, 0, 0)
Reviz.TextSize = 18.000
Reviz.TextWrapped = true
Reviz.MouseButton1Down:connect(function()
--[[
	Welcome to Reviz Admin! (By illremember)
	An admin that is designed to work with FE games.
--]]
prefix = ";"
--[[
	---- CREDITS TO:
	xFunnieuss + Timeless for partial name support
	Timeless for Invisible command + Print remotes
	Creators of DEX explorer
	Creators of Infinite Yield (Ideas)
	Harkinian for Shutdown
	Creators of Mr.Spy remotespy
	TCP for Testing/Ideas/Fire Rapper
--]]
wait(0.3)
Commands = {
	'[-] cmdbar is shown when ; is pressed.',
	'[1] kill [plr] -- You need a tool! Will kill the player, use rkill to kill you and player',
	'[2] bring [plr] -- You need a tool! Will bring player to you',
	'[3] spin [plr] -- You need a tool! Makes you and the player spin crazy',
	'[4] unspin -- Use after using spin cmd and dying, so you stop loop teleporting',
	'[5] attach [plr] -- You need a tool! Attaches you to player',
	'[6] unattach [plr] -- Attempts to unattach you from a player',
	'[7] follow [plr] -- Makes you follow behind the player',
	'[8] unfollow',
	'[9] freefall [plr] -- You need a tool! Teleports you and the player up into the air',
	'[10] trail [plr] -- The opposite of follow, you stay infront of player',
	'[11] untrail',
	'[12] orbit [plr] -- Makes you orbit the player',
	'[13] unorbit',
	'[14] fling [plr] -- Makes you fling the player',
	'[15] unfling',
	'[16] fecheck -- Checks if the game is FE or not',
	'[17] void [plr] -- Teleports player to the void',
	'[18] noclip -- Gives you noclip to walk through walls',
	'[19] clip -- Removes noclip',
	'[20] speed [num]/ws [num] -- Changes how fast you walk 16 is default',
	'[21] jumppower [num]/jp [num] -- Changes how high you jump 50 is default',
	'[22] hipheight [num]/hh [num] -- Changes how high you float 0 is default',
	'[23] default -- Changes your speed, jumppower and hipheight to default values',
	'[24] annoy [plr] -- Loop teleports you to the player',
	'[25] unannoy',
	'[26] headwalk [plr] -- Loop teleports you to the player head',
	'[27] unheadwalk',
	'[28] nolimbs -- Removes your arms and legs',
	'[29] god -- Gives you FE Godmode',
	'[30] drophats -- Drops your accessories',
	'[31] droptool -- Drops any tool you have equipped',
	'[32] loopdhats -- Loop drops your accessories',
	'[33] unloopdhats',
	'[34] loopdtool -- Loop drops any tools you have equipped',
	'[35] unloopdtool',
	'[36] invisible -- Gives you invisibility CREDIT TO TIMELESS',
	'[37] view [plr] -- Changes your camera to the player character',
	'[38] unview',
	'[39] goto [plr] -- Teleports you to player',
	'[40] fly -- Allows you to fly',
	'[41] unfly',
	'[42] chat [msg] -- Makes you chat a message',
	'[43] spam [msg] -- Spams a message',
	'[44] unspam',
	'[45] spamwait [num] -- Changes delay of chatting a message for the spam command in seconds default is 1 second',
	'[46] pmspam [plr] -- Spams a player in private message',
	'[47] unpmspam',
	'[48] cfreeze [plr] -- Freezes a player on your client, they will only be frozen for you',
	'[49] uncfreeze [plr]',
	'[50] unlockws -- Unlocks the workspace',
	'[51] lockws -- Locks the workspace',
	'[52] btools -- Gives you btools that will only show to you useful for deleting certain blocks only for you',
	'[53] pstand -- Enables platform stand',
	'[54] unpstand -- Disables platform stand',
	'[55] blockhead -- Removes your head mesh',
	'[56] sit',
	'[57] bringobj [obj] -- Only shows on client, brings an object/part to you constantly, can be used to bring healing parts, weapons, money etc, type in exact name',
	'[58] wsvis [num] -- Changes visibility of workspace parts, num should be between 0 and 1, only shows client sided',
	'[59] hypertotal -- Loads in my FE GUI Hypertotal',
	'[60] cmds -- Prints all commands',
	'[61] rmeshhats/blockhats -- Removes the meshes of all your accessories aka block hats',
	'[62] rmeshtool/blocktool -- Removes the mesh of the tool you have equipped aka block tool',
	'[63] spinner -- Makes you spin',
	'[64] nospinner',
	'[65] reach [num] -- Gives you reach, mostly used for swords, say ;reachd for default and enter number after for custom',
	'[66] noreach -- Removes reach, must have tool equipped',
	'[67] rkill [plr] -- Kills you and the player, use kill to just kill the player without dying',
	'[68] tp me [plr] -- Alternative to goto',
	'[69] cbring [plr] -- Brings player infront of you, shows only on client, allows you to do damage to player',
	'[70] uncbring',
	'[71] swap [plr] -- You need a tool! Swaps players position with yours and your position with players',
	'[72] givetool [plr] -- Gives the tool you have equipped to the player',
	'[73] glitch [plr] -- Glitches you and the player, looks very cool',
	'[74] unglitch -- Unglitches you',
	'[75] grespawn -- Alternative to normal respawn and usually works best for when you want to reset with FE Godmode',
	'[76] explorer -- Loads up DEX',
	'[77] remotespy -- Loads up a remotespy',
	'[78] anim [id] -- Applies an animation on you, must be created by ROBLOX',
	'[79] animgui -- Loads up Energize animations GUI',
	'[80] savepos -- Saves your current position',
	'[81] loadpos -- Teleports you to your saved position',
	'[82] bang [plr] -- 18+',
	'[83] unbang',
	'[84] delcmdbar -- Removes the command bar completely',
	'[85] bringmod [obj] -- Brings all the parts in a model, client only, comes from ;bringobj enter exact name of model',
	'[86] shutdown -- Uses harkinians script to shutdown server',
	'[87] respawn -- If grespawn doesnt work you can use respawn',
	'[88] delobj [obj] -- Deletes a certain brick in workspace, client sided',
	'[89] getplrs -- Prints all players in game',
	'[90] deldecal -- Deletes all decals client sided',
	'[91] opfinality -- Loads in my FE GUI Opfinality',
	'[92] remotes -- Prints all remotes in the game in the console when added',
	'[93] noremotes -- Stops printing remotes',
	'[94] tpdefault -- Stops all loop teleports to a player',
	'[95] stopsit -- Will not allow you to sit',
	'[96] gosit -- Allows you to sit',
	'[97] clicktp -- Enables click tp',
	'[98] noclicktp -- Disables click tp',
	'[99] toolson -- If any tools are dropped in the workspace you will automatically get them',
	'[100] toolsoff -- Stops ;toolson',
	'[101] version -- Gets the admin version'
}

lplayer = game.Players.LocalPlayer

function GetPlayer(String) -- Credit to Timeless/xFunnieuss
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(game.Players:GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                table.insert(Found,v)
            end
        end   
	elseif strl == "me" then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name == game.Players.LocalPlayer.Name then
                table.insert(Found,v)
            end
        end  
    else
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found,v)
            end
        end    
    end
    return Found    
end

local Mouse = game.Players.LocalPlayer:GetMouse()

spin = false
followed = false
traill = false
noclip = false
annoying = false
hwalk = false
droppinghats = false
droppingtools = false
flying = false
spamdelay = 1
spamming = false
spammingpm = false
cbringing = false
remotes = true
added = true
binds = false
stopsitting = false
clickgoto = false
gettingtools = false

adminversion = "Reviz admin by illremember, Version 1.0"

local CMDS = Instance.new("ScreenGui")
local CMDSFRAME = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local TextLabel = Instance.new("TextLabel")
local closegui = Instance.new("TextButton")
CMDS.Name = "CMDS"
CMDS.Parent = game.CoreGui
CMDSFRAME.Name = "CMDSFRAME"
CMDSFRAME.Parent = CMDS
CMDSFRAME.Active = true
CMDSFRAME.BackgroundColor3 = Color3.new(0.223529, 0.231373, 0.309804)
CMDSFRAME.BorderSizePixel = 0
CMDSFRAME.Draggable = true
CMDSFRAME.Position = UDim2.new(0, 315, 0, 100)
CMDSFRAME.Size = UDim2.new(0, 275, 0, 275)
CMDSFRAME.Visible = false
ScrollingFrame.Parent = CMDSFRAME
ScrollingFrame.BackgroundColor3 = Color3.new(0.160784, 0.160784, 0.203922)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0, 0, 0.0729999989, 0)
ScrollingFrame.Size = UDim2.new(1.04999995, 0, 0.92900002, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
TextLabel.Parent = ScrollingFrame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(0.930000007, 0, 1, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.FontSize = Enum.FontSize.Size18
TextLabel.Text = "[-] cmdbar is shown when ; is pressed.,\n[1] kill [plr] -- You need a tool! Will kill the player, use rkill to kill you and player,\n[2] bring [plr] -- You need a tool! Will bring player to you,\n[3] spin [plr] -- You need a tool! Makes you and the player spin crazy,\n[4] unspin -- Use after using spin cmd and dying, so you stop loop teleporting,\n[5] attach [plr] -- You need a tool! Attaches you to player,\n[6] unattach [plr] -- Attempts to unattach you from a player,\n[7] follow [plr] -- Makes you follow behind the player,\n[8] unfollow,\n[9] freefall [plr] -- You need a tool! Teleports you and the player up into the air,\n[10] trail [plr] -- The opposite of follow, you stay infront of player,\n[11] untrail,\n[12] orbit [plr] -- Makes you orbit the player,\n[13] unorbit,\n[14] fling [plr] -- Makes you fling the player,\n[15] unfling,\n[16] fecheck -- Checks if the game is FE or not,\n[17] void [plr] -- Teleports player to the void,\n[18] noclip -- Gives you noclip to walk through walls,\n[19] clip -- Removes noclip,\n[20] speed [num]/ws [num] -- Changes how fast you walk 16 is default,\n[21] jumppower [num]/jp [num] -- Changes how high you jump 50 is default,\n[22] hipheight [num]/hh [num] -- Changes how high you float 0 is default,\n[23] default -- Changes your speed, jumppower and hipheight to default values,\n[24] annoy [plr] -- Loop teleports you to the player,\n[25] unannoy,\n[26] headwalk [plr] -- Loop teleports you to the player head,\n[27] unheadwalk,\n[28] nolimbs -- Removes your arms and legs,\n[29] god -- Gives you FE Godmode,\n[30] drophats -- Drops your accessories,\n[31] droptool -- Drops any tool you have equipped,\n[32] loopdhats -- Loop drops your accessories,\n[33] unloopdhats,\n[34] loopdtool -- Loop drops any tools you have equipped,\n[35] unloopdtool,\n[36] invisible -- Gives you invisibility CREDIT TO TIMELESS,\n[37] view [plr] -- Changes your camera to the player character,\n[38] unview,\n[39] goto [plr] -- Teleports you to player,\n[40] fly -- Allows you to fly,\n[41] unfly,\n[42] chat [msg] -- Makes you chat a message,\n[43] spam [msg] -- Spams a message,\n[44] unspam,\n[45] spamwait [num] -- Changes delay of chatting a message for the spam command in seconds default is 1 second,\n[46] pmspam [plr] -- Spams a player in private message,\n[47] unpmspam,\n[48] cfreeze [plr] -- Freezes a player on your client, they will only be frozen for you,\n[49] uncfreeze [plr],\n[50] unlockws -- Unlocks the workspace,\n[51] lockws -- Locks the workspace,\n[52] btools -- Gives you btools that will only show to you useful for deleting certain blocks only for you,\n[53] pstand -- Enables platform stand,\n[54] unpstand -- Disables platform stand,\n[55] blockhead -- Removes your head mesh,\n[56] sit,\n[57] bringobj [obj] -- Only shows on client, brings an object/part to you constantly, can be used to bring healing parts, weapons, money etc, type in exact name,\n[58] wsvis [num] -- Changes visibility of workspace parts, num should be between 0 and 1, only shows client sided,\n[59] hypertotal -- Loads in my FE GUI Hypertotal,\n[60] cmds -- Prints all commands,\n[61] rmeshhats/blockhats -- Removes the meshes of all your accessories aka block hats,\n[62] rmeshtool/blocktool -- Removes the mesh of the tool you have equipped aka block tool,\n[63] spinner -- Makes you spin,\n[64] nospinner,\n[65] reach [num] -- Gives you reach, mostly used for swords, say ;reachd for default and enter number after for custom,\n[66] noreach -- Removes reach, must have tool equipped,\n[67] rkill [plr] -- Kills you and the player, use kill to just kill the player without dying,\n[68] tp me [plr] -- Alternative to goto,\n[69] cbring [plr] -- Brings player infront of you, shows only on client, allows you to do damage to player,\n[70] uncbring,\n[71] swap [plr] -- You need a tool! Swaps players position with yours and your position with players,\n[72] givetool [plr] -- Gives the tool you have equipped to the player,\n[73] glitch [plr] -- Glitches you and the player, looks very cool,\n[74] unglitch -- Unglitches you,\n[75] grespawn -- Alternative to normal respawn and usually works best for when you want to reset with FE Godmode,\n[76] explorer -- Loads up DEX,\n[77] remotespy -- Loads up a remotespy,\n[78] anim [id] -- Applies an animation on you, must be created by ROBLOX,\n[79] animgui -- Loads up Energize animations GUI,\n[80] savepos -- Saves your current position,\n[81] loadpos -- Teleports you to your saved position,\n[82] bang [plr] -- 18+,\n[83] unbang,\n[84] delcmdbar -- Removes the command bar completely,\n[85] bringmod [obj] -- Brings all the parts in a model, client only, comes from ;bringobj enter exact name of model,\n[86] shutdown -- Uses harkinians script to shutdown server,\n[87] respawn -- If grespawn doesnt work you can use respawn,\n[88] delobj [obj] -- Deletes a certain brick in workspace, client sided,\n[89] getplrs -- Prints all players in game,\n[90] deldecal -- Deletes all decals client sided,\n[91] opfinality -- Loads in my FE GUI Opfinality,\n[92] remotes -- Prints all remotes in the game in the console when added,\n[93] noremotes -- Stops printing remotes,\n[94] tpdefault -- Stops all loop teleports to a player,\n[95] stopsit -- Will not allow you to sit,\n[96] gosit -- Allows you to sit,\n[97] clicktp -- Enables click tp,\n[98] noclicktp -- Disables click tp,\n[99] toolson -- If any tools are dropped in the workspace you will automatically get them,\n[100] toolsoff -- Stops ;toolson,\n[101] version -- Gets the admin version"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 15
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextYAlignment = Enum.TextYAlignment.Top
closegui.Name = "closegui"
closegui.Parent = CMDSFRAME
closegui.BackgroundColor3 = Color3.new(0.890196, 0.223529, 0.0588235)
closegui.BorderSizePixel = 0
closegui.Position = UDim2.new(0.995000005, 0, 0, 0)
closegui.Size = UDim2.new(0.0545952693, 0, 0.0728644878, 0)
closegui.Font = Enum.Font.SourceSansBold
closegui.FontSize = Enum.FontSize.Size24
closegui.Text = "X"
closegui.TextColor3 = Color3.new(1, 1, 1)
closegui.TextSize = 20

closegui.MouseButton1Click:connect(function()
	CMDSFRAME.Visible = false
end)

game:GetService('RunService').Stepped:connect(function()
	if spin then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[spinplr.Name].Character.HumanoidRootPart.CFrame
	end
	if followed then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[flwplr.Name].Character.HumanoidRootPart.CFrame + game.Players[flwplr.Name].Character.HumanoidRootPart.CFrame.lookVector * -5
	end
	if traill then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[trlplr.Name].Character.HumanoidRootPart.CFrame + game.Players[trlplr.Name].Character.HumanoidRootPart.CFrame.lookVector * 5
	end
	if annoying then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[annplr.Name].Character.HumanoidRootPart.CFrame
	end
	if hwalk then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[hdwplr.Name].Character.HumanoidRootPart.CFrame + Vector3.new(0, 4, 0)
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if noclip then
		game.Players.LocalPlayer.Character.Head.CanCollide = false
		game.Players.LocalPlayer.Character.Torso.CanCollide = false
		game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
		game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if droppinghats then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Parent = workspace
			end
		end
	end
	if droppingtools then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Parent = workspace
			end
		end
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if banpl then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[bplrr].Character.HumanoidRootPart.CFrame
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if stopsitting then
		game.Players.LocalPlayer.Character.Humanoid.Sit = false
	end
end)

plr = game.Players.LocalPlayer 
hum = plr.Character.HumanoidRootPart
mouse = plr:GetMouse() 
mouse.KeyDown:connect(function(key) 
	if key == "e" then 
		if mouse.Target then 
			if clickgoto then
				hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z) 
			end
		end 
	end 
end)

lplayer.Chatted:Connect(function(msg)
	if string.sub(msg, 1, 6) == (prefix.."kill ") then
		if string.sub(msg, 7) == "me" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100000,0,100000)
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 7)))do
				local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				game.Players.LocalPlayer.Character.Humanoid.Name = 1
				local l = game.Players.LocalPlayer.Character["1"]:Clone()
				l.Parent = game.Players.LocalPlayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				game.Players.LocalPlayer.Character["1"]:Destroy()
				game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
				game.Players.LocalPlayer.Character.Animate.Disabled = true
				wait(0.1)
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
				local function tp(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.5)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
				wait(0.7)
				tp(game.Players.LocalPlayer,game.Players[v.Name])
				wait(0.7)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
				game.StarterGui:SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."bring ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8)))do
			local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			end
			local function tp(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
			end
			end
			local function getout(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1:MoveTo(char2.Head.Position)
			end
			end
			tp(game.Players[v.Name], game.Players.LocalPlayer)
			wait(0.2)
			tp(game.Players[v.Name], game.Players.LocalPlayer)
			wait(0.5)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
			wait(0.5)
			getout(game.Players.LocalPlayer, game.Players[v.Name])
			wait(0.3)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
			game.StarterGui:SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 6) == (prefix.."spin ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
			spinplr = v
			wait(0.5)
			spin = true
			game.StarterGui:SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."unspin") then
		spin = false
		local function getout(player,player2)
		local char1,char2=player.Character,player2.Character
		if char1 and char2 then
		char1:MoveTo(char2.Head.Position)
		end
		end
		getout(game.Players.LocalPlayer, game.Players.LocalPlayer)
	end
	if string.sub(msg, 1, 8) == (prefix.."attach ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
			wait(0.3)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
			attplr = v
			game.StarterGui:SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."unattach ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 10))) do
			local function getout(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1:MoveTo(char2.Head.Position)
			end
			end
			getout(game.Players.LocalPlayer, game.Players[v.Name])
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."follow ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			followed = true
			flwplr = v
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."unfollow") then
		followed = false
	end
	if string.sub(msg, 1, 10) == (prefix.."freefall ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 11))) do
			local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.6)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
			wait(0.6)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,50000,0)
			game.StarterGui:SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."trail ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
			traill = true
			trlplr = v
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."untrail") then
		traill = false
	end
	if string.sub(msg, 1, 7) == (prefix.."orbit ") then
		if string.sub(msg, 8) == "all" or string.sub(msg, 8) == "others" or string.sub(msg, 8) == "me" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
				local o = Instance.new("RocketPropulsion")
				o.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
				o.Name = "Orbit"
				o.Target = game.Players[v.Name].Character.HumanoidRootPart
				o:Fire()
				noclip = true
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."unorbit") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.Orbit:Destroy()
		noclip = false
	end
	if string.sub(msg, 1, 7) == (prefix.."fling ") then
		if string.sub(msg, 8) == "all" or string.sub(msg, 8) == "others" or string.sub(msg, 8) == "me" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
				local y = Instance.new("RocketPropulsion")
				y.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
				y.CartoonFactor = 1
				y.MaxThrust = 500000
				y.MaxSpeed = 1000
				y.ThrustP = 100000
				y.Name = "Fling"
				game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
				y.Target = game.Players[v.Name].Character.HumanoidRootPart
				y:Fire()
				noclip = true
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."unfling") then
		noclip = false
		game.Players.LocalPlayer.Character.HumanoidRootPart.Fling:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
		wait(0.4)
		game.Players.LocalPlayer.Character.HumanoidRootPart.Fling:Destroy()
	end
	if string.sub(msg, 1, 8) == (prefix.."fecheck") then
		if game.Workspace.FilteringEnabled == true then
			warn("FE is Enabled (Filtering Enabled)")
			game.StarterGui:SetCore("SendNotification", {
				Title = "FE is Enabled";
				Text = "Filtering Enabled. Enjoy using Reviz Admin!";
			})
		else
			warn("FE is Disabled (Filtering Disabled) Consider using a different admin script.")
			game.StarterGui:SetCore("SendNotification", {
				Title = "FE is Disabled";
				Text = "Filtering Disabled. Consider using a different admin script.";
			})
		end
	end
	if string.sub(msg, 1, 6) == (prefix.."void ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.6)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(999999999999999,0,999999999999999)
			game.StarterGui:SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."noclip") then
		noclip = true
		game.StarterGui:SetCore("SendNotification", {
		Title = "Noclip enabled";
		Text = "Type ;clip to disable";
		})
	end
	if string.sub(msg, 1, 5) == (prefix.."clip") then
		noclip = false
		game.StarterGui:SetCore("SendNotification", {
		Title = "Noclip disabled";
		Text = "Type ;noclip to enable";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."speed ") then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (string.sub(msg, 8))
	end
	if string.sub(msg, 1, 4) == (prefix.."ws ") then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (string.sub(msg, 5))
	end
	if string.sub(msg, 1, 11) == (prefix.."hipheight ") then
		game.Players.LocalPlayer.Character.Humanoid.HipHeight = (string.sub(msg, 12))
	end
	if string.sub(msg, 1, 4) == (prefix.."hh ") then
		game.Players.LocalPlayer.Character.Humanoid.HipHeight = (string.sub(msg, 5))
	end
	if string.sub(msg, 1, 11) == (prefix.."jumppower ") then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = (string.sub(msg, 12))
	end
	if string.sub(msg, 1, 4) == (prefix.."jp ") then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = (string.sub(msg, 5))
	end
	if string.sub(msg, 1, 8) == (prefix.."default") then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
	end
	if string.sub(msg, 1, 7) == (prefix.."annoy ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
			annoying = true
			annplr = v
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."unannoy") then
		annoying = false
	end
	if string.sub(msg, 1, 10) == (prefix.."headwalk ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 11))) do
			hwalk = true
			hdwplr = v
		end
	end
	if string.sub(msg, 1, 11) == (prefix.."unheadwalk") then
		hwalk = false
	end
	if string.sub(msg, 1, 8) == (prefix.."nolimbs") then
		game.Players.LocalPlayer.Character["Left Leg"]:Destroy()
		game.Players.LocalPlayer.Character["Left Arm"]:Destroy()
		game.Players.LocalPlayer.Character["Right Leg"]:Destroy()
		game.Players.LocalPlayer.Character["Right Arm"]:Destroy()
	end
	if string.sub(msg, 1, 4) == (prefix.."god") then
		game.Players.LocalPlayer.Character.Humanoid.Name = 1
		local l = game.Players.LocalPlayer.Character["1"]:Clone()
		l.Parent = game.Players.LocalPlayer.Character
		l.Name = "Humanoid"
		wait(0.1)
		game.Players.LocalPlayer.Character["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		wait(0.1)
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
		game.StarterGui:SetCore("SendNotification", {
		Title = "FE Godmode enabled";
		Text = "Use ;kill me OR ;respawn to reset";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."drophats") then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Parent = workspace
			end
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."droptool") then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Parent = workspace
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."loopdhats") then
		droppinghats = true
		game.StarterGui:SetCore("SendNotification", {
		Title = "Loop Drop Enabled";
		Text = "Type ;unloopdhats to disable";
		})
	end
	if string.sub(msg, 1, 12) == (prefix.."unloopdhats") then
		droppinghats = false
		game.StarterGui:SetCore("SendNotification", {
		Title = "Loop Drop Disabled";
		Text = "Type ;loopdhats to enable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."loopdtool") then
		droppingtools = true
		game.StarterGui:SetCore("SendNotification", {
		Title = "Loop Drop Enabled";
		Text = "Type ;unloopdtool to disable";
		})
	end
	if string.sub(msg, 1, 12) == (prefix.."unloopdtool") then
		droppingtools = false
		game.StarterGui:SetCore("SendNotification", {
		Title = "Loop Drop Disabled";
		Text = "Type ;loopdtool to enable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."invisible") then -- Credit to Timeless
		Local = game:GetService('Players').LocalPlayer
		Char  = Local.Character
		touched,tpdback = false, false
		box = Instance.new('Part',workspace)
		box.Anchored = true
		box.CanCollide = true
		box.Size = Vector3.new(10,1,10)
		box.Position = Vector3.new(0,10000,0)
		box.Touched:connect(function(part)
		    if (part.Parent.Name == Local.Name) then
		        if touched == false then
		            touched = true
		            function apply()
		                if script.Disabled ~= true then
		                    no = Char.HumanoidRootPart:Clone()
		                    wait(.25)
		                    Char.HumanoidRootPart:Destroy()
		                    no.Parent = Char
		                    Char:MoveTo(loc)
		                    touched = false
		                end end
		            if Char then
		                apply()
		            end
		        end
		    end
		end)
		repeat wait() until Char
		loc = Char.HumanoidRootPart.Position
		Char:MoveTo(box.Position + Vector3.new(0,.5,0))
		game.StarterGui:SetCore("SendNotification", {
		Title = "Invisibility enabled!";
		Text = "Reset or use ;respawn to remove.";
		})
	end
	if string.sub(msg, 1, 6) == (prefix.."view ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."unview") then
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
	end
	if string.sub(msg, 1, 6) == (prefix.."goto ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
		end
	end
	if string.sub(msg, 1, 4) == (prefix.."fly") then
		flying = true
		repeat wait()
		until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
		local mouse = game.Players.LocalPlayer:GetMouse()
		repeat wait() until mouse
		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 80
		local speed = 0
		 
		function FlyFunction()
		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		repeat wait()
		plr.Character.Humanoid.PlatformStand = true
		if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
		speed = speed+.5+(speed/maxspeed)
		if speed > maxspeed then
		speed = maxspeed
		end
		elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
		speed = speed-1
		if speed < 0 then
		speed = 0
		end
		end
		if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
		bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
		lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
		elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
		bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
		else
		bv.velocity = Vector3.new(0,0.1,0)
		end
		bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		until not flying
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		end
		mouse.KeyDown:connect(function(key)
		if key:lower() == "w" then
		ctrl.f = 1
		elseif key:lower() == "s" then
		ctrl.b = -1
		elseif key:lower() == "a" then
		ctrl.l = -1
		elseif key:lower() == "d" then
		ctrl.r = 1
		end
		end)
		mouse.KeyUp:connect(function(key)
		if key:lower() == "w" then
		ctrl.f = 0
		elseif key:lower() == "s" then
		ctrl.b = 0
		elseif key:lower() == "a" then
		ctrl.l = 0
		elseif key:lower() == "d" then
		ctrl.r = 0
		end
		end)
		FlyFunction()
	end
	if string.sub(msg, 1, 6) == (prefix.."unfly") then
		flying = false
	end
	if string.sub(msg, 1, 6) == (prefix.."chat ") then
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer((string.sub(msg, 7)), "All")
	end
	if string.sub(msg, 1, 6) == (prefix.."spam ") then
		spamtext = (string.sub(msg, 7))
		spamming = true
	end
	if string.sub(msg, 1, 7) == (prefix.."unspam") then
		spamming = false
	end
	if string.sub(msg, 1, 10) == (prefix.."spamwait ") then
		spamdelay = (string.sub(msg, 11))
	end
	if string.sub(msg, 1, 8) == (prefix.."pmspam ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			pmspammed = v.Name
			spammingpm = true
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."unpmspam") then
		spammingpm = false
	end
	if string.sub(msg, 1, 9) == (prefix.."cfreeze ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 10))) do
			v.Character["Left Leg"].Anchored = true
			v.Character["Left Arm"].Anchored = true
			v.Character["Right Leg"].Anchored = true
			v.Character["Right Arm"].Anchored = true
			v.Character.Torso.Anchored = true
			v.Character.Head.Anchored = true
		end
	end
	if string.sub(msg, 1, 11) == (prefix.."uncfreeze ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 12))) do
			v.Character["Left Leg"].Anchored = false
			v.Character["Left Arm"].Anchored = false
			v.Character["Right Leg"].Anchored = false
			v.Character["Right Arm"].Anchored = false
			v.Character.Torso.Anchored = false
			v.Character.Head.Anchored = false
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."unlockws") then
		local a = game.Workspace:getChildren()
		for i = 1, #a do
			if a[i].className == "Part" then
				a[i].Locked = false
			elseif a[i].className == "Model" then
				local r = a[i]:getChildren()
				for i = 1, #r do
					if r[i].className == "Part" then
					r[i].Locked = false
					end
				end
			end
		end
		game.StarterGui:SetCore("SendNotification", {
		Title = "Success!";
		Text = "Workspace unlocked. Use ;lockws to lock.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."lockws") then
		local a = game.Workspace:getChildren()
		for i = 1, #a do
			if a[i].className == "Part" then
				a[i].Locked = true
			elseif a[i].className == "Model" then
				local r = a[i]:getChildren()
				for i = 1, #r do
					if r[i].className == "Part" then
					r[i].Locked = true
					end
				end
			end
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."btools") then
		local Clone_T = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
		Clone_T.BinType = "Clone"
		local Destruct = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
		Destruct.BinType = "Hammer"
		local Hold_T = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
		Hold_T.BinType = "Grab"
	end
	if string.sub(msg, 1, 7) == (prefix.."pstand") then
		game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
	end
	if string.sub(msg, 1, 9) == (prefix.."unpstand") then
		game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	end
	if string.sub(msg, 1, 10) == (prefix.."blockhead") then
		game.Players.LocalPlayer.Character.Head.Mesh:Destroy()
	end
	if string.sub(msg, 1, 4) == (prefix.."sit") then
		game.Players.LocalPlayer.Character.Humanoid.Sit = true
	end
	if string.sub(msg, 1, 10) == (prefix.."bringobj ") then
		local function bringobjw()
		for i,obj in ipairs(game.Workspace:GetDescendants()) do
		if obj.Name == (string.sub(msg, 11)) then
		obj.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		obj.CanCollide = false
		obj.Transparency = 0.7
		wait()
		obj.CFrame = game.Players.LocalPlayer.Character["Left Leg"].CFrame
		wait()
		obj.CFrame = game.Players.LocalPlayer.Character["Right Leg"].CFrame
		wait()
		obj.CFrame = game.Players.LocalPlayer.Character["Head"].CFrame
		end
		end
		end
		while wait() do
			bringobjw()
		end
		game.StarterGui:SetCore("SendNotification", {
		Title = "BringObj";
		Text = "BringObj enabled.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."wsvis ") then
		vis = (string.sub(msg, 8))
		local a = game.Workspace:GetDescendants()
		for i = 1, #a do
			if a[i].className == "Part" then
				a[i].Transparency = vis
			elseif a[i].className == "Model" then
				local r = a[i]:getChildren()
				for i = 1, #r do
					if r[i].className == "Part" then
					r[i].Transparency = vis
					end
				end
			end
		end
	end
	if string.sub(msg, 1, 11) == (prefix.."hypertotal") then
		loadstring(game:GetObjects("rbxassetid://1255063809")[1].Source)()
		game.StarterGui:SetCore("SendNotification", {
		Title = "Success!";
		Text = "HyperTotal GUI Loaded!";
		})
	end
	if string.sub(msg, 1, 5) == (prefix.."cmds") then
		CMDSFRAME.Visible = true
	end
	if string.sub(msg, 1, 10) == (prefix.."rmeshhats") then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."blockhats") then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."rmeshtool") then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."blocktool") then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."spinner") then
		local p = Instance.new("RocketPropulsion")
		p.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		p.Name = "Spinner"
		p.Target = game.Players.LocalPlayer.Character["Left Arm"]
		p:Fire()
		game.StarterGui:SetCore("SendNotification", {
		Title = "Spinner enabled";
		Text = "Type ;nospinner to disable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."nospinner") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.Spinner:Destroy()
	end
	if string.sub(msg, 1, 7) == (prefix.."reachd") then
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				local a = Instance.new("SelectionBox",v.Handle)
				a.Adornee = v.Handle
				v.Handle.Size = Vector3.new(0.5,0.5,60)
				v.GripPos = Vector3.new(0,0,0)
				game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
			end
		end
		game.StarterGui:SetCore("SendNotification", {
		Title = "Reach applied!";
		Text = "Applied to equipped sword. Use ;noreach to disable.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."reach ") then
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				local a = Instance.new("SelectionBox",v.Handle)
				a.Name = "Reach"
				a.Adornee = v.Handle
				v.Handle.Size = Vector3.new(0.5,0.5,(string.sub(msg, 8)))
				v.GripPos = Vector3.new(0,0,0)
				game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
			end
		end
		game.StarterGui:SetCore("SendNotification", {
		Title = "Reach applied!";
		Text = "Applied to equipped sword. Use ;noreach to disable.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."noreach") then
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				v.Handle.Reach:Destroy()
			end
		end
		game.StarterGui:SetCore("SendNotification", {
		Title = "Reach removed!";
		Text = "Removed reach from equipped sword.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."rkill ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8)))do
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			end
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.5)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
			game.StarterGui:SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."tp me ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."cbring ") then
		if (string.sub(msg, 9)) == "all" or (string.sub(msg, 9)) == "All" or (string.sub(msg, 9)) == "ALL" then
			cbringall = true
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
				brplr = v.Name
			end
		end
		cbring = true
	end
	if string.sub(msg, 1, 9) == (prefix.."uncbring") then
		cbring = false
		cbringall = false
	end
	if string.sub(msg, 1, 6) == (prefix.."swap ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			local NOWPLR = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			end
			local function tp(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1:MoveTo(char2.Head.Position)
			end
			end
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.5)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
			wait(0.6)
			tp(game.Players.LocalPlayer, game.Players[v.Name])
			wait(0.4)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOWPLR
			game.StarterGui:SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."givetool") then
		for i,v in pairs(GetPlayer(string.sub(msg, 10))) do
			for i,tool in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if (tool:IsA("Tool")) then
					tool.Parent = game.Workspace[v.Name]
				end
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."glitch ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
			wait(0.3)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
			wait(0.4)
			b = Instance.new("BodyForce")
			b.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			b.Name = "Glitch"
			b.Force = Vector3.new(100000000,5000,0)
			game.StarterGui:SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."unglitch") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.Glitch:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(10000,0,10000)
		b = Instance.new("BodyForce")
		b.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		b.Name = "unGlitch"
		b.Force = Vector3.new(0,-5000000,0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.unGlitch:Destroy()
	end
	if string.sub(msg, 1, 9) == (prefix.."grespawn") then
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(1)
		game.Players.LocalPlayer.Character.Head.CFrame = CFrame.new(1000000,0,1000000)
		game.Players.LocalPlayer.Character.Torso.CFrame = CFrame.new(1000000,0,1000000)
	end
	if string.sub(msg, 1, 9) == (prefix.."explorer") then
		loadstring(game:GetObjects("rbxassetid://492005721")[1].Source)()
		game.StarterGui:SetCore("SendNotification", {
		Title = "Success!";
		Text = "DEX Explorer has loaded.";
		})
	end
	if string.sub(msg, 1, 6) == (prefix.."anim ") then
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://"..(string.sub(msg, 7))
		local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
		track:Play(.1, 1, 1)
	end
	if string.sub(msg, 1, 8) == (prefix.."animgui") then
		loadstring(game:GetObjects("rbxassetid://1202558084")[1].Source)()
		game.StarterGui:SetCore("SendNotification", {
		Title = "Success!";
		Text = "Energize Animations GUI has loaded.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."savepos") then
		saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.StarterGui:SetCore("SendNotification", {
		Title = "Position Saved";
		Text = "Use ;loadpos to return to saved position.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."loadpos") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
	end
	if string.sub(msg, 1, 6) == (prefix.."bang ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			local Anim2 = Instance.new("Animation")
			Anim2.AnimationId = "rbxassetid://148840371"
			local track2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim2)
			track2:Play(.1, 1, 1)
			bplrr = v.Name
			banpl = true
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."unbang") then
		banpl = false
	end
	if string.sub(msg, 1, 10) == (prefix.."bringmod ") then
		local function bringmodw()
		for i,obj in ipairs(game.Workspace:GetDescendants()) do
		if obj.Name == (string.sub(msg, 11)) then
		for i,ch in pairs(obj:GetDescendants()) do
		if (ch:IsA("BasePart")) then
		ch.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		ch.CanCollide = false
		ch.Transparency = 0.7
		wait()
		ch.CFrame = game.Players.LocalPlayer.Character["Left Leg"].CFrame
		wait()
		ch.CFrame = game.Players.LocalPlayer.Character["Right Leg"].CFrame
		wait()
		ch.CFrame = game.Players.LocalPlayer.Character["Head"].CFrame
		end
		end
		end
		end
		end
		while wait() do
			bringmodw()
		end
		game.StarterGui:SetCore("SendNotification", {
		Title = "BringMod";
		Text = "BringMod enabled.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."respawn") then
		local mod = Instance.new('Model', workspace) mod.Name = 're '..game.Players.LocalPlayer.Name
		local hum = Instance.new('Humanoid', mod)
		local ins = Instance.new('Part', mod) ins.Name = 'Torso' ins.CanCollide = false ins.Transparency = 1
		game.Players.LocalPlayer.Character = mod
	end
	if string.sub(msg, 1, 9) == (prefix.."shutdown") then
		game:GetService'RunService'.Stepped:Connect(function()
		pcall(function()
		    for i,v in pairs(game:GetService'Players':GetPlayers()) do
		        if v.Character ~= nil and v.Character:FindFirstChild'Head' then
		            for _,x in pairs(v.Character.Head:GetChildren()) do
		                if x:IsA'Sound' then x.Playing = true x.CharacterSoundEvent:FireServer(true, true) end
		            end
		        end
		    end
		end)
		end)
		game.StarterGui:SetCore("SendNotification", {
		Title = "Attempting Shutdown";
		Text = "Shutdown Attempt has begun.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."delobj ") then
		objtodel = (string.sub(msg, 9))
		delobject()
	end
	if string.sub(msg, 1, 8) == (prefix.."getplrs") then
		for i,v in pairs(game:GetService("Players"):GetChildren())do
			print(v)
		end
		game.StarterGui:SetCore("SendNotification", {
		Title = "Printed";
		Text = "Players have been printed to console. (F9)";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."deldecal") then
		for i,v in pairs(game.Workspace:GetDescendants())do
			if (v:IsA("Decal")) then
				v:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 11) == (prefix.."opfinality") then
		loadstring(game:GetObjects("rbxassetid://1294358929")[1].Source)()
		game.StarterGui:SetCore("SendNotification", {
		Title = "Success!";
		Text = "OpFinality GUI has loaded.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."remotes") then
		remotes = true
		added = true
		game.DescendantAdded:connect(function(rmt)
		if added == true then
		if remotes == true then 
		if rmt:IsA("RemoteEvent") then
		print("A RemoteEvent was added!")
		print(" game." .. rmt:GetFullName() .. " | RemoteEvent")
		print(" game." .. rmt:GetFullName() .. " | RemoteEvent", 247, 0, 0, true)
		end end end
		end)
		game.DescendantAdded:connect(function(rmtfnctn)
		if added == true then
		if remotes == true then 
		if rmtfnctn:IsA("RemoteFunction") then
		warn("A RemoteFunction was added!")
		warn(" game." .. rmtfnctn:GetFullName() .. " | RemoteFunction")
		print(" game." .. rmtfnctn:GetFullName() .. " | RemoteFunction", 5, 102, 198, true)
		end end end
		end)
		
		game.DescendantAdded:connect(function(bndfnctn)
		if added == true then
		if binds == true then 
		if bndfnctn:IsA("BindableFunction") then
		print("A BindableFunction was added!")
		print(" game." .. bndfnctn:GetFullName() .. " | BindableFunction")
		print(" game." .. bndfnctn:GetFullName() .. " | BindableFunction", 239, 247, 4, true)
		end end end
		end)
		
		game.DescendantAdded:connect(function(bnd)
		if added == true then
		if binds == true then 
		if bnd:IsA("BindableEvent") then
		warn("A BindableEvent was added!")
		warn(" game." .. bnd:GetFullName() .. " | BindableEvent")
		print(" game." .. bnd:GetFullName() .. " | BindableEvent", 13, 193, 22, true)
		end end end
		end)
		
		
		if binds == true then
		for i,v in pairs(game:GetDescendants()) do
		if v:IsA("BindableFunction") then
		print(" game." .. v:GetFullName() .. " | BindableFunction")
		print(" game." .. v:GetFullName() .. " | BindableFunction", 239, 247, 4, true)
		end end
		for i,v in pairs(game:GetDescendants()) do
		if v:IsA("BindableEvent") then
		warn(" game." .. v:GetFullName() .. " | BindableEvent")
		print(" game." .. v:GetFullName() .. " | BindableEvent", 13, 193, 22, true)
		end end
		else
		print("Off")
		end
		if remotes == true then
		for i,v in pairs(game:GetDescendants()) do
		if v:IsA("RemoteFunction") then
		warn(" game." .. v:GetFullName() .. " | RemoteFunction")
		print(" game." .. v:GetFullName() .. " | RemoteFunction", 5, 102, 198, true)
		end end
		wait()
		for i,v in pairs(game:GetDescendants()) do
		if v:IsA("RemoteEvent") then
		print(" game." .. v:GetFullName() .. " | RemoteEvent")
		print(" game." .. v:GetFullName() .. " | RemoteEvent", 247, 0, 0, true)
		end end
		else
		print("Off")
		end
		game.StarterGui:SetCore("SendNotification", {
		Title = "Printing Remotes";
		Text = "Type ;noremotes to disable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."noremotes") then
		remotes = false
		added = false
		game.StarterGui:SetCore("SendNotification", {
		Title = "Printing Remotes Disabled";
		Text = "Type ;remotes to enable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."tpdefault") then
		spin = false
		followed = false
		traill = false
		noclip = false
		annoying = false
		hwalk = false
		cbringing = false
	end
	if string.sub(msg, 1, 8) == (prefix.."stopsit") then
		stopsitting = true
	end
	if string.sub(msg, 1, 6) == (prefix.."gosit") then
		stopsitting = false
	end
	if string.sub(msg, 1, 8) == (prefix.."version") then
		print(adminversion)
		game.StarterGui:SetCore("SendNotification", {
		Title = "Version";
		Text = adminversion;
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."clicktp") then
		clickgoto = true
		game.StarterGui:SetCore("SendNotification", {
		Title = "Click TP";
		Text = "Press E to teleport to mouse position";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."noclicktp") then
		clickgoto = false
		game.StarterGui:SetCore("SendNotification", {
		Title = "Click TP";
		Text = "Click TP has been disabled.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."toolson") then
		gettingtools = true
		game.StarterGui:SetCore("SendNotification", {
		Title = "Tools Enabled";
		Text = "Automatically colleting tools dropped.";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."toolsoff") then
		gettingtools = false
		game.StarterGui:SetCore("SendNotification", {
		Title = "Tools Disabled";
		Text = "Click TP has been disabled.";
		})
	end
end)

local function tp()
	for i, player in ipairs(game.Players:GetChildren()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			if player.Name == brplr then
				player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 2
			end
		end
	end
end
local function tpall()
	for i, player in ipairs(game.Players:GetChildren()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 3
		end
	end
end
local function delobject()
	for i,v in pairs(game.Workspace:GetDescendants()) do
		if v.Name == objtodel then
			v:Destroy()
		end
	end
end
spawn(function()
	while wait(spamdelay) do
		if spamming == true then
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(spamtext, "All")
		end
	end
end)
spawn(function()
	while wait(spamdelay) do
		if spammingpm == true then
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..pmspammed.." @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@", "All")
		end
	end
end)
spawn(function()
	while wait() do
		if cbring == true then
			tp()
		end
	end
end)
spawn(function()
	while wait() do
		if cbringall == true then
			tpall()
		end
	end
end)
------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local CMDBAR = Instance.new("TextBox")
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.3, 0.1, 0.1)
Frame.BackgroundTransparency = 0.3
Frame.Position = UDim2.new(0.5, 0, 0, 10)
Frame.Size = UDim2.new(0, 200, 0, 40)
Frame.Active = true
Frame.Draggable = true
CMDBAR.Name = "CMDBAR"
CMDBAR.Parent = Frame
CMDBAR.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
CMDBAR.BackgroundTransparency = 0.20000000298023
CMDBAR.Size = UDim2.new(0, 180, 0, 20)
CMDBAR.Position = UDim2.new(0.05, 0, 0.25, 0)
CMDBAR.Font = Enum.Font.SourceSansLight
CMDBAR.FontSize = Enum.FontSize.Size14
CMDBAR.TextColor3 = Color3.new(0.945098, 0.945098, 0.945098)
CMDBAR.TextScaled = true
CMDBAR.TextSize = 14
CMDBAR.TextWrapped = true
CMDBAR.Text = "Press ; to type, Enter to execute"

Mouse.KeyDown:connect(function(Key)
	if Key == prefix then
		CMDBAR:CaptureFocus()
	end
end)

CMDBAR.FocusLost:connect(function(enterPressed)
	if enterPressed then
		if string.sub(CMDBAR.Text, 1, 5) == ("kill ") then
			if string.sub(CMDBAR.Text, 6) == "me" then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100000,0,100000)
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6)))do
					local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
					game.Players.LocalPlayer.Character.Humanoid.Name = 1
					local l = game.Players.LocalPlayer.Character["1"]:Clone()
					l.Parent = game.Players.LocalPlayer.Character
					l.Name = "Humanoid"
					wait(0.1)
					game.Players.LocalPlayer.Character["1"]:Destroy()
					game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
					game.Players.LocalPlayer.Character.Animate.Disabled = true
					wait(0.1)
					game.Players.LocalPlayer.Character.Animate.Disabled = false
					game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
					for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
					end
					local function tp(player,player2)
					local char1,char2=player.Character,player2.Character
					if char1 and char2 then
					char1:MoveTo(char2.Head.Position)
					end
					end
					wait(0.1)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
					wait(0.2)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
					wait(0.5)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
					wait(0.7)
					tp(game.Players.LocalPlayer,game.Players[v.Name])
					wait(0.7)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
					game.StarterGui:SetCore("SendNotification", {
					Title = "Tools needed!";
					Text = "You need a tool in your backpack for this command!";
					})
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("bring ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7)))do
				local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				game.Players.LocalPlayer.Character.Humanoid.Name = 1
				local l = game.Players.LocalPlayer.Character["1"]:Clone()
				l.Parent = game.Players.LocalPlayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				game.Players.LocalPlayer.Character["1"]:Destroy()
				game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
				game.Players.LocalPlayer.Character.Animate.Disabled = true
				wait(0.1)
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
				local function tp(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
				end
				end
				local function getout(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				tp(game.Players[v.Name], game.Players.LocalPlayer)
				wait(0.2)
				tp(game.Players[v.Name], game.Players.LocalPlayer)
				wait(0.5)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
				wait(0.5)
				getout(game.Players.LocalPlayer, game.Players[v.Name])
				wait(0.3)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
				game.StarterGui:SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("spin ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				game.Players.LocalPlayer.Character.Humanoid.Name = 1
				local l = game.Players.LocalPlayer.Character["1"]:Clone()
				l.Parent = game.Players.LocalPlayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				game.Players.LocalPlayer.Character["1"]:Destroy()
				game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
				game.Players.LocalPlayer.Character.Animate.Disabled = true
				wait(0.1)
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
				spinplr = v
				wait(0.5)
				spin = true
				game.StarterGui:SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("unspin") then
			spin = false
			local function getout(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1:MoveTo(char2.Head.Position)
			end
			end
			getout(game.Players.LocalPlayer, game.Players.LocalPlayer)
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("attach ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				game.Players.LocalPlayer.Character.Humanoid.Name = 1
				local l = game.Players.LocalPlayer.Character["1"]:Clone()
				l.Parent = game.Players.LocalPlayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				game.Players.LocalPlayer.Character["1"]:Destroy()
				game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
				game.Players.LocalPlayer.Character.Animate.Disabled = true
				wait(0.1)
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
				wait(0.3)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
				attplr = v
				game.StarterGui:SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unattach ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 9))) do
				local function getout(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				getout(game.Players.LocalPlayer, game.Players[v.Name])
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("follow ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				followed = true
				flwplr = v
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unfollow") then
			followed = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("freefall ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 10))) do
				local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				game.Players.LocalPlayer.Character.Humanoid.Name = 1
				local l = game.Players.LocalPlayer.Character["1"]:Clone()
				l.Parent = game.Players.LocalPlayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				game.Players.LocalPlayer.Character["1"]:Destroy()
				game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
				game.Players.LocalPlayer.Character.Animate.Disabled = true
				wait(0.1)
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.6)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
				wait(0.6)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,50000,0)
				game.StarterGui:SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("trail ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
				traill = true
				trlplr = v
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("untrail") then
			traill = false
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("orbit ") then
			if string.sub(CMDBAR.Text, 7) == "all" or string.sub(CMDBAR.Text, 7) == "others" or string.sub(CMDBAR.Text, 7) == "me" then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
					local o = Instance.new("RocketPropulsion")
					o.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
					o.Name = "Orbit"
					o.Target = game.Players[v.Name].Character.HumanoidRootPart
					o:Fire()
					noclip = true
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unorbit") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Orbit:Destroy()
			noclip = false
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("fling ") then
			if string.sub(CMDBAR.Text, 7) == "all" or string.sub(CMDBAR.Text, 7) == "others" or string.sub(CMDBAR.Text, 7) == "me" then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
					local y = Instance.new("RocketPropulsion")
					y.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
					y.CartoonFactor = 1
					y.MaxThrust = 500000
					y.MaxSpeed = 1000
					y.ThrustP = 100000
					y.Name = "Fling"
					game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
					y.Target = game.Players[v.Name].Character.HumanoidRootPart
					y:Fire()
					noclip = true
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unfling") then
			noclip = false
			game.Players.LocalPlayer.Character.HumanoidRootPart.Fling:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
			wait(0.4)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Fling:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("fecheck") then
			if game.Workspace.FilteringEnabled == true then
				warn("FE is Enabled (Filtering Enabled)")
				game.StarterGui:SetCore("SendNotification", {
					Title = "FE is Enabled";
					Text = "Filtering Enabled. Enjoy using Reviz Admin!";
				})
			else
				warn("FE is Disabled (Filtering Disabled) Consider using a different admin script.")
				game.StarterGui:SetCore("SendNotification", {
					Title = "FE is Disabled";
					Text = "Filtering Disabled. Consider using a different admin script.";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("void ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				game.Players.LocalPlayer.Character.Humanoid.Name = 1
				local l = game.Players.LocalPlayer.Character["1"]:Clone()
				l.Parent = game.Players.LocalPlayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				game.Players.LocalPlayer.Character["1"]:Destroy()
				game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
				game.Players.LocalPlayer.Character.Animate.Disabled = true
				wait(0.1)
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.6)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(999999999999999,0,999999999999999)
				game.StarterGui:SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("noclip") then
			noclip = true
			game.StarterGui:SetCore("SendNotification", {
			Title = "Noclip enabled";
			Text = "Type ;clip to disable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 4) == ("clip") then
			noclip = false
			game.StarterGui:SetCore("SendNotification", {
			Title = "Noclip disabled";
			Text = "Type ;noclip to enable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("speed ") then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (string.sub(CMDBAR.Text, 7))
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("ws ") then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (string.sub(CMDBAR.Text, 4))
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("hipheight ") then
			game.Players.LocalPlayer.Character.Humanoid.HipHeight = (string.sub(CMDBAR.Text, 11))
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("hh ") then
			game.Players.LocalPlayer.Character.Humanoid.HipHeight = (string.sub(CMDBAR.Text, 4))
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("jumppower ") then
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = (string.sub(CMDBAR.Text, 11))
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("jp ") then
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = (string.sub(CMDBAR.Text, 4))
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("default") then
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
			game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("annoy ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
				annoying = true
				annplr = v
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unannoy") then
			annoying = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("headwalk ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 10))) do
				hwalk = true
				hdwplr = v
			end
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("unheadwalk") then
			hwalk = false
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("nolimbs") then
			game.Players.LocalPlayer.Character["Left Leg"]:Destroy()
			game.Players.LocalPlayer.Character["Left Arm"]:Destroy()
			game.Players.LocalPlayer.Character["Right Leg"]:Destroy()
			game.Players.LocalPlayer.Character["Right Arm"]:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("god") then
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			game.StarterGui:SetCore("SendNotification", {
			Title = "FE Godmode enabled";
			Text = "Use ;kill me OR ;respawn to reset";
			})
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("drophats") then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if (v:IsA("Accessory")) or (v:IsA("Hat")) then
					v.Parent = workspace
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("droptool") then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if (v:IsA("Tool")) then
					v.Parent = workspace
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("loopdhats") then
			droppinghats = true
			game.StarterGui:SetCore("SendNotification", {
			Title = "Loop Drop Enabled";
			Text = "Type ;unloopdhats to disable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("unloopdhats") then
			droppinghats = false
			game.StarterGui:SetCore("SendNotification", {
			Title = "Loop Drop Disabled";
			Text = "Type ;loopdhats to enable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("loopdtool") then
			droppingtools = true
			game.StarterGui:SetCore("SendNotification", {
			Title = "Loop Drop Enabled";
			Text = "Type ;unloopdtool to disable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("unloopdtool") then
			droppingtools = false
			game.StarterGui:SetCore("SendNotification", {
			Title = "Loop Drop Disabled";
			Text = "Type ;loopdtool to enable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("invisible") then -- Credit to Timeless
			Local = game:GetService('Players').LocalPlayer
			Char  = Local.Character
			touched,tpdback = false, false
			box = Instance.new('Part',workspace)
			box.Anchored = true
			box.CanCollide = true
			box.Size = Vector3.new(10,1,10)
			box.Position = Vector3.new(0,10000,0)
			box.Touched:connect(function(part)
			    if (part.Parent.Name == Local.Name) then
			        if touched == false then
			            touched = true
			            function apply()
			                if script.Disabled ~= true then
			                    no = Char.HumanoidRootPart:Clone()
			                    wait(.25)
			                    Char.HumanoidRootPart:Destroy()
			                    no.Parent = Char
			                    Char:MoveTo(loc)
			                    touched = false
			                end end
			            if Char then
			                apply()
			            end
			        end
			    end
			end)
			repeat wait() until Char
			loc = Char.HumanoidRootPart.Position
			Char:MoveTo(box.Position + Vector3.new(0,.5,0))
			game.StarterGui:SetCore("SendNotification", {
			Title = "Invisibility enabled!";
			Text = "Reset or use ;respawn to remove.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("view ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("unview") then
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("goto ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			end
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("fly") then
			flying = true
			repeat wait()
			until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
			local mouse = game.Players.LocalPlayer:GetMouse()
			repeat wait() until mouse
			local plr = game.Players.LocalPlayer
			local torso = plr.Character.Torso
			local deb = true
			local ctrl = {f = 0, b = 0, l = 0, r = 0}
			local lastctrl = {f = 0, b = 0, l = 0, r = 0}
			local maxspeed = 80
			local speed = 0
			 
			function FlyFunction()
			local bg = Instance.new("BodyGyro", torso)
			bg.P = 9e4
			bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			bg.cframe = torso.CFrame
			local bv = Instance.new("BodyVelocity", torso)
			bv.velocity = Vector3.new(0,0.1,0)
			bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
			repeat wait()
			plr.Character.Humanoid.PlatformStand = true
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
			speed = speed+.5+(speed/maxspeed)
			if speed > maxspeed then
			speed = maxspeed
			end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
			speed = speed-1
			if speed < 0 then
			speed = 0
			end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
			bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
			bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
			bv.velocity = Vector3.new(0,0.1,0)
			end
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
			until not flying
			ctrl = {f = 0, b = 0, l = 0, r = 0}
			lastctrl = {f = 0, b = 0, l = 0, r = 0}
			speed = 0
			bg:Destroy()
			bv:Destroy()
			plr.Character.Humanoid.PlatformStand = false
			end
			mouse.KeyDown:connect(function(key)
			if key:lower() == "w" then
			ctrl.f = 1
			elseif key:lower() == "s" then
			ctrl.b = -1
			elseif key:lower() == "a" then
			ctrl.l = -1
			elseif key:lower() == "d" then
			ctrl.r = 1
			end
			end)
			mouse.KeyUp:connect(function(key)
			if key:lower() == "w" then
			ctrl.f = 0
			elseif key:lower() == "s" then
			ctrl.b = 0
			elseif key:lower() == "a" then
			ctrl.l = 0
			elseif key:lower() == "d" then
			ctrl.r = 0
			end
			end)
			FlyFunction()
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("unfly") then
			flying = false
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("chat ") then
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer((string.sub(CMDBAR.Text, 6)), "All")
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("spam ") then
			spamtext = (string.sub(CMDBAR.Text, 6))
			spamming = true
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("unspam") then
			spamming = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("spamwait ") then
			spamdelay = (string.sub(CMDBAR.Text, 10))
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("pmspam ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				pmspammed = v.Name
				spammingpm = true
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unpmspam") then
			spammingpm = false
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("cfreeze ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 9))) do
				v.Character["Left Leg"].Anchored = true
				v.Character["Left Arm"].Anchored = true
				v.Character["Right Leg"].Anchored = true
				v.Character["Right Arm"].Anchored = true
				v.Character.Torso.Anchored = true
				v.Character.Head.Anchored = true
			end
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("uncfreeze ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 11))) do
				v.Character["Left Leg"].Anchored = false
				v.Character["Left Arm"].Anchored = false
				v.Character["Right Leg"].Anchored = false
				v.Character["Right Arm"].Anchored = false
				v.Character.Torso.Anchored = false
				v.Character.Head.Anchored = false
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unlockws") then
			local a = game.Workspace:getChildren()
			for i = 1, #a do
				if a[i].className == "Part" then
					a[i].Locked = false
				elseif a[i].className == "Model" then
					local r = a[i]:getChildren()
					for i = 1, #r do
						if r[i].className == "Part" then
						r[i].Locked = false
						end
					end
				end
			end
			game.StarterGui:SetCore("SendNotification", {
			Title = "Success!";
			Text = "Workspace unlocked. Use ;lockws to lock.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("lockws") then
			local a = game.Workspace:getChildren()
			for i = 1, #a do
				if a[i].className == "Part" then
					a[i].Locked = true
				elseif a[i].className == "Model" then
					local r = a[i]:getChildren()
					for i = 1, #r do
						if r[i].className == "Part" then
						r[i].Locked = true
						end
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("btools") then
			local Clone_T = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
			Clone_T.BinType = "Clone"
			local Destruct = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
			Destruct.BinType = "Hammer"
			local Hold_T = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
			Hold_T.BinType = "Grab"
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("pstand") then
			game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unpstand") then
			game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("blockhead") then
			game.Players.LocalPlayer.Character.Head.Mesh:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("sit") then
			game.Players.LocalPlayer.Character.Humanoid.Sit = true
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("bringobj ") then
			local function bringobjw()
			for i,obj in ipairs(game.Workspace:GetDescendants()) do
			if obj.Name == (string.sub(CMDBAR.Text, 10)) then
			obj.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			obj.CanCollide = false
			obj.Transparency = 0.7
			wait()
			obj.CFrame = game.Players.LocalPlayer.Character["Left Leg"].CFrame
			wait()
			obj.CFrame = game.Players.LocalPlayer.Character["Right Leg"].CFrame
			wait()
			obj.CFrame = game.Players.LocalPlayer.Character["Head"].CFrame
			end
			end
			end
			while wait() do
				bringobjw()
			end
			game.StarterGui:SetCore("SendNotification", {
			Title = "BringObj";
			Text = "BringObj enabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("wsvis ") then
			vis = (string.sub(CMDBAR.Text, 7))
			local a = game.Workspace:GetDescendants()
			for i = 1, #a do
				if a[i].className == "Part" then
					a[i].Transparency = vis
				elseif a[i].className == "Model" then
					local r = a[i]:getChildren()
					for i = 1, #r do
						if r[i].className == "Part" then
						r[i].Transparency = vis
						end
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("hypertotal") then
			loadstring(game:GetObjects("rbxassetid://1255063809")[1].Source)()
			game.StarterGui:SetCore("SendNotification", {
			Title = "Success!";
			Text = "HyperTotal GUI Loaded!";
			})
		end
		if string.sub(CMDBAR.Text, 1, 4) == ("cmds") then
			CMDSFRAME.Visible = true
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("rmeshhats") then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if (v:IsA("Accessory")) or (v:IsA("Hat")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("blockhats") then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if (v:IsA("Accessory")) or (v:IsA("Hat")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("rmeshtool") then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if (v:IsA("Tool")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("blocktool") then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if (v:IsA("Tool")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("spinner") then
			local p = Instance.new("RocketPropulsion")
			p.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			p.Name = "Spinner"
			p.Target = game.Players.LocalPlayer.Character["Left Arm"]
			p:Fire()
			game.StarterGui:SetCore("SendNotification", {
			Title = "Spinner enabled";
			Text = "Type ;nospinner to disable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("nospinner") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Spinner:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("reachd") then
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
				if v:isA("Tool") then
					local a = Instance.new("SelectionBox",v.Handle)
					a.Adornee = v.Handle
					v.Handle.Size = Vector3.new(0.5,0.5,60)
					v.GripPos = Vector3.new(0,0,0)
					game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
				end
			end
			game.StarterGui:SetCore("SendNotification", {
			Title = "Reach applied!";
			Text = "Applied to equipped sword. Use ;noreach to disable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("reach ") then
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
				if v:isA("Tool") then
					local a = Instance.new("SelectionBox",v.Handle)
					a.Name = "Reach"
					a.Adornee = v.Handle
					v.Handle.Size = Vector3.new(0.5,0.5,(string.sub(CMDBAR.Text, 7)))
					v.GripPos = Vector3.new(0,0,0)
					game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
				end
			end
			game.StarterGui:SetCore("SendNotification", {
			Title = "Reach applied!";
			Text = "Applied to equipped sword. Use ;noreach to disable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("noreach") then
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
				if v:isA("Tool") then
					v.Handle.Reach:Destroy()
				end
			end
			game.StarterGui:SetCore("SendNotification", {
			Title = "Reach removed!";
			Text = "Removed reach from equipped sword.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("rkill ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7)))do
				game.Players.LocalPlayer.Character.Humanoid.Name = 1
				local l = game.Players.LocalPlayer.Character["1"]:Clone()
				l.Parent = game.Players.LocalPlayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				game.Players.LocalPlayer.Character["1"]:Destroy()
				game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
				game.Players.LocalPlayer.Character.Animate.Disabled = true
				wait(0.1)
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
				wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.5)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
				game.StarterGui:SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("tp me ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("cbring ") then
			if (string.sub(CMDBAR.Text, 8)) == "all" or (string.sub(CMDBAR.Text, 8)) == "All" or (string.sub(CMDBAR.Text, 8)) == "ALL" then
				cbringall = true
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
					brplr = v.Name
				end
			end
			cbring = true
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("uncbring") then
			cbring = false
			cbringall = false
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("swap ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				local NOWPLR = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				game.Players.LocalPlayer.Character.Humanoid.Name = 1
				local l = game.Players.LocalPlayer.Character["1"]:Clone()
				l.Parent = game.Players.LocalPlayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				game.Players.LocalPlayer.Character["1"]:Destroy()
				game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
				game.Players.LocalPlayer.Character.Animate.Disabled = true
				wait(0.1)
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
				local function tp(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.5)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
				wait(0.6)
				tp(game.Players.LocalPlayer, game.Players[v.Name])
				wait(0.4)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOWPLR
				game.StarterGui:SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("givetool") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 9))) do
				for i,tool in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if (tool:IsA("Tool")) then
						tool.Parent = game.Workspace[v.Name]
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("glitch ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				game.Players.LocalPlayer.Character.Humanoid.Name = 1
				local l = game.Players.LocalPlayer.Character["1"]:Clone()
				l.Parent = game.Players.LocalPlayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				game.Players.LocalPlayer.Character["1"]:Destroy()
				game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
				game.Players.LocalPlayer.Character.Animate.Disabled = true
				wait(0.1)
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
				wait(0.3)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
				wait(0.4)
				b = Instance.new("BodyForce")
				b.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
				b.Name = "Glitch"
				b.Force = Vector3.new(100000000,5000,0)
				game.StarterGui:SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unglitch") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Glitch:Destroy()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(10000,0,10000)
			b = Instance.new("BodyForce")
			b.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			b.Name = "unGlitch"
			b.Force = Vector3.new(0,-5000000,0)
			wait(2)
			game.Players.LocalPlayer.Character.HumanoidRootPart.unGlitch:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("grespawn") then
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(1)
			game.Players.LocalPlayer.Character.Head.CFrame = CFrame.new(1000000,0,1000000)
			game.Players.LocalPlayer.Character.Torso.CFrame = CFrame.new(1000000,0,1000000)
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("explorer") then
			loadstring(game:GetObjects("rbxassetid://492005721")[1].Source)()
			game.StarterGui:SetCore("SendNotification", {
			Title = "Success!";
			Text = "DEX Explorer has loaded.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("anim ") then
			local Anim = Instance.new("Animation")
			Anim.AnimationId = "rbxassetid://"..(string.sub(CMDBAR.Text, 6))
			local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
			track:Play(.1, 1, 1)
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("animgui") then
			loadstring(game:GetObjects("rbxassetid://1202558084")[1].Source)()
			game.StarterGui:SetCore("SendNotification", {
			Title = "Success!";
			Text = "Energize Animations GUI has loaded.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("savepos") then
			saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			game.StarterGui:SetCore("SendNotification", {
			Title = "Position Saved";
			Text = "Use ;loadpos to return to saved position.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("loadpos") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("bang ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				local Anim2 = Instance.new("Animation")
				Anim2.AnimationId = "rbxassetid://148840371"
				local track2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim2)
				track2:Play(.1, 1, 1)
				bplrr = v.Name
				banpl = true
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("unbang") then
			banpl = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("bringmod ") then
			local function bringmodw()
			for i,obj in ipairs(game.Workspace:GetDescendants()) do
			if obj.Name == (string.sub(CMDBAR.Text, 10)) then
			for i,ch in pairs(obj:GetDescendants()) do
			if (ch:IsA("BasePart")) then
			ch.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			ch.CanCollide = false
			ch.Transparency = 0.7
			wait()
			ch.CFrame = game.Players.LocalPlayer.Character["Left Leg"].CFrame
			wait()
			ch.CFrame = game.Players.LocalPlayer.Character["Right Leg"].CFrame
			wait()
			ch.CFrame = game.Players.LocalPlayer.Character["Head"].CFrame
			end
			end
			end
			end
			end
			while wait() do
				bringmodw()
			end
			game.StarterGui:SetCore("SendNotification", {
			Title = "BringMod";
			Text = "BringMod enabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("respawn") then
			local mod = Instance.new('Model', workspace) mod.Name = 're '..game.Players.LocalPlayer.Name
			local hum = Instance.new('Humanoid', mod)
			local ins = Instance.new('Part', mod) ins.Name = 'Torso' ins.CanCollide = false ins.Transparency = 1
			game.Players.LocalPlayer.Character = mod
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("shutdown") then
			game:GetService'RunService'.Stepped:Connect(function()
			pcall(function()
			    for i,v in pairs(game:GetService'Players':GetPlayers()) do
			        if v.Character ~= nil and v.Character:FindFirstChild'Head' then
			            for _,x in pairs(v.Character.Head:GetChildren()) do
			                if x:IsA'Sound' then x.Playing = true x.CharacterSoundEvent:FireServer(true, true) end
			            end
			        end
			    end
			end)
			end)
			game.StarterGui:SetCore("SendNotification", {
			Title = "Attempting Shutdown";
			Text = "Shutdown Attempt has begun.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("delobj ") then
			objtodel = (string.sub(CMDBAR.Text, 8))
			delobject()
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("getplrs") then
			for i,v in pairs(game:GetService("Players"):GetChildren())do
				print(v)
			end
			game.StarterGui:SetCore("SendNotification", {
			Title = "Printed";
			Text = "Players have been printed to console. (F9)";
			})
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("deldecal") then
			for i,v in pairs(game.Workspace:GetDescendants())do
				if (v:IsA("Decal")) then
					v:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("opfinality") then
			loadstring(game:GetObjects("rbxassetid://1294358929")[1].Source)()
			game.StarterGui:SetCore("SendNotification", {
			Title = "Success!";
			Text = "OpFinality GUI has loaded.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("remotes") then
			remotes = true
			added = true
			game.DescendantAdded:connect(function(rmt)
			if added == true then
			if remotes == true then 
			if rmt:IsA("RemoteEvent") then
			print("A RemoteEvent was added!")
			print(" game." .. rmt:GetFullName() .. " | RemoteEvent")
			print(" game." .. rmt:GetFullName() .. " | RemoteEvent", 247, 0, 0, true)
			end end end
			end)
			game.DescendantAdded:connect(function(rmtfnctn)
			if added == true then
			if remotes == true then 
			if rmtfnctn:IsA("RemoteFunction") then
			warn("A RemoteFunction was added!")
			warn(" game." .. rmtfnctn:GetFullName() .. " | RemoteFunction")
			print(" game." .. rmtfnctn:GetFullName() .. " | RemoteFunction", 5, 102, 198, true)
			end end end
			end)
			
			game.DescendantAdded:connect(function(bndfnctn)
			if added == true then
			if binds == true then 
			if bndfnctn:IsA("BindableFunction") then
			print("A BindableFunction was added!")
			print(" game." .. bndfnctn:GetFullName() .. " | BindableFunction")
			print(" game." .. bndfnctn:GetFullName() .. " | BindableFunction", 239, 247, 4, true)
			end end end
			end)
			
			game.DescendantAdded:connect(function(bnd)
			if added == true then
			if binds == true then 
			if bnd:IsA("BindableEvent") then
			warn("A BindableEvent was added!")
			warn(" game." .. bnd:GetFullName() .. " | BindableEvent")
			print(" game." .. bnd:GetFullName() .. " | BindableEvent", 13, 193, 22, true)
			end end end
			end)
			
			
			if binds == true then
			for i,v in pairs(game:GetDescendants()) do
			if v:IsA("BindableFunction") then
			print(" game." .. v:GetFullName() .. " | BindableFunction")
			print(" game." .. v:GetFullName() .. " | BindableFunction", 239, 247, 4, true)
			end end
			for i,v in pairs(game:GetDescendants()) do
			if v:IsA("BindableEvent") then
			warn(" game." .. v:GetFullName() .. " | BindableEvent")
			print(" game." .. v:GetFullName() .. " | BindableEvent", 13, 193, 22, true)
			end end
			else
			print("Off")
			end
			if remotes == true then
			for i,v in pairs(game:GetDescendants()) do
			if v:IsA("RemoteFunction") then
			warn(" game." .. v:GetFullName() .. " | RemoteFunction")
			print(" game." .. v:GetFullName() .. " | RemoteFunction", 5, 102, 198, true)
			end end
			wait()
			for i,v in pairs(game:GetDescendants()) do
			if v:IsA("RemoteEvent") then
			print(" game." .. v:GetFullName() .. " | RemoteEvent")
			print(" game." .. v:GetFullName() .. " | RemoteEvent", 247, 0, 0, true)
			end end
			else
			print("Off")
			end
			game.StarterGui:SetCore("SendNotification", {
			Title = "Printing Remotes";
			Text = "Type ;noremotes to disable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("noremotes") then
			remotes = false
			added = false
			game.StarterGui:SetCore("SendNotification", {
			Title = "Printing Remotes Disabled";
			Text = "Type ;remotes to enable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("tpdefault") then
			spin = false
			followed = false
			traill = false
			noclip = false
			annoying = false
			hwalk = false
			cbringing = false
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("stopsit") then
			stopsitting = true
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("gosit") then
			stopsitting = false
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("version") then
			print(adminversion)
			game.StarterGui:SetCore("SendNotification", {
			Title = "Version";
			Text = adminversion;
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("clicktp") then
			clickgoto = true
			game.StarterGui:SetCore("SendNotification", {
			Title = "Click TP";
			Text = "Press E to teleport to mouse position";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("noclicktp") then
			clickgoto = false
			game.StarterGui:SetCore("SendNotification", {
			Title = "Click TP";
			Text = "Click TP has been disabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("toolson") then
			gettingtools = true
			game.StarterGui:SetCore("SendNotification", {
			Title = "Tools Enabled";
			Text = "Automatically colleting tools dropped.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("toolsoff") then
			gettingtools = false
			game.StarterGui:SetCore("SendNotification", {
			Title = "Tools Disabled";
			Text = "Click TP has been disabled.";
			})
		end
		CMDBAR.Text = ""
	end
end)

wait(0.3)
game.StarterGui:SetCore("SendNotification", {
	Title = "Loaded successfully!";
	Text = "Reviz Admin by illremember";
})
wait(0.1)
if game.Workspace.FilteringEnabled == true then
	warn("FE is Enabled (Filtering Enabled)")
	game.StarterGui:SetCore("SendNotification", {
		Title = "FE is Enabled";
		Text = "Filtering Enabled. Enjoy using Reviz Admin!";
	})
else
	warn("FE is Disabled (Filtering Disabled) Consider using a different admin script.")
	game.StarterGui:SetCore("SendNotification", {
		Title = "FE is Disabled";
		Text = "Filtering Disabled. Consider using a different admin script.";
	})
end


while wait(2) do
	for _, v in pairs(game.Players:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			game.ReplicatedStorage.GunEvent:FireServer({"1", v.Character.Humanoid, 100})
		end
	end
end
end)

Seizure.Name = "Seizure"
Seizure.Parent = BypassFrame
Seizure.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
Seizure.BorderColor3 = Color3.fromRGB(206, 208, 255)
Seizure.BorderSizePixel = 2
Seizure.Position = UDim2.new(0.403606772, 0, 0.419477969, 0)
Seizure.Size = UDim2.new(0, 139, 0, 39)
Seizure.Font = Enum.Font.Gotham
Seizure.Text = "Seizure ( J )"
Seizure.TextColor3 = Color3.fromRGB(0, 0, 0)
Seizure.TextSize = 20.000
Seizure.MouseButton1Down:connect(function()
--Credit to sked
--[[
    how to use:
    press "j" on your keyboard to toggle seizure mode
    works best if you run, jump then press j
    works on all games works best on r6 avatar because u shake but it works on r15 too
]]

local an = Instance.new("Animation",workspace)
an.AnimationId = "rbxassetid://48972923"
local an2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(an)
an:Remove()

game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
    if key == "j" then
        if game.Players.LocalPlayer.Character.Humanoid.PlatformStand then
            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0))
            an2:Stop()
        else
            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0))
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(-60, 0, 0)
            an2:Play()
            an2:AdjustSpeed(9999)
        end
    end
end)
end)

ToolMorph.Name = "ToolMorph"
ToolMorph.Parent = BypassFrame
ToolMorph.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
ToolMorph.BorderColor3 = Color3.fromRGB(206, 208, 255)
ToolMorph.BorderSizePixel = 2
ToolMorph.Position = UDim2.new(0.405339807, 0, 0.579628468, 0)
ToolMorph.Size = UDim2.new(0, 139, 0, 39)
ToolMorph.Font = Enum.Font.Gotham
ToolMorph.Text = "Tool Morph ( MUST HAVE 2+ TOOLS! )"
ToolMorph.TextColor3 = Color3.fromRGB(0, 0, 0)
ToolMorph.TextSize = 15.000
ToolMorph.TextWrapped = true
ToolMorph.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character.Humanoid.HipHeight = 100
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 100, 0))
wait()
for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if (v:IsA("Tool")) then
        workspace.CurrentCamera.CameraSubject = v.Handle
        repeat
            v.GripPos = Vector3.new(0, 0, 99.1)
            wait()
        until game.Players.LocalPlayer.Character.Humanoid.Health == 0
end
end
end)

Twerk.Name = "Twerk"
Twerk.Parent = BypassFrame
Twerk.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
Twerk.BorderColor3 = Color3.fromRGB(206, 208, 255)
Twerk.BorderSizePixel = 2
Twerk.Position = UDim2.new(0.705002964, 0, 0.259807825, 0)
Twerk.Size = UDim2.new(0, 139, 0, 39)
Twerk.Font = Enum.Font.Gotham
Twerk.Text = "Twerk"
Twerk.TextColor3 = Color3.fromRGB(0, 0, 0)
Twerk.TextScaled = true
Twerk.TextSize = 14.000
Twerk.TextWrapped = true
Twerk.MouseButton1Down:connect(function()
repeat
AnimationId = "179224234"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1111111111111111111111)
wait(.125)
local Humanoid = game.Players.LocalPlayer.Character.Humanoid

local ActiveTracks = Humanoid:GetPlayingAnimationTracks()

for _,v in pairs(ActiveTracks)
do v:Stop()
end
wait()
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
end)

Unanimation.Name = "Unanimation"
Unanimation.Parent = BypassFrame
Unanimation.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
Unanimation.BorderColor3 = Color3.fromRGB(206, 208, 255)
Unanimation.BorderSizePixel = 2
Unanimation.Position = UDim2.new(0.705002904, 0, 0.877090812, 0)
Unanimation.Size = UDim2.new(0, 139, 0, 39)
Unanimation.Font = Enum.Font.Gotham
Unanimation.Text = "UnAnimation"
Unanimation.TextColor3 = Color3.fromRGB(0, 0, 0)
Unanimation.TextScaled = true
Unanimation.TextSize = 14.000
Unanimation.TextWrapped = true
Unanimation.MouseButton1Down:connect(function()
h = game.Players.LocalPlayer.Character.Humanoid
tracks = h:GetPlayingAnimationTracks()
for _,x in pairs(tracks)
do x:Stop()
end
end)

Yay.Name = "Yay"
Yay.Parent = BypassFrame
Yay.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
Yay.BorderColor3 = Color3.fromRGB(206, 208, 255)
Yay.BorderSizePixel = 2
Yay.Position = UDim2.new(0.705002904, 0, 0.578051448, 0)
Yay.Size = UDim2.new(0, 139, 0, 39)
Yay.Font = Enum.Font.Gotham
Yay.Text = "random dance?"
Yay.TextColor3 = Color3.fromRGB(0, 0, 0)
Yay.TextScaled = true
Yay.TextSize = 14.000
Yay.TextWrapped = true
Yay.MouseButton1Down:connect(function()
Player = "LocalPlayer"
AnimationId = "429703734"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local Anim = game.Players[Player].Character.Humanoid:LoadAnimation(Anim)
Anim:Play()
Anim:AdjustSpeed(1)
end)

Zombie.Name = "Zombie"
Zombie.Parent = BypassFrame
Zombie.BackgroundColor3 = Color3.fromRGB(156, 179, 255)
Zombie.BorderColor3 = Color3.fromRGB(206, 208, 255)
Zombie.BorderSizePixel = 2
Zombie.Position = UDim2.new(0.705002904, 0, 0.419341952, 0)
Zombie.Size = UDim2.new(0, 139, 0, 39)
Zombie.Font = Enum.Font.Gotham
Zombie.Text = "Zombie"
Zombie.TextColor3 = Color3.fromRGB(0, 0, 0)
Zombie.TextScaled = true
Zombie.TextSize = 14.000
Zombie.TextWrapped = true
Zombie.MouseButton1Down:connect(function()
AnimationId      = "183294396"
local Anim       = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k          = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(0)
k:AdjustSpeed(1)
end)

Warning.Name = "Warning"
Warning.Parent = BypassFrame
Warning.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Warning.BackgroundTransparency = 1.000
Warning.Position = UDim2.new(-0.00634586811, 0, 0.999042153, 0)
Warning.Size = UDim2.new(0, 584, 0, 16)
Warning.Font = Enum.Font.SourceSans
Warning.Text = "WARNING: SOME OF THESE SCRIPTS ARE R15 AND R6. SO IF THEY DONT WORK ITS BECAUSE YOU DONT HAVE R6 / R15  "
Warning.TextColor3 = Color3.fromRGB(0, 0, 0)
Warning.TextSize = 14.000
  end,
})



local GeneralScriptsSection = ScriptsTab:CreateSection("General Scripts")


local Button = ScriptsTab:CreateButton({
	Name = "Usercreation Chat Bypasser (Key Is ".. UsercreationKey ..")",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/1price/usercreation/refs/heads/main/UserCreation.lua", true))()
		
		
	end,
})



		
local Button = ScriptsTab:CreateButton({
	Name = "Unnamed ESP",
	Callback = function()
			  loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
             
	end,
 })

 local Button = ScriptsTab:CreateButton({
	Name = "Free Emotes Script",
	Callback = function()
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Gi7331/scripts/main/Emote.lua"))()

		Rayfield:Notify({
			Title = "Emotes Script",
			Content = "Press Comma (,) To Open The Emotes Menu",
			Duration = 6,
		})
	end,
 })

 local Button = ScriptsTab:CreateButton({
	Name = "System Broken",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()

	end,
 })






-- Define your games table

-- Method to get the current game ID
local function getCurrentGameId()
    return game.PlaceId -- Correct method to get the current game ID in Roblox
end

-- Get the current game ID
local games = {
    [155615604] = "Prison Life 🏢", -- Done
    [142823291] = "MM2 🔪", 
    [2788229376] = "Da Hood 🔫", -- Done
    [606849621] = "Jailbreak 🚔",
    [292439477] = "Phantom Forces 💥",
    [537413528] = "Build A Boat For Treasure 🚤",
    [2041312716] = "Super Golf ⛳",
    [189707] = "Natural Disaster Survival 🌪️",
    [3260590327] = "Arsenal 🔫",
    [292439477] = "Tower of Hell 🗼",
    [606849621] = "Bloxburg 🏡",
    [4616652839] = "Adopt Me! 🐶",
    [321541178] = "Anime Fighting Simulator 💪",
    [3233893879] = "Shindo Life 🍥",
    [4954755078] = "All Star Tower Defense 🌟",
    [12109643] = "Work at a Pizza Place 🍕",
    [286090429] = "Bee Swarm Simulator 🐝",
    [920587237] = "Rogue Lineage ⚔️",
    [4442272183] = "Ro Ghoul 👻",
    [13772394625] = "Blade Ball ⚔️",
    [488667523] = "Royale High 👑",
    [3306021185] = "Brookhaven 🏠",
    [552500546] = "Flee the Facility 🏃",
    [4605918737] = "King Piece 👑",
    [2046441765] = "Ninja Legends 🥷",
    [6884319169] = "Mic Up 🎙", -- Done
    [3840352284] = "Volleyball 4.2 🏐", -- Done

}

-- Function to get the current game ID
local function getCurrentGameId()
    return game.PlaceId
end

-- Get the current game ID and name
local currentGameId = getCurrentGameId()
local currentGameName = games[currentGameId]

-- Create a tab only for the current game if it is fully supported


-- Create a tab only for the current game
if currentGameName and (currentGameName:find("Fully Complete") or currentGameName:find("Mic Up 🎙") or currentGameName:find("Prison Life 🏢") or currentGameName:find("MM2 🔪") or currentGameName:find("Da Hood 🔫") or currentGameName:find("Volleyball 4.2 🏐") or currentGameName:find("Natural Disaster Survival 🌪️")) then
    local tab = Window:CreateTab(currentGameName)
    -- Add further logic for what to do in this tab here


    -- Customize the tab based on the current game
    if currentGameName == "Prison Life 🏢" then
        tab:CreateButton({
            Name = "Load Admin",
            Callback = function()
                print("Loading Prizzlife Admin...")

				local PA = loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
                PA.load()

				delay(1000)
				print("Admin loaded successfully.")
           end
        })

        tab:CreateButton({
            Name = "ESP",
            Callback = function()
                print("Loading ESP...")

				local UNESP = loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
                UNESP.load()

				delay(1000)
				print("ESP loaded successfully.")

			end
        })

		

		tab:CreateButton({
            Name = "Goto Cafe",
            Callback = function()

				local player = game.Players.LocalPlayer
local teleportPosition = Vector3.new(893.22 , 99.99, 2320.92)  -- Replace with your desired coordinates

-- Function to teleport the player
local function teleportPlayer(destination)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
    end
end

-- Teleport the player to the specified coordinates
teleportPlayer(teleportPosition)
			end
        })

		tab:CreateButton({
            Name = "Goto Roof",
            Callback = function()

				local player = game.Players.LocalPlayer
local teleportPosition = Vector3.new(832.45 , 118.99, 2359.12)  -- Replace with your desired coordinates

-- Function to teleport the player
local function teleportPlayer(destination)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
    end
end

-- Teleport the player to the specified coordinates
teleportPlayer(teleportPosition)
			end
        })

		tab:CreateButton({
            Name = "Goto Crim Base",
            Callback = function()

				local player = game.Players.LocalPlayer
local teleportPosition = Vector3.new(-890.98 , 94.13, 2056.39)  -- Replace with your desired coordinates

-- Function to teleport the player
local function teleportPlayer(destination)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
    end
end

-- Teleport the player to the specified coordinates
teleportPlayer(teleportPosition)
			end
        })

		tab:CreateButton({
            Name = "Goto Police Area",
            Callback = function()

				local player = game.Players.LocalPlayer
local teleportPosition = Vector3.new(830.32 , 99.99, 2319.11)  -- Replace with your desired coordinates

-- Function to teleport the player
local function teleportPlayer(destination)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
    end
end

-- Teleport the player to the specified coordinates
teleportPlayer(teleportPosition)
			end
        })

		tab:CreateButton({
            Name = "Goto Yard",
            Callback = function()

				local player = game.Players.LocalPlayer
local teleportPosition = Vector3.new(774.72 , 98.00, 2450.67)  -- Replace with your desired coordinates

-- Function to teleport the player
local function teleportPlayer(destination)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
    end
end

-- Teleport the player to the specified coordinates
teleportPlayer(teleportPosition)
			end
        })

		tab:CreateButton({
            Name = "Goto Cell",
            Callback = function()

				local player = game.Players.LocalPlayer
local teleportPosition = Vector3.new(916.71 , 99.99, 2431.36)  -- Replace with your desired coordinates

-- Function to teleport the player
local function teleportPlayer(destination)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
    end
end

-- Teleport the player to the specified coordinates
teleportPlayer(teleportPosition)
			end
        })

		tab:CreateButton({
            Name = "Goto Armory Police",
            Callback = function()

				local player = game.Players.LocalPlayer
local teleportPosition = Vector3.new(836.82 , 99.99, 2267.67)  -- Replace with your desired coordinates

-- Function to teleport the player
local function teleportPlayer(destination)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
    end
end

-- Teleport the player to the specified coordinates
teleportPlayer(teleportPosition)
			end
        })

		tab:CreateButton({
            Name = "Goto Armory Crim",
            Callback = function()

				local player = game.Players.LocalPlayer
local teleportPosition = Vector3.new(-945.75 , 94.13, 2056.36)  -- Replace with your desired coordinates

-- Function to teleport the player
local function teleportPlayer(destination)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
    end
end



-- Teleport the player to the specified coordinates
teleportPlayer(teleportPosition)
			end
        })

		
	elseif currentGameName == "Mic Up 🎙" then

		local function forceRejoinVoiceChat()
			local VoiceChatInternal = cloneref and cloneref(game:GetService("VoiceChatInternal")) or game:GetService("VoiceChatInternal")
			local VoiceChatService = cloneref and cloneref(game:GetService("VoiceChatService")) or game:GetService("VoiceChatService")
			
			Rayfield:Notify({
				Title = "Voice Chat Reconnection",
				Content = "Attempting to reconnect to Voice Chat...",
				Duration = 6.5,
				Image = "bell",
			})
		
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
			
			Rayfield:Notify({
				Title = "Voice Chat Reconnection",
				Content = "Reconnection attempt completed.",
				Duration = 6.5,
				Image = "bell",
			})
		end


		
		
		tab:CreateSection("Voice Chat")


		tab:CreateButton({
			Name = "Bypass Vc (Used If Voice Chat Banned)",
			Callback = function()
				forceRejoinVoiceChat()
			end
		})

		
		
		



	 tab:CreateSection("Scripts")
     
	 tab:CreateButton({
			Name = "Execute INF Yield",
			Callback = function()
				print("Executing Infinite Yield...")
				-- Execute Infinite Yield script
				loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
			end
		})

		tab:CreateButton({
			Name = "Execute System Broken",
			Callback = function()
				
				loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
			end
		})

		tab:CreateButton({
			Name = "Execute Free Emotes",
			Callback = function()
				
				loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Gi7331/scripts/main/Emote.lua"))()

				Rayfield:Notify({
					Title = "Free Emotes Script",
					Content = "Press Comma (,) To Open The Emotes Menu",
					Duration = 5,
					Image = "bell",
				 })
			end
		})


	  


		tab:CreateSection("Teleports")
		-- Define teleport locations
		local teleportLocations = {
			{name = "TP Private Room (Ontop) (Mute Before If You Want To Spy) ", position = Vector3.new(4226.12, 23.53, 59.57)},
			{name = "TP Stand 1", position = Vector3.new(150.41, 4.70, 12.35)},
			{name = "TP Stand 2", position = Vector3.new(150.66, 4.70, 42.21)},
			{name = "TP Stand 3", position = Vector3.new(151.11, 4.70, 73.42)},
			{name = "TP Stand 4", position = Vector3.new(150.06, 4.70, 105.01)},
			{name = "TP Stand 5", position = Vector3.new(149.83, 4.70, 138.27)},
			{name = "TP Soccer Area", position = Vector3.new(217.75, 4.70, 195.06)},
			{name = "TP Tall thing", position = Vector3.new(159.99, 22.70, 254.04)},
			{name = "TP On top skyscraper", position = Vector3.new(56.64, 284.11, 193.72)},
			{name = "TP On top of the top of skyscraper", position = Vector3.new(57.88, 313.01, 225.67)},
			{name = "TP Inside slide", position = Vector3.new(16.25, 284.15, 154.47)},
			{name = "TP Outside slide", position = Vector3.new(15.49, 284.22, 187.50)},
			{name = "TP On top washroom", position = Vector3.new(-92.18, 18.39, 83.66)},
			{name = "TP Washroom", position = Vector3.new(-92.06, 4.80, 88.28)},
			{name = "TP Cozy hut", position = Vector3.new(-94.63, 5.18, 125.47)},
			{name = "TP Fast food", position = Vector3.new(-92.47, 4.80, 32.59)},
			{name = "TP Circle couch", position = Vector3.new(26.57, 7.51, 85.92)},
			{name = "TP TicTac 1", position = Vector3.new(22.53, 8.97, 28.29)},
			{name = "TP Hut", position = Vector3.new(70.31, 5.33, 24.97)},
			{name = "TP Sing area 1", position = Vector3.new(27.38, 7.50, -67.36)},
			{name = "TP Item area", position = Vector3.new(-53.17, 4.70, -62.83)},
			{name = "TP Donut shop", position = Vector3.new(-109.94, 2.93, -89.13)},
			{name = "TP TicTac 2", position = Vector3.new(168.66, 8.97, -15.83)},
			{name = "TP Couch and Bed area", position = Vector3.new(217.18, 5.24, -11.31)},
			{name = "TP Private 1", position = Vector3.new(220.69, 6.94, 59.73)},
			{name = "TP Private 2", position = Vector3.new(221.10, 24.94, 59.44)},
			{name = "TP Picnic", position = Vector3.new(81.89, 4.84, -29.66)},
			{name = "TP Sing area 2", position = Vector3.new(-61.61, 9.87, 229.58)},
			{name = "TP TicTac 3", position = Vector3.new(-66.42, 8.97, 148.57)},
			{name = "TP Corner area", position = Vector3.new(-127.84, 2.70, -108.56)}
		}
	
		-- Create a button for each teleport location
		for _, location in ipairs(teleportLocations) do
			tab:CreateButton({
				Name = location.name,
				Callback = function()
					print("Teleporting to " .. location.name .. "...")
					-- Teleport the player to the specified coordinates
					local player = game.Players.LocalPlayer
					if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
						player.Character.HumanoidRootPart.CFrame = CFrame.new(location.position)
					end
				end
			})
		end

	elseif currentGameId == 189707 then

		tab:CreateSection("Scripts")

		tab:CreateButton({
			Name = "Exeucte FE Tornado Script",
			Callback = function()
				loadstring(game:HttpGet("https://pastebin.com/raw/JR7RBh2a"))()
			end
		})

		tab:CreateButton({
			Name = "Exeucte FE Gravity Inversion",
			Callback = function()
				loadstring(game:HttpGet("https://pastebin.com/raw/4jiEU7Gx"))()
			end
		})

		tab:CreateButton({
			Name = "Execute Infinite Yield",
			Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
			end
		})


	elseif currentGameName == "Da Hood 🔫" then
		   
		       

				



	            Rayfield:Notify({
				Title = "NOTE (REALLY IMPORTANT) Da Hood 🔫",
				Content = "DO NOT USE WALKSPEED & JUMPOWER & FLY IN MAIN TAB YOU WILL GET BANNED ONLY USE Da Hood 🔫 TAB",
				Duration = 8,
				Image = "bell",
				
				
			 })
			 
		
			
			 
	    tab:CreateSection("Scripts")
		
		
		
		
		tab:CreateButton({
			Name = "Execute TBO (Good now but aimlocks trash)",
			Callback = function()
				print("Executing TBO ")

				loadstring(game:HttpGet('https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript'))()
				-- Execute Infinite Yield script
			end
		})

		tab:CreateButton({
			Name = "Execute Swagmode (Good)",
			Callback = function()
				print("Executing Swagmode")

				loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002'))()
				-- Execute Infinite Yield script
			end
		})

		tab:CreateButton({
			Name = "Execute Faded (Not good right now)",
			Callback = function()
				print("Executing Faded")

				loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded/main/YesEpic", true))()
				-- Execute Infinite Yield script
			end
		})

		tab:CreateButton({
			Name = "Execute Vortex (Ok)",
			Callback = function()
				print("Executing Vortex")

				loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
				-- Execute Infinite Yield script
			end
		})

		tab:CreateButton({
			Name = "Execute Polkaya (Great in general and has good aimlock)",
			Callback = function()
				print("Executing Polkaya")

				loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md",true))()
                -- Execute Infinite Yield script
			end
		})

		tab:CreateButton({
			Name = "Unnamed ESP",
			Callback = function()
				print("Executing Unnamed ESP")

				loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
                -- Execute Infinite Yield script
			end
		})

	
		
		

		

	elseif currentGameName == "MM2 🔪" then
		tab:CreateButton({
			Name = "YARHM Hub (op)",
			Callback = function()

				loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
          end
		})

		local MurderMysteryLabel1 = tab:CreateLabel("Theres Only A Little Bit But More Soon!", "info")

	elseif currentGameName == "Volleyball 4.2 🏐" then
		
		local Section = tab:CreateSection("Main")
		
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local ServerRegion = ReplicatedStorage:WaitForChild("ServerRegion")


        local ServerLocationLabel = tab:CreateLabel("Server Location: " .. tostring(ServerRegion.Value))


        ServerRegion:GetPropertyChangedSignal("Value"):Connect(function()
        ServerLocationLabel:SetText("Server Location: " .. tostring(ServerRegion.Value))
        end)

		

		    
		 
	end
end

local MiscTab = Window:CreateTab("Misc", "settings") -- Title, Image


local Lighting = game:GetService("Lighting")
local OldAmbient = Lighting.Ambient
local OldBrightness = Lighting.Brightness
local OldClockTime = Lighting.ClockTime
local OldFogEnd = Lighting.FogEnd
local OldGlobalShadows = Lighting.GlobalShadows
local OldOutdoorAmbient = Lighting.OutdoorAmbient

local function doFullbright()
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    
    -- Remove all other lighting effects
    for i, v in pairs(Lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end
end

local function undoFullbright()
    Lighting.Ambient = OldAmbient
    Lighting.Brightness = OldBrightness
    Lighting.ClockTime = OldClockTime
    Lighting.FogEnd = OldFogEnd
    Lighting.GlobalShadows = OldGlobalShadows
    Lighting.OutdoorAmbient = OldOutdoorAmbient
    
    -- Re-enable other lighting effects
    for i, v in pairs(Lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = true
        end
    end
end
local Section = MiscTab:CreateSection("World")
local FullbrightToggle = MiscTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullbrightToggle",
    Callback = function(Value)
        if Value then
            doFullbright()
           
        else
            undoFullbright()
           
        end
    end,
})



-- Connect to the Lighting's Changed event to maintain Fullbright if it's enabled
Lighting.Changed:Connect(function()
    if FullbrightToggle.CurrentValue then
        doFullbright()
    end
end)

local TimeSlider = MiscTab:CreateSlider({
    Name = "Time of Day",
    Range = {0, 24}, -- Range from 0 to 24 hours
    Increment = 0.1, -- Increment by 0.1 hours
    Suffix = " hours",
    CurrentValue = game.Lighting.ClockTime, -- Set current value to the current time
    Flag = "TimeSlider", -- Unique flag for saving
    Callback = function(Value)
        game.Lighting.ClockTime = Value -- Update the ClockTime based on slider value
    end,
})

local GravitySlider = MiscTab:CreateSlider({
    Name = "Gravity",
    Range = {1, 500}, -- Adjust as needed for minimum and maximum gravity
    Increment = 1,
    Suffix = "Gravity",
    CurrentValue = 196.2,
    Flag = "GravitySlider", -- Unique identifier for saving configuration
    Callback = function(Value)
        workspace.Gravity = Value
    end,
})

local ResetButton = MiscTab:CreateButton({
    Name = "Reset Gravity",
    Callback = function()
		GravitySlider:Set(196.2) -- The new slider integer value
    end,
})



-- Update the slider when the game's time changes
game.Lighting:GetPropertyChangedSignal("ClockTime"):Connect(function()
    TimeSlider:Set(game.Lighting.ClockTime) -- Update slider to reflect the current game time
end)

local FPSBoostButton = MiscTab:CreateButton({
    Name = "FPS Boost",
    Callback = function()
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

        -- Notify the user that FPS Boost has been applied
        Rayfield:Notify({
            Title = "FPS Boost",
            Content = "FPS Boost has been applied.",
            Duration = 3,
        })
    end,
})




local ExtendBaseplateButton = MiscTab:CreateButton({
	Name = "Extend Baseplate (Float)",
	Callback = function()
		local Workspace = game:GetService("Workspace");
local Players = game:GetService("Players");
local Player = Players.LocalPlayer
local Terrain = Workspace.Terrain

Terrain:FillBlock(CFrame.new(66, -10, 72.5), Vector3.new(10000, 16, 10000), Enum.Material.Asphalt)

	end,
 })




local Section = MiscTab:CreateSection("Others")

StatsButton = MiscTab:CreateButton({
    Name = "Bypass VC",
    Callback = function()
             VoiceChatInternal = cloneref and cloneref(game:GetService("VoiceChatInternal")) or game:GetService("VoiceChatInternal")
			 VoiceChatService = cloneref and cloneref(game:GetService("VoiceChatService")) or game:GetService("VoiceChatService")
			
			Rayfield:Notify({
				Title = "Voice Chat Reconnection",
				Content = "Attempting to reconnect to Voice Chat...",
				Duration = 6.5,
				Image = "bell",
			})
		
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
    end,
})

-- Function to check and modify blur
local function checkBlur()
    local lighting = game:GetService("Lighting")
    local blur = lighting:FindFirstChild("Blur")
    
    if blur and blur.Size == 25 then
        blur.Size = 0
    end
end

StatsButton = MiscTab:CreateButton({
    Name = "Show Stats",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/ZKw8UCT5",true))()
    end,
})


local Button = MiscTab:CreateButton({
	Name = "Destroy Blur",
	Callback = function()
		checkBlur()
	end,
})






local Button = MiscTab:CreateButton({
	Name = "Destroy Universal Hub",
	Callback = function()
		Rayfield:Destroy()
	end,
})


local Button = MiscTab:CreateButton({
	Name = "Re-Execute",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Angxers2/Unihub/main/Unihub%20" .. Version .. ".lua", true))()

	end,
 })

 -- Server Hop Button

ServerHopButton = MiscTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        Rayfield:Notify({
            Title = "Server Hop",
            Content = "Finding Server...",
            Duration = 3,
        })

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

                local storedServerID = randomServerID

                Rayfield:Notify({
                    Title = "Server Found",
                    Content = "Hopping to ".. storedServerID,
                    Duration = 3
                })

                game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, randomServerID, game.Players.LocalPlayer)
            else
                Rayfield:Notify({
                    Title = "Server Hop",
                    Content = "No available servers found. Please try again.",
                    Duration = 3
                })
            end
        end

        TPReturner()
    end,
})

local RejoinButton = MiscTab:CreateButton({
    Name = "Rejoin Game",
    Callback = function()
        Rayfield:Notify({
            Title = "Rejoin",
            Content = "Rejoining the game...",
            Duration = 3,
        })
        
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        
        ts:Teleport(game.PlaceId, p)
    end,
})


-- FPS Boost Button
-- FPS Boost Button




local AntiAFKButton = MiscTab:CreateButton({
    Name = "Anti AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        
        Rayfield:Notify({
            Title = "Anti AFK",
            Content = "Anti AFK has been activated.",
            Duration = 3,
        })
    end,
})

local DestroyAllGuiButton = MiscTab:CreateButton({
    Name = "Destroy All Gui's ",
    Callback = function()
        -- Function to destroy all GUIs in the Player's GUI
        local function destroyAllGUIs()
            local player = game.Players.LocalPlayer
            local playerGui = player:WaitForChild("PlayerGui")

            -- Iterate through all the descendants of the PlayerGui and destroy GUI objects
            for _, gui in pairs(playerGui:GetDescendants()) do
                if gui:IsA("GuiObject") then
                    gui:Destroy()
                end
            end
        end

        -- Call the function to destroy all GUIs
        destroyAllGUIs()
    end,
})


local DisableStatsButton = MiscTab:CreateButton({
    Name = "Optimize (use this if your game/unihub is running slow)",
    Callback = function()
        -- Change all stats labels to "N/A"
        if TimeInGameLabel then TimeInGameLabel:Set("Turned Off") end
        if SystemTimeLabel then SystemTimeLabel:Set("Turned Off") end
        if FPSLabel then FPSLabel:Set("Turned Off") end
        if PingLabel then PingLabel:Set("Turned Off") end
        if PlayerCountLabel then PlayerCountLabel:Set("Turned Off") end
        if MemoryLabel then MemoryLabel:Set("Turned Off") end
        if GarbageCollectionLabel then GarbageCollectionLabel:Set("Turned Off") end
        if RenderTimeLabel then RenderTimeLabel:Set("Turned Off") end

        -- Disable the update loops by setting a global flag
        _G.DisableStats = true

		

        -- Display Rayfield notification
        Rayfield:Notify({
            Title = "Notification",
            Content = "All Statistics Disabled",
            Duration = 5 -- Duration in seconds
        })
    end
})

ServerHopSection = MiscTab:CreateSection("Server Hop (Advanced)")

-- ═══════════════════════════════════════════════════════════════
--                    ADVANCED SERVER HOP SYSTEM
-- ═══════════════════════════════════════════════════════════════

-- ═══════════════════════════════════════════════════════════════
--                        GLOBAL VARIABLES
-- ═══════════════════════════════════════════════════════════════
serverHopMode = "Random"
minPlayers = 1
maxPlayers = game.Players.MaxPlayers or 100 -- Dynamic based on current game
excludeCurrentServer = true
hopAttempts = 0
isCustomMode = false -- Track if user has customized settings

-- ═══════════════════════════════════════════════════════════════
--                         CORE FUNCTIONS  
-- ═══════════════════════════════════════════════════════════════

-- Helper function to apply preset values based on mode
function applyPresetValues(mode)
    if mode == "Random" then
        minPlayers = 1
        maxPlayers = game.Players.MaxPlayers or 100
        excludeCurrentServer = true
    elseif mode == "Smallest" then
        minPlayers = 1
        maxPlayers = math.floor((game.Players.MaxPlayers or 100) * 0.3) -- 30% of max
        excludeCurrentServer = true
    elseif mode == "Largest" then
        minPlayers = math.floor((game.Players.MaxPlayers or 100) * 0.7) -- 70% of max
        maxPlayers = game.Players.MaxPlayers or 100
        excludeCurrentServer = true
    elseif mode == "Medium" then
        minPlayers = math.floor((game.Players.MaxPlayers or 100) * 0.3) -- 30% of max
        maxPlayers = math.floor((game.Players.MaxPlayers or 100) * 0.7) -- 70% of max
        excludeCurrentServer = true
    elseif mode == "Low Ping" then
        minPlayers = 5 -- Avoid empty servers for better ping data
        maxPlayers = game.Players.MaxPlayers or 100
        excludeCurrentServer = true
    end
    
    -- Update slider values if they exist
    if MinPlayersSlider then
        MinPlayersSlider:Set(minPlayers)
    end
    if MaxPlayersSlider then
        MaxPlayersSlider:Set(maxPlayers)
    end
    if ExcludeCurrentToggle then
        ExcludeCurrentToggle:Set(excludeCurrentServer)
    end
    
    isCustomMode = false
end

function getServerList()
    PlaceId = game.PlaceId
    currentJobId = game.JobId
    allServers = {}
    cursor = ""
    
    -- Collect servers from multiple pages
    for page = 1, 3 do -- Get up to 3 pages (300 servers)
        url = 'https://games.roblox.com/v1/games/' .. PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'
        if cursor ~= "" then
            url = url .. '&cursor=' .. cursor
        end
        
        success, site = pcall(function()
            return game.HttpService:JSONDecode(game:HttpGet(url))
        end)
        
        if not success then
            break
        end
        
        for _, server in pairs(site.data) do
            -- Filter servers based on criteria
            hasAvailableSpots = tonumber(server.maxPlayers) > tonumber(server.playing)
            meetsMinPlayers = tonumber(server.playing) >= minPlayers
            meetsMaxPlayers = tonumber(server.playing) <= maxPlayers
            notCurrentServer = not excludeCurrentServer or server.id ~= currentJobId
            
            if hasAvailableSpots and meetsMinPlayers and meetsMaxPlayers and notCurrentServer then
                table.insert(allServers, {
                    id = server.id,
                    playing = tonumber(server.playing),
                    maxPlayers = tonumber(server.maxPlayers),
                    ping = server.ping or 0
                })
            end
        end
        
        if site.nextPageCursor then
            cursor = site.nextPageCursor
        else
            break
        end
    end
    
    return allServers
end

function selectServerByMode(servers)
    if #servers == 0 then
        return nil
    end
    
    if serverHopMode == "Random" then
        return servers[math.random(1, #servers)]
        
    elseif serverHopMode == "Smallest" then
        table.sort(servers, function(a, b) return a.playing < b.playing end)
        return servers[1]
        
    elseif serverHopMode == "Largest" then
        table.sort(servers, function(a, b) return a.playing > b.playing end)
        return servers[1]
        
    elseif serverHopMode == "Medium" then
        table.sort(servers, function(a, b) return a.playing < b.playing end)
        midIndex = math.ceil(#servers / 2)
        return servers[midIndex]
        
    elseif serverHopMode == "Low Ping" then
        table.sort(servers, function(a, b) return a.ping < b.ping end)
        return servers[1]
    end
    
    return servers[1] -- Fallback
end

-- Create dropdown for server hop mode
ServerHopModeDropdown = MiscTab:CreateDropdown({
    Name = "Server Hop Mode",
    Options = {"Random", "Smallest", "Largest", "Medium", "Low Ping", "Custom"},
    CurrentOption = {"Random"},
    Flag = "ServerHopMode",
    Callback = function(Value)
        selectedMode = Value[1] or Value -- Handle both table and string formats
        
        if selectedMode ~= "Custom" then
            serverHopMode = selectedMode
            applyPresetValues(selectedMode)
            Rayfield:Notify({
                Title = "Preset Applied",
                Content = "Applied " .. tostring(selectedMode) .. " preset settings",
                Duration = 2,
                Image = "bell"
            })
        else
            serverHopMode = "Custom"
            isCustomMode = true
            Rayfield:Notify({
                Title = "Custom Mode",
                Content = "Using your custom slider settings",
                Duration = 2,
                Image = "bell"
            })
        end
    end,
})

-- Create slider for minimum players
MinPlayersSlider = MiscTab:CreateSlider({
    Name = "Minimum Players",
    Range = {0, game.Players.MaxPlayers or 100},
    Increment = 1,
    Suffix = " players",
    CurrentValue = 1,
    Flag = "MinPlayers",
    Callback = function(Value)
        minPlayers = Value
        -- If user manually changes slider and it's not custom mode, switch to custom
        if not isCustomMode and serverHopMode ~= "Custom" then
            serverHopMode = "Custom"
            isCustomMode = true
            ServerHopModeDropdown:Set({"Custom"})
            Rayfield:Notify({
                Title = "Switched to Custom",
                Content = "Mode changed to Custom due to manual adjustment",
                Duration = 2,
                Image = "bell"
            })
        end
    end,
})

-- Create slider for maximum players  
MaxPlayersSlider = MiscTab:CreateSlider({
    Name = "Maximum Players",
    Range = {1, game.Players.MaxPlayers or 100},
    Increment = 1,
    Suffix = " players", 
    CurrentValue = game.Players.MaxPlayers or 100,
    Flag = "MaxPlayers",
    Callback = function(Value)
        maxPlayers = Value
        -- If user manually changes slider and it's not custom mode, switch to custom
        if not isCustomMode and serverHopMode ~= "Custom" then
            serverHopMode = "Custom"
            isCustomMode = true
            ServerHopModeDropdown:Set({"Custom"})
            Rayfield:Notify({
                Title = "Switched to Custom",
                Content = "Mode changed to Custom due to manual adjustment",
                Duration = 2,
            })
        end
    end,
})

-- Toggle to exclude current server
ExcludeCurrentToggle = MiscTab:CreateToggle({
    Name = "Exclude Current Server",
    CurrentValue = true,
    Flag = "ExcludeCurrentServer",
    Callback = function(Value)
        excludeCurrentServer = Value
        -- If user manually changes toggle and it's not custom mode, switch to custom
        if not isCustomMode and serverHopMode ~= "Custom" then
            serverHopMode = "Custom"
            isCustomMode = true
            ServerHopModeDropdown:Set({"Custom"})
            Rayfield:Notify({
                Title = "Switched to Custom",
                Content = "Mode changed to Custom due to manual adjustment",
                Duration = 2,
            })
        end
    end,
})

-- Enhanced Server Hop Button
ServerHopButton = MiscTab:CreateButton({
    Name = "Server Hop (Custom Settings)",
    Callback = function()
        hopAttempts = hopAttempts + 1
        
        Rayfield:Notify({
            Title = "Server Hop",
            Content = "Finding servers... (Attempt " .. hopAttempts .. ")",
            Duration = 3,
            Image = "bell"
        })
        
        servers = getServerList()
        
        if #servers == 0 then
            Rayfield:Notify({
                Title = "Server Hop Failed",
                Content = "No servers match your criteria. Try adjusting settings.",
                Duration = 4,
                Image = "bell"
            })
            return
        end
        
        selectedServer = selectServerByMode(servers)
        
        if selectedServer then
            modeText = tostring(serverHopMode)
            if serverHopMode == "Smallest" or serverHopMode == "Largest" or serverHopMode == "Medium" then
                modeText = modeText .. " (" .. selectedServer.playing .. "/" .. selectedServer.maxPlayers .. ")"
            end
            
            Rayfield:Notify({
                Title = "Server Found (" .. modeText .. ")",
                Content = "Hopping to server...",
                Duration = 2,
                Image = "bell"
            })
            
            wait(1)
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, selectedServer.id, game.Players.LocalPlayer)
        else
            Rayfield:Notify({
                Title = "Server Hop Failed",
                Content = "Could not find suitable server.",
                Duration = 3,
                Image = "bell"
            })
        end
    end,
})

ServerHopSection = MiscTab:CreateSection("Server Hop (Others)")

-- Quick hop buttons for common scenarios
QuickHopSmallest = MiscTab:CreateButton({
    Name = "Quick Hop - Smallest Server",
    Callback = function()
        originalMode = serverHopMode
        serverHopMode = "Smallest"
        
        servers = getServerList()
        selectedServer = selectServerByMode(servers)
        
        if selectedServer then
            Rayfield:Notify({
                Title = "Quick Hop - Smallest",
                Content = "Found server with " .. selectedServer.playing .. " players",
                Duration = 2,
                Image = "bell"
            })
            wait(1)
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, selectedServer.id, game.Players.LocalPlayer)
        else
            Rayfield:Notify({
                Title = "Quick Hop Failed",
                Content = "No small servers available",
                Duration = 3,
                Image = "bell"
            })
        end
        
        serverHopMode = originalMode
    end,
})

QuickHopLargest = MiscTab:CreateButton({
    Name = "Quick Hop - Largest Server", 
    Callback = function()
        originalMode = serverHopMode
        serverHopMode = "Largest"
        
        servers = getServerList()
        selectedServer = selectServerByMode(servers)
        
        if selectedServer then
            Rayfield:Notify({
                Title = "Quick Hop - Largest",
                Content = "Found server with " .. selectedServer.playing .. " players",
                Duration = 2,
                Image = "bell"
            })
            wait(1)
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, selectedServer.id, game.Players.LocalPlayer)
        else
            Rayfield:Notify({
                Title = "Quick Hop Failed", 
                Content = "No large servers available",
                Duration = 3,
                Image = "bell"
            })
        end
        
        serverHopMode = originalMode
    end,
})

-- Reset hop attempts counter
ResetCounterButton = MiscTab:CreateButton({
    Name = "Reset Hop Counter",
    Callback = function()
        hopAttempts = 0
        Rayfield:Notify({
            Title = "Counter Reset",
            Content = "Hop attempts counter reset to 0",
            Duration = 2,
            Image = "bell"
        })
    end,
})

ServerHopSection = MiscTab:CreateSection("Server Info")

-- Server info label that updates automatically
-- Create the labels
PlayersLabel = MiscTab:CreateLabel("Players: Loading...")
JobIdLabel = MiscTab:CreateLabel("Server ID: Loading...")
UptimeLabel = MiscTab:CreateLabel("Uptime: Loading...")

-- Track server start time (global)
ServerStartTime = os.time()

-- Function to calculate server uptime
function getServerRuntime()
    diff = os.time() - ServerStartTime
    hours = math.floor(diff / 3600)
    minutes = math.floor((diff % 3600) / 60)
    seconds = diff % 60
    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

-- Function to update all labels
function updateServerInfo()
    Players = #game.Players:GetPlayers()
    MaxPlayers = game.Players.MaxPlayers
    JobId = game.JobId

    PlayersLabel:Set("Players: " .. Players .. "/" .. MaxPlayers, "server")
    JobIdLabel:Set("Server ID: " .. JobId, "server")
    UptimeLabel:Set("Uptime: " .. getServerRuntime(), "server")
end

-- Initial update
updateServerInfo()

-- Update every 5 seconds
spawn(function()
    while wait(5) do
        updateServerInfo()
    end
end)


-- Copy server ID button
CopyServerIdButton = MiscTab:CreateButton({
    Name = "Copy Server ID",
    Callback = function()
        jobId = game.JobId
        setclipboard(jobId)
        Rayfield:Notify({
            Title = "Server ID Copied",
            Content = "Copied: " .. string.sub(jobId, 1, 12) .. "...",
            Duration = 2,
            Image = "bell"
        })
    end,
})

-- Copy server link button
CopyServerLinkButton = MiscTab:CreateButton({
    Name = "Copy Server Link",
    Callback = function()
        placeId = game.PlaceId
        jobId = game.JobId
        serverLink = "https://www.roblox.com/games/" .. placeId .. "?privateServerLinkCode=" .. jobId
        setclipboard(serverLink)
        Rayfield:Notify({
            Title = "Server Link Copied",
            Content = "Server link copied to clipboard",
            Duration = 2,
            Image = "bell"
        })
    end,
})






 




local ESPTab = Window:CreateTab("ESP", "eye")
local Section = ESPTab:CreateSection("Main")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local highlightOutlineColor = Color3.fromRGB(255, 0, 0) -- Default outline color
local highlightFillColor = Color3.new(1, 1, 1) -- Default fill color (white)
local highlightOutlineOpacity = 1 -- Default outline opacity (1 = fully opaque)
local highlightFillOpacity = 1 -- Default fill opacity (1 = fully opaque)
local existingHighlights = {} -- Table to keep track of highlights
local isHighlightingEnabled = false -- Initial toggle state

-- Function to highlight a player's character
local function highlightCharacter(character)
    if character and not existingHighlights[character] then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = character
        highlight.FillColor = highlightFillColor
        highlight.OutlineColor = highlightOutlineColor
        highlight.OutlineTransparency = 1 - highlightOutlineOpacity
        highlight.FillTransparency = 1 - highlightFillOpacity
        highlight.Parent = character
        
        -- Store the highlight in the table
        existingHighlights[character] = highlight
    else
        -- If the character already has a highlight, update the colors and properties
        if existingHighlights[character] then
            existingHighlights[character].OutlineColor = highlightOutlineColor
            existingHighlights[character].FillColor = highlightFillColor
            existingHighlights[character].OutlineTransparency = 1 - highlightOutlineOpacity
            existingHighlights[character].FillTransparency = 1 - highlightFillOpacity
        end
    end
end

-- Function to remove highlights from a player's character
local function removeHighlight(character)
    if existingHighlights[character] then
        existingHighlights[character]:Destroy()
        existingHighlights[character] = nil
    end
end

-- Toggle function
local function toggleChams(value)
    isHighlightingEnabled = value

    if isHighlightingEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                highlightCharacter(player.Character) -- Highlight existing players when enabling
            end
        end
    else
        -- Remove highlights for all players when disabling
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                removeHighlight(player.Character)
            end
        end
    end
end

-- Connect to PlayerAdded and CharacterAdded events
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if isHighlightingEnabled then
            highlightCharacter(character) -- Highlight new player's character
        end
    end)
end)

-- ESP Script Integration for Existing Rayfield ESPTab (No Local Variables)

_G.Players = game:GetService("Players")
_G.RunService = game:GetService("RunService")
_G.UserInputService = game:GetService("UserInputService")
_G.TweenService = game:GetService("TweenService")
_G.CoreGui = game:GetService("CoreGui")

_G.LocalPlayer = _G.Players.LocalPlayer
_G.Camera = workspace.CurrentCamera

-- Configuration
_G.ESPConfig = {
    ESP = {
        Enabled = true,
        ShowBoxes = false,
        ShowTracers = false,
        ShowNames = false,
        ShowHealth = false,
        ShowDistance = false,
        ShowSkeleton = false,
        TeamCheck = false,
        MaxDistance = 1000,
        RefreshRate = 0.1
    },
    Colors = {
        Enemy = Color3.fromRGB(255, 100, 100),
        Team = Color3.fromRGB(100, 255, 100),
        Box = Color3.fromRGB(255, 255, 255),
        Tracer = Color3.fromRGB(0, 255, 255),
        Text = Color3.fromRGB(255, 255, 255),
        Health = Color3.fromRGB(0, 255, 0),
        HealthLow = Color3.fromRGB(255, 0, 0),
        Skeleton = Color3.fromRGB(255, 255, 255),
        Distance = Color3.fromRGB(255, 255, 255)
    }
}

-- Storage for ESP objects
_G.ESPObjects = {}
_G.ESPConnections = {}

-- Utility Functions
function CreateDrawing(Type, Properties)
    _G.TempDrawing = Drawing.new(Type)
    for property, value in pairs(Properties or {}) do
        _G.TempDrawing[property] = value
    end
    return _G.TempDrawing
end

function GetPlayerColor(player)
    if _G.ESPConfig.ESP.TeamCheck and player.Team == _G.LocalPlayer.Team then
        return _G.ESPConfig.Colors.Team
    else
        return _G.ESPConfig.Colors.Enemy
    end
end

function WorldToScreen(position)
    _G.TempVector, _G.TempOnScreen = _G.Camera:WorldToViewportPoint(position)
    return Vector2.new(_G.TempVector.X, _G.TempVector.Y), _G.TempOnScreen
end

function GetCharacterParts(character)
    _G.TempParts = {}
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            _G.TempParts[part.Name] = part
        end
    end
    return _G.TempParts
end

-- ESP Object Class
_G.ESPObject = {}
_G.ESPObject.__index = _G.ESPObject

function _G.ESPObject.new(player)
    _G.TempSelf = setmetatable({}, _G.ESPObject)
    _G.TempSelf.Player = player
    _G.TempSelf.Drawings = {}
    
    -- Create drawing objects
    _G.TempSelf.Drawings.Box = CreateDrawing("Square", {
        Thickness = 2,
        Filled = false,
        Transparency = 1,
        Color = _G.ESPConfig.Colors.Box
    })
    
    _G.TempSelf.Drawings.Tracer = CreateDrawing("Line", {
        Thickness = 2,
        Transparency = 1,
        Color = _G.ESPConfig.Colors.Tracer
    })
    
    _G.TempSelf.Drawings.Name = CreateDrawing("Text", {
        Size = 16,
        Center = true,
        Outline = true,
        Font = 2,
        Color = _G.ESPConfig.Colors.Text
    })
    
    _G.TempSelf.Drawings.Health = CreateDrawing("Text", {
        Size = 14,
        Center = true,
        Outline = true,
        Font = 2,
        Color = _G.ESPConfig.Colors.Health
    })
    
    _G.TempSelf.Drawings.Distance = CreateDrawing("Text", {
        Size = 14,
        Center = true,
        Outline = true,
        Font = 2,
        Color = _G.ESPConfig.Colors.Distance
    })
    
    -- Skeleton parts
    _G.TempSelf.Drawings.Skeleton = {}
    _G.TempSkeletonParts = {
        "Head_UpperTorso", "UpperTorso_LowerTorso",
        "UpperTorso_LeftUpperArm", "LeftUpperArm_LeftLowerArm", "LeftLowerArm_LeftHand",
        "UpperTorso_RightUpperArm", "RightUpperArm_RightLowerArm", "RightLowerArm_RightHand",
        "LowerTorso_LeftUpperLeg", "LeftUpperLeg_LeftLowerLeg", "LeftLowerLeg_LeftFoot",
        "LowerTorso_RightUpperLeg", "RightUpperLeg_RightLowerLeg", "RightLowerLeg_RightFoot",
        "Head_Torso", "Torso_LeftArm", "Torso_RightArm",
        "Torso_LeftLeg", "Torso_RightLeg"
    }
    
    for _, partName in pairs(_G.TempSkeletonParts) do
        _G.TempSelf.Drawings.Skeleton[partName] = CreateDrawing("Line", {
            Thickness = 2,
            Transparency = 1,
            Color = _G.ESPConfig.Colors.Skeleton
        })
    end
    
    return _G.TempSelf
end

function _G.ESPObject:Update()
    if not self.Player.Character or not self.Player.Character:FindFirstChild("HumanoidRootPart") then
        self:SetVisible(false)
        return
    end
    
    _G.TempCharacter = self.Player.Character
    _G.TempHumanoid = _G.TempCharacter:FindFirstChild("Humanoid")
    _G.TempRootPart = _G.TempCharacter.HumanoidRootPart
    
    if not _G.TempHumanoid or not _G.TempRootPart then
        self:SetVisible(false)
        return
    end
    
    -- Distance check
    _G.TempDistance = (_G.LocalPlayer.Character.HumanoidRootPart.Position - _G.TempRootPart.Position).Magnitude
    if _G.TempDistance > _G.ESPConfig.ESP.MaxDistance then
        self:SetVisible(false)
        return
    end
    
    -- Get screen positions
    _G.TempRootPos, _G.TempOnScreen = WorldToScreen(_G.TempRootPart.Position)
    if not _G.TempOnScreen then
        self:SetVisible(false)
        return
    end
    
    _G.TempHeadPos = WorldToScreen(_G.TempRootPart.Position + Vector3.new(0, 2.5, 0))
    _G.TempLegPos = WorldToScreen(_G.TempRootPart.Position - Vector3.new(0, 2.5, 0))
    
    -- Calculate box dimensions
    _G.TempBoxHeight = math.abs(_G.TempHeadPos.Y - _G.TempLegPos.Y)
    _G.TempBoxWidth = _G.TempBoxHeight * 0.6
    
    -- Update box
    if _G.ESPConfig.ESP.ShowBoxes then
        self.Drawings.Box.Size = Vector2.new(_G.TempBoxWidth, _G.TempBoxHeight)
        self.Drawings.Box.Position = Vector2.new(_G.TempRootPos.X - _G.TempBoxWidth/2, _G.TempHeadPos.Y)
        self.Drawings.Box.Color = _G.ESPConfig.Colors.Box
        self.Drawings.Box.Visible = true
    else
        self.Drawings.Box.Visible = false
    end
    
    -- Update tracer
    if _G.ESPConfig.ESP.ShowTracers then
        self.Drawings.Tracer.From = Vector2.new(_G.Camera.ViewportSize.X/2, _G.Camera.ViewportSize.Y)
        self.Drawings.Tracer.To = Vector2.new(_G.TempRootPos.X, _G.TempLegPos.Y)
        self.Drawings.Tracer.Color = _G.ESPConfig.Colors.Tracer
        self.Drawings.Tracer.Visible = true
    else
        self.Drawings.Tracer.Visible = false
    end
    
    -- Update name
    if _G.ESPConfig.ESP.ShowNames then
        self.Drawings.Name.Text = self.Player.DisplayName
        self.Drawings.Name.Position = Vector2.new(_G.TempRootPos.X, _G.TempHeadPos.Y - 20)
        self.Drawings.Name.Color = _G.ESPConfig.Colors.Text
        self.Drawings.Name.Visible = true
    else
        self.Drawings.Name.Visible = false
    end
    
    -- Update health
    if _G.ESPConfig.ESP.ShowHealth and _G.TempHumanoid then
        _G.TempHealthPercent = math.floor((_G.TempHumanoid.Health / _G.TempHumanoid.MaxHealth) * 100)
        self.Drawings.Health.Text = _G.TempHealthPercent .. "%"
        self.Drawings.Health.Position = Vector2.new(_G.TempRootPos.X, _G.TempHeadPos.Y - 35)
        
        -- Health color based on percentage
        if _G.TempHealthPercent > 75 then
            self.Drawings.Health.Color = _G.ESPConfig.Colors.Health
        elseif _G.TempHealthPercent > 25 then
            self.Drawings.Health.Color = Color3.fromRGB(255, 255, 0)
        else
            self.Drawings.Health.Color = _G.ESPConfig.Colors.HealthLow
        end
        
        self.Drawings.Health.Visible = true
    else
        self.Drawings.Health.Visible = false
    end
    
    -- Update distance
  -- Update distance
if _G.ESPConfig.ESP.ShowDistance then
    local distanceInMeters = _G.TempDistance * 0.28 -- Convert studs to meters
    self.Drawings.Distance.Text = math.floor(distanceInMeters) .. "m"
    self.Drawings.Distance.Position = Vector2.new(_G.TempRootPos.X, _G.TempLegPos.Y + 5)
    self.Drawings.Distance.Color = _G.ESPConfig.Colors.Distance
    self.Drawings.Distance.Visible = true
elseif _G.ESPConfig.ESP.ShowDistanceStuds then
    self.Drawings.Distance.Text = math.floor(_G.TempDistance) .. " studs"
    self.Drawings.Distance.Position = Vector2.new(_G.TempRootPos.X, _G.TempLegPos.Y + 5)
    self.Drawings.Distance.Color = _G.ESPConfig.Colors.Distance
    self.Drawings.Distance.Visible = true
else
    self.Drawings.Distance.Visible = false
end


    
    -- Update skeleton
    if _G.ESPConfig.ESP.ShowSkeleton then
        _G.TempParts = GetCharacterParts(_G.TempCharacter)
        _G.TempSkeletonConnections = {}
        
        -- Check if R15 or R6
        if _G.TempParts.UpperTorso then
            _G.TempSkeletonConnections = {
                Head_UpperTorso = {_G.TempParts.Head, _G.TempParts.UpperTorso},
                UpperTorso_LowerTorso = {_G.TempParts.UpperTorso, _G.TempParts.LowerTorso},
                UpperTorso_LeftUpperArm = {_G.TempParts.UpperTorso, _G.TempParts.LeftUpperArm},
                LeftUpperArm_LeftLowerArm = {_G.TempParts.LeftUpperArm, _G.TempParts.LeftLowerArm},
                LeftLowerArm_LeftHand = {_G.TempParts.LeftLowerArm, _G.TempParts.LeftHand},
                UpperTorso_RightUpperArm = {_G.TempParts.UpperTorso, _G.TempParts.RightUpperArm},
                RightUpperArm_RightLowerArm = {_G.TempParts.RightUpperArm, _G.TempParts.RightLowerArm},
                RightLowerArm_RightHand = {_G.TempParts.RightLowerArm, _G.TempParts.RightHand},
                LowerTorso_LeftUpperLeg = {_G.TempParts.LowerTorso, _G.TempParts.LeftUpperLeg},
                LeftUpperLeg_LeftLowerLeg = {_G.TempParts.LeftUpperLeg, _G.TempParts.LeftLowerLeg},
                LeftLowerLeg_LeftFoot = {_G.TempParts.LeftLowerLeg, _G.TempParts.LeftFoot},
                LowerTorso_RightUpperLeg = {_G.TempParts.LowerTorso, _G.TempParts.RightUpperLeg},
                RightUpperLeg_RightLowerLeg = {_G.TempParts.RightUpperLeg, _G.TempParts.RightLowerLeg},
                RightLowerLeg_RightFoot = {_G.TempParts.RightLowerLeg, _G.TempParts.RightFoot}
            }
        elseif _G.TempParts.Torso then
            _G.TempSkeletonConnections = {
                Head_Torso = {_G.TempParts.Head, _G.TempParts.Torso},
                Torso_LeftArm = {_G.TempParts.Torso, _G.TempParts["Left Arm"]},
                Torso_RightArm = {_G.TempParts.Torso, _G.TempParts["Right Arm"]},
                Torso_LeftLeg = {_G.TempParts.Torso, _G.TempParts["Left Leg"]},
                Torso_RightLeg = {_G.TempParts.Torso, _G.TempParts["Right Leg"]}
            }
        end
        
        -- Clear all skeleton lines first
        for _, line in pairs(self.Drawings.Skeleton) do
            line.Visible = false
        end
        
        -- Draw active connections
        for connectionName, connection in pairs(_G.TempSkeletonConnections) do
            _G.TempPart1, _G.TempPart2 = connection[1], connection[2]
            if _G.TempPart1 and _G.TempPart2 and self.Drawings.Skeleton[connectionName] then
                _G.TempPos1, _G.TempOnScreen1 = WorldToScreen(_G.TempPart1.Position)
                _G.TempPos2, _G.TempOnScreen2 = WorldToScreen(_G.TempPart2.Position)
                
                if _G.TempOnScreen1 and _G.TempOnScreen2 then
                    self.Drawings.Skeleton[connectionName].From = _G.TempPos1
                    self.Drawings.Skeleton[connectionName].To = _G.TempPos2
                    self.Drawings.Skeleton[connectionName].Color = _G.ESPConfig.Colors.Skeleton
                    self.Drawings.Skeleton[connectionName].Visible = true
                end
            end
        end
    else
        for _, line in pairs(self.Drawings.Skeleton) do
            line.Visible = false
        end
    end
end

function _G.ESPObject:SetVisible(visible)
    for drawingType, drawing in pairs(self.Drawings) do
        if drawingType == "Skeleton" then
            for _, line in pairs(drawing) do
                line.Visible = visible
            end
        else
            drawing.Visible = visible
        end
    end
end

function _G.ESPObject:ClearAll()
    for drawingType, drawing in pairs(self.Drawings) do
        if drawingType == "Skeleton" then
            for _, line in pairs(drawing) do
                line.Visible = false
            end
        else
            drawing.Visible = false
        end
    end
end

function _G.ESPObject:Destroy()
    for _, drawing in pairs(self.Drawings) do
        if type(drawing) == "table" then
            for _, subDrawing in pairs(drawing) do
                subDrawing:Remove()
            end
        else
            drawing:Remove()
        end
    end
end

-- ESP Management Functions
function CreateESPForPlayer(player)
    if player == _G.LocalPlayer then return end
    if _G.ESPObjects[player] then return end
    
    _G.ESPObjects[player] = _G.ESPObject.new(player)
end

function RemoveESPForPlayer(player)
    if _G.ESPObjects[player] then
        _G.ESPObjects[player]:Destroy()
        _G.ESPObjects[player] = nil
    end
end

function UpdateAllESP()
    if not _G.ESPConfig.ESP.Enabled then
        for player, espObject in pairs(_G.ESPObjects) do
            espObject:ClearAll()
        end
        return
    end
    
    for player, espObject in pairs(_G.ESPObjects) do
        if player.Parent then
            espObject:Update()
        else
            RemoveESPForPlayer(player)
        end
    end
end

function InitializeESPSystem()
    -- Create ESP for existing players
    for _, player in pairs(_G.Players:GetPlayers()) do
        CreateESPForPlayer(player)
    end
    
    -- Connect events
    _G.ESPConnections.PlayerAdded = _G.Players.PlayerAdded:Connect(CreateESPForPlayer)
    _G.ESPConnections.PlayerRemoving = _G.Players.PlayerRemoving:Connect(RemoveESPForPlayer)
    _G.ESPConnections.RenderStepped = _G.RunService.RenderStepped:Connect(UpdateAllESP)
end



ESPTab:CreateToggle({
    Name = "ESP Enabled",
    CurrentValue = _G.ESPConfig.ESP.Enabled,
    Flag = "ESPEnabled",
    Callback = function(Value)
        _G.ESPConfig.ESP.Enabled = Value
        if Value then
            Rayfield:Notify({
                Title = "ESP System",
                Content = "ESP has been enabled",
                Duration = 2,
                Image = 4483362458,
            })
        else
            for player, espObject in pairs(_G.ESPObjects) do
                espObject:ClearAll()
            end
            Rayfield:Notify({
                Title = "ESP System",
                Content = "ESP has been disabled",
                Duration = 2,
                Image = 4483362458,
            })
        end
    end,
})

ESPTab:CreateSection("Boxes")

ESPTab:CreateToggle({
    Name = "Show Boxes",
    CurrentValue = _G.ESPConfig.ESP.ShowBoxes,
    Flag = "ShowBoxes",
    Callback = function(Value)
        _G.ESPConfig.ESP.ShowBoxes = Value
    end,
})

ESPTab:CreateColorPicker({
    Name = "Box Color",
    Color = _G.ESPConfig.Colors.Box,
    Flag = "BoxColor",
    Callback = function(Value)
        _G.ESPConfig.Colors.Box = Value
    end
})

ESPTab:CreateSection("Tracers")

ESPTab:CreateToggle({
    Name = "Show Tracers",
    CurrentValue = _G.ESPConfig.ESP.ShowTracers,
    Flag = "ShowTracers",
    Callback = function(Value)
        _G.ESPConfig.ESP.ShowTracers = Value
    end,
})

ESPTab:CreateColorPicker({
    Name = "Tracer Color",
    Color = _G.ESPConfig.Colors.Tracer,
    Flag = "TracerColor",
    Callback = function(Value)
        _G.ESPConfig.Colors.Tracer = Value
    end
})
ESPTab:CreateSection("Chams")


local Toggle = ESPTab:CreateToggle({
    Name = "Toggle Chams",
    CurrentValue = false,
    Flag = "ToggleChams", -- Identifier for the configuration
    Callback = function(value)
        toggleChams(value) -- Call the toggle function with the new value
    end,
})

-- Color Picker for Outline Color
local OutlineColorPicker = ESPTab:CreateColorPicker({
    Name = "Outline Color",
    Color = highlightOutlineColor,
    Flag = "OutlineColor", -- A flag for the configuration file
    Callback = function(Color1)
        highlightOutlineColor = Color1 -- Update the highlight outline color variable
        -- Update existing highlights to use the new outline color
        for _, highlight in pairs(existingHighlights) do
            highlight.OutlineColor = highlightOutlineColor
        end
    end
})

-- Color Picker for Fill Color
local FillColorPicker = ESPTab:CreateColorPicker({
    Name = "Fill Color",
    Color = highlightFillColor,
    Flag = "FillColor", -- A flag for the configuration file
    Callback = function(Color1)
        highlightFillColor = Color1 -- Update the highlight fill color variable
        -- Update existing highlights to use the new fill color
        for _, highlight in pairs(existingHighlights) do
            highlight.FillColor = highlightFillColor
        end
    end
})

-- Opacity sliders
local function createOpacitySlider(name, initialValue, flag, callback)
    return ESPTab:CreateSlider({
        Name = name,
        Range = {0, 100}, -- Opacity from 0% to 100%
        Increment = 1,
        Suffix = "%",
        CurrentValue = initialValue * 100, -- Convert to percentage for the slider
        Flag = flag,
        Callback = function(value)
            local opacity = value / 100 -- Convert back to decimal
            callback(opacity) -- Call the provided callback with the new opacity
            -- Update existing highlights to use the new opacity
            for _, highlight in pairs(existingHighlights) do
                highlight.OutlineTransparency = 1 - highlightOutlineOpacity
                highlight.FillTransparency = 1 - highlightFillOpacity
            end
        end,
    })
end

local OutlineOpacitySlider = createOpacitySlider("Outline Opacity", highlightOutlineOpacity, "OutlineOpacity", function(value) highlightOutlineOpacity = value end)
local FillOpacitySlider = createOpacitySlider("Fill Opacity", highlightFillOpacity, "FillOpacity", function(value) highlightFillOpacity = value end)

ESPTab:CreateSection("Names")

ESPTab:CreateToggle({
    Name = "Show Names",
    CurrentValue = _G.ESPConfig.ESP.ShowNames,
    Flag = "ShowNames",
    Callback = function(Value)
        _G.ESPConfig.ESP.ShowNames = Value
    end,
})


ESPTab:CreateColorPicker({
    Name = "Name Text Color",
    Color = _G.ESPConfig.Colors.Text,
    Flag = "TextColor",
    Callback = function(Value)
        _G.ESPConfig.Colors.Text = Value
    end
})

ESPTab:CreateSection("Health")

ESPTab:CreateToggle({
    Name = "Show Health",
    CurrentValue = _G.ESPConfig.ESP.ShowHealth,
    Flag = "ShowHealth",
    Callback = function(Value)
        _G.ESPConfig.ESP.ShowHealth = Value
    end,
})

ESPTab:CreateColorPicker({
    Name = "Health Color",
    Color = _G.ESPConfig.Colors.Health,
    Flag = "HealthColor",
    Callback = function(Value)
        _G.ESPConfig.Colors.Health = Value
    end
})

ESPTab:CreateSection("Distance")

ESPTab:CreateToggle({
    Name = "Show Distance (Meters)",
    CurrentValue = _G.ESPConfig.ESP.ShowDistance,
    Flag = "ShowDistance",
    Callback = function(Value)
        _G.ESPConfig.ESP.ShowDistance = Value
    end,
})

ESPTab:CreateToggle({
    Name = "Show Distance (Studs)",
    CurrentValue = _G.ESPConfig.ESP.ShowDistanceStuds,
    Flag = "ShowDistance",
    Callback = function(Value)
        _G.ESPConfig.ESP.ShowDistanceStuds = Value
    end,
})

ESPTab:CreateColorPicker({
    Name = "Distance Color",
    Color = _G.ESPConfig.Colors.Distance,
    Flag = "DistanceColor",
    Callback = function(Value)
        _G.ESPConfig.Colors.Distance = Value
    end
})

ESPTab:CreateSlider({
    Name = "Max Distance",
    Range = {100, 5000},
    Increment = 50,
    Suffix = "studs",
    CurrentValue = _G.ESPConfig.ESP.MaxDistance,
    Flag = "MaxDistance",
    Callback = function(Value)
        _G.ESPConfig.ESP.MaxDistance = Value
    end,
})
ESPTab:CreateSection("Skeleton")

ESPTab:CreateToggle({
    Name = "Show Skeleton",
    CurrentValue = _G.ESPConfig.ESP.ShowSkeleton,
    Flag = "ShowSkeleton",
    Callback = function(Value)
        _G.ESPConfig.ESP.ShowSkeleton = Value
    end,
})

ESPTab:CreateColorPicker({
    Name = "Skeleton Color",
    Color = _G.ESPConfig.Colors.Skeleton,
    Flag = "SkeletonColor",
    Callback = function(Value)
        _G.ESPConfig.Colors.Skeleton = Value
    end
})

ESPTab:CreateSection("Team")

ESPTab:CreateToggle({
    Name = "Team Check",
    CurrentValue = _G.ESPConfig.ESP.TeamCheck,
    Flag = "TeamCheck",
    Callback = function(Value)
        _G.ESPConfig.ESP.TeamCheck = Value
    end,
})

ESPTab:CreateColorPicker({
    Name = "Enemy Color",
    Color = _G.ESPConfig.Colors.Enemy,
    Flag = "EnemyColor",
    Callback = function(Value)
        _G.ESPConfig.Colors.Enemy = Value
    end
})

ESPTab:CreateColorPicker({
    Name = "Team Color",
    Color = _G.ESPConfig.Colors.Team,
    Flag = "TeamColor",
    Callback = function(Value)
        _G.ESPConfig.Colors.Team = Value
    end
})

ESPTab:CreateSection("Others")


ESPTab:CreateButton({
    Name = "Refresh ESP",
    Callback = function()
        for player, espObject in pairs(_G.ESPObjects) do
            espObject:Destroy()
        end
        _G.ESPObjects = {}
        
        for _, player in pairs(_G.Players:GetPlayers()) do
            CreateESPForPlayer(player)
        end
        
        Rayfield:Notify({
            Title = "ESP System",
            Content = "ESP refreshed successfully",
            Duration = 2,
            Image = "bell",
        })
    end,
})

ESPTab:CreateButton({
    Name = "Clear All ESP",
    Callback = function()
        for player, espObject in pairs(_G.ESPObjects) do
            espObject:ClearAll()
        end
        
        Rayfield:Notify({
            Title = "ESP System",
            Content = "All ESP elements cleared",
            Duration = 2,
            Image = "bell",
        })
    end,
})

-- Clean up highlights when a player is removed
Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        removeHighlight(player.Character)
    end
end)

-- Continuous update for respawning characters
RunService.Heartbeat:Connect(function()
    if isHighlightingEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                highlightCharacter(player.Character) -- Ensure highlight is maintained on respawn
            end
        end
    end
end)

-- Ensure highlights apply to all existing players initially
toggleChams(isHighlightingEnabled)

-- Initialize the ESP system
InitializeESPSystem()









 
 



 


-- Create the Target tab and section
local TargetTab = Window:CreateTab("Target", "user") -- Title, Image
local Section = TargetTab:CreateSection("Target")



-- Define global variables
local targetPlayer = nil
local markParts = {}
local originalColors = {}
local markRadius = 0.5 -- Radius of the red dot

-- Function to find a player by name or display name
local function findPlayer(input)
	for _, player in ipairs(game.Players:GetPlayers()) do
		if string.find(player.Name:lower(), input:lower()) or string.find(player.DisplayName:lower(), input:lower()) then
			return player
		end
	end
	return nil
end
local Note1Label = TargetTab:CreateLabel("NOTE! The Target Can Be Display Or Username And Can Be Shortened To 3 Characters!", "message-circle-warning") 

local UserLabel = TargetTab:CreateLabel("Target: N/A", "user") -- Initial label

 
local function findPlayer(input)
	for _, player in ipairs(game.Players:GetPlayers()) do
		if string.find(player.Name:lower(), input:lower()) or string.find(player.DisplayName:lower(), input:lower()) then
			return player
		end
	end
	return nil
end



local TargetBox = TargetTab:CreateInput({
    Name = "Target",
    PlaceholderText = "Enter Player Name",
    Callback = function(Value)
        -- Find the player based on input
        targetPlayer = findPlayer(Value)
		
		
        
		if targetPlayer then
            -- Update the label to display the player's display name and username
            UserLabel:Set("Target: " .. targetPlayer.DisplayName .. " (" .. targetPlayer.Name .. ")", "user")
        else
            -- Notify the user if the player isn't found
            Rayfield:Notify({
                Title = "Error",
                Content = "Player not found!",
                Duration = 0, -- Notification stays until "Okay" is pressed
                Image = "bell",
                Actions = {
                    Okay = {
                        Name = "Okay",
                        Callback = function()
                            -- Automatically closes the notification on click
                        end
                    }
                }
            })

            -- Reset the label to show no target is selected
            UserLabel:Set("Target: N/A", "user")
        end
    end,
})

-- Always watch targetPlayer and notify if they leave/reappear
spawn(function()
    local wasInGame = false
    local hasDisappeared = false

    while true do
        if targetPlayer then
            local stillInGame = game.Players:FindFirstChild(targetPlayer.Name)

            if stillInGame then
                -- If they reappeared after disappearing
                if hasDisappeared then
                    local name = targetPlayer.DisplayName or targetPlayer.Name
                    Rayfield:Notify({
                        Title = "Target Reappeared",
                        Content = name .. " has rejoined the game.",
                        Duration = 4,
                        Image = "bell"
                    })
                    hasDisappeared = false
                end
                wasInGame = true
            else
                -- If they disappeared while being tracked
                if wasInGame and not hasDisappeared then
                    local name = targetPlayer.DisplayName or targetPlayer.Name
                    Rayfield:Notify({
                        Title = "Target Has Disappeared",
                        Content = name .. " has left the game.",
                        Duration = 4,
                        Image = "bell"
                    })
                    hasDisappeared = true
                end
            end
        end
        wait(0.5) -- check twice per second
    end
end)

















-- Create the TP Player button
local TpButton = TargetTab:CreateButton({
	Name = "Goto Player",
	Callback = function()
		if targetPlayer then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "No target player set!",
				Duration = 3,
				Image = "bell",
			})
		end
	end,
})

-- Create the View button
local ViewButton = TargetTab:CreateButton({
	Name = "View",
	Callback = function()
		if targetPlayer then
			game.Workspace.CurrentCamera.CameraSubject = targetPlayer.Character.Humanoid
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "No target player set!",
				Duration = 3,
				Image = "bell",
			})
		end
	end,
})

-- Create the Unview button
local UnviewButton = TargetTab:CreateButton({
	Name = "Unview",
	Callback = function()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		-- No notification is shown here
	end,
})

-- Create the View button
WatchActivityButton = TargetTab:CreateButton({
	Name = "Watch Activity", 
	Callback = function()
		local playerToWatch = targetPlayer -- or replace with whoever you want

		if not playerToWatch then
			Rayfield:Notify({
				Title = "No Player Selected",
				Content = "Please set a player to watch first.",
				Duration = 4,
				Image = "bell"
			})
			return
		end

		Rayfield:Notify({
			Title = "Watching Player",
			Content = "Now watching " .. (playerToWatch.DisplayName or playerToWatch.Name) .. "'s activity.",
			Duration = 4,
			Image = "bell"
		})

		spawn(function()
			local hasDisappeared = false

			local function connectCharacter(character)
				local humanoid = character:WaitForChild("Humanoid", 5)
				if humanoid then
					humanoid.Died:Connect(function()
						Rayfield:Notify({
							Title = "Player Died",
							Content = (playerToWatch.DisplayName or playerToWatch.Name) .. " has died.",
							Duration = 4,
							Image = "bell"
						})
					end)
				end
			end

			-- Connect respawn event every time character spawns
			playerToWatch.CharacterAdded:Connect(function(char)
				Rayfield:Notify({
					Title = "Player Respawned",
					Content = (playerToWatch.DisplayName or playerToWatch.Name) .. " has respawned.",
					Duration = 4,
					Image = "bell"
				})
				connectCharacter(char)
			end)

			-- Connect current character if exists
			if playerToWatch.Character then
				connectCharacter(playerToWatch.Character)
			end

			while playerToWatch do
				local playerInstance = game.Players:FindFirstChild(playerToWatch.Name)
				if playerInstance then
					if hasDisappeared then
						local name = playerToWatch.DisplayName or playerToWatch.Name
						Rayfield:Notify({
							Title = "Player Reappeared",
							Content = name .. " has rejoined the game.",
							Duration = 4,
							Image = "bell"
						})
						hasDisappeared = false
					end
				else
					if not hasDisappeared then
						local name = playerToWatch.DisplayName or playerToWatch.Name
						Rayfield:Notify({
							Title = "Player Disappeared",
							Content = name .. " has left the game.",
							Duration = 4,
							Image = "bell"
						})
						hasDisappeared = true
					end
				end
				wait(0.5)
			end
		end)
	end,
})




local localPlayer = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", localPlayer.PlayerGui)

-- Create the dot
local compassDot = Instance.new("Frame", screenGui)
compassDot.Size = UDim2.new(0, 15, 0, 15)
compassDot.BackgroundColor3 = Color3.new(1, 0, 0)
compassDot.AnchorPoint = Vector2.new(0.5, 0.5)
compassDot.Position = UDim2.new(0.5, 0, 0, 10)
compassDot.Visible = false
compassDot.BorderSizePixel = 0
compassDot.BackgroundTransparency = 0
compassDot.ClipsDescendants = true

-- Make the dot a circle
local uicorner = Instance.new("UICorner", compassDot)
uicorner.CornerRadius = UDim.new(1, 0)

-- Create up and down arrows for elevation
local upArrow = Instance.new("TextLabel", screenGui)
upArrow.Size = UDim2.new(0, 40, 0, 40)  -- Increased size
upArrow.Text = "↓"
upArrow.TextSize = 30  -- Set text size for better visibility
upArrow.TextColor3 = Color3.new(1, 0, 0) -- Red color for the arrow
upArrow.BackgroundTransparency = 1
upArrow.Visible = false -- Initially hidden
upArrow.Position = UDim2.new(0.5, 0.1, 0, 10)  -- Fixed position relative to the dot

local downArrow = Instance.new("TextLabel", screenGui)
downArrow.Size = UDim2.new(0, 40, 0, 40)  -- Increased size
downArrow.Text = "↑"
downArrow.TextSize = 30  -- Set text size for better visibility
downArrow.TextColor3 = Color3.new(1, 0, 0) -- Red color for the arrow
downArrow.BackgroundTransparency = 1
downArrow.Visible = false -- Initially hidden
downArrow.Position = UDim2.new(0.5, 0.1, 0, 10)  -- Fixed position relative to the dot

local highlight = nil -- To store the highlight instance
local dotActive = false -- To track if the dot is active

-- Highlight Player Toggle (added)
local HighlightToggle = TargetTab:CreateToggle({
    Name = "Highlight Player",
    CurrentValue = false, -- Initially off
    Flag = "highlightToggle",
    Callback = function(Value)
        if targetPlayer and targetPlayer.Character then
            if Value then
                -- Turn on the highlight
                if highlight then
                    highlight:Destroy() -- Remove any previous highlight
                end
                highlight = Instance.new("Highlight")
                highlight.Adornee = targetPlayer.Character
                highlight.FillColor = Color3.new(1, 0, 0) -- Red fill color
                highlight.OutlineColor = Color3.new(1, 1, 1) -- White outline color
                highlight.Parent = game.Workspace

                -- Activate dot
                dotActive = true
                compassDot.Visible = true -- Show the dot
                -- Show arrows only when the toggle is on
                upArrow.Visible = true
                downArrow.Visible = true
            else
                -- Turn off the highlight
                if highlight then
                    highlight:Destroy()
                    highlight = nil
                end

                -- Deactivate dot
                dotActive = false
                compassDot.Visible = false -- Hide the dot
                -- Hide arrows when the toggle is off
                upArrow.Visible = false
                downArrow.Visible = false
            end
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "No target player or character found!",
                Duration = 3
            })
        end
    end
})

-- Smooth interpolation for the dot's movement
local function lerp(a, b, t)
    return a + (b - a) * t
end

-- Function to update the dot and arrows based on target's position
local function updateDotAndArrows()
    local lastXPos = 0.5 -- Start the dot at the center

    while true do
        if dotActive and targetPlayer and targetPlayer.Character then
            local rootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                local camera = workspace.CurrentCamera

                -- Calculate direction from the camera to the player
                local direction = (rootPart.Position - camera.CFrame.Position).unit
                local screenPos = camera:WorldToScreenPoint(rootPart.Position)

                -- Adjust the horizontal position of the dot based on the player's relative position
                local xPosition = screenPos.X / camera.ViewportSize.X

                -- Update the vertical position for the arrows based on elevation
                local elevation = screenPos.Y - (camera.ViewportSize.Y / 2)  -- Calculate elevation difference

                -- Show arrows based on elevation
                if elevation > 20 then
                    upArrow.Visible = true
                    downArrow.Visible = false
                elseif elevation < -20 then
                    downArrow.Visible = true
                    upArrow.Visible = false
                else
                    upArrow.Visible = false
                    downArrow.Visible = false
                end

                -- Check if the player is off-screen
                if screenPos.Z <= 0 then
                    xPosition = 1 -- Player is behind, move dot to the far right (off-screen)
                elseif xPosition < 0 then
                    xPosition = 0 -- Player is off to the left, clamp to far left
                elseif xPosition > 1 then
                    xPosition = 1 -- Player is off to the right, clamp to far right
                end

                -- Smoothly interpolate the dot's position
                lastXPos = lerp(lastXPos, xPosition, 0.1) -- Adjust 0.1 for faster/slower smoothness
                compassDot.Position = UDim2.new(lastXPos, 0, 0, 10) -- Adjust horizontal position smoothly
            end
        end
        wait(0.05) -- Update more frequently for smoother movement
    end
end

-- Start updating the dot and arrows
spawn(updateDotAndArrows) -- Use spawn to run the update in a separate thread











local TrollSection = TargetTab:CreateSection("Troll")


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

-- Utility functions to get the torso or root part of a character
local function getRoot(character)
    return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso")
end

local function getTorso(character)
    return character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
end

-- Variables to keep track of active connections and animation state
local bangActive = false
local bangLoop, bangAnim, bangAnimation, bangDied

-- Main bang function
local function bang(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then
        -- Display a notification if target player is not set or found
        Rayfield:Notify({
            Title = "Error",
            Content = "Target not set or found!",
            Duration = 3,  -- Duration in seconds
            Image = "bell",  -- No image
        })
        return
    end

    local humanoid = localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    if not humanoid then
        warn("Humanoid not found in local player.")
        return
    end

    -- Determine animation based on the character rig type (R6 or R15)
    bangAnim = Instance.new("Animation")
    bangAnim.AnimationId = humanoid.RigType == Enum.HumanoidRigType.R15 and "rbxassetid://5918726674" or "rbxassetid://148840371"

    -- Load and play the bang animation
    bangAnimation = humanoid:LoadAnimation(bangAnim)
    bangAnimation:Play(0.1, 1, 1)
    bangAnimation:AdjustSpeed(3)  -- Adjust the speed as needed

    -- Define variables for cleanup
    local bangOffset = CFrame.new(0, 0, 1.1)  -- Offset to position behind the target player

    -- Connect to the humanoid's Died event to clean up
    bangDied = humanoid.Died:Connect(function()
        bangAnimation:Stop()
        bangAnim:Destroy()
        bangDied:Disconnect()
        if bangLoop then bangLoop:Disconnect() end
    end)

    -- Continuously position localPlayer behind targetPlayer while playing animation
    bangLoop = RunService.Stepped:Connect(function()
        if not bangActive then
            -- Stop the bang effect if toggle is off
            bangAnimation:Stop()
            bangAnim:Destroy()
            bangLoop:Disconnect()
            bangDied:Disconnect()
            return
        end

        pcall(function()
            local targetRoot = getRoot(targetPlayer.Character)
            if targetRoot then
                getRoot(localPlayer.Character).CFrame = targetRoot.CFrame * bangOffset
            end
        end)
    end)
end

-- Toggle for Bang action in Rayfield GUI
TargetTab:CreateToggle({
    Name = "Bang",
    Default = false,
    Callback = function(value)
        bangActive = value
        if value then
            bang(targetPlayer)
        else
            -- Ensure all connections and animations are properly stopped when toggling off
            if bangLoop then
                bangLoop:Disconnect()
                bangLoop = nil
            end
            if bangDied then
                bangDied:Disconnect()
                bangDied = nil
            end
            if bangAnimation then
                bangAnimation:Stop()
                bangAnimation:Destroy()
                bangAnimation = nil
            end
            if bangAnim then
                bangAnim:Destroy()
                bangAnim = nil
            end
        end
    end
})

local BangSpeedSlider = TargetTab:CreateSlider({
	Name = "Bang Speed",
	Range = {1, 500},
	Increment = 2,
	Suffix = "Bang Speed",
	CurrentValue = 3,
	Flag = "Slidfeeefefefedsbfe", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bangspeed)
		bangAnimation:AdjustSpeed(bangspeed)
	end,
 })






-- Add these at the top of your script with other global variables
local isOrbiting = false
local orbitRadius = 5 -- Default orbit radius
local orbitSpeed = 1 -- Default orbit speed

-- Add this after your existing buttons in the Target tab

-- Create the Orbit Target toggle
local isOrbiting = false
local orbitRadius = 5
local orbitSpeed = 1

local function orbitTarget()
    local angle = 0
    while isOrbiting and targetPlayer do
        local targetPos = targetPlayer.Character.HumanoidRootPart.Position
        local orbitPos = targetPos + Vector3.new(
            math.cos(angle) * orbitRadius,
            0,
            math.sin(angle) * orbitRadius
        )
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(orbitPos, targetPos)
        angle = angle + orbitSpeed * 0.1
        game:GetService("RunService").Heartbeat:Wait()
    end
end

local OrbitToggle = TargetTab:CreateToggle({
    Name = "Orbit Target",
    CurrentValue = false,
    Flag = "OrbitToggle",
    Callback = function(Value)
        isOrbiting = Value
        if isOrbiting and targetPlayer then
            spawn(orbitTarget)
        end
    end,
})












-- You can add more code here





-- Create a slider for orbit radius
local RadiusSlider = TargetTab:CreateSlider({
    Name = "Orbit Radius",
    Range = {1, 20},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 5,
    Flag = "RadiusSlider",
    Callback = function(Value)
        orbitRadius = Value
    end,
})

-- Create a slider for orbit speed
local SpeedSlider = TargetTab:CreateSlider({
    Name = "Orbit Speed",
    Range = {0.1, 5},
    Increment = 0.1,
    Suffix = "x",
    CurrentValue = 1,
    Flag = "SpeedSlider",
    Callback = function(Value)
        orbitSpeed = Value
    end,
})

local InfoSection = TargetTab:CreateSection("Info")

-- Create a label for join date and days since creation
-- Global variable to store the target's full join date
-- Global variable to store the target's full join date
_G.TargetJoinDate = "N/A"

-- Create a label to show join date and days since creation
local TargetJoinLabel = TargetTab:CreateLabel("Target Join Date: N/A | Days Since Creation: N/A", "calendar-search")

-- Function to get ordinal for the day (1st, 2nd, 3rd, etc.)
local function getOrdinal(day)
    if day % 10 == 1 and day ~= 11 then
        return day .. "st"
    elseif day % 10 == 2 and day ~= 12 then
        return day .. "nd"
    elseif day % 10 == 3 and day ~= 13 then
        return day .. "rd"
    else
        return day .. "th"
    end
end

-- Update the label and global variable
spawn(function()
    while true do
        if targetPlayer then
            local daysSinceCreation = math.floor(targetPlayer.AccountAge)
            local creationTimestamp = os.time() - (daysSinceCreation * 24 * 60 * 60)
            local dateTable = os.date("*t", creationTimestamp)

            local weekday = os.date("%A", creationTimestamp) -- e.g., Thursday
            local month = os.date("%B", creationTimestamp) -- e.g., August
            local day = getOrdinal(dateTable.day)
            local year = dateTable.year

            local fullDate = weekday .. " " .. month .. " " .. day .. " " .. year

            -- Store in global variable
            _G.TargetJoinDate = fullDate

            -- Update label
            TargetJoinLabel:Set("Target Join Date: " .. fullDate .. " | Days Since Creation: " .. daysSinceCreation, "calendar-search")
        else
            _G.TargetJoinDate = "N/A"
            TargetJoinLabel:Set("Target Join Date: N/A | Days Since Creation: N/A", "calendar-search")
        end
        wait(5)
    end
end)







-- Create a label to show distance to target
local DistanceLabel = TargetTab:CreateLabel("Distance to Target: N/A", "ruler")

-- Update the distance label
spawn(function()
    while true do
        if targetPlayer and game.Players.LocalPlayer.Character and targetPlayer.Character then
            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - targetPlayer.Character.HumanoidRootPart.Position).Magnitude
            local studs = math.floor(distance)
            local meters = math.floor(distance * 0.28)
            DistanceLabel:Set("Distance to Target: " .. studs .. " studs (" .. meters .. " m)", "ruler")
        else
            DistanceLabel:Set("Distance to Target: N/A", "ruler")
        end
        wait(0.1) -- Update every 0.1 seconds
    end
end)



-- Nearby Players Label
local NearbyPlayersLabel = TargetTab:CreateLabel("Users Near Target: N/A", "users")

-- Function to get the preferred name of a player
local function getPreferredName(player)
    if preferenceOption == "Username" then
        return player.DisplayName
    else
        return player.DisplayName
    end
end

-- Function to update nearby players information
local function updateNearbyPlayers()
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local nearbyPlayers = {}
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= targetPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (player.Character.HumanoidRootPart.Position - targetPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 20 then  -- Consider players within 20 studs as nearby
                    local playerName = getPreferredName(player)
                    table.insert(nearbyPlayers, string.format("%s (%.1f)", playerName, distance))
                end
            end
        end
        if #nearbyPlayers > 0 then
            NearbyPlayersLabel:Set("Users Near Target: " .. table.concat(nearbyPlayers, ", "), "users")
        else
            NearbyPlayersLabel:Set("Users Near Target: None", "users")
        end
    else
        NearbyPlayersLabel:Set("Users Near Target: N/A", "users")
    end
end

-- Update nearby players info periodically
spawn(function()
    while true do
        updateNearbyPlayers()
        wait(1)  -- Update every second
    end
end)

-- Make sure to call updateNearbyPlayers() when a new target is selected
-- This should be added to your existing target selection logic
local function updateTarget(player)
    targetPlayer = player
    updateNearbyPlayers()
    -- ... other existing update logic ...
end



local OthersSections = TargetTab:CreateSection("Others")

local CopyUserButton = TargetTab:CreateButton({
	Name = "Copy Target Username",
	Callback = function()
		setclipboard(targetPlayer.Name)
		Rayfield:Notify({
			Title = "Copied Username !",
			Content = "Copied ".. targetPlayer.Name,
			Duration = 4,
			Image = "bell"
		 })
		 
	end,
})

local CopyDisplayButton = TargetTab:CreateButton({
	Name = "Copy Target Display Name",
	Callback = function()
		setclipboard(targetPlayer.DisplayName)
		Rayfield:Notify({
			Title = "Copied Display Name !",
			Content = "Copied ".. targetPlayer.DisplayName,
			Duration = 4,
			Image = "bell"
		 })
		 
	end,
})

local CopyUserIDButton = TargetTab:CreateButton({
	Name = "Copy Target User ID",
	Callback = function()
		setclipboard(tostring(targetPlayer.UserId))
		Rayfield:Notify({
			Title = "Copied User ID !",
			Content = "Copied ".. targetPlayer.UserId,
			Duration = 4,
			Image = "bell"
		 })

	
	end,
 })

-- Create a button to copy the target's join date
JoinDateButton = TargetTab:CreateButton({
	Name = "Copy Target Join Date",
	Callback = function()
		if not targetPlayer then
			Rayfield:Notify({
				Title = "No Player Selected",
				Content = "Please set a target first.",
				Duration = 4,
				Image = "bell"
			})
			return
		end

		-- Function to get ordinal for the day
		local function getOrdinal(day)
			if day % 10 == 1 and day ~= 11 then
				return day .. "st"
			elseif day % 10 == 2 and day ~= 12 then
				return day .. "nd"
			elseif day % 10 == 3 and day ~= 13 then
				return day .. "rd"
			else
				return day .. "th"
			end
		end

		-- Calculate full join date
		local daysSinceCreation = math.floor(targetPlayer.AccountAge)
		local creationTimestamp = os.time() - (daysSinceCreation * 24 * 60 * 60)
		local dateTable = os.date("*t", creationTimestamp)

		local weekday = os.date("%A", creationTimestamp)
		local month = os.date("%B", creationTimestamp)
		local day = getOrdinal(dateTable.day)
		local year = dateTable.year

		local fullDate = weekday .. " " .. month .. " " .. day .. " " .. year

		-- Copy to clipboard
		setclipboard(fullDate)

		-- Notify
		Rayfield:Notify({
			Title = "Copied Join Date!",
			Content = "Copied " .. fullDate,
			Duration = 4,
			Image = "bell"
		})
	end,
})




TargetTab:CreateButton({
    Name = "Show Target Image",
    Callback = function()
        -- GUI Setup when button is clicked
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
                wait(0.05)
            end
            ScreenGui:Destroy()  -- Remove the GUI after fading out
        end)

    end
})

local ThemesTab = Window:CreateTab("Themes", "palette")
local Section = ThemesTab:CreateSection("Themes")

local themes = {
    {name = "Default", identifier = "Default"},
    {name = "Amber Glow", identifier = "AmberGlow"},
    {name = "Amethyst", identifier = "Amethyst"},
    {name = "Bloom", identifier = "Bloom"},
    {name = "Dark Blue", identifier = "DarkBlue"},
    {name = "Green", identifier = "Green"},
    {name = "Light", identifier = "Light"},
    {name = "Ocean", identifier = "Ocean"},
    {name = "Serenity", identifier = "Serenity"}
}

for _, theme in ipairs(themes) do
    local Theme21Button = ThemesTab:CreateButton({
        Name = theme.name,
        Callback = function()
            Window.ModifyTheme(theme.identifier)
        end,
    })
end



local InfoTab = Window:CreateTab("Info", "info") -- Title, Image
local Section = InfoTab:CreateSection("Info")

local GameInfoParagraph = InfoTab:CreateParagraph({
	Title = "What Does The 🔴 🟠 🟢 Mean Beside Current Game (Welcome Tab)",
	Content = "🔴 = This Displays The Game Is Not Supported Dynamically\n🟠 = This Displays The Game Is Supported Dynamically But Is Not Completed\n🟢 = This Displays The Game Is Supported Dynamically And Fully Complete"
})

-- Create multiple labels with unique variable names
local Discord1Button = InfoTab:CreateButton({
	Name = "Copy Discord Invite",
	Callback = function()
		-- Check if setclipboard is available
		if setclipboard then
			setclipboard("https://discord.gg/ZNfKFyuUEd") -- Copy the invite link to the clipboard
			

			-- Notify the user (if Rayfield or a similar notification library is available)
			Rayfield:Notify({
				Title = "Copied Discord Invite",
				Content = "Join the Discord for suggestions, bugs, and more!",
				Duration = 5,
				Image = "bell"
			})
		else
			print("setclipboard function is not available.")
		end
	end,
})

local WebsiteButton = InfoTab:CreateButton({
	Name = "Copy Website Link (New)",
	Callback = function()
		-- Check if setclipboard is available
		if setclipboard then
			setclipboard("https://angxers2.github.io/Unihub/") -- Copy the invite link to the clipboard
			print("Copied to clipboard: https://angxers2.github.io/Unihub/") -- Confirmation in the console

			-- Notify the user (if Rayfield or a similar notification library is available)
			Rayfield:Notify({
				Title = "Copied Website Link",
				Content = "Visit the website for more information on updates and more!",
				Duration = 6,
				Image = "bell"
			})
		else
			print("setclipboard function is not available.")
		end
	end,
})



local Label2 = InfoTab:CreateLabel("This script will ALWAYS REMAIN FREE")
local Label4 = InfoTab:CreateLabel("This script is frequently updated !")
local Label5 = InfoTab:CreateLabel("This script was made fully by angxers")
local VersionLabel = InfoTab:CreateLabel("Version ".. Version, "rocket")


print("Universal Hub loaded.")

-- Record the end time
setclipboard("https://discord.gg/ZNfKFyuUEd")  -- Set the clipboard to the Discord invite link

Rayfield:Notify({
    Title = "Universal Hub " .. Version,
    Content = "Join the Discord for suggestions and bugs. Link copied to clipboard!",
    Duration = 8,
    Image = "bell",
})


end

-- Function to fade out the blur effect
local function fadeOutBlur(duration)
    local TweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    
    -- Tween for the blur size to 0
    local tween = TweenService:Create(blurEffect, TweenInfo, {Size = 0})

    -- Load additional things before starting the tween
    loadAdditionalThings()

    -- Play the tween
    tween:Play()

    -- Optional: Wait for the tween to complete
    tween.Completed:Wait()
    
    -- Clean up (remove the BlurEffect)
    blurEffect:Destroy()
end



-- Example usage
fadeOutBlur(2) -- Adjust the duration as needed


 
 






	
