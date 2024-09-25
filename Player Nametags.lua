local PlayerService = game:GetService("Players")

function CreateNametagESP()
	local BillboardGui = Instance.new("BillboardGui")
	local Username = Instance.new("TextLabel")
	local Gun = Instance.new("TextLabel")
	local Distance = Instance.new("TextLabel")
	
	BillboardGui.Name = "NametagGui"
	BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	BillboardGui.Active = true
	BillboardGui.AlwaysOnTop = true
	BillboardGui.LightInfluence = 1.000
	BillboardGui.Size = UDim2.new(0, 200, 0, 48)
	BillboardGui.StudsOffset = Vector3.new(0, 10, 0)

	Username.Name = "Username"
	Username.Parent = BillboardGui
	Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Username.BackgroundTransparency = 1.000
	Username.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Username.BorderSizePixel = 0
	Username.Size = UDim2.new(1, 0, 0, 16)
	Username.Font = Enum.Font.Code
	Username.Text = "Noob"
	Username.TextColor3 = Color3.fromRGB(255, 85, 127)
	Username.TextSize = 14.000
	Username.TextStrokeTransparency = 0.000
	Username.TextWrapped = true

	Gun.Name = "Gun"
	Gun.Parent = BillboardGui
	Gun.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Gun.BackgroundTransparency = 1.000
	Gun.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Gun.BorderSizePixel = 0
	Gun.Position = UDim2.new(0, 0, 0, 32)
	Gun.Size = UDim2.new(1, 0, 0, 14)
	Gun.Font = Enum.Font.Code
	Gun.Text = "Unarmed"
	Gun.TextColor3 = Color3.fromRGB(255, 255, 255)
	Gun.TextSize = 12.000
	Gun.TextStrokeTransparency = 0.000
	Gun.TextWrapped = true

	Distance.Name = "Distance"
	Distance.Parent = BillboardGui
	Distance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Distance.BackgroundTransparency = 1.000
	Distance.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Distance.BorderSizePixel = 0
	Distance.Position = UDim2.new(0, 0, 0, 16)
	Distance.Size = UDim2.new(1, 0, 0, 14)
	Distance.Font = Enum.Font.Code
	Distance.Text = "1000"
	Distance.TextColor3 = Color3.fromRGB(255, 255, 255)
	Distance.TextSize = 12.000
	Distance.TextStrokeTransparency = 0.000
	Distance.TextWrapped = true
	
	return BillboardGui
end

function UpdatePlayerESP(player)
	if player.Character == nil or PlayerService.LocalPlayer.Character == nil then
		return
	end
	
	local head = player.Character:FindFirstChild("Head")
	local nametagGui = head:FindFirstChild("NametagGui")
	
	if head == nil or nametagGui == nil then
		return
	end
	
	local gun = player.Character:FindFirstChild("CurrentHolding")
	
	if gun == nil then
		nametagGui.Gun.Text = "Unarmed"
	else
		nametagGui.Gun.Text = gun.RealName.Value
	end
	
	local rootPart1 = player.Character:FindFirstChild("HumanoidRootPart")
	local rootPart2 = PlayerService.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	
	nametagGui.Distance.Text = tostring(math.round((rootPart2.Position - rootPart1.Position).Magnitude))
end

while true do
	
	for _, player in pairs(PlayerService:GetPlayers()) do
		
		if player.Character == nil then
			continue
		end
		
        local head = player.Character:FindFirstChild("Head")

        if head == nil then
            continue
        end

		local nametagGui = head:FindFirstChild("NametagGui")
		local chamGui = player.Character:FindFirstChild("ChamGui")
		
		if nametagGui == nil then
			local gui = CreateNametagESP()
			gui.Parent = head
			gui.Username.Text = player.Name
			print("create nametag")
		end
		
		UpdatePlayerESP(player)
	end
	
	wait(0.1)
end
