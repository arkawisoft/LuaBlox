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

local innerFrame = script.Parent
local outerFrame = innerFrame.Parent
outerFrame.BackgroundTransparency = 0.75
outerFrame.Active = true
outerFrame.Size = UDim2.new(1, 0, 1, 0)
outerFrame.Position = UDim2.new(0, 0, 0, 0)
outerFrame.AnchorPoint = Vector2.new(0, 0)
outerFrame.ClipsDescendants = true

local dragging = false
local basePosition

local function onTouchPan(_touchPositions, totalTranslation, _velocity, state)
	if state == Enum.UserInputState.Begin and not dragging then
		dragging = true
		basePosition = innerFrame.Position
		outerFrame.BackgroundTransparency = 0.25
	elseif state == Enum.UserInputState.Change then
		innerFrame.Position = basePosition + UDim2.new(0, totalTranslation.X, 0, totalTranslation.Y)
	elseif state == Enum.UserInputState.End and dragging then
		dragging = false
		outerFrame.BackgroundTransparency = 0.75
	end
end

outerFrame.TouchPan:Connect(onTouchPan)
