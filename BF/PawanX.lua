if game.placeid == 2753915549 then
repeat
    wait()
until game:IsLoaded()
print("Game is loaded")

local ScreenGui = Instance.new("ScreenGui")
local Toggle = Instance.new("TextButton")
    
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.CoreGui
    
Toggle.Name = "ui"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Font = Enum.Font.Code
Toggle.Text = ""
Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
Toggle.TextScaled = true
Toggle.MouseButton1Down:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)

local ui = game.CoreGui:FindFirstChild("Kub")
if ui then
    ui:Destroy()
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

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
    local currenttab = ""
    local uihide = false
    local abc = false
    keybind = keybind or Enum.KeyCode.RightControl
    yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")

    local Kub = Instance.new("ScreenGui")
    Kub.Name = "Kub"
    Kub.Parent = game.CoreGui
    Kub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = Kub
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.ClipsDescendants = true
    Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Main.Position = UDim2.new(0.5, 0, 0.499, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)

    Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)

    local MainCorner = Instance.new("UICorner")
    MainCorner.Name = "MainCorner"
    MainCorner.Parent = Main

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Top.Size = UDim2.new(0, 656, 0, 27)

    local TopCorner = Instance.new("UICorner")
    TopCorner.Name = "TopCorner"
    TopCorner.Parent = Top

    local NameHub = Instance.new("TextLabel")
    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.Position = UDim2.new(0, 12, 0, 0)
    NameHub.Size = UDim2.new(0, 61, 0, 27)
    NameHub.Font = Enum.Font.GothamSemibold
    NameHub.Text = string.upper(text)
    NameHub.TextColor3 = Color3.fromRGB(225, 225, 225)
    NameHub.TextSize = 17.000

    local NameHub2 = Instance.new("TextLabel")
    NameHub2.Name = "NameHub2"
    NameHub2.Parent = Top
    NameHub2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub2.BackgroundTransparency = 1.000
    NameHub2.Position = UDim2.new(0, 71, 0, 0)
    NameHub2.Size = UDim2.new(0, 61, 0, 27)
    NameHub2.Font = Enum.Font.GothamSemibold
    NameHub2.Text = " HUB"
    NameHub2.TextColor3 = Color3.fromRGB(255,0,0)
    NameHub2.TextSize = 17.000
    NameHub2.TextXAlignment = Enum.TextXAlignment.Left

    local BindButton = Instance.new("TextButton")
    BindButton.Name = "BindButton"
    BindButton.Parent = Top
    BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BindButton.BackgroundTransparency = 1.000
    BindButton.Position = UDim2.new(0, 550, 0, 0)
    BindButton.Size = UDim2.new(0, 100, 0, 27)
    BindButton.Font = Enum.Font.GothamSemibold
    BindButton.Text = "[ "..string.gsub(tostring(keybind),"Enum.KeyCode.","").." ]"
    BindButton.TextColor3 = Color3.fromRGB(103, 103, 103)
    BindButton.TextSize = 11.000

    BindButton.MouseButton1Click:Connect(function ()
        BindButton.Text = "[ ... ]"
        local inputwait = game:GetService("UserInputService").InputBegan:wait()
        local shiba = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode

        if
        shiba.Name ~= "Focus" and shiba.Name ~= "MouseMovement" and shiba.Name ~= "Focus"
        then
            BindButton.Text = "[ "..shiba.Name.." ]"
            yoo = shiba.Name
        end
    end)

    
    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Tab.Position = UDim2.new(0, 12, 0, 40)
    Tab.Size = UDim2.new(0, 633, 0, 29)

    local TabCorner = Instance.new("UICorner")
    TabCorner.Name = "TabCorner"
    TabCorner.Parent = Tab
    
    local ScrollTab = Instance.new("ScrollingFrame")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.BorderSizePixel = 0
    ScrollTab.Size = UDim2.new(0, 633, 0, 29)
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0
    
    local UIPadding = Instance.new("UIPadding")
    UIPadding.Parent = ScrollTab
    UIPadding.PaddingLeft = UDim.new(0, 10)

    local TabList = Instance.new("UIListLayout")
    TabList.Name = "TabList"
    TabList.Parent = ScrollTab
    TabList.FillDirection = Enum.FillDirection.Horizontal
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 5)

    MakeDraggable(Top,Main)

	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode[yoo] then
			if uihide == false then
				uihide = true
				Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
			else
				uihide = false
				Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)
			end
		end
	end)

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Page.Position = UDim2.new(0, 11, 0, 80)
    Page.Size = UDim2.new(0, 633, 0, 305)

    local PageCorner = Instance.new("UICorner")
    PageCorner.Name = "PageCorner"
    PageCorner.Parent = Page

    local PageFolder = Instance.new("Folder")
    PageFolder.Name = "PageFolder"
    PageFolder.Parent = Page

    local UIPageLayout = Instance.new("UIPageLayout")

    UIPageLayout.Parent = PageFolder
    UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
    UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
    UIPageLayout.Padding = UDim.new(0, 10)
    UIPageLayout.TweenTime = 0.400
    UIPageLayout.GamepadInputEnabled = false
    UIPageLayout.ScrollWheelInputEnabled = false
    UIPageLayout.TouchInputEnabled = false


    local Ui = {}
    function Ui:AddTab(text)
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Parent = ScrollTab
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(0, 100, 0, 29)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        TabButton.TextSize = 15.000
        TabButton.Text = text
        TabButton.TextTransparency = 0.500
        
        local MainPage = Instance.new("Frame")

        MainPage.Name = "MainPage"
        MainPage.Parent = PageFolder
        MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainPage.BackgroundTransparency = 1.000
        MainPage.Position = UDim2.new(0.00157977885, 0, 0, 0)
        MainPage.Size = UDim2.new(0, 632, 0, 305)

        TabButton.MouseButton1Click:Connect(function()
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            for i,v in next, PageFolder:GetChildren() do 
                if v.Name == "MainPage" then
                    currenttab = v.Name
                end
                UIPageLayout:JumpTo(MainPage)
            end
		end)

		if abc == false then
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            UIPageLayout:JumpToIndex(1)
			abc = true
		end

        local uitab = {}
        function uitab:AddPage()
            local MainFramePage = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local ScrollPage = Instance.new("ScrollingFrame")
            local PageList = Instance.new("UIListLayout")
            local UIPadding = Instance.new("UIPadding")
            local UIPadding_2 = Instance.new("UIPadding")
            local UIListLayout_2 = Instance.new("UIListLayout")
        
            MainFramePage.Name = "MainFramePage"
            MainFramePage.Parent = MainPage
            MainFramePage.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            MainFramePage.Size = UDim2.new(0, 300, 0, 285)
        
            UICorner.Parent = MainFramePage
        
            ScrollPage.Name = "ScrollPage"
            ScrollPage.Parent = MainFramePage
            ScrollPage.Active = true
            ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollPage.BackgroundTransparency = 1.000
            ScrollPage.BorderSizePixel = 0
            ScrollPage.Size = UDim2.new(0, 300, 0, 285)
            ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollPage.ScrollBarThickness = 0
        
            PageList.Name = "PageList"
            PageList.Parent = ScrollPage
            PageList.SortOrder = Enum.SortOrder.LayoutOrder
            PageList.Padding = UDim.new(0, 13)
        
            UIPadding.Parent = ScrollPage
            UIPadding.PaddingLeft = UDim.new(0, 20)
            UIPadding.PaddingTop = UDim.new(0, 10)
        
            UIPadding_2.Parent = MainPage
            UIPadding_2.PaddingLeft = UDim.new(0, 10)
            UIPadding_2.PaddingTop = UDim.new(0, 10)
        
            UIListLayout_2.Parent = MainPage
            UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 13)

            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 26)
                    ScrollTab.CanvasSize = UDim2.new(0,TabList.AbsoluteContentSize.X + 10,0,0)
                end)
            end)

            local main = {}
            function main:AddSeperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local Sep2 = Instance.new("TextLabel")
                local Sep3 = Instance.new("Frame")
                
                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollPage
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.Size = UDim2.new(0, 260, 0, 20)
                
                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 40, 0, 1)
                
                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Sep2.BackgroundTransparency = 1.000
                Sep2.Position = UDim2.new(0, 80, 0, 0)
                Sep2.Size = UDim2.new(0, 100, 0, 20)
                Sep2.Font = Enum.Font.GothamSemibold
                Sep2.Text = text
                Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Sep2.TextSize = 14.000
                
                Sep3.Name = "Sep3"
                Sep3.Parent = Seperator
                Sep3.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep3.BorderSizePixel = 0
                Sep3.Position = UDim2.new(0, 220, 0, 10)
                Sep3.Size = UDim2.new(0, 40, 0, 1)
            end

            function main:AddLine()
                local Linee = Instance.new("Frame")
                local Line = Instance.new("Frame")
                
                Linee.Name = "Linee"
                Linee.Parent = ScrollPage
                Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Linee.BackgroundTransparency = 1.000
                Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
                Linee.Size = UDim2.new(0, 260, 0, 20)
                
                Line.Name = "Line"
                Line.Parent = Linee
                Line.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Line.BorderSizePixel = 0
                Line.Position = UDim2.new(0, 0, 0, 10)
                Line.Size = UDim2.new(0, 260, 0, 1)
            end

            function main:AddButton(text,callback)
                local Button = Instance.new("Frame")
                local ButtonCorner = Instance.new("UICorner")
                local Btn = Instance.new("TextButton")
                local BtnCorner = Instance.new("UICorner")
                
                Button.Name = "Button"
                Button.Parent = ScrollPage
                Button.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Button.Size = UDim2.new(0, 260, 0, 38)
                Button.BackgroundTransparency = 0.5
                
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.Parent = Button
                
                Btn.Name = "Btn"
                Btn.Parent = Button
                Btn.AutoButtonColor = false
                Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Btn.Position = UDim2.new(0, 1, 0, 1)
                Btn.Size = UDim2.new(0, 258, 0, 36)
                Btn.Font = Enum.Font.GothamSemibold
                Btn.TextColor3 = Color3.fromRGB(225, 225, 225)
                Btn.TextSize = 16.000
                Btn.Text = text
                Btn.TextTransparency = 0.500
                
                BtnCorner.CornerRadius = UDim.new(0, 5)
                BtnCorner.Name = "BtnCorner"
                BtnCorner.Parent = Btn

                Btn.MouseEnter:Connect(function()
                    TweenService:Create(
                        Btn,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                end)

                Btn.MouseLeave:Connect(function()
                    TweenService:Create(
                        Btn,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                end)

                Btn.MouseButton1Click:Connect(function()
                    callback()
                    Btn.TextSize = 9
                    TweenService:Create(
                        Btn,
                        TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                        {TextSize = 16}
                    ):Play()
                end)
            end 

            function main:AddDropdown(text,option,callback)
                local Dropdown = Instance.new("Frame")
                local dropcorner = Instance.new("UICorner")
                local Dropdownn = Instance.new("Frame")
                local droppcorner = Instance.new("UICorner")
                local DropBtn = Instance.new("TextButton")
                local DropLabel = Instance.new("TextLabel")
                local DropScroll = Instance.new("ScrollingFrame")
                local dpd = Instance.new("UIPadding")
                local dll = Instance.new("UIListLayout")
                local DropImage = Instance.new("ImageLabel")
                local isdropping = false

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = ScrollPage
                Dropdown.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Dropdown.BackgroundTransparency = 0.500
                Dropdown.Size = UDim2.new(0, 260, 0, 38) -- 114
                
                dropcorner.CornerRadius = UDim.new(0, 5)
                dropcorner.Name = "dropcorner"
                dropcorner.Parent = Dropdown
                
                Dropdownn.Name = "Dropdownn"
                Dropdownn.Parent = Dropdown
                Dropdownn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Dropdownn.ClipsDescendants = true
                Dropdownn.Position = UDim2.new(0, 1, 0, 1)
                Dropdownn.Size = UDim2.new(0, 258, 0, 36) -- 112
                
                droppcorner.CornerRadius = UDim.new(0, 5)
                droppcorner.Name = "droppcorner"
                droppcorner.Parent = Dropdownn
                
                DropBtn.Name = "DropBtn"
                DropBtn.Parent = Dropdownn
                DropBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropBtn.BackgroundTransparency = 1.000
                DropBtn.Size = UDim2.new(0, 258, 0, 36)
                DropBtn.Font = Enum.Font.SourceSans
                DropBtn.Text = ""
                DropBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropBtn.TextSize = 14.000
                
                DropLabel.Name = "DropLabel"
                DropLabel.Parent = Dropdownn
                DropLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropLabel.BackgroundTransparency = 1.000
                DropLabel.Position = UDim2.new(0, 15, 0, 0)
                DropLabel.Size = UDim2.new(0, 180, 0, 36)
                DropLabel.Font = Enum.Font.GothamSemibold
                DropLabel.Text = text
                DropLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                DropLabel.TextSize = 16.000
                DropLabel.TextTransparency = 0.500
                DropLabel.TextXAlignment = Enum.TextXAlignment.Left

                DropImage.Name = "DropImage"
                DropImage.Parent = Dropdownn
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.Position = UDim2.new(0, 230, 0, 9)
                DropImage.Rotation = 180.000
                DropImage.Size = UDim2.new(0, 20, 0, 20)
                DropImage.Image = "rbxassetid://6031090990"
                DropImage.ImageTransparency = 0.500
                
                DropScroll.Name = "DropScroll"
                DropScroll.Parent = DropLabel
                DropScroll.Active = true
                DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropScroll.BackgroundTransparency = 1.000
                DropScroll.BorderSizePixel = 0
                DropScroll.Position = UDim2.new(-0.105555557, 0, 1.11111116, 0)
                DropScroll.Size = UDim2.new(0, 258, 0, 70)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
                DropScroll.ScrollBarThickness = 3
                
                dpd.Name = "dpd"
                dpd.Parent = DropScroll
                dpd.PaddingLeft = UDim.new(0, 5)
                dpd.PaddingTop = UDim.new(0, 5)
                
                dll.Name = "dll"
                dll.Parent = DropScroll
                dll.SortOrder = Enum.SortOrder.LayoutOrder
                dll.Padding = UDim.new(0, 5)

                for i,v in next, option do
                    local Item = Instance.new("TextButton")
                    Item.Name = "Item"
                    Item.Parent = DropScroll
                    Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Item.BackgroundTransparency = 1.000
                    Item.Size = UDim2.new(0, 248, 0, 29)
                    Item.Font = Enum.Font.GothamSemibold
                    Item.TextColor3 = Color3.fromRGB(225, 225, 225)
                    Item.TextSize = 16.000
                    Item.Text = tostring(v)
                    Item.TextTransparency = 0.5

                    Item.MouseEnter:Connect(function()
                        TweenService:Create(
                            Item,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextTransparency = 0}
                        ):Play()
                    end)
                    Item.MouseLeave:Connect(function()
                        TweenService:Create(
                            Item,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextTransparency = 0.5}
                        ):Play()
                    end)

                    Item.MouseButton1Click:Connect(function()
                        isdropping = false
                        Dropdown:TweenSize(UDim2.new(0,260,0,38),"Out","Quad",0.3,true)
                        Dropdownn:TweenSize(UDim2.new(0,258,0,36),"Out","Quad",0.3,true)
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 180}
                        ):Play()
                        callback(v)
                    end)
                end 

                DropScroll.CanvasSize = UDim2.new(0,0,0,dll.AbsoluteContentSize.Y + 10)

                DropBtn.MouseEnter:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        DropLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {ImageTransparency = 0}
                    ):Play()
                end)

                DropBtn.MouseLeave:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        DropLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {ImageTransparency = 0.5}
                    ):Play()
                end)

                DropBtn.MouseButton1Click:Connect(function()
                    if isdropping == false then
                        isdropping = true
                        Dropdown:TweenSize(UDim2.new(0,260,0,114),"Out","Quad",0.3,true)
                        Dropdownn:TweenSize(UDim2.new(0,258,0,112),"Out","Quad",0.3,true)
                        DropBtn:TweenSize(UDim2.new(0,258,0,112),"Out","Quad",0.3,true)
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                    else
                        isdropping = false
                        Dropdown:TweenSize(UDim2.new(0,260,0,38),"Out","Quad",0.3,true)
                        Dropdownn:TweenSize(UDim2.new(0,258,0,36),"Out","Quad",0.3,true)
                        DropBtn:TweenSize(UDim2.new(0,258,0,36),"Out","Quad",0.3,true)
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 180}
                        ):Play()
                    end
                end)

                local drop = {}

                function drop:Clear()
                    DropLabel.Text = tostring(text).." :"
                    isdropping = false
                    Dropdown:TweenSize(UDim2.new(0,260,0,38),"Out","Quad",0.3,true)
                    Dropdownn:TweenSize(UDim2.new(0,258,0,36),"Out","Quad",0.3,true)
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 180}
                    ):Play()
                    for i, v in next, DropScroll:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end
                function drop:Add(t)
                    local Item = Instance.new("TextButton")
                    Item.Name = "Item"
                    Item.Parent = DropScroll
                    Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Item.BackgroundTransparency = 1.000
                    Item.Size = UDim2.new(0, 248, 0, 29)
                    Item.Font = Enum.Font.GothamSemibold
                    Item.TextColor3 = Color3.fromRGB(225, 225, 225)
                    Item.TextSize = 16.000
                    Item.TextTransparency = 0.5
                    Item.Text = tostring(t)

                    Item.MouseButton1Click:Connect(function()
                        isdropping = false
                        Dropdown:TweenSize(UDim2.new(0,260,0,36),"Out","Quad",0.3,true)
                        Dropdownn:TweenSize(UDim2.new(0,260,0,34),"Out","Quad",0.3,true)
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 180}
                        ):Play()
                        callback(t)
                    end)
                end
                return drop
            end

            function main:AddSlider(text,min,max,set,callback)
                local Slider = Instance.new("Frame")
                local slidercorner = Instance.new("UICorner")
                local sliderr = Instance.new("Frame")
                local sliderrcorner = Instance.new("UICorner")
                local SliderLabel = Instance.new("TextLabel")
                local HAHA = Instance.new("Frame")
                local AHEHE = Instance.new("TextButton")
                local bar = Instance.new("Frame")
                local bar1 = Instance.new("Frame")
                local bar1corner = Instance.new("UICorner")
                local barcorner = Instance.new("UICorner")
                local circlebar = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local slidervalue = Instance.new("Frame")
                local valuecorner = Instance.new("UICorner")
                local TextBox = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")

                Slider.Name = "Slider"
                Slider.Parent = ScrollPage
                Slider.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Slider.BackgroundTransparency = 0.500
                Slider.Size = UDim2.new(0, 260, 0, 48)

                slidercorner.CornerRadius = UDim.new(0, 5)
                slidercorner.Name = "slidercorner"
                slidercorner.Parent = Slider

                sliderr.Name = "sliderr"
                sliderr.Parent = Slider
                sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                sliderr.Position = UDim2.new(0, 1, 0, 1)
                sliderr.Size = UDim2.new(0, 258, 0, 46)

                sliderrcorner.CornerRadius = UDim.new(0, 5)
                sliderrcorner.Name = "sliderrcorner"
                sliderrcorner.Parent = sliderr

                SliderLabel.Name = "SliderLabel"
                SliderLabel.Parent = sliderr
                SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderLabel.BackgroundTransparency = 1.000
                SliderLabel.Position = UDim2.new(0.0581395365, 0, 0, 0)
                SliderLabel.Size = UDim2.new(0, 180, 0, 26)
                SliderLabel.Font = Enum.Font.GothamSemibold
                SliderLabel.Text = text
                SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderLabel.TextSize = 16.000
                SliderLabel.TextTransparency = 0.500
                SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

                HAHA.Name = "HAHA"
                HAHA.Parent = sliderr
                HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HAHA.BackgroundTransparency = 1.000
                HAHA.Size = UDim2.new(0, 258, 0, 46)

                AHEHE.Name = "AHEHE"
                AHEHE.Parent = sliderr
                AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                AHEHE.BackgroundTransparency = 1.000
                AHEHE.Position = UDim2.new(0, 10, 0, 35)
                AHEHE.Size = UDim2.new(0, 238, 0, 5)
                AHEHE.Font = Enum.Font.SourceSans
                AHEHE.Text = ""
                AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
                AHEHE.TextSize = 14.000

                bar.Name = "bar"
                bar.Parent = AHEHE
                bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                bar.Size = UDim2.new(0, 238, 0, 5)

                bar1.Name = "bar1"
                bar1.Parent = bar
                bar1.BackgroundColor3 = Color3.fromRGB(255,0,0)
                bar1.BackgroundTransparency = 0.500
                bar1.Size = UDim2.new(set/max, 0, 0, 5)

                bar1corner.CornerRadius = UDim.new(0, 5)
                bar1corner.Name = "bar1corner"
                bar1corner.Parent = bar1

                barcorner.CornerRadius = UDim.new(0, 5)
                barcorner.Name = "barcorner"
                barcorner.Parent = bar

                circlebar.Name = "circlebar"
                circlebar.Parent = bar1
                circlebar.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
                circlebar.Position = UDim2.new(1, -2, 0, -3)
                circlebar.Size = UDim2.new(0, 10, 0, 10)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = circlebar

                slidervalue.Name = "slidervalue"
                slidervalue.Parent = sliderr
                slidervalue.BackgroundColor3 = Color3.fromRGB(255,0,0)
                slidervalue.BackgroundTransparency = 0.500
                slidervalue.Position = UDim2.new(0, 185, 0, 5)
                slidervalue.Size = UDim2.new(0, 65, 0, 18)

                valuecorner.CornerRadius = UDim.new(0, 5)
                valuecorner.Name = "valuecorner"
                valuecorner.Parent = slidervalue

                TextBox.Parent = slidervalue
                TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                TextBox.Position = UDim2.new(0, 1, 0, 1)
                TextBox.Size = UDim2.new(0, 63, 0, 16)
                TextBox.Font = Enum.Font.GothamSemibold
                TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextBox.TextSize = 9.000
                TextBox.Text = set
                TextBox.TextTransparency = 0.500

                UICorner_2.CornerRadius = UDim.new(0, 5)
                UICorner_2.Parent = TextBox

                HAHA.MouseEnter:Connect(function()
                    TweenService:Create(
                        Slider,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        SliderLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        bar1,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        circlebar,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(225,225,225)}
                    ):Play()
                    TweenService:Create(
                        slidervalue,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        TextBox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                end)

                HAHA.MouseLeave:Connect(function()
                    TweenService:Create(
                        Slider,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        SliderLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        bar1,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        circlebar,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(180,180,180)}
                    ):Play()
                    TweenService:Create(
                        slidervalue,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        TextBox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end)

                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")

                if Value == nil then
                    Value = set
                    pcall(function()
                        callback(Value)
                    end)
                end
                
                AHEHE.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 238) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 238), 0, 5)
                    circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 228), 0, -3)
                    moveconnection = mouse.Move:Connect(function()
                        TextBox.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 238) * bar1.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 238), 0, 5)
                        circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 228), 0, -3)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 238) * bar1.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 238), 0, 5)
                            circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 228), 0, -3)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 238) * bar1.AbsoluteSize.X) + tonumber(min))
                        TextBox.Text = Value
                    end
                end)

                TextBox.FocusLost:Connect(function()
                    if tonumber(TextBox.Text) > max then
                        TextBox.Text  = max
                    end
                    bar1.Size = UDim2.new((tonumber(TextBox.Text) or 0) / max, 0, 0, 5)
                    circlebar.Position = UDim2.new(1, -2, 0, -3)
                    TextBox.Text = tostring(tonumber(TextBox.Text) and math.floor( (tonumber(TextBox.Text) / max) * (max - min) + min) )
                    pcall(callback, TextBox.Text)
                end)
            end

            function main:AddTextbox(text,disappear,callback)
                local Textbox = Instance.new("Frame")
                local TextboxCorner = Instance.new("UICorner")
                local Textboxx = Instance.new("Frame")
                local TextboxxCorner = Instance.new("UICorner")
                local TextboxLabel = Instance.new("TextLabel")
                local txtbtn = Instance.new("TextButton")
                local RealTextbox = Instance.new("TextBox")
                local UICorner = Instance.new("UICorner")

                Textbox.Name = "Textbox"
                Textbox.Parent = ScrollPage
                Textbox.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Textbox.BackgroundTransparency = 0.500
                Textbox.Size = UDim2.new(0, 260, 0, 38)

                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.Parent = Textbox

                Textboxx.Name = "Textboxx"
                Textboxx.Parent = Textbox
                Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Textboxx.Position = UDim2.new(0, 1, 0, 1)
                Textboxx.Size = UDim2.new(0, 258, 0, 36)

                TextboxxCorner.CornerRadius = UDim.new(0, 5)
                TextboxxCorner.Name = "TextboxxCorner"
                TextboxxCorner.Parent = Textboxx

                TextboxLabel.Name = "TextboxLabel"
                TextboxLabel.Parent = Textbox
                TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxLabel.BackgroundTransparency = 1.000
                TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
                TextboxLabel.Text = text
                TextboxLabel.Size = UDim2.new(0, 145, 0, 38)
                TextboxLabel.Font = Enum.Font.GothamSemibold
                TextboxLabel.TextColor3 = Color3.fromRGB(255,0,0)
                TextboxLabel.TextSize = 16.000
                TextboxLabel.TextTransparency = 0.500
                TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

                txtbtn.Name = "txtbtn"
                txtbtn.Parent = Textbox
                txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                txtbtn.BackgroundTransparency = 1.000
                txtbtn.Position = UDim2.new(0, 1, 0, 1)
                txtbtn.Size = UDim2.new(0, 258, 0, 36)
                txtbtn.Font = Enum.Font.SourceSans
                txtbtn.Text = ""
                txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                txtbtn.TextSize = 14.000

                RealTextbox.Name = "RealTextbox"
                RealTextbox.Parent = Textbox
                RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                RealTextbox.BackgroundTransparency = 0.500
                RealTextbox.Position = UDim2.new(0, 150, 0, 7)
                RealTextbox.Size = UDim2.new(0, 100, 0, 22)
                RealTextbox.Font = Enum.Font.GothamSemibold
                RealTextbox.Text = ""
                RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                RealTextbox.TextSize = 11.000
                RealTextbox.TextTransparency = 0.500

                txtbtn.MouseEnter:Connect(function()
                    TweenService:Create(
                        Textbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        TextboxLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        RealTextbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        RealTextbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                end)

                txtbtn.MouseLeave:Connect(function()
                    TweenService:Create(
                        Textbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        TextboxLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        RealTextbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        RealTextbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                end)

                RealTextbox.FocusLost:Connect(function()
                    callback(RealTextbox.Text)
                    if disappear then
                        RealTextbox.Text = ""
                    end
                end)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = RealTextbox
            end

            function main:AddToggle(text,config,callback)
                local Toggle = Instance.new("Frame")
                local ToggleCorner = Instance.new("UICorner")
                local Tgle = Instance.new("Frame")
                local TgleCorner = Instance.new("UICorner")
                local tglebtn = Instance.new("TextButton")
                local ToggleLabel = Instance.new("TextLabel")
                local ToggleImage = Instance.new("Frame")
                local ToggleImageCorner = Instance.new("UICorner")
                local tgleimg = Instance.new("Frame")
                local tgleimg_2 = Instance.new("UICorner")

                Toggle.Name = "Toggle"
                Toggle.Parent = ScrollPage
                Toggle.BackgroundColor3 = Color3.fromRGB(233, 63, 63)
                Toggle.BackgroundTransparency = 0.500
                Toggle.Size = UDim2.new(0, 260, 0, 38)

                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.Parent = Toggle

                Tgle.Name = "Tgle"
                Tgle.Parent = Toggle
                Tgle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Tgle.Position = UDim2.new(0, 1, 0, 1)
                Tgle.Size = UDim2.new(0, 258, 0, 36)

                TgleCorner.CornerRadius = UDim.new(0, 5)
                TgleCorner.Name = "TgleCorner"
                TgleCorner.Parent = Tgle

                tglebtn.Name = "tglebtn"
                tglebtn.Parent = Tgle
                tglebtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                tglebtn.BackgroundTransparency = 1.000
                tglebtn.Size = UDim2.new(0, 258, 0, 36)
                tglebtn.Font = Enum.Font.SourceSans
                tglebtn.Text = ""
                tglebtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                tglebtn.TextSize = 14.000

                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Parent = Tgle
                ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleLabel.BackgroundTransparency = 1.000
                ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
                ToggleLabel.Size = UDim2.new(0, 190, 0, 36)
                ToggleLabel.Font = Enum.Font.GothamSemibold
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(233, 63, 63)
                ToggleLabel.TextSize = 16.000
                ToggleLabel.TextTransparency = 0.500
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Tgle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                ToggleImage.BackgroundTransparency = 0.500
                ToggleImage.Position = UDim2.new(0, 225, 0, 5)
                ToggleImage.Size = UDim2.new(0, 26, 0, 26)

                ToggleImageCorner.CornerRadius = UDim.new(0, 5)
                ToggleImageCorner.Name = "ToggleImageCorner"
                ToggleImageCorner.Parent = ToggleImage

                tgleimg.Name = "tgleimg"
                tgleimg.Parent = ToggleImage
                tgleimg.AnchorPoint = Vector2.new(0.5, 0.5)
                tgleimg.BackgroundColor3 = Color3.fromRGB(255,0,0)
                tgleimg.BackgroundTransparency = 0.500
                tgleimg.Position = UDim2.new(0, 13, 0, 13)
                tgleimg.Size = UDim2.new(0, 0, 0, 0)

                tgleimg_2.CornerRadius = UDim.new(0, 5)
                tgleimg_2.Name = "tgleimg_2"
                tgleimg_2.Parent = tgleimg

                tglebtn.MouseEnter:Connect(function()
                    TweenService:Create(
                        Toggle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
				    ):Play()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
				    ):Play()
                    TweenService:Create(
                        ToggleImage,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
				    ):Play()
                    TweenService:Create(
                        tgleimg,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
				    ):Play()
                end)
                tglebtn.MouseLeave:Connect(function()
                    TweenService:Create(
                        Toggle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
				    ):Play()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
				    ):Play()
                    TweenService:Create(
                        ToggleImage,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
				    ):Play()
                    TweenService:Create(
                        tgleimg,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
				    ):Play()
                end)
                if config == true then
                    istoggled = true
                    pcall(callback,istoggled)
                    tgleimg:TweenSize(UDim2.new(0, 26, 0, 26),"In","Bounce",0.1,true)
                    TweenService:Create(
                        Toggle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(63,233,233)}
				    ):Play()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(63,233,233)}
                    ):Play()
                end

                local istoggled = config or false
                tglebtn.MouseButton1Click:Connect(function()
                    if istoggled == false then
                        istoggled = true
                        tgleimg:TweenSize(UDim2.new(0, 26, 0, 26),"In","Quad",0.1,true)
                        TweenService:Create(
                            Toggle,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(63,233,233)}
				        ):Play()
                        TweenService:Create(
                            ToggleLabel,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(63,233,233)}
                        ):Play()
                    else
                        istoggled = false
                        tgleimg:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.1,true)
                        TweenService:Create(
                            Toggle,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(233,63,63)}
				        ):Play()
                        TweenService:Create(
                            ToggleLabel,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(233,63,63)}
                        ):Play()
                    end
                    pcall(callback,istoggled)
                end)
            end

            function main:AddLabel(text)
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}
        
                Label.Name = "Label"
                Label.Parent = ScrollPage
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 260, 0, 20)
                Label.Font = Enum.Font.GothamSemibold
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 16.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left
    
                PaddingLabel.PaddingLeft = UDim.new(0,15)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"
        
                function labell:Set(newtext)
                    Label.Text = newtext
                end
    
                return labell
            end

            return main
        end
        return uitab
    end
    return Ui
end
local function loading()
	local Loading = Instance.new("ScreenGui")
	local Blur = Instance.new("Frame")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Logo = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	local Load = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local Bar = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local BAR1 = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local Top = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local TextLabel_2 = Instance.new("TextLabel")
	local TextLabel_3 = Instance.new("TextLabel")

	--Properties:

	Loading.Name = "Loading"
	Loading.Parent = game.CoreGui
	Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Blur.Name = "Blur"
	Blur.Parent = Loading
	Blur.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Blur.BackgroundTransparency = 0.500
	Blur.Size = UDim2.new(1, 0, 1, 0)

	Main.Name = "Main"
	Main.Parent = Blur
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.5, 0, 0.499241263, 0)
	Main.Size = UDim2.new(0, 500, 0, 300)

	UICorner.Parent = Main

	Logo.Name = "Logo"
	Logo.Parent = Main
	Logo.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Logo.Position = UDim2.new(0.400000006, 0, 0.163333327, 0)
	Logo.Size = UDim2.new(0, 100, 0, 100)
	Logo.Image = "rbxassetid://8346185306"

	UICorner_2.CornerRadius = UDim.new(0, 100)
	UICorner_2.Parent = Logo

	Load.Name = "Load"
	Load.Parent = Main
	Load.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Load.Position = UDim2.new(0, 15, 0, 170)
	Load.Size = UDim2.new(0, 470, 0, 115)

	UICorner_3.Parent = Load

	Bar.Name = "Bar"
	Bar.Parent = Load
	Bar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Bar.Position = UDim2.new(0, 15, 0, 80)
	Bar.Size = UDim2.new(0, 440, 0, 15)

	UICorner_4.CornerRadius = UDim.new(0, 5)
	UICorner_4.Parent = Bar

	BAR1.Name = "BAR1"
	BAR1.Parent = Bar
	BAR1.BackgroundColor3 = Color3.fromRGB(255,0,0)
	BAR1.Size = UDim2.new(0, 0, 0, 15)

	UICorner_5.CornerRadius = UDim.new(0, 5)
	UICorner_5.Parent = BAR1

	TextLabel.Parent = Load
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.0319148935, 0, 0.173913032, 0)
	TextLabel.Size = UDim2.new(0, 440, 0, 25)
	TextLabel.Font = Enum.Font.GothamSemibold
	TextLabel.Text = "Loading"
	TextLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
	TextLabel.TextSize = 16.000
	spawn(function()
		for i = 1,5 do 
			wait(0.5)
			TextLabel.Text = "Loading."
			wait(0.5) 
			TextLabel.Text = "Loading.."
			wait(0.5)
			TextLabel.Text = "Loading..."
		end
	end)

	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Top.Size = UDim2.new(0, 500, 0, 30)

	UICorner_6.Parent = Top

	TextLabel_2.Parent = Top
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.Position = UDim2.new(0.0299999993, 0, 0, 0)
	TextLabel_2.Size = UDim2.new(0, 61, 0, 30)
	TextLabel_2.Font = Enum.Font.GothamSemibold
	TextLabel_2.Text = "CFrame"
	TextLabel_2.TextColor3 = Color3.fromRGB(225, 225, 225)
	TextLabel_2.TextSize = 17.000

	TextLabel_3.Parent = Top
	TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.BackgroundTransparency = 1.000
	TextLabel_3.Position = UDim2.new(0.151999995, 0, 0, 0)
	TextLabel_3.Size = UDim2.new(0, 61, 0, 30)
	TextLabel_3.Font = Enum.Font.GothamSemibold
	TextLabel_3.Text = "HUB"
	TextLabel_3.TextColor3 = Color3.fromRGB(255,0,0)
	TextLabel_3.TextSize = 17.000
	TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
	
	BAR1:TweenSize(UDim2.new(0,440,0,15),"Out","Linear",5,true)
	wait(5)
    Main:TweenSize(UDim2.new(0,0,0,0),"Out","Quad",0.4,true)
    wait(0.4)
	
	do 
		local Load = game.CoreGui:FindFirstChild("Loading")
		if Load then
			Load:Destroy()
		end
	end
end
loading()

if string.lower(game:GetService("RbxAnalyticsService"):GetClientId()) == game:GetService("RbxAnalyticsService"):GetClientId() then
    local ScreenGui = Instance.new("ScreenGui")
    local ImageButton = Instance.new("ImageButton")

    ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    ImageButton.Parent = ScreenGui
    ImageButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    ImageButton.Size = UDim2.new(0, 50, 0, 50)
    ImageButton.Image = "rbxassetid://8622542227"
    ImageButton.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
    end)
end

local win = library:AddWindow("PrivateHub"(Alpha)")
local MainTab = win:AddTab("Main")
local Player = win:AddTab("Player")
local Dungeon = win:AddTab("DungeonDungeon")
local ShopMain = win:AddTab("Shop")

local AutoFarm = MainTab:AddPage()
local Settings = MainTab:AddPage()

local Autostats = Player:AddPage()

local Raid = Dungeon:AddPage()
local RaidProperty = Dungeon:AddPage()

local Shop = ShopMain:AddPage()
local Haki = ShopMain:AddPage()

AutoFarm:AddToggle("Auto Farm Level",false,function(t)
    _G.AutoFarm = t
end)

AutoFarm:AddToggle("Auto Superhuman",false,function(t)
    _G.AutoSuperhuman = t
end)

if game.PlaceId == 2753915549 then
    AutoFarm:AddToggle("Auto Sea 2",false,function(t)
        _G.AutoSea2 = t
    end)

    AutoFarm:AddToggle("Auto Saber",false,function(t)
        _G.AutoSaber = t
    end)
end

Weapon = {}
Fruit= {"Bomb-Bomb","Spike-Spike","Chop-Chop","Spring-Spring","Kilo-Kilo","Smoke-Smoke","Spin-Spin","Flame-Flame","Brid-Bird: Falcon","Ice-Ice","Sand-Sand","Dark-Dark","Revive-Revive","Diamond-Diamond","Light-Light","Love-Love","Rubber-Rubber","Barrier-Barrier","Magma-Magma","Door-Door","Quake-Quake","Human-Human: Buddha","String-String","Bird-Bird: Phoenix","Rumble-Rumble","Paw-Paw","Gravity-Gravity","Dough-Dough","Shadow-Shadow","Venom-Venom","Control-Control","Soul-Soul","Dragon-Dragon","Leapord-Leapord"}
Melee = {"Combat","Black Leg","Electro","Fishman Karate","Dragon Claw","Superhuman","Death Step","Sharkman Karate","Dragon Talon","God Human"}
Chip = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"}

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weapon,v.Name)
end

for x,y in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if y:IsA("Tool")then
        table.insert(Weapon,y.Name)
    end
end

local SelectWeapon = Settings:AddDropdown("Choose Weapon",Weapon,function(value)
    _G.ChooseWeapon = value
end)

Settings:AddButton("Refresh Weapon",function()
    SelectWeapon:Clear()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        SelectWeapon:Add(v.Name)
    end
end)

Settings:AddToggle("Auto Equip",true,function(t)
    _G.AutoEquip = t
end)

Settings:AddToggle("Auto Buso",true,function(t)
    _G.AutoBuso = t
end)

Settings:AddToggle("Auto Set Spawn",true,function(t)
    _G.AutoSetSpawn = t
end)

Settings:AddToggle("Auto Attack",true,function(t)
    _G.AutoAttack = t
end)

Settings:AddToggle("Fast Attack",true,function(t)
    _G.FastAttack = t
end)

Settings:AddToggle("Bring Mob",true,function(t)
    _G.BringMob = t
end)

Autostats:AddToggle("Auto Melee",false,function(t)
    _G.Melee = t
end)

Autostats:AddToggle("Auto Defense",false,function(t)
    _G.Def = t
end)
Autostats:AddToggle("Auto Sword",false,function(t)
    _G.Sword = t
end)
Autostats:AddToggle("Auto Gun",false,function(t)
    _G.Gun = t
end)
Autostats:AddToggle("Auto Blox Fruit",false,function(t)
    _G.BF = t
end)

Raid:AddToggle("Auto Raid",false,function(t)
    _G.AutoRaid = t
end)
RaidProperty:AddDropdown("Select Raid Chip",Chip,"",false,function(t)
    _G.DunChip = t
end)
RaidProperty:AddToggle("Auto Buy Chip",false,function(t)
    _G.BuyChip = t
end)
RaidProperty:AddToggle("Auto Next Island",false,function(t)
    _G.AutoNextIsland = t
end)
RaidProperty:AddToggle("Kill Aura",false,function(t)
    _G.Killaura = t
end)

Shop:AddToggle("Auto Random Fruit",false,function(t)
    _G.AutoRandomFruit = t
end)

Shop:AddButton("Random Fruit",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin" , "Buy")
end)

Haki:AddButton("Buy Geppo",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki" , "Geppo")
end)

Haki:AddButton("Buy Buso",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki" , "Buso")
end)

Haki:AddButton("Buy Soru",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki" , "Soru")
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSuperhuman then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") then
                    _G.ChooseWeapon = "Black Leg"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") then
                    _G.ChooseWeapon = "Electro"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") then
                    _G.ChooseWeapon = "Fishman Karate"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Breath") then
                    _G.ChooseWeapon = "Dragon Breath"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                    _G.ChooseWeapon = "Superhuman"
                end
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                for x,y in pairs(Melee) do
                    if v.Name == y then
                        if v:FindFirstChild("Level") then
                            if v.Name == Melee[1] then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                            end
                            if v.Name == Melee[2] then
                                if v.Level.Value >= 300 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                                end
                            elseif v.Name == Melee[3] then
                                if v.Level.Value >= 300 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                                end
                            elseif v.Name == Melee[4] then
                                if v.Level.Value >= 300 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                                end
                            elseif v.Name == Melee[5] then
                                if v.Level.Value >= 300 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                                end
                            end
                        end
                    end
                end
                end
            end
        end)
    end
end)


function Bring()
    if _G.BringMob then
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        for x,y in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == y.Name then
                v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                v.HumanoidRootPart.Transparency = 0.5
                y.HumanoidRootPart.Transparency = 0.5
                v.Humanoid.WalkSpeed = 0
                y.Humanoid.WalkSpeed = 0
                v.Humanoid.JumpPower = 0
                y.Humanoid.JumpPower = 0
                if sethiddenproperty then
                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                end
            end
        end
        end
    end
end

function Attack()
    if _G.AutoAttack then
        pcall(function()
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end)
    end
end

function EquipTool(Tool)
    if _G.AutoEquip then
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(Tool))
        end)
    end
end

function CheckQuest()
    local Id = game.PlaceId
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Id == 2753915549 then
        if Level == 1 or Level <= 9 then
            Mon = "Bandit [Lv. 5]"
            LQuest = 1
            NQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
        elseif Level == 10 or Level <= 14 then
            Mon = "Monkey [Lv. 14]"
            LQuest = 1
            NQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif Level == 15 or Level <= 29 then
            Mon = "Gorilla [Lv. 20]"
            LQuest = 2
            NQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif Level == 30 or Level <= 39 then
            Mon = "Pirate [Lv. 35]"
            LQuest = 1
            NQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        elseif Level == 40 or Level <= 59 then
            Mon = "Brute [Lv. 45]"
            LQuest = 2
            NQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        elseif Level == 60 or Level <= 74 then
            Mon = "Desert Bandit [Lv. 60]"
            LQuest = 1
            NQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
        elseif Level == 75 or Level <= 89 then
            Mon = "Desert Officer [Lv. 70]"
            LQuest = 2
            NQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
        elseif Level == 90 or Level <= 99 then
            Mon = "Snow Bandit [Lv. 90]"
            LQuest = 1
            NQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
        elseif Level == 100 or Level <= 119 then
            Mon = "Snowman [Lv. 100]"
            LQuest = 2
            NQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
        elseif Level == 120 or Level <= 149 then
            Mon = "Chief Petty Officer [Lv. 120]"
            LQuest = 1
            NQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 150 or Level <= 174 then
            Mon = "Sky Bandit [Lv. 150]"
            LQuest = 1
            NQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif Level == 175 or Level <= 189 then
            Mon = "Dark Master [Lv. 175]"
            LQuest = 2
            NQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif Level == 190 or Level <= 209 then
            Mon = "Prisoner [Lv. 190]"
            LQuest = 1
            NQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
        elseif Level == 210 or Level <= 249 then
            Mon = "Dangerous Prisoner [Lv. 210]"
            LQuest = 2
            NQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
        elseif Level == 250 or Level <= 274 then
            Mon = "Toga Warrior [Lv. 250]"
            LQuest = 1
            NQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
        elseif Level == 275 or Level <= 299 then
            Mon = "Gladiator [Lv. 275]"
            LQuest = 2
            NQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
        elseif Level == 300 or Level <= 324 then
            Mon = "Military Soldier [Lv. 300]"
            LQuest = 1
            NQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
        elseif Level == 325 or Level <= 449 then
            Mon = "Military Spy [Lv. 325]"
            LQuest = 2
            NQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
        elseif Level == 450 or Level <= 474 then
            Mon = "God's Guard [Lv. 450]"
            LQuest = 1
            NQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
        elseif Level == 475 or Level <= 524 then
            Mon = "Shanda [Lv. 475]"
            LQuest = 2
            NQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
        elseif Level == 525 or Level <= 549 then
            Mon = "Royal Squad [Lv. 525]"
            LQuest = 1
            NQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 550 or Level <= 624 then
            Mon = "Royal Soldier [Lv. 550]"
            LQuest = 2
            NQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 625 or Level <= 649 then
            Mon = "Galley Pirate [Lv. 625]"
            LQuest = 1
            NQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
        elseif Level >= 650 then
            Mon = "Galley Captain [Lv. 650]"
            LQuest = 2
            NQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
        end
    elseif Id == 4442272183 then
        if Level == 700 or Level <= 724 then
            Mon = "Raider [Lv. 700]"
            LQuest = 1
            NQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
        elseif Level == 725 or Level <= 774 then
            Mon = "Mercenary [Lv. 725]"
            LQuest = 2
            NQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
        elseif Level == 775 or Level <= 799 then
            Mon = "Swan Pirate [Lv. 775]"
            LQuest = 1
            NQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
        elseif Level == 800 or Level <= 874 then
            Mon = "Factory Staff [Lv. 800]"
            NQuest = "Area2Quest"
            LQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
        elseif Level == 875 or Level <= 899 then
            Mon = "Marine Lieutenant [Lv. 875]"
            LQuest = 1
            NQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif Level == 900 or Level <= 949 then
            Mon = "Marine Captain [Lv. 900]"
            LQuest = 2
            NQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif Level == 950 or Level <= 974 then
            Mon = "Zombie [Lv. 950]"
            LQuest = 1
            NQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
        elseif Level == 975 or Level <= 999 then
            Mon = "Vampire [Lv. 975]"
            LQuest = 2
            NQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
        elseif Level == 1000 or Level <= 1049 then
            Mon = "Snow Trooper [Lv. 1000]"
            LQuest = 1
            NQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
        elseif Level == 1050 or Level <= 1099 then
            Mon = "Winter Warrior [Lv. 1050]"
            LQuest = 2
            NQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
        elseif Level == 1100 or Level <= 1124 then
            Mon = "Lab Subordinate [Lv. 1100]"
            LQuest = 1
            NQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
        elseif Level == 1125 or Level <= 1174 then
            Mon = "Horned Warrior [Lv. 1125]"
            LQuest = 2
            NQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
        elseif Level == 1175 or Level <= 1199 then
            Mon = "Magma Ninja [Lv. 1175]"
            LQuest = 1
            NQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        elseif Level == 1200 or Level <= 1249 then
            Mon = "Lava Pirate [Lv. 1200]"
            LQuest = 2
            NQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        elseif Level == 1250 or Level <= 1274 then
            Mon = "Ship Deckhand [Lv. 1250]"
            LQuest = 1
            NQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
        elseif Level == 1275 or Level <= 1299 then
            Mon = "Ship Engineer [Lv. 1275]"
            LQuest = 2
            NQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)
        elseif Level == 1300 or Level <= 1324 then
            Mon = "Ship Steward [Lv. 1300]"
            LQuest = 1
            NQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
        elseif Level == 1325 or Level <= 1349 then
            Mon = "Ship Officer [Lv. 1325]"
            LQuest = 2
            NQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
        elseif Level == 1350 or Level <= 1374 then
            Mon = "Arctic Warrior [Lv. 1350]"
            LQuest = 1
            NQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
        elseif Level == 1375 or Level <= 1424 then
            Mon = "Snow Lurker [Lv. 1375]"
            LQuest = 2
            NQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
        elseif Level == 1425 or Level <= 1449 then
            Mon = "Sea Soldier [Lv. 1425]"
            LQuest = 1
            NQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
        elseif Level >= 1450 then
            Mon = "Water Fighter [Lv. 1450]"
            LQuest = 2
            NQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
        end
    elseif Id == 7449423635 then
        if Level == 1500 or Level <= 1524 then
            Mon = "Pirate Millionaire [Lv. 1500]"
            LQuest = 1
            NQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        elseif Level == 1525 or Level <= 1574 then
            Mon = "Pistol Billionaire [Lv. 1525]"
            LQuest = 2
            NQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        elseif Level == 1575 or Level <= 1599 then
            Mon = "Dragon Crew Warrior [Lv. 1575]"
            LQuest = 1
            NQuest = "AmazonQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
        elseif Level == 1600 or Level <= 1624 then 
            Mon = "Dragon Crew Archer [Lv. 1600]"
            NQuest = "AmazonQuest"
            LQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
        elseif Level == 1625 or Level <= 1649 then
            Mon = "Female Islander [Lv. 1625]"
            NQuest = "AmazonQuest2"
            LQuest = 1
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
        elseif Level == 1650 or Level <= 1699 then 
            Mon = "Giant Islander [Lv. 1650]"
            NQuest = "AmazonQuest2"
            LQuest = 2
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
        elseif Level == 1700 or Level <= 1724 then
            Mon = "Marine Commodore [Lv. 1700]"
            LQuest = 1
            NQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
        elseif Level == 1725 or Level <= 1774 then
            Mon = "Marine Rear Admiral [Lv. 1725]"
            NameMon = "Marine Rear Admiral"
            NQuest = "MarineTreeIsland"
            LQuest = 2
            CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
        elseif Level == 1775 or Level <= 1799 then
            Mon = "Fishman Raider [Lv. 1775]"
            LQuest = 1
            NQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
        elseif Level == 1800 or Level <= 1824 then
            Mon = "Fishman Captain [Lv. 1800]"
            LQuest = 2
            NQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
        elseif Level == 1825 or Level <= 1849 then
            Mon = "Forest Pirate [Lv. 1825]"
            LQuest = 1
            NQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
        elseif Level == 1850 or Level <= 1899 then
            Mon = "Mythological Pirate [Lv. 1850]"
            LQuest = 2
            NQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
        elseif Level == 1900 or Level <= 1924 then
            Mon = "Jungle Pirate [Lv. 1900]"
            LQuest = 1
            NQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        elseif Level == 1925 or Level <= 1974 then
            Mon = "Musketeer Pirate [Lv. 1925]"
            LQuest = 2
            NQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        elseif Level == 1975 or Level <= 1999 then
            Mon = "Reborn Skeleton [Lv. 1975]"
            LQuest = 1
            NQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif Level == 2000 or Level <= 2024 then
            Mon = "Living Zombie [Lv. 2000]"
            LQuest = 2
            NQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif Level == 2025 or Level <= 2049 then
            Mon = "Demonic Soul [Lv. 2025]"
            LQuest = 1
            NQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
        elseif Level == 2050 or Level <= 2074 then
            Mon = "Posessed Mummy [Lv. 2050]"
            LQuest = 2
            NQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2075 or Level <= 2099 then
            Mon = "Peanut Scout [Lv. 2075]"
            LQuest = 1
            NQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2100 or Level <= 2124 then
            Mon = "Peanut President [Lv. 2100]"
            LQuest = 2
            NQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2125 or Level <= 2149 then
            Mon = "Ice Cream Chef [Lv. 2125]"
            LQuest = 1
            NQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2150 or Level <= 2199 then
            Mon = "Ice Cream Commander [Lv. 2150]"
            LQuest = 2
            NQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2200 or Level <= 2224 then
            Mon = "Cookie Crafter [Lv. 2200]"
            LQuest = 1
            NQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
        elseif Level == 2225 or Level <= 2249 then
            Mon = "Cake Guard [Lv. 2225]"
            LQuest = 2
            NQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
        elseif Level == 2250 or Level <= 2274 then
            Mon = "Baking Staff [Lv. 2250]"
            LQuest = 1
            NQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
        elseif Level >= 2275  then
            Mon = "Head Baker [Lv. 2275]"
            LQuest = 2
            NQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
        end
    end
end

function Tween(P1)
    local Dis = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed
    if Dis < 1000 then
        Speed = 290
    elseif Dis >= 100 then
        Speed = 190
    end

    function DoAfter()
       game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end

    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true

    local tween = game:GetService("TweenService"):Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,TweenInfo.new(Dis/Speed,Enum.EasingStyle.Linear),{CFrame = P1})
    tween:Play()
    tween.Completed:Connect(DoAfter)
end
function TweenSe(P1)
    local Dis = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed
    if Dis < 1000 then
        Speed = 300
    elseif Dis >= 100 then
        Speed = 200
    end
    local tween = game:GetService("TweenService"):Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,TweenInfo.new(Dis/Speed,Enum.EasingStyle.Linear),{CFrame = P1})
    tween:Play()
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm then
                CheckQuest()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,NameMon) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == Mon then
                            if v:FindFirstChild("HumanoidRootPart") then
                                Attack()
                                EquipTool(_G.SelectWeapon)
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -  v.HumanoidRootPart.Position).Magnitude <= 500 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(20,0,0)
                                    Bring()
                                else 
                                    Tween(v.HumanoidRootPart.CFrame)
                                end

                            end
                        end
                    end
                else
                    Tween(CFrame.new(0,10,0) * CFrameQuest)
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -  CFrameQuest.Position).Magnitude <= 10 then
			wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQuest,LQuest)
                    end
                end
            end
        end)
    end
end)
	
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSaber then
                if game.Players.LocalPlayer.Data.Level.Value >= 200 then
                    local QPlates = game:GetService("Workspace").Map.Jungle.QuestPlates
                    if QPlates["Plate1"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate1"].Button.CFrame)
                    elseif QPlates["Plate2"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate2"].Button.CFrame)
                    elseif QPlates["Plate3"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate3"].Button.CFrame)
                    elseif QPlates["Plate4"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate4"].Button.CFrame)
                    elseif QPlates["Plate5"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate5"].Button.CFrame)
                    end
                    if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.CanCollide == false and game:GetService("Workspace").Map.Desert.Burn.Part.CanCollide == true then
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                            Tween(CFrame.new(-1610.025634765625, 12.177388191223145, 162.5987091064453))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                            EquipTool("Torch")
                            game:GetService("Workspace").Map.Desert.Burn.Fire.Size = Vector3.new(10,10,10)
                            game:GetService("Workspace").Map.Desert.Burn.Fire.CanCollide = false
                            Tween(CFrame.new(1113.6805419921875, 5.046795845031738, 4349.96484375))
                        end
                    end
                    if game:GetService("Workspace").Map.Desert.Burn.Part.CanCollide == false and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") or game.Players.LocalPlayer.Character:FindFirstChild("Cup") then
                            Tween(CFrame.new(1114.609619140625, 7.24679708480835, 4365.28076171875))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") or game.Players.LocalPlayer.Character:FindFirstChild("Cup") then
                            EquipTool("Cup")
                            game:GetService("Workspace").Map.Ice.ParticleDrop.Water.Size = Vector3.new(40,40,40)
                            game:GetService("Workspace").Map.Ice.ParticleDrop.Water.Transparency = 0
                            Tween(CFrame.new(1397.471435546875, 37.47333908081055, -1321.564208984375))
                        end
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedCup == false then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                    end 
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").TalkedSon == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedRelic == false then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Mob Leader [Lv. 120] [Boss]" then
                                if v:FindFirstChild("HumanoidRootPart") then
                                    Attack()
                                    EquipTool(_G.SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(20,0,0))
                                end
                            end
                        end
                        for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                            if y.Name == "Mob Leader [Lv. 120] [Boss]" then
                                if y:FindFirstChild("HumanoidRootPart") then
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - y.HumanoidRootPart.Position).Magnitude >= 100 then
                                        Tween(y.HumanoidRootPart.CFrame * CFrame.new(0,35,0))
                                    end
                                end
                            end
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedRelic == false and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").KilledMob == true then
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") or game.Players.LocalPlayer.Character:FindFirstChild("Relic") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") or game.Players.LocalPlayer.Character:FindFirstChild("Relic") then
                            EquipTool("Relic")
                            game:GetService("Workspace").Map.Jungle.Final.Invis.Size = Vector3.new(20,20,20)
                            game:GetService("Workspace").Map.Jungle.Final.Invis.CanCollide = false
                            Tween(CFrame.new(-1407.0384521484375, 29.977327346801758, 4.923530578613281))
                        end
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedRelic == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").KilledShanks == false then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Saber Expert [Lv. 200] [Boss]" then
                                if v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Humanoid") then
                                    Attack()
                                    EquipTool(_G.SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(20,0,0))
                                    v.HumanoidRootPart.Transparency = 0.5
                                    v.Humanoid.WalkSpeed = 0
                                    v.Humanoid.JumpPower = 0
                                    if sethiddenproperty then
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    end
                                end
                            end
                        end
                        for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                            if y.Name == "Saber Expert [Lv. 200] [Boss]" then
                                if y:FindFirstChild("HumanoidRootPart") then
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - y.HumanoidRootPart.Position).Magnitude >= 100 then
                                        Tween(y.HumanoidRootPart.CFrame * CFrame.new(20,0,0))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSea2 then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").UsedKey == false then
                    if not game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                        EquipTool("Key")
                        Tween(CFrame.new(1349.697265625, 37.34928512573242, -1328.8309326171875))
                        game:GetService("Workspace").Map.Ice.Door.Size = Vector3.new(30,30,30)
                    end
                end
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").UsedKey == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").KilledIceBoss == false then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                Attack()
                                EquipTool(_G.SelectWeapon)
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(20,0,0))
                            end
                        end
                    end
                    for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                        if y.Name == "Ice Admiral [Lv. 700] [Boss]" then
                            if y:FindFirstChild("HumanoidRootPart") then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - y.HumanoidRootPart.Position).Magnitude >= 100 then
                                    Tween(y.HumanoidRootPart.CFrame * CFrame.new(20,0,0))
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSetSpawn then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            end
        end)
    end
end)

local Module = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
local CombatFramework = debug.getupvalues(Module)[2]
local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
spawn(function() --Fast Attack
while wait() do
    if _G.FastAttack then
    pcall(function()
        CamShake:Stop()
        CombatFramework.activeController.attacking = false
        CombatFramework.activeController.timeToNextAttack = 0
        CombatFramework.activeController.increment = 3
        CombatFramework.activeController.hitboxMagnitude = 100
        CombatFramework.activeController.blocking = false
        CombatFramework.activeController.timeToNextBlock = 0
        CombatFramework.activeController.focusStart = 0
    end)
    end
    task.wait()
end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoBuso then
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Melee then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",1)
            end
            if _G.Def then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",1)
            end
            if _G.Sword then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",1)
            end
            if _G.Gun then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",1)
            end
            if _G.BF then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Blox Fruit",1)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BuyChip then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.DunChip)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Killaura then
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        pcall(function()
                            repeat wait(.1)
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                v.Humanoid.Health = 0
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.HumanoidRootPart.Transparency = 0.8
                            until not _G.Killaura or not v.Parent or v.Humanoid.Health <= 0
                        end)
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoRaid then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoNextIsland then
                local Island = game.Workspace._WorldOrigin.Locations
                if Island:FindFirstChild("Island 5") then
                    TweenSe(Island["Island 5"].CFrame * CFrame.new(0,35,0))
                elseif Island:FindFirstChild("Island 4") then
                    TweenSe(Island["Island 4"].CFrame * CFrame.new(0,35,0))
                elseif Island:FindFirstChild("Island 3") then
                    TweenSe(Island["Island 3"].CFrame * CFrame.new(0,35,0))
                elseif Island:FindFirstChild("Island 2") then
                    TweenSe(Island["Island 2"].CFrame * CFrame.new(0,35,0))
                elseif Island:FindFirstChild("Island 1") then
                    TweenSe(Island["Island 1"].CFrame * CFrame.new(0,35,0))
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoRandomFruit then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin" , "Buy")
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm or _G.AutoNextIsland or _G.AutoSaber or _G.AutoSea2 then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
