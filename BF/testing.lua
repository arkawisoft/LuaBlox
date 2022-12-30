_G.Color = Color3.fromRGB(138, 71, 236)
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

repeat wait() until game:GetService("Players")

if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end
    
wait(1)

do
    local ui = game.CoreGui:FindFirstChild("UlLib")
    if ui then
        ui:Destroy()
    end
end

local PawanX = Instance.new("ScreenGui")
    PawanX.Name = "UlLib"
    PawanX.Parent = game.CoreGui
    PawanX.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
Main.Parent = PawanX
Main.BackgroundTransparency = 0.75
Main.Active = true
Main.Size = UDim2.new(1, 0, 1, 0)
Main.Position = UDim2.new(0, 0, 0, 0)
Main.AnchorPoint = Vector2.new(0, 0)
Main.ClipsDescendants = true

local dragging = false
local basePosition

local function onTouchPan(_touchPositions, totalTranslation, _velocity, state)
	if state == Enum.UserInputState.Begin and not dragging then
		dragging = true
		basePosition = PawanX.Position
		Main.BackgroundTransparency = 0.25
	elseif state == Enum.UserInputState.Change then
		PawanX.Position = basePosition + UDim2.new(0, totalTranslation.X, 0, totalTranslation.Y)
	elseif state == Enum.UserInputState.End and dragging then
		dragging = false
		Main.BackgroundTransparency = 0.75
	end
end

Main.TouchPan:Connect(onTouchPan)
