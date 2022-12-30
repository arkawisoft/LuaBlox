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

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset + Delta.X,
                StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y
            )
        local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local library = {}


function library:AddWindow(text,keybind)
    local bind = keybind or Enum.KeyCode.RightControl
    local ff = false
    local currenttab = ""

    local DoctorShiba = Instance.new("ScreenGui")
    DoctorShiba.Name = "UlLib"
    DoctorShiba.Parent = game.CoreGui
    DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = DoctorShiba
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main.BackgroundTransparency = 0.100
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
    Main.Size = UDim2.new(0, 600, 0, 350)
    
    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Top.BackgroundTransparency = 1.000
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(0, 600, 0, 20)
    MakeDraggable(Top,Main)
end

    --------------------------------------------------------------------
    if game.PlaceId == 2753915549 then
        World1 = true
    elseif game.PlaceId == 4442272183 then
        World2 = true
    elseif game.PlaceId == 7449423635 then
        World3 = true
    end

    local ScreenGui = Instance.new("ScreenGui")
    local Toggle = Instance.new("TextButton")
    
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui
    
    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Toggle.Size = UDim2.new(0, 50, 0, 50)
    Toggle.Font = Enum.Font.Code
    Toggle.Text = "PX"
    Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    Toggle.TextScaled = true
    Toggle.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
    end)
    --------------------------------------------------------------------
    local RenUi = library:AddWindow("Mid Hub | BF",Enum.KeyCode.RightControl)
