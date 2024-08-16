local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
   Name = "Universal Hub",
   LoadingTitle = "Universal Hub",
   LoadingSubtitle = "by angxers",
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
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local MainTab = Window:CreateTab("🏠 Main", nil) -- Title, Image
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

local Slider = MainTab:CreateSlider({
    Name = "JumpPower",
    Range = {0, 300},
    Increment = 1,
    Suffix = " JumpPower",
    CurrentValue = 50,
    Flag = "jumpower", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        -- The function that takes place when the slider changes
        -- The variable (Value) is a number which correlates to the value the slider is currently at
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            humanoid.JumpPower = Value
        end
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
   Image = nil,
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
        local Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua"))()
        Aimbot.Load()
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
   Image = nil,
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

local ScriptsTab = Window:CreateTab("📃 Scripts", nil) -- Title, Image
local AdminsSection = ScriptsTab:CreateSection("Admins")

local Button = ScriptsTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
            local InfiniteYield = loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
            InfiniteYield.Load()
   end,
})

local Button = ScriptsTab:CreateButton({
   Name = "Prizzlife (prison life only)",
   Callback = function()
            local PL = loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
            PL.Load()
   end,
})

local Button = ScriptsTab:CreateButton({
   Name = "Reviz Admin",
   Callback = function()
            -- Creator: illremember#3799

-- Credits to infinite yield, harkinian, dex creators

prefix = ";"
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
	'[40] fly -- Allows you to fly, credit to Infinite Yield',
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
	'[77] reset -- Resets your character.',
	'[78] anim [id] -- Applies an animation on you, must be created by ROBLOX',
	'[79] animgui -- Loads up Energize animations GUI',
	'[80] savepos -- Saves your current position',
	'[81] loadpos -- Teleports you to your saved position',
	'[82] bang [plr] -- 18+ will not work if you have FE Godmode on',
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
	'[101] version -- Gets the admin version',
	'[102] state [num] -- Changes your humanoid state, ;unstate to stop.',
	'[103] gravity [num] -- Changes workspace gravity default is 196.2',
	'[104] pgs -- Checks if the game has PGSPhysicsSolverEnabled enabled',
	'[105] clickdel -- Delete any block you press q on, client sided',
	'[106] noclickdel -- Stops clickdel',
	'[107] looprhats -- Loop removes mesh of your hats/loop block hats',
	'[108] unlooprhats -- Stops loop removing mesh',
	'[109] looprtool -- Loop removes mesh of your tool/loop block tools',
	'[110] unlooprtool -- Stops loop removing mesh',
	'[111] givealltools [plr] -- Gives all the tools you have in your backpack to the player',
	'[112] age [plr] -- Makes you chat the account age of the player',
	'[113] id [plr] -- Makes you chat the account ID of the player',
	'[114] .age [plr] -- Privately shows you the account age of the player',
	'[115] .id [plr] -- Privately shows you the account ID of the player',
	'[116] gameid -- Shows the game ID',
	'[117] removeinvis -- Removes all invisible walls/parts, client sided',
	'[118] removefog -- Removes fog, client sided',
	'[119] disable -- Disables your character by removing humanoid',
	'[120] enable -- Enables your character by adding humanoid',
	'[121] prefix [key] -- Changes the prefix used, default is ;',
	'[122] ;resetprefix -- Resets the prefix to ; incase you change it to an unusable prefix. Say exactly ";resetprefix" to do this command, no matter what your prefix is set to.',
	'[123] flyspeed [num] -- Change your fly speed, default is 1',
	'[124] carpet [plr] -- Makes you a carpet for a player, will not work if FE Godmode is on',
	'[125] uncarpet -- Stops carpet player',
	'[126] stare [plr] -- Turns your character to stare at another player',
	'[127] unstare -- Stops stare player',
	'[128] logchat -- Logs all chat (including /e and whispers) of all players',
	'[129] unlogchat -- Disables logchat',
	'[130] fixcam -- Fixes/resets your camera',
	'[131] unstate -- Stops changing state',
}
speedget = 1

lplayer = game:GetService("Players").LocalPlayer

lplayer.CharacterAdded:Connect(function(character)
	spin = false
	flying = false
	staring = false
	banpl = false
end)

function change()
	prefix = prefix
	speedfly = speedfly
end

function GetPlayer(String) -- Credit to Timeless/xFunnieuss
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= lplayer.Name then
                table.insert(Found,v)
            end
        end   
	elseif strl == "me" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name == lplayer.Name then
                table.insert(Found,v)
            end
        end  
    else
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found,v)
            end
        end    
    end
    return Found    
end

local Mouse = lplayer:GetMouse()

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
removingmeshhats = false
removingmeshtool = false
clickdel = false
staring = false
chatlogs = false
banpl = false
changingstate = false
statechosen = 0

adminversion = "Reviz Admin by illremember, Version 2.0"

flying = false
speedfly = 1

function plrchat(plr, chat)
print(plr.Name..": "..tick().."\n"..chat)
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(chat)
if chatlogs then
plrchat(v, chat)
end
end)
end
game:GetService("Players").PlayerAdded:connect(function(plr)
plr.Chatted:connect(function(chat)
if chatlogs then
plrchat(plr, chat)
end
end)
end)


local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local CMDBAR = Instance.new("TextBox")
ScreenGui.Parent = game:GetService("CoreGui")
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

local CMDS = Instance.new("ScreenGui")
local CMDSFRAME = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local TextLabel = Instance.new("TextLabel")
local closegui = Instance.new("TextButton")
CMDS.Name = "CMDS"
CMDS.Parent = game:GetService("CoreGui")
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
TextLabel.Text = "[-] cmdbar is shown when ; is pressed.,\n[1] kill [plr] -- You need a tool! Will kill the player, use rkill to kill you and player,\n[2] bring [plr] -- You need a tool! Will bring player to you,\n[3] spin [plr] -- You need a tool! Makes you and the player spin crazy,\n[4] unspin -- Use after using spin cmd and dying, so you stop loop teleporting,\n[5] attach [plr] -- You need a tool! Attaches you to player,\n[6] unattach [plr] -- Attempts to unattach you from a player,\n[7] follow [plr] -- Makes you follow behind the player,\n[8] unfollow,\n[9] freefall [plr] -- You need a tool! Teleports you and the player up into the air,\n[10] trail [plr] -- The opposite of follow, you stay infront of player,\n[11] untrail,\n[12] orbit [plr] -- Makes you orbit the player,\n[13] unorbit,\n[14] fling [plr] -- Makes you fling the player,\n[15] unfling,\n[16] fecheck -- Checks if the game is FE or not,\n[17] void [plr] -- Teleports player to the void,\n[18] noclip -- Gives you noclip to walk through walls,\n[19] clip -- Removes noclip,\n[20] speed [num]/ws [num] -- Changes how fast you walk 16 is default,\n[21] jumppower [num]/jp [num] -- Changes how high you jump 50 is default,\n[22] hipheight [num]/hh [num] -- Changes how high you float 0 is default,\n[23] default -- Changes your speed, jumppower and hipheight to default values,\n[24] annoy [plr] -- Loop teleports you to the player,\n[25] unannoy,\n[26] headwalk [plr] -- Loop teleports you to the player head,\n[27] unheadwalk,\n[28] nolimbs -- Removes your arms and legs,\n[29] god -- Gives you FE Godmode,\n[30] drophats -- Drops your accessories,\n[31] droptool -- Drops any tool you have equipped,\n[32] loopdhats -- Loop drops your accessories,\n[33] unloopdhats,\n[34] loopdtool -- Loop drops any tools you have equipped,\n[35] unloopdtool,\n[36] invisible -- Gives you invisibility CREDIT TO TIMELESS,\n[37] view [plr] -- Changes your camera to the player character,\n[38] unview,\n[39] goto [plr] -- Teleports you to player,\n[40] fly -- Allows you to fly,\n[41] unfly,\n[42] chat [msg] -- Makes you chat a message,\n[43] spam [msg] -- Spams a message,\n[44] unspam,\n[45] spamwait [num] -- Changes delay of chatting a message for the spam command in seconds default is 1 second,\n[46] pmspam [plr] -- Spams a player in private message,\n[47] unpmspam,\n[48] cfreeze [plr] -- Freezes a player on your client, they will only be frozen for you,\n[49] uncfreeze [plr],\n[50] unlockws -- Unlocks the workspace,\n[51] lockws -- Locks the workspace,\n[52] btools -- Gives you btools that will only show to you useful for deleting certain blocks only for you,\n[53] pstand -- Enables platform stand,\n[54] unpstand -- Disables platform stand,\n[55] blockhead -- Removes your head mesh,\n[56] sit,\n[57] bringobj [obj] -- Only shows on client, brings an object/part to you constantly, can be used to bring healing parts, weapons, money etc, type in exact name,\n[58] wsvis [num] -- Changes visibility of workspace parts, num should be between 0 and 1, only shows client sided,\n[59] hypertotal -- Loads in my FE GUI Hypertotal,\n[60] cmds -- Prints all commands,\n[61] rmeshhats/blockhats -- Removes the meshes of all your accessories aka block hats,\n[62] rmeshtool/blocktool -- Removes the mesh of the tool you have equipped aka block tool,\n[63] spinner -- Makes you spin,\n[64] nospinner,\n[65] reach [num] -- Gives you reach, mostly used for swords, say ;reachd for default and enter number after for custom,\n[66] noreach -- Removes reach, must have tool equipped,\n[67] rkill [plr] -- Kills you and the player, use kill to just kill the player without dying,\n[68] tp me [plr] -- Alternative to goto,\n[69] cbring [plr] -- Brings player infront of you, shows only on client, allows you to do damage to player,\n[70] uncbring,\n[71] swap [plr] -- You need a tool! Swaps players position with yours and your position with players,\n[72] givetool [plr] -- Gives the tool you have equipped to the player,\n[73] glitch [plr] -- Glitches you and the player, looks very cool,\n[74] unglitch -- Unglitches you,\n[75] grespawn -- Alternative to normal respawn and usually works best for when you want to reset with FE Godmode,\n[76] explorer -- Loads up DEX,\n[77] reset -- Resets your character.,\n[78] anim [id] -- Applies an animation on you, must be created by ROBLOX,\n[79] animgui -- Loads up Energize animations GUI,\n[80] savepos -- Saves your current position,\n[81] loadpos -- Teleports you to your saved position,\n[82] bang [plr] -- 18+,\n[83] unbang,\n[84] delcmdbar -- Removes the command bar completely,\n[85] bringmod [obj] -- Brings all the parts in a model, client only, comes from ;bringobj enter exact name of model,\n[86] shutdown -- Uses harkinians script to shutdown server,\n[87] respawn -- If grespawn doesnt work you can use respawn,\n[88] delobj [obj] -- Deletes a certain brick in workspace, client sided,\n[89] getplrs -- Prints all players in game,\n[90] deldecal -- Deletes all decals client sided,\n[91] opfinality -- Loads in my FE GUI Opfinality,\n[92] remotes -- Prints all remotes in the game in the console when added,\n[93] noremotes -- Stops printing remotes,\n[94] tpdefault -- Stops all loop teleports to a player,\n[95] stopsit -- Will not allow you to sit,\n[96] gosit -- Allows you to sit,\n[97] clicktp -- Enables click tp,\n[98] noclicktp -- Disables click tp,\n[99] toolson -- If any tools are dropped in the workspace you will automatically get them,\n[100] toolsoff -- Stops ;toolson,\n[101] version -- Gets the admin version, \n This list of commands is NOT showing everything, go to my thread in the pastebin link to see ALL commands."
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
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[spinplr.Name].Character.HumanoidRootPart.CFrame
	end
	if followed then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[flwplr.Name].Character.HumanoidRootPart.CFrame + game:GetService("Players")[flwplr.Name].Character.HumanoidRootPart.CFrame.lookVector * -5
	end
	if traill then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[trlplr.Name].Character.HumanoidRootPart.CFrame + game:GetService("Players")[trlplr.Name].Character.HumanoidRootPart.CFrame.lookVector * 5
	end
	if annoying then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[annplr.Name].Character.HumanoidRootPart.CFrame
	end
	if hwalk then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[hdwplr.Name].Character.HumanoidRootPart.CFrame + Vector3.new(0, 4, 0)
	end
	if staring then
		lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(lplayer.Character.Torso.Position, game:GetService("Players")[stareplr.Name].Character.Torso.Position)
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if noclip then
		if lplayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
			lplayer.Character.Head.CanCollide = false
			lplayer.Character.Torso.CanCollide = false
			lplayer.Character["Left Leg"].CanCollide = false
			lplayer.Character["Right Leg"].CanCollide = false
		else
			lplayer.Character.Humanoid:ChangeState(11)
		end
	end
	if changingstate then
		lplayer.Character.Humanoid:ChangeState(statechosen)
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if droppinghats then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Parent = workspace
			end
		end
	end
	if droppingtools then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Parent = workspace
			end
		end
	end
	if removingmeshhats then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if removingmeshtool then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if banpl then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[bplrr].Character.HumanoidRootPart.CFrame
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if stopsitting then
		lplayer.Character.Humanoid.Sit = false
	end
end)

plr = lplayer 
hum = plr.Character.HumanoidRootPart
mouse = plr:GetMouse() 
mouse.KeyDown:connect(function(key) 
	if key == "e" then 
		if mouse.Target then 
			if clickgoto then
				hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
			elseif clickdel then
				mouse.Target:Destroy()
			end
		end 
	end
end)

game:GetService("Workspace").ChildAdded:connect(function(part)
	if gettingtools then
		if part:IsA("Tool") then
			part.Handle.CFrame = lplayer.Character.HumanoidRootPart.CFrame
		end
	end
end)

lplayer.Chatted:Connect(function(msg)
	if string.sub(msg, 1, 6) == (prefix.."kill ") then
		if string.sub(msg, 7) == "me" then
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(100000,0,100000)
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 7)))do
				local NOW = lplayer.Character.HumanoidRootPart.CFrame
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				local function tp(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				wait(0.1)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.5)
				lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
				wait(0.7)
				tp(lplayer,game:GetService("Players")[v.Name])
				wait(0.7)
				lplayer.Character.HumanoidRootPart.CFrame = NOW
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."bring ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8)))do
			local NOW = lplayer.Character.HumanoidRootPart.CFrame
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
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
			tp(game:GetService("Players")[v.Name], lplayer)
			wait(0.2)
			tp(game:GetService("Players")[v.Name], lplayer)
			wait(0.5)
			lplayer.Character.HumanoidRootPart.CFrame = NOW
			wait(0.5)
			getout(lplayer, game:GetService("Players")[v.Name])
			wait(0.3)
			lplayer.Character.HumanoidRootPart.CFrame = NOW
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 6) == (prefix.."spin ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			lplayer.Character.Animate.Disabled = false
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
			spinplr = v
			wait(0.5)
			spin = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."unspin") then
		spin = false
	end
	if string.sub(msg, 1, 8) == (prefix.."attach ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
			wait(0.3)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
			attplr = v
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."unattach ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 11))) do
			local function getout(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1:MoveTo(char2.Head.Position)
			end
			end
			getout(lplayer, game:GetService("Players")[v.Name])
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
			local NOW = lplayer.Character.HumanoidRootPart.CFrame
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.6)
			lplayer.Character.HumanoidRootPart.CFrame = NOW
			wait(0.6)
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,50000,0)
			game:GetService("StarterGui"):SetCore("SendNotification", {
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
			lplayer.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
				local o = Instance.new("RocketPropulsion")
				o.Parent = lplayer.Character.HumanoidRootPart
				o.Name = "Orbit"
				o.Target = game:GetService("Players")[v.Name].Character.HumanoidRootPart
				o:Fire()
				noclip = true
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."unorbit") then
		lplayer.Character.HumanoidRootPart.Orbit:Destroy()
		noclip = false
	end
	if string.sub(msg, 1, 7) == (prefix.."fling ") then
		if string.sub(msg, 8) == "all" or string.sub(msg, 8) == "others" or string.sub(msg, 8) == "me" then
			lplayer.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
				local y = Instance.new("RocketPropulsion")
				y.Parent = lplayer.Character.HumanoidRootPart
				y.CartoonFactor = 1
				y.MaxThrust = 800000
				y.MaxSpeed = 1000
				y.ThrustP = 200000
				y.Name = "Fling"
				game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Head
				y.Target = game:GetService("Players")[v.Name].Character.HumanoidRootPart
				y:Fire()
				noclip = true
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."unfling") then
		noclip = false
		lplayer.Character.HumanoidRootPart.Fling:Destroy()
		game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Head
		wait(0.4)
		lplayer.Character.HumanoidRootPart.Fling:Destroy()
	end
	if string.sub(msg, 1, 8) == (prefix.."fecheck") then
		if game:GetService("Workspace").FilteringEnabled == true then
			warn("FE is Enabled (Filtering Enabled)")
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "FE is Enabled";
				Text = "Filtering Enabled. Enjoy using Reviz Admin!";
			})
		else
			warn("FE is Disabled (Filtering Disabled) Consider using a different admin script.")
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "FE is Disabled";
				Text = "Filtering Disabled. Consider using a different admin script.";
			})
		end
	end
	if string.sub(msg, 1, 6) == (prefix.."void ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.6)
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(999999999999999,0,999999999999999)
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."noclip") then
		noclip = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Noclip enabled";
		Text = "Type ;clip to disable";
		})
	end
	if string.sub(msg, 1, 5) == (prefix.."clip") then
		noclip = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Noclip disabled";
		Text = "Type ;noclip to enable";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."speed ") then
		lplayer.Character.Humanoid.WalkSpeed = (string.sub(msg, 8))
	end
	if string.sub(msg, 1, 4) == (prefix.."ws ") then
		lplayer.Character.Humanoid.WalkSpeed = (string.sub(msg, 5))
	end
	if string.sub(msg, 1, 11) == (prefix.."hipheight ") then
		lplayer.Character.Humanoid.HipHeight = (string.sub(msg, 12))
	end
	if string.sub(msg, 1, 4) == (prefix.."hh ") then
		lplayer.Character.Humanoid.HipHeight = (string.sub(msg, 5))
	end
	if string.sub(msg, 1, 11) == (prefix.."jumppower ") then
		lplayer.Character.Humanoid.JumpPower = (string.sub(msg, 12))
	end
	if string.sub(msg, 1, 4) == (prefix.."jp ") then
		lplayer.Character.Humanoid.JumpPower = (string.sub(msg, 5))
	end
	if string.sub(msg, 1, 8) == (prefix.."default") then
		lplayer.Character.Humanoid.JumpPower = 50
		lplayer.Character.Humanoid.WalkSpeed = 16
		lplayer.Character.Humanoid.HipHeight = 0
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
		lplayer.Character["Left Leg"]:Destroy()
		lplayer.Character["Left Arm"]:Destroy()
		lplayer.Character["Right Leg"]:Destroy()
		lplayer.Character["Right Arm"]:Destroy()
	end
	if string.sub(msg, 1, 4) == (prefix.."god") then
		lplayer.Character.Humanoid.Name = 1
		local l = lplayer.Character["1"]:Clone()
		l.Parent = lplayer.Character
		l.Name = "Humanoid"
		wait(0.1)
		lplayer.Character["1"]:Destroy()
		game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
		lplayer.Character.Animate.Disabled = true
		wait(0.1)
		lplayer.Character.Animate.Disabled = false
		lplayer.Character.Humanoid.DisplayDistanceType = "None"
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "FE Godmode enabled";
		Text = "Use ;grespawn or ;respawn to remove";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."drophats") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Parent = workspace
			end
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."droptool") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Parent = workspace
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."loopdhats") then
		droppinghats = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Loop Drop Enabled";
		Text = "Type ;unloopdhats to disable";
		})
	end
	if string.sub(msg, 1, 12) == (prefix.."unloopdhats") then
		droppinghats = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Loop Drop Disabled";
		Text = "Type ;loopdhats to enable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."loopdtool") then
		droppingtools = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Loop Drop Enabled";
		Text = "Type ;unloopdtool to disable";
		})
	end
	if string.sub(msg, 1, 12) == (prefix.."unloopdtool") then
		droppingtools = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
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
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Invisibility enabled!";
		Text = "Reset or use ;respawn to remove.";
		})
	end
	if string.sub(msg, 1, 6) == (prefix.."view ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			if game:GetService("Players")[v.Name].Character.Humanoid then
				game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Humanoid
			else
				game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Head
			end
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."unview") then
		if lplayer.Character.Humanoid then
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Humanoid
		else
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Head
		end
	end
	if string.sub(msg, 1, 6) == (prefix.."goto ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
		end
	end
	if string.sub(msg, 1, 4) == (prefix.."fly") then
	repeat wait() until lplayer and lplayer.Character and lplayer.Character:FindFirstChild('HumanoidRootPart') and lplayer.Character:FindFirstChild('Humanoid')
	repeat wait() until Mouse
	
	local T = lplayer.Character.HumanoidRootPart
	local CONTROL = {F = 0, B = 0, L = 0, R = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
	local SPEED = speedget
	
	local function fly()
		flying = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0.1, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
		repeat wait()
		lplayer.Character.Humanoid.PlatformStand = true
		if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
		SPEED = 50
		elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
		SPEED = 0
		end
		if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
		BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
		lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
		elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
		BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
		else
		BV.velocity = Vector3.new(0, 0.1, 0)
		end
		BG.cframe = workspace.CurrentCamera.CoordinateFrame
				until not flying
				CONTROL = {F = 0, B = 0, L = 0, R = 0}
				lCONTROL = {F = 0, B = 0, L = 0, R = 0}
				SPEED = 0
				BG:destroy()
				BV:destroy()
				lplayer.Character.Humanoid.PlatformStand = false
			end)
		end
	Mouse.KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = speedfly
		elseif KEY:lower() == 's' then
			CONTROL.B = -speedfly
		elseif KEY:lower() == 'a' then
			CONTROL.L = -speedfly 
		elseif KEY:lower() == 'd' then 
			CONTROL.R = speedfly
		end
	end)
	Mouse.KeyUp:connect(function(KEY)
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
	fly()
	end
	if string.sub(msg, 1, 6) == (prefix.."unfly") then
		flying = false
		lplayer.Character.Humanoid.PlatformStand = false
	end
	if string.sub(msg, 1, 6) == (prefix.."chat ") then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer((string.sub(msg, 7)), "All")
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
		local a = game:GetService("Workspace"):getChildren()
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
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Success!";
		Text = "Workspace unlocked. Use ;lockws to lock.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."lockws") then
		local a = game:GetService("Workspace"):getChildren()
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
		local Clone_T = Instance.new("HopperBin",lplayer.Backpack)
		Clone_T.BinType = "Clone"
		local Destruct = Instance.new("HopperBin",lplayer.Backpack)
		Destruct.BinType = "Hammer"
		local Hold_T = Instance.new("HopperBin",lplayer.Backpack)
		Hold_T.BinType = "Grab"
	end
	if string.sub(msg, 1, 7) == (prefix.."pstand") then
		lplayer.Character.Humanoid.PlatformStand = true
	end
	if string.sub(msg, 1, 9) == (prefix.."unpstand") then
		lplayer.Character.Humanoid.PlatformStand = false
	end
	if string.sub(msg, 1, 10) == (prefix.."blockhead") then
		lplayer.Character.Head.Mesh:Destroy()
	end
	if string.sub(msg, 1, 4) == (prefix.."sit") then
		lplayer.Character.Humanoid.Sit = true
	end
	if string.sub(msg, 1, 10) == (prefix.."bringobj ") then
		local function bringobjw()
		for i,obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		if obj.Name == (string.sub(msg, 11)) then
		obj.CFrame = lplayer.Character.HumanoidRootPart.CFrame
		obj.CanCollide = false
		obj.Transparency = 0.7
		wait()
		obj.CFrame = lplayer.Character["Left Leg"].CFrame
		wait()
		obj.CFrame = lplayer.Character["Right Leg"].CFrame
		wait()
		obj.CFrame = lplayer.Character["Head"].CFrame
		end
		end
		end
		while wait() do
			bringobjw()
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "BringObj";
		Text = "BringObj enabled.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."wsvis ") then
		vis = (string.sub(msg, 8))
		local a = game:GetService("Workspace"):GetDescendants()
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
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Success!";
		Text = "HyperTotal GUI Loaded!";
		})
	end
	if string.sub(msg, 1, 5) == (prefix.."cmds") then
		CMDSFRAME.Visible = true
	end
	if string.sub(msg, 1, 10) == (prefix.."rmeshhats") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."blockhats") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."rmeshtool") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."blocktool") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."spinner") then
		local p = Instance.new("RocketPropulsion")
		p.Parent = lplayer.Character.HumanoidRootPart
		p.Name = "Spinner"
		p.Target = lplayer.Character["Left Arm"]
		p:Fire()
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Spinner enabled";
		Text = "Type ;nospinner to disable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."nospinner") then
		lplayer.Character.HumanoidRootPart.Spinner:Destroy()
	end
	if string.sub(msg, 1, 7) == (prefix.."reachd") then
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				local a = Instance.new("SelectionBox",v.Handle)
				a.Adornee = v.Handle
				v.Handle.Size = Vector3.new(0.5,0.5,60)
				v.GripPos = Vector3.new(0,0,0)
				lplayer.Character.Humanoid:UnequipTools()
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Reach applied!";
		Text = "Applied to equipped sword. Use ;noreach to disable.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."reach ") then
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				handleSize = v.Handle.Size
				wait()
				local a = Instance.new("SelectionBox",v.Handle)
				a.Name = "a"
				a.Adornee = v.Handle
				v.Handle.Size = Vector3.new(0.5,0.5,(string.sub(msg, 8)))
				v.GripPos = Vector3.new(0,0,0)
				lplayer.Character.Humanoid:UnequipTools()
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Reach applied!";
		Text = "Applied to equipped sword. Use ;noreach to disable.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."noreach") then
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				v.Handle.a:Destroy()
				v.Handle.Size = handleSize
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Reach removed!";
		Text = "Removed reach from equipped sword.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."rkill ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8)))do
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			wait(0.1)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.5)
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."tp me ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
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
			local NOWPLR = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			local NOW = lplayer.Character.HumanoidRootPart.CFrame
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			local function tp(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1:MoveTo(char2.Head.Position)
			end
			end
			wait(0.1)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.5)
			lplayer.Character.HumanoidRootPart.CFrame = NOW
			wait(0.6)
			tp(lplayer, game:GetService("Players")[v.Name])
			wait(0.4)
			lplayer.Character.HumanoidRootPart.CFrame = NOWPLR
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."glitch ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
			wait(0.3)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
			wait(0.4)
			b = Instance.new("BodyForce")
			b.Parent = lplayer.Character.HumanoidRootPart
			b.Name = "Glitch"
			b.Force = Vector3.new(100000000,5000,0)
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."unglitch") then
		lplayer.Character.HumanoidRootPart.Glitch:Destroy()
		lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(10000,0,10000)
		b = Instance.new("BodyForce")
		b.Parent = lplayer.Character.HumanoidRootPart
		b.Name = "unGlitch"
		b.Force = Vector3.new(0,-5000000,0)
		wait(2)
		lplayer.Character.HumanoidRootPart.unGlitch:Destroy()
	end
	if string.sub(msg, 1, 9) == (prefix.."grespawn") then
		lplayer.Character.Humanoid.Health = 0
		wait(1)
		lplayer.Character.Head.CFrame = CFrame.new(1000000,0,1000000)
		lplayer.Character.Torso.CFrame = CFrame.new(1000000,0,1000000)
	end
	if string.sub(msg, 1, 9) == (prefix.."explorer") then
		loadstring(game:GetObjects("rbxassetid://492005721")[1].Source)()
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Success!";
		Text = "DEX Explorer has loaded.";
		})
	end
	if string.sub(msg, 1, 6) == (prefix.."anim ") then
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://"..(string.sub(msg, 7))
		local track = lplayer.Character.Humanoid:LoadAnimation(Anim)
		track:Play(.1, 1, 1)
	end
	if string.sub(msg, 1, 8) == (prefix.."animgui") then
		loadstring(game:GetObjects("rbxassetid://1202558084")[1].Source)()
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Success!";
		Text = "Energize Animations GUI has loaded.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."savepos") then
		saved = lplayer.Character.HumanoidRootPart.CFrame
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Position Saved";
		Text = "Use ;loadpos to return to saved position.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."loadpos") then
		lplayer.Character.HumanoidRootPart.CFrame = saved
	end
	if string.sub(msg, 1, 6) == (prefix.."bang ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			local Anim2 = Instance.new("Animation")
			Anim2.AnimationId = "rbxassetid://148840371"
			local track2 = lplayer.Character.Humanoid:LoadAnimation(Anim2)
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
		for i,obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		if obj.Name == (string.sub(msg, 11)) then
		for i,ch in pairs(obj:GetDescendants()) do
		if (ch:IsA("BasePart")) then
		ch.CFrame = lplayer.Character.HumanoidRootPart.CFrame
		ch.CanCollide = false
		ch.Transparency = 0.7
		wait()
		ch.CFrame = lplayer.Character["Left Leg"].CFrame
		wait()
		ch.CFrame = lplayer.Character["Right Leg"].CFrame
		wait()
		ch.CFrame = lplayer.Character["Head"].CFrame
		end
		end
		end
		end
		end
		while wait() do
			bringmodw()
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "BringMod";
		Text = "BringMod enabled.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."respawn") then
		local mod = Instance.new('Model', workspace) mod.Name = 're '..lplayer.Name
		local hum = Instance.new('Humanoid', mod)
		local ins = Instance.new('Part', mod) ins.Name = 'Torso' ins.CanCollide = false ins.Transparency = 1
		lplayer.Character = mod
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
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Attempting Shutdown";
		Text = "Shutdown Attempt has begun.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."delobj ") then
		objtodel = (string.sub(msg, 9))
		for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v.Name == objtodel then
				v:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."getplrs") then
		for i,v in pairs(game:GetService("Players"):GetPlayers())do
			print(v)
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Printed";
		Text = "Players have been printed to console. (F9)";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."deldecal") then
		for i,v in pairs(game:GetService("Workspace"):GetDescendants())do
			if (v:IsA("Decal")) then
				v:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 11) == (prefix.."opfinality") then
		loadstring(game:GetObjects("rbxassetid://1294358929")[1].Source)()
		game:GetService("StarterGui"):SetCore("SendNotification", {
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
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Printing Remotes";
		Text = "Type ;noremotes to disable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."noremotes") then
		remotes = false
		added = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
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
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Version";
		Text = adminversion;
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."clicktp") then
		clickgoto = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Click TP";
		Text = "Press E to teleport to mouse position, ;noclicktp to stop";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."clickdel") then
		clickdel = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Click Delete";
		Text = "Press E to delete part at mouse, ;noclickdel to stop";
		})
	end
	if string.sub(msg, 1, 11) == (prefix.."noclickdel") then
		clickdel = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Click Delete";
		Text = "Click delete has been disabled.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."noclicktp") then
		clickgoto = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Click TP";
		Text = "Click TP has been disabled.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."toolson") then
		gettingtools = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Tools Enabled";
		Text = "Automatically colleting tools dropped.";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."toolsoff") then
		gettingtools = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Tools Disabled";
		Text = "Click TP has been disabled.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."delcmdbar") then
		ScreenGui:Destroy()
	end
	if string.sub(msg, 1, 6) == (prefix.."reset") then
		lplayer.Character.Head:Destroy()
	end
	if string.sub(msg, 1, 7) == (prefix.."state ") then
		statechosen = string.sub(msg, 8)
		changingstate = true
	end
	if string.sub(msg, 1, 9) == (prefix.."gravity ") then
		game:GetService("Workspace").Gravity = string.sub(msg, 10)
	end
	if string.sub(msg, 1, 10) == (prefix.."looprhats") then
		removingmeshhats = true
	end
	if string.sub(msg, 1, 12) == (prefix.."unlooprhats") then
		removingmeshhats = false
	end
	if string.sub(msg, 1, 10) == (prefix.."looprtool") then
		removingmeshtool = true
	end
	if string.sub(msg, 1, 12) == (prefix.."unlooprtool") then
		removingmeshtool = false
	end
	if string.sub(msg, 1, 10) == (prefix.."givetool ") then
		for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
			if v:IsA("Tool") then
				for i,player in pairs(GetPlayer(string.sub(msg, 11))) do
					v.Parent = player.Character
				end
			end
		end
	end
	if string.sub(msg, 1, 14) == (prefix.."givealltools ") then
		for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
			if v:IsA("Tool") then
				v.Parent = lplayer.Character
				wait()
				for i,player in pairs(GetPlayer(string.sub(msg, 15))) do
					v.Parent = player.Character
				end
			end
		end
	end
	if string.sub(msg, 1, 5) == (prefix.."age ") then
		for i,player in pairs(GetPlayer(string.sub(msg, 6))) do
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.Name.." Account Age: "..player.AccountAge.." days!", "All")
		end
	end
	if string.sub(msg, 1, 4) == (prefix.."id ") then
		for i,player in pairs(GetPlayer(string.sub(msg, 5))) do
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.Name.." Account ID: "..player.UserId, "All")
		end
	end
	if string.sub(msg, 1, 6) == (prefix..".age ") then
		for i,player in pairs(GetPlayer(string.sub(msg, 7))) do
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = player.AccountAge.." Days";
			Text = "Account age of "..player.Name;
			})
		end
	end
	if string.sub(msg, 1, 5) == (prefix..".id ") then
		for i,player in pairs(GetPlayer(string.sub(msg, 6))) do
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = player.UserId.." ID";
			Text = "Account ID of "..player.Name;
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."gameid") then
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Game ID";
		Text = "Game ID: ".. game.GameId;
		})
	end
	if string.sub(msg, 1, 4) == (prefix.."pgs") then
		local pgscheck = game:GetService("Workspace"):PGSIsEnabled()
		if pgscheck == true then
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "PGSPhysicsSolverEnabled";
			Text = "PGS is Enabled!";
			})
		else
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "PGSPhysicsSolverEnabled";
			Text = "PGS is Disabled!";
			})
		end
	end
	if string.sub(msg, 1, 12) == (prefix.."removeinvis") then
		for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v:IsA("Part") then
				if v.Transparency == 1 then
					if v.Name ~= "HumanoidRootPart" then
						v:Destroy()
					end
				end
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."removefog") then
		game:GetService("Lighting").FogStart = 0
		game:GetService("Lighting").FogEnd = 9999999999999
	end
	if string.sub(msg, 1, 8) == (prefix.."disable") then
		lplayer.Character.Humanoid.Parent = lplayer
	end
	if string.sub(msg, 1, 7) == (prefix.."enable") then
		lplayer.Humanoid.Parent = lplayer.Character
	end
	if string.sub(msg, 1, 8) == (prefix.."prefix ") then
		prefix = (string.sub(msg, 9, 9))
		wait(0.1)
		change()
		wait(0.1)
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Prefix changed!";
		Text = "Prefix is now "..prefix..". Use ;resetprefix to reset to ;";
		})
	end
	if string.sub(msg, 1, 12) == (";resetprefix") then
		prefix = ";"
		wait(0.1)
		change()
		wait(0.1)
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Prefix changed!";
		Text = "Prefix is now "..prefix..". Make sure it's one key!";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."flyspeed ") then
		speedfly = string.sub(msg, 11)
		wait()
		change()
	end
	if string.sub(msg, 1, 8) == (prefix.."carpet ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			local Anim3 = Instance.new("Animation")
			Anim3.AnimationId = "rbxassetid://282574440"
			local track3 = lplayer.Character.Humanoid:LoadAnimation(Anim3)
			track3:Play(.1, 1, 1)
			bplrr = v.Name
			banpl = true
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."uncarpet") then
		banpl = false
	end
	if string.sub(msg, 1, 7) == (prefix.."stare ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
			staring = true
			stareplr = v
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."unstare") then
		staring = false
	end
	if string.sub(msg, 1, 8) == (prefix.."logchat") then
		chatlogs = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "LogChat enabled";
		Text = "Now logging all player chat.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."unlogchat") then
		chatlogs = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "LogChat disabled";
		Text = "Stopped logging all player chat.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."fixcam") then
		game:GetService("Workspace").CurrentCamera:Destroy()
		wait(0.1)
		game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Humanoid
		game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
		lplayer.CameraMinZoomDistance = 0.5
		lplayer.CameraMaxZoomDistance = 400
		lplayer.CameraMode = "Classic"
	end
	if string.sub(msg, 1, 8) == (prefix.."unstate") then
		changingstate = false
	end
end)

local function tp()
	for i, player in ipairs(game:GetService("Players"):GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			if player.Name == brplr then
				player.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame + lplayer.Character.HumanoidRootPart.CFrame.lookVector * 2
			end
		end
	end
end
local function tpall()
	for i, player in ipairs(game:GetService("Players"):GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame + lplayer.Character.HumanoidRootPart.CFrame.lookVector * 3
		end
	end
end
spawn(function()
	while wait(spamdelay) do
		if spamming == true then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(spamtext, "All")
		end
	end
end)
spawn(function()
	while wait(spamdelay) do
		if spammingpm == true then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..pmspammed.." @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@", "All")
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

Mouse.KeyDown:connect(function(Key)
	if Key == prefix then
		CMDBAR:CaptureFocus()
	end
end)

CMDBAR.FocusLost:connect(function(enterPressed)
	if enterPressed then
		if string.sub(CMDBAR.Text, 1, 5) == ("kill ") then
			if string.sub(CMDBAR.Text, 6) == "me" then
				lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(100000,0,100000)
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6)))do
					local NOW = lplayer.Character.HumanoidRootPart.CFrame
					lplayer.Character.Humanoid.Name = 1
					local l = lplayer.Character["1"]:Clone()
					l.Parent = lplayer.Character
					l.Name = "Humanoid"
					wait(0.1)
					lplayer.Character["1"]:Destroy()
					game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
					lplayer.Character.Animate.Disabled = true
					wait(0.1)
					lplayer.Character.Animate.Disabled = false
					lplayer.Character.Humanoid.DisplayDistanceType = "None"
					for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
					lplayer.Character.Humanoid:EquipTool(v)
					end
					local function tp(player,player2)
					local char1,char2=player.Character,player2.Character
					if char1 and char2 then
					char1:MoveTo(char2.Head.Position)
					end
					end
					wait(0.1)
					lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
					wait(0.2)
					lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
					wait(0.5)
					lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
					wait(0.7)
					tp(lplayer,game:GetService("Players")[v.Name])
					wait(0.7)
					lplayer.Character.HumanoidRootPart.CFrame = NOW
					game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Tools needed!";
					Text = "You need a tool in your backpack for this command!";
					})
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("bring ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7)))do
				local NOW = lplayer.Character.HumanoidRootPart.CFrame
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
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
				tp(game:GetService("Players")[v.Name], lplayer)
				wait(0.2)
				tp(game:GetService("Players")[v.Name], lplayer)
				wait(0.5)
				lplayer.Character.HumanoidRootPart.CFrame = NOW
				wait(0.5)
				getout(lplayer, game:GetService("Players")[v.Name])
				wait(0.3)
				lplayer.Character.HumanoidRootPart.CFrame = NOW
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("spin ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
				spinplr = v
				wait(0.5)
				spin = true
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("unspin") then
			spin = false
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("attach ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
				wait(0.3)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
				attplr = v
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("unattach ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 10))) do
				local function getout(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				getout(lplayer, game:GetService("Players")[v.Name])
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
				local NOW = lplayer.Character.HumanoidRootPart.CFrame
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.6)
				lplayer.Character.HumanoidRootPart.CFrame = NOW
				wait(0.6)
				lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,50000,0)
				game:GetService("StarterGui"):SetCore("SendNotification", {
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
				lplayer.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
					local o = Instance.new("RocketPropulsion")
					o.Parent = lplayer.Character.HumanoidRootPart
					o.Name = "Orbit"
					o.Target = game:GetService("Players")[v.Name].Character.HumanoidRootPart
					o:Fire()
					noclip = true
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unorbit") then
			lplayer.Character.HumanoidRootPart.Orbit:Destroy()
			noclip = false
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("fling ") then
			if string.sub(CMDBAR.Text, 7) == "all" or string.sub(CMDBAR.Text, 7) == "others" or string.sub(CMDBAR.Text, 7) == "me" then
				lplayer.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
					local y = Instance.new("RocketPropulsion")
					y.Parent = lplayer.Character.HumanoidRootPart
					y.CartoonFactor = 1
					y.MaxThrust = 800000
					y.MaxSpeed = 1000
					y.ThrustP = 200000
					y.Name = "Fling"
					game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Head
					y.Target = game:GetService("Players")[v.Name].Character.HumanoidRootPart
					y:Fire()
					noclip = true
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unfling") then
			noclip = false
			lplayer.Character.HumanoidRootPart.Fling:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Head
			wait(0.4)
			lplayer.Character.HumanoidRootPart.Fling:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("fecheck") then
			if game:GetService("Workspace").FilteringEnabled == true then
				warn("FE is Enabled (Filtering Enabled)")
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "FE is Enabled";
					Text = "Filtering Enabled. Enjoy using Reviz Admin!";
				})
			else
				warn("FE is Disabled (Filtering Disabled) Consider using a different admin script.")
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "FE is Disabled";
					Text = "Filtering Disabled. Consider using a different admin script.";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("void ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.6)
				lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(999999999999999,0,999999999999999)
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("noclip") then
			noclip = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Noclip enabled";
			Text = "Type ;clip to disable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 4) == ("clip") then
			noclip = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Noclip disabled";
			Text = "Type ;noclip to enable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("speed ") then
			lplayer.Character.Humanoid.WalkSpeed = (string.sub(CMDBAR.Text, 7))
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("ws ") then
			lplayer.Character.Humanoid.WalkSpeed = (string.sub(CMDBAR.Text, 4))
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("hipheight ") then
			lplayer.Character.Humanoid.HipHeight = (string.sub(CMDBAR.Text, 11))
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("hh ") then
			lplayer.Character.Humanoid.HipHeight = (string.sub(CMDBAR.Text, 4))
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("jumppower ") then
			lplayer.Character.Humanoid.JumpPower = (string.sub(CMDBAR.Text, 11))
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("jp ") then
			lplayer.Character.Humanoid.JumpPower = (string.sub(CMDBAR.Text, 4))
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("default") then
			lplayer.Character.Humanoid.JumpPower = 50
			lplayer.Character.Humanoid.WalkSpeed = 16
			lplayer.Character.Humanoid.HipHeight = 0
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
			lplayer.Character["Left Leg"]:Destroy()
			lplayer.Character["Left Arm"]:Destroy()
			lplayer.Character["Right Leg"]:Destroy()
			lplayer.Character["Right Arm"]:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("god") then
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "FE Godmode enabled";
			Text = "Use ;grespawn or ;respawn to remove.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("drophats") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Accessory")) or (v:IsA("Hat")) then
					v.Parent = workspace
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("droptool") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Tool")) then
					v.Parent = workspace
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("loopdhats") then
			droppinghats = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Loop Drop Enabled";
			Text = "Type ;unloopdhats to disable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("unloopdhats") then
			droppinghats = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Loop Drop Disabled";
			Text = "Type ;loopdhats to enable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("loopdtool") then
			droppingtools = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Loop Drop Enabled";
			Text = "Type ;unloopdtool to disable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("unloopdtool") then
			droppingtools = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
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
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Invisibility enabled!";
			Text = "Reset or use ;respawn to remove.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("view ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				if game:GetService("Players")[v.Name].Character.Humanoid then
					game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Humanoid
				else
					game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Head
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("unview") then
			if lplayer.Character.Humanoid then
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Humanoid
			else
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Head
			end
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("goto ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			end
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("fly") then
		repeat wait() until lplayer and lplayer.Character and lplayer.Character:FindFirstChild('HumanoidRootPart') and lplayer.Character:FindFirstChild('Humanoid')
		repeat wait() until Mouse
		
		local T = lplayer.Character.HumanoidRootPart
		local CONTROL = {F = 0, B = 0, L = 0, R = 0}
		local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
		local SPEED = speedget
		
		local function fly()
			flying = true
			local BG = Instance.new('BodyGyro', T)
			local BV = Instance.new('BodyVelocity', T)
			BG.P = 9e4
			BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			BG.cframe = T.CFrame
			BV.velocity = Vector3.new(0, 0.1, 0)
			BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
			spawn(function()
			repeat wait()
			lplayer.Character.Humanoid.PlatformStand = true
			if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
			SPEED = 50
			elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
			SPEED = 0
			end
			if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
			BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
			lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
			elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
			BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
			else
			BV.velocity = Vector3.new(0, 0.1, 0)
			end
			BG.cframe = workspace.CurrentCamera.CoordinateFrame
					until not flying
					CONTROL = {F = 0, B = 0, L = 0, R = 0}
					lCONTROL = {F = 0, B = 0, L = 0, R = 0}
					SPEED = 0
					BG:destroy()
					BV:destroy()
					lplayer.Character.Humanoid.PlatformStand = false
				end)
			end
		Mouse.KeyDown:connect(function(KEY)
			if KEY:lower() == 'w' then
				CONTROL.F = speedfly
			elseif KEY:lower() == 's' then
				CONTROL.B = -speedfly
			elseif KEY:lower() == 'a' then
				CONTROL.L = -speedfly 
			elseif KEY:lower() == 'd' then 
				CONTROL.R = speedfly
			end
		end)
		Mouse.KeyUp:connect(function(KEY)
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
		fly()
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("unfly") then
			flying = false
			lplayer.Character.Humanoid.PlatformStand = false
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("chat ") then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer((string.sub(CMDBAR.Text, 6)), "All")
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
			local a = game:GetService("Workspace"):getChildren()
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
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Success!";
			Text = "Workspace unlocked. Use ;lockws to lock.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("lockws") then
			local a = game:GetService("Workspace"):getChildren()
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
			local Clone_T = Instance.new("HopperBin",lplayer.Backpack)
			Clone_T.BinType = "Clone"
			local Destruct = Instance.new("HopperBin",lplayer.Backpack)
			Destruct.BinType = "Hammer"
			local Hold_T = Instance.new("HopperBin",lplayer.Backpack)
			Hold_T.BinType = "Grab"
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("pstand") then
			lplayer.Character.Humanoid.PlatformStand = true
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unpstand") then
			lplayer.Character.Humanoid.PlatformStand = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("blockhead") then
			lplayer.Character.Head.Mesh:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("sit") then
			lplayer.Character.Humanoid.Sit = true
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("bringobj ") then
			local function bringobjw()
			for i,obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
			if obj.Name == (string.sub(CMDBAR.Text, 10)) then
			obj.CFrame = lplayer.Character.HumanoidRootPart.CFrame
			obj.CanCollide = false
			obj.Transparency = 0.7
			wait()
			obj.CFrame = lplayer.Character["Left Leg"].CFrame
			wait()
			obj.CFrame = lplayer.Character["Right Leg"].CFrame
			wait()
			obj.CFrame = lplayer.Character["Head"].CFrame
			end
			end
			end
			while wait() do
				bringobjw()
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "BringObj";
			Text = "BringObj enabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("wsvis ") then
			vis = (string.sub(CMDBAR.Text, 7))
			local a = game:GetService("Workspace"):GetDescendants()
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
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Success!";
			Text = "HyperTotal GUI Loaded!";
			})
		end
		if string.sub(CMDBAR.Text, 1, 4) == ("cmds") then
			CMDSFRAME.Visible = true
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("rmeshhats") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Accessory")) or (v:IsA("Hat")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("blockhats") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Accessory")) or (v:IsA("Hat")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("rmeshtool") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Tool")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("blocktool") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Tool")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("spinner") then
			local p = Instance.new("RocketPropulsion")
			p.Parent = lplayer.Character.HumanoidRootPart
			p.Name = "Spinner"
			p.Target = lplayer.Character["Left Arm"]
			p:Fire()
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Spinner enabled";
			Text = "Type ;nospinner to disable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("nospinner") then
			lplayer.Character.HumanoidRootPart.Spinner:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("reachd") then
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
				if v:isA("Tool") then
					local a = Instance.new("SelectionBox",v.Handle)
					a.Adornee = v.Handle
					v.Handle.Size = Vector3.new(0.5,0.5,60)
					v.GripPos = Vector3.new(0,0,0)
					lplayer.Character.Humanoid:UnequipTools()
				end
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
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
					lplayer.Character.Humanoid:UnequipTools()
				end
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
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
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Reach removed!";
			Text = "Removed reach from equipped sword.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("rkill ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7)))do
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				wait(0.1)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.5)
				lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("tp me ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
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
				local NOWPLR = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				local NOW = lplayer.Character.HumanoidRootPart.CFrame
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				local function tp(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				wait(0.1)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.5)
				lplayer.Character.HumanoidRootPart.CFrame = NOW
				wait(0.6)
				tp(lplayer, game:GetService("Players")[v.Name])
				wait(0.4)
				lplayer.Character.HumanoidRootPart.CFrame = NOWPLR
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("glitch ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
				wait(0.3)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
				wait(0.4)
				b = Instance.new("BodyForce")
				b.Parent = lplayer.Character.HumanoidRootPart
				b.Name = "Glitch"
				b.Force = Vector3.new(100000000,5000,0)
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unglitch") then
			lplayer.Character.HumanoidRootPart.Glitch:Destroy()
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(10000,0,10000)
			b = Instance.new("BodyForce")
			b.Parent = lplayer.Character.HumanoidRootPart
			b.Name = "unGlitch"
			b.Force = Vector3.new(0,-5000000,0)
			wait(2)
			lplayer.Character.HumanoidRootPart.unGlitch:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("grespawn") then
			lplayer.Character.Humanoid.Health = 0
			wait(1)
			lplayer.Character.Head.CFrame = CFrame.new(1000000,0,1000000)
			lplayer.Character.Torso.CFrame = CFrame.new(1000000,0,1000000)
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("explorer") then
			loadstring(game:GetObjects("rbxassetid://492005721")[1].Source)()
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Success!";
			Text = "DEX Explorer has loaded.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("anim ") then
			local Anim = Instance.new("Animation")
			Anim.AnimationId = "rbxassetid://"..(string.sub(CMDBAR.Text, 6))
			local track = lplayer.Character.Humanoid:LoadAnimation(Anim)
			track:Play(.1, 1, 1)
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("animgui") then
			loadstring(game:GetObjects("rbxassetid://1202558084")[1].Source)()
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Success!";
			Text = "Energize Animations GUI has loaded.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("savepos") then
			saved = lplayer.Character.HumanoidRootPart.CFrame
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Position Saved";
			Text = "Use ;loadpos to return to saved position.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("loadpos") then
			lplayer.Character.HumanoidRootPart.CFrame = saved
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("bang ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				local Anim2 = Instance.new("Animation")
				Anim2.AnimationId = "rbxassetid://148840371"
				local track2 = lplayer.Character.Humanoid:LoadAnimation(Anim2)
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
			for i,obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
			if obj.Name == (string.sub(CMDBAR.Text, 10)) then
			for i,ch in pairs(obj:GetDescendants()) do
			if (ch:IsA("BasePart")) then
			ch.CFrame = lplayer.Character.HumanoidRootPart.CFrame
			ch.CanCollide = false
			ch.Transparency = 0.7
			wait()
			ch.CFrame = lplayer.Character["Left Leg"].CFrame
			wait()
			ch.CFrame = lplayer.Character["Right Leg"].CFrame
			wait()
			ch.CFrame = lplayer.Character["Head"].CFrame
			end
			end
			end
			end
			end
			while wait() do
				bringmodw()
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "BringMod";
			Text = "BringMod enabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("respawn") then
			local mod = Instance.new('Model', workspace) mod.Name = 're '..lplayer.Name
			local hum = Instance.new('Humanoid', mod)
			local ins = Instance.new('Part', mod) ins.Name = 'Torso' ins.CanCollide = false ins.Transparency = 1
			lplayer.Character = mod
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
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Attempting Shutdown";
			Text = "Shutdown Attempt has begun.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("delobj ") then
			objtodel = (string.sub(CMDBAR.Text, 8))
			for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if v.Name == objtodel then
					v:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("getplrs") then
			for i,v in pairs(game:GetService("Players"):GetPlayers())do
				print(v)
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Printed";
			Text = "Players have been printed to console. (F9)";
			})
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("deldecal") then
			for i,v in pairs(game:GetService("Workspace"):GetDescendants())do
				if (v:IsA("Decal")) then
					v:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("opfinality") then
			loadstring(game:GetObjects("rbxassetid://1294358929")[1].Source)()
			game:GetService("StarterGui"):SetCore("SendNotification", {
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
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Printing Remotes";
			Text = "Type ;noremotes to disable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("noremotes") then
			remotes = false
			added = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
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
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Version";
			Text = adminversion;
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("clicktp") then
			clickgoto = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Click TP";
			Text = "Press E to teleport to mouse position";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("noclicktp") then
			clickgoto = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Click TP";
			Text = "Click TP has been disabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("toolson") then
			gettingtools = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools Enabled";
			Text = "Automatically colleting tools dropped.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("toolsoff") then
			gettingtools = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools Disabled";
			Text = "Click TP has been disabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("delcmdbar") then
			ScreenGui:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("reset") then
			lplayer.Character.Head:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("state ") then
			statechosen = string.sub(CMDBAR.Text, 7)
			changingstate = true
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("gravity ") then
			game:GetService("Workspace").Gravity = string.sub(CMDBAR.Text, 9)
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("looprhats") then
		removingmeshhats = true
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("unlooprhats") then
			removingmeshhats = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("looprtool") then
			removingmeshtool = true
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("unlooprtool") then
			removingmeshtool = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("givetool ") then
			for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
				if v:IsA("Tool") then
					for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 10))) do
						v.Parent = player.Character
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 4) == ("age ") then
			for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 5))) do
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.Name.." Account Age: "..player.AccountAge.." days!", "All")
			end
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("id ") then
			for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 4))) do
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.Name.." Account ID: "..player.UserId, "All")
			end
		end
		if string.sub(CMDBAR.Text, 1, 5) == (".age ") then
			for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = player.AccountAge.." Days";
				Text = "Account age of "..player.Name;
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 4) == (".id ") then
			for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 5))) do
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = player.UserId.." ID";
				Text = "Account ID of "..player.Name;
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("gameid") then
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Game ID";
			Text = "Game ID: ".. game.GameId;
			})
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("pgs") then
			local pgscheck = game:GetService("Workspace"):PGSIsEnabled()
			if pgscheck == true then
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "PGSPhysicsSolverEnabled";
				Text = "PGS is Enabled!";
				})
			else
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "PGSPhysicsSolverEnabled";
				Text = "PGS is Disabled!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("removeinvis") then
			for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if v:IsA("Part") then
					if v.Transparency == 1 then
						if v.Name ~= "HumanoidRootPart" then
							v:Destroy()
						end
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("removefog") then
			game:GetService("Lighting").FogStart = 0
			game:GetService("Lighting").FogEnd = 9999999999999
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("disable") then
			lplayer.Character.Humanoid.Parent = lplayer
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("enable") then
			lplayer.Humanoid.Parent = lplayer.Character
		end
		if string.sub(CMDBAR.Text, 1, 13) == ("givealltools ") then
			for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
				if v:IsA("Tool") then
					v.Parent = lplayer.Character
					wait()
					for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 14))) do
						v.Parent = player.Character
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("flyspeed ") then
			speedfly = string.sub(CMDBAR.Text, 10)
			wait()
			change()
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("carpet ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				local Anim3 = Instance.new("Animation")
				Anim3.AnimationId = "rbxassetid://282574440"
				local track3 = lplayer.Character.Humanoid:LoadAnimation(Anim3)
				track3:Play(.1, 1, 1)
				bplrr = v.Name
				banpl = true
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("uncarpet") then
			banpl = false
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("stare ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
				staring = true
				stareplr = v
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unstare") then
			staring = false
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("logchat") then
			chatlogs = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "LogChat enabled";
			Text = "Now logging all player chat.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("unlogchat") then
			chatlogs = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "LogChat disabled";
			Text = "Stopped logging all player chat.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("fixcam") then
			game:GetService("Workspace").CurrentCamera:Destroy()
			wait(0.1)
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Humanoid
			game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
			lplayer.CameraMinZoomDistance = 0.5
			lplayer.CameraMaxZoomDistance = 400
			lplayer.CameraMode = "Classic"
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unstate") then
			changingstate = false
		end
		CMDBAR.Text = ""
	end
end)

wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Loaded successfully!";
	Text = "Reviz Admin V2 by illremember";
})
wait(0.1)
print("Reviz Admin V2 loaded!")
if game:GetService("Workspace").FilteringEnabled == true then
	warn("FE is Enabled (Filtering Enabled)")
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "FE is Enabled";
		Text = "Filtering Enabled. Enjoy using Reviz Admin!";
	})
else
	warn("FE is Disabled (Filtering Disabled) Consider using a different admin script.")
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "FE is Disabled";
		Text = "Filtering Disabled. Consider using a different admin script.";
	})
end

local intro = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
intro.Parent = game:GetService("CoreGui")
Frame.Parent = intro
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 1
Frame.Size = UDim2.new(1, 0, 0, 300)
Frame.Position = UDim2.new(0, 0, -0.4, 0)
ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0, 0, 0, 0)
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Image = "http://www.roblox.com/asset/?id=1542162618"
Frame:TweenPosition(UDim2.new(0, 0, 0.2, 0), "Out", "Elastic", 3)
wait(3.01)
Frame:TweenPosition(UDim2.new(0, 0, 1.5, 0), "Out", "Elastic", 5)
wait(5.01)
intro:Destroy()
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
         Image = nil,
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
   Image = nil,
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

if not Welcome then Message("Script by AnthonyIsntHere", "Enjoy!", 5) end
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

local Button = ScriptsTab:CreateButton({
   Name = "FE Fling Player",
   Callback = function()
            local lp = game:FindService("Players").LocalPlayer
 
local function gplr(String)
	local Found = {}
	local strl = String:lower()
	if strl == "all" then
		for i,v in pairs(game:FindService("Players"):GetPlayers()) do
			table.insert(Found,v)
		end
	elseif strl == "others" then
		for i,v in pairs(game:FindService("Players"):GetPlayers()) do
			if v.Name ~= lp.Name then
				table.insert(Found,v)
			end
		end 
	elseif strl == "me" then
		for i,v in pairs(game:FindService("Players"):GetPlayers()) do
			if v.Name == lp.Name then
				table.insert(Found,v)
			end
		end 
	else
		for i,v in pairs(game:FindService("Players"):GetPlayers()) do
			if v.Name:lower():sub(1, #String) == String:lower() then
				table.insert(Found,v)
			end
		end 
	end
	return Found 
end
 
local function notif(str,dur)
	game:FindService("StarterGui"):SetCore("SendNotification", {
		Title = "yeet gui",
		Text = str,
		Icon = "rbxassetid://2005276185",
		Duration = dur or 3
	})
end
 
--// sds
 
local h = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Top = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
 
h.Name = "h"
h.Parent = game:GetService("CoreGui")
h.ResetOnSpawn = false
 
Main.Name = "Main"
Main.Parent = h
Main.Active = true
Main.Draggable = true
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.174545452, 0, 0.459574461, 0)
Main.Size = UDim2.new(0, 454, 0, 218)
Main.Image = "rbxassetid://113252733"
 
Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
Top.BorderSizePixel = 0
Top.Size = UDim2.new(0, 454, 0, 44)
 
Title.Name = "Title"
Title.Parent = Top
Title.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0.295454562, 0)
Title.Size = UDim2.new(0, 454, 0, 30)
Title.Font = Enum.Font.SourceSans
Title.Text = "FE Fling Player"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
 
TextBox.Parent = Main
TextBox.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0704845786, 0, 0.270642221, 0)
TextBox.Size = UDim2.new(0, 388, 0, 62)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Fling Who (can be shortened)"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true
 
TextButton.Parent = Main
TextButton.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.10352423, 0, 0.596330225, 0)
TextButton.Size = UDim2.new(0, 359, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Fling Player'"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
 
TextButton.MouseButton1Click:Connect(function()
	local Target = gplr(TextBox.Text)
	if Target[1] then
		Target = Target[1]
 
		local Thrust = Instance.new('BodyThrust', lp.Character.HumanoidRootPart)
		Thrust.Force = Vector3.new(9999,9999,9999)
		Thrust.Name = "FlingForce"
		repeat
			lp.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
			Thrust.Location = Target.Character.HumanoidRootPart.Position
			game:FindService("RunService").Heartbeat:wait()
		until not Target.Character:FindFirstChild("Head")
	else
		notif("Invalid player")
	end
end)
 
--//fsddfsdf
notif("Loaded successfully! Created by scuba#0001 modified by angxers", 5)
   
   end,
})

local GameScriptsSection = ScriptsTab:CreateSection("Game Scripts")

local Button = ScriptsTab:CreateButton({
	Name = "Swagmode Dahood",
	Callback = function()
			 local SW = loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002'))()
			 SW.load()
	end,
 })

local Button = ScriptsTab:CreateButton({
   Name = "Faded Dahood",
   Callback = function()
            local Faded = loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded/main/YesEpic", true))()
            Faded.load()
   end,
})

local Button = ScriptsTab:CreateButton({
   Name = "Vortex Dahood",
   Callback = function()
            local Vortex = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
            Vortex.load()
   end,
})

local Button = ScriptsTab:CreateButton({
   Name = "Polakya Dahood",
   Callback = function()
            local Polakya = loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md",true))()
            Polakya.load()
   end,
})

local Button = ScriptsTab:CreateButton({
   Name = "TBO Dahood",
   Callback = function()
            local TBO = loadstring(game:HttpGet('https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript'))()
            TBO.load()
   end,
})
local textToCopy = "https://sfl.gl/Em48peMv"
local Button = ScriptsTab:CreateButton({
   Name = "Chat Bypasser",
   Callback = function()
        Rayfield:Notify({
   Title = "Key System",
   Content = "Go to https://sfl.gl/Em48peMv click copy to copy",
   Duration = 6.5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Copy",
         Callback = function()
                    setclipboard(textToCopy)
    end
   },
},
})

            local ChatBypasser = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ehehekum/Ehehekum/main/Neptune%20Bypasser",true))()
            ChatBypasser.load()
    end,
})

local Button = ScriptsTab:CreateButton({
	Name = "SimpleBypass (op)",
	Callback = function()
			 local SB = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/Ouxie/main/Projects/simplebypass.lua"))()
			 SB.load()
	end,
 })

 local Button = ScriptsTab:CreateButton({
    Name = "UserCreation Chat Bypasser (op)",
    Callback = function()
        -- First notification for Discord key
        Rayfield:Notify({
            Title = "Discord Key",
            Content = "Join discord.gg/usercreation for key click copy to copy",
            Duration = 5,
            Image = nil,
            Actions = { -- Notification Buttons
                Copy = {
                    Name = "Copy",
                    Callback = function()
                        if setclipboard then
                            setclipboard("discord.gg/usercreation")
                        else
                            warn("setclipboard function is not available")
                        end
                    end
                }
            }
        })

        -- Second notification for execution confirmation
        Rayfield:Notify({
            Title = "NOTE (READ)",
            Content = "Universal Hub will be destroyed after UserCreation execution do you want to continue?",
            Duration = 5,
            Image = nil,
            Actions = { -- Notification Buttons
                Execute = {
                    Name = "Yes",
                    Callback = function()
                        local UC = loadstring(game:HttpGet("https://raw.githubusercontent.com/1price/usercreation/main/UserCreation.lua", true))()
                        if UC and UC.load then
                            UC.load()
                        else
                            warn("Failed to load UserCreation script or UC.load is not available")
                        end
                    end
                },
                Ignore = {
                    Name = "No",
                    Callback = function()
                        -- Optional: Add any specific action for "No" button here
                        print("User chose not to continue.")
                    end
                }
            }
        })
    end
})

local Button = ScriptsTab:CreateButton({
	Name = "Unnamed ESP",
	Callback = function()
			 local UESP = loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
             UESP.load()
	end,
 })

-- Define your games table
local games = {
    [155615604] = "Prison Life 🏢",
    [142823291] = "Murder Mystery 2 🔪",
    [2788229376] = "Da Hood 🔫",
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
	[6884319169] = "Mic Up 🎙",
}

-- Method to get the current game ID
local function getCurrentGameId()
    return game.PlaceId -- Correct method to get the current game ID in Roblox
end

-- Get the current game ID
local currentGameId = getCurrentGameId()
local currentGameName = games[currentGameId]

-- Create a tab only for the current game
if currentGameName then
    local tab = Window:CreateTab(currentGameName)

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
		-- Create the Execute INF Yield button
		tab:CreateButton({
			Name = "Execute INF Yield",
			Callback = function()
				print("Executing Infinite Yield...")
				-- Execute Infinite Yield script
				loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
			end
		})
	
		-- Define teleport locations
		local teleportLocations = {
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

	elseif currentGameName == "Da Hood 🔫" then

	            Rayfield:Notify({
				Title = "NOTE (REALLY IMPORTANT) Da Hood 🔫",
				Content = "DO NOT USE WALKSPEED & JUMPOWER & FLY IN MAIN TAB YOU WILL GET BANNED ONLY USE Da Hood 🔫 TAB",
				Duration = 6.5,
				Image = 11745872952,
				Actions = { -- Notification Buttons
				   Ignore = {
					  Name = "OK",
					  Callback = function()
					  print("The user tapped Okay!")
				   end
				},
			 },
			 })
		
			

		tab:CreateButton({
			Name = "Execute TBO",
			Callback = function()
				print("Executing TBO")

				loadstring(game:HttpGet('https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript'))()
				-- Execute Infinite Yield script
			end
		})

		



	
		-- Add more buttons or functionalities specific to "Mic Up 🎙" here
	end
end
	
