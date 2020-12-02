local function randomName()
    local data = ""
    for i = 0, 20, 1 do
        data = data .. tostring(string.char(math.ceil(math.random() * 233)))
    end
    return data
end
local UIS = game:GetService("UserInputService")
function dragify(Frame)
    dragToggle = nil
    local dragSpeed = 0
    dragInput = nil
    dragStart = nil
    local dragPos = nil
    function updateInput(input)
        local Delta = input.Position - dragStart
        local Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.1), {Position = Position}):Play()
    end
    Frame.InputBegan:Connect(
        function(input)
            if
                (input.UserInputType == Enum.UserInputType.MouseButton1 or
                    input.UserInputType == Enum.UserInputType.Touch) and
                    UIS:GetFocusedTextBox() == nil
             then
                dragToggle = true
                dragStart = input.Position
                startPos = Frame.Position
                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragToggle = false
                        end
                    end
                )
            end
        end
    )
    Frame.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
                dragInput = input
            end
        end
    )
    game:GetService("UserInputService").InputChanged:Connect(
        function(input)
            if input == dragInput and dragToggle then
                updateInput(input)
            end
        end
    )
end
local library = {}
function library:CreateWindow(text)
    local cock = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local line = Instance.new("Frame")
    local gamename = Instance.new("TextLabel")
    local Close = Instance.new("TextButton")
    local tabs = Instance.new("Folder")
    local tabholder = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local tabtoggle = Instance.new("ImageButton")

    cock.Name = randomName()
    cock.Parent = game.CoreGui

    Main.Name = "Main"
    Main.Parent = cock
    Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Main.BorderColor3 = Color3.fromRGB(85, 85, 85)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.161596954, 0, 0.161721066, 0)
    Main.Size = UDim2.new(0, 332, 0, 219)
    Main.Active = true
    dragify(Main)

    line.Name = "line"
    line.Parent = Main
    line.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
    line.BorderSizePixel = 0
    line.Position = UDim2.new(0, 0, 0, 22)
    line.Size = UDim2.new(0, 330, 0, 1)

    gamename.Name = "gamename"
    gamename.Parent = Main
    gamename.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    gamename.BackgroundTransparency = 1.000
    gamename.Position = UDim2.new(0.0933734924, 0, 0, 0)
    gamename.Size = UDim2.new(0, 135, 0, 22)
    gamename.Font = Enum.Font.SourceSans
    gamename.TextColor3 = Color3.fromRGB(255, 255, 255)
    gamename.TextSize = 21.000
    gamename.Text = text or "NewWindow"

    Close.Name = "Close"
    Close.Parent = Main
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.Position = UDim2.new(0.918674707, 0, -0.00456620986, 0)
    Close.Size = UDim2.new(0, 27, 0, 23)
    Close.Font = Enum.Font.SourceSans
    Close.Text = "x"
    Close.TextColor3 = Color3.fromRGB(255, 255, 255)
    Close.TextSize = 21.000
    Close.MouseButton1Click:Connect(
        function()
            cock:Destroy()
        end
    )

    tabs.Name = "tabs"
    tabs.Parent = Main

    tabholder.Name = "tabholder"
    tabholder.Parent = Main
    tabholder.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    tabholder.BorderSizePixel = 0
    tabholder.ClipsDescendants = true
    tabholder.Position = UDim2.new(0, 0, 0.105022833, 0)
    tabholder.Size = UDim2.new(0, 71, 0, 0)
    tabholder.ZIndex = 2

    UIListLayout.Parent = tabholder
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    tabtoggle.Name = "tabtoggle"
    tabtoggle.Parent = Main
    tabtoggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabtoggle.BackgroundTransparency = 1.000
    tabtoggle.Size = UDim2.new(0, 23, 0, 22)
    tabtoggle.Image = "http://www.roblox.com/asset/?id=5076535498"
    tas = false
    tabtoggle.MouseButton1Click:Connect(
        function()
            if tas == false then
                tas = true
                tabholder:TweenSize(UDim2.new(0, 71, 0, 196), "Out", "Sine", 0.2)
            elseif tas == true then
                tas = false
                tabholder:TweenSize(UDim2.new(0, 71, 0, 0), "Out", "Sine", 0.2)
            end
        end
    )

    local asd = {}

    function asd:CreateTab(title, visible)
        local gaming = Instance.new("Frame")
        local UIGridLayout = Instance.new("UIGridLayout")
        local UIPadding = Instance.new("UIPadding")
        local tabbutton = Instance.new("TextButton")
        local UIGradient = Instance.new("UIGradient")
        local tabtext = Instance.new("TextLabel")

        gaming.Name = title or "gaming"
        gaming.Parent = tabs
        gaming.BackgroundColor3 = Color3.fromRGB(45, 42, 16)
        gaming.BackgroundTransparency = 1.000
        gaming.BorderSizePixel = 0
        gaming.ClipsDescendants = true
        gaming.Position = UDim2.new(0, 0, 0, 23)
        gaming.Size = UDim2.new(1, 0, 0.995433807, -22)
        gaming.Visible = visible or false

        UIGridLayout.Parent = gaming
        UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIGridLayout.CellSize = UDim2.new(0, 105, 0, 42)

        UIPadding.Parent = gaming
        UIPadding.PaddingLeft = UDim.new(0, 3)
        UIPadding.PaddingTop = UDim.new(0, 6)

        tabbutton.Name = "tabbutton"
        tabbutton.Parent = tabholder
        tabbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabbutton.Size = UDim2.new(0, 71, 0, 33)
        tabbutton.ZIndex = 4
        tabbutton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
        tabbutton.Font = Enum.Font.SourceSans
        tabbutton.Text = ""
        tabbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
        tabbutton.TextSize = 14.000
        tabbutton.MouseButton1Click:Connect(
            function()
                for i, v in next, tabs:GetChildren() do
                    v.Visible = false
                end
                gaming.Visible = true
            end
        )

        UIGradient.Color =
            ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(45, 45, 45)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(45, 45, 45))
        }
        UIGradient.Parent = tabbutton

        tabtext.Name = "tabtext"
        tabtext.Parent = tabbutton
        tabtext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabtext.BackgroundTransparency = 1.000
        tabtext.Position = UDim2.new(-0.288038015, 0, -0.809917212, 0)
        tabtext.Size = UDim2.new(0, 76, 0, 24)
        tabtext.ZIndex = 5
        tabtext.Font = Enum.Font.SourceSans
        tabtext.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabtext.TextSize = 14.000
        tabtext.Text = title or "NewTab"

        local tab = {}

        function tab:CreateButton(text, callback)
            local callback = callback or function()
                end

            local TextButton = Instance.new("TextButton")
            local UIGradient = Instance.new("UIGradient")
            local buttonlabel = Instance.new("TextLabel")

            TextButton.Parent = gaming
            TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.Size = UDim2.new(0, 105, 0, 40)
            TextButton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
            TextButton.Font = Enum.Font.SourceSans
            TextButton.Text = ""
            TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton.TextSize = 14.000
            TextButton.Name = name or "TextButton"
            TextButton.MouseButton1Click:Connect(
                function()
                    pcall(callback)
                end
            )

            UIGradient.Color =
                ColorSequence.new {
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(45, 45, 45)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(45, 45, 45))
            }
            UIGradient.Parent = TextButton

            buttonlabel.Name = "buttonlabel"
            buttonlabel.Parent = TextButton
            buttonlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            buttonlabel.BackgroundTransparency = 1.000
            buttonlabel.Position = UDim2.new(-0.0952381045, 0, -0.142857134, 0)
            buttonlabel.Size = UDim2.new(0, 93, 0, 24)
            buttonlabel.Font = Enum.Font.SourceSans
            buttonlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            buttonlabel.TextSize = 18.000
            buttonlabel.TextWrapped = true
            buttonlabel.Text = text or "NewButton"
        end

        function tab:CreateToggle(text, callback)
            local switchactions = {}
            enabled = false
            callback = callback or function()
                end
            local toggleholder = Instance.new("Frame")
            local TextLabel = Instance.new("TextLabel")
            local togglebutton = Instance.new("TextButton")
            local UICorner = Instance.new("UICorner")
            local pointer = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")

            toggleholder.Name = "toggleholder" or text
            toggleholder.Parent = gaming
            toggleholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleholder.BackgroundTransparency = 1.000
            toggleholder.Size = UDim2.new(0, 100, 0, 100)

            TextLabel.Parent = toggleholder
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(-0.0476190485, 0, 0.095238097, 0)
            TextLabel.Size = UDim2.new(0, 61, 0, 33)
            TextLabel.Font = Enum.Font.SourceSans
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextSize = 18.000
            TextLabel.Text = text

            togglebutton.Name = "togglebutton"
            togglebutton.Parent = toggleholder
            togglebutton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
            togglebutton.BorderSizePixel = 0
            togglebutton.Position = UDim2.new(0.63809526, 0, 0.319727957, 0)
            togglebutton.Size = UDim2.new(0, 29, 0, 17)
            togglebutton.Font = Enum.Font.SourceSans
            togglebutton.Text = ""
            togglebutton.TextColor3 = Color3.fromRGB(0, 0, 0)
            togglebutton.TextSize = 14.000

            UICorner.CornerRadius = UDim.new(0, 2)
            UICorner.Parent = togglebutton

            pointer.Name = "pointer"
            pointer.Parent = togglebutton
            pointer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            pointer.Position = UDim2.new(-0.017583387, 0, 0, 0)
            pointer.Size = UDim2.new(0, 15, 0, 17)

            UICorner_2.CornerRadius = UDim.new(0.150000006, 0)
            UICorner_2.Parent = pointer
            function Trigger()
                enabled = not enabled
                pointer:TweenPosition(
                    enabled and UDim2.new(0.5, 0, 0, 0) or UDim2.new(-0.018, 0, 0, 0),
                    "In",
                    "Sine",
                    0.2
                )
                pcall(callback, enabled)
            end

            togglebutton.MouseButton1Click:Connect(Trigger)

            function switchactions:Set(state)
                enabled = state
                pointer:TweenPosition(
                    enabled and UDim2.new(0.5, 0, 0, 0) or UDim2.new(-0.018, 0, 0, 0),
                    "In",
                    "Sine",
                    0.2
                )
                pcal(callback, enabled)
            end
            return switchactions
        end

        function tab:CreateSlider(text, minvalue, maxvalue, callback)
            local slider = Instance.new("TextLabel")
            local sliderbutton = Instance.new("TextButton")
            local slidermain = Instance.new("Frame")
            local slidernumber = Instance.new("TextLabel")
            local TextLabel = Instance.new("TextLabel")

            slider.Name = "slider"
            slider.Parent = gaming
            slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            slider.BackgroundTransparency = 1.000
            slider.Size = UDim2.new(0, 200, 0, 50)
            slider.Font = Enum.Font.SourceSans
            slider.Text = ""
            slider.TextColor3 = Color3.fromRGB(255, 255, 255)
            slider.TextSize = 17.000
            slider.TextXAlignment = Enum.TextXAlignment.Left
            slider.TextYAlignment = Enum.TextYAlignment.Top

            sliderbutton.Name = "sliderbutton"
            sliderbutton.Parent = slider
            sliderbutton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
            sliderbutton.BorderSizePixel = 0
            sliderbutton.Position = UDim2.new(0.0476190485, 0, 0.5, 0)
            sliderbutton.Size = UDim2.new(0, 95, 0, 9)
            sliderbutton.Font = Enum.Font.SourceSans
            sliderbutton.Text = ""
            sliderbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
            sliderbutton.TextSize = 14.000

            slidermain.Name = "slider main"
            slidermain.Parent = sliderbutton
            slidermain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            slidermain.BorderSizePixel = 0
            slidermain.Position = UDim2.new(-0.0285714287, 0, 0, 0)
            slidermain.Size = UDim2.new(0, 0, 0, 9)

            slidernumber.Name = "slidernumber"
            slidernumber.Parent = slider
            slidernumber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            slidernumber.BackgroundTransparency = 1.000
            slidernumber.Position = UDim2.new(0.780952394, 0, 0, 0)
            slidernumber.Size = UDim2.new(0, 23, 0, 21)
            slidernumber.Font = Enum.Font.SourceSans
            slidernumber.Text = "0"
            slidernumber.TextColor3 = Color3.fromRGB(255, 255, 255)
            slidernumber.TextSize = 18.000

            TextLabel.Parent = slider
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(0.0476190485, 0, 0, 0)
            TextLabel.Size = UDim2.new(0, 84, 0, 21)
            TextLabel.Font = Enum.Font.SourceSans
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextSize = 14.000
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left
            minvalue = minvalue
            maxvalue = maxvalue

            -----Callback-----
            callback = callback or function()
                end

            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")
            local Value
            local down = false

            sliderbutton.MouseButton1Down:Connect(
                function()
                    down = true
                    Value =
                        math.floor(
                        (((tonumber(maxvalue) - tonumber(minvalue)) / 98) * slidermain.AbsoluteSize.X) +
                            tonumber(minvalue)
                    ) or 0
                    slidernumber.Text = Value
                    pcall(callback, Value)
                    slidermain:TweenSize(
                        UDim2.new(0, math.clamp(mouse.X - slidermain.AbsolutePosition.X, 0, 98), 0, 9),
                        Enum.EasingDirection.InOut,
                        Enum.EasingStyle.Linear,
                        .07
                    )
                    while game:GetService("RunService").RenderStepped:wait() and down do
                        Value =
                            math.floor(
                            (((tonumber(maxvalue) - tonumber(minvalue)) / 98) * slidermain.AbsoluteSize.X) +
                                tonumber(minvalue)
                        ) or 0
                        slidernumber.Text = Value
                        pcall(callback, Value)
                        slidermain:TweenSize(
                            UDim2.new(0, math.clamp(mouse.X - slidermain.AbsolutePosition.X, 0, 98), 0, 9),
                            Enum.EasingDirection.InOut,
                            Enum.EasingStyle.Linear,
                            .07
                        )
                    end
                end
            )

            uis.InputEnded:connect(
                function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 and down then
                        down = false
                        Value =
                            math.floor(
                            (((tonumber(maxvalue) - tonumber(minvalue)) / 98) * slidermain.AbsoluteSize.X) +
                                tonumber(minvalue)
                        ) or 0
                        slidernumber.Text = Value
                        pcall(callback, Value)
                        slidermain:TweenSize(
                            UDim2.new(0, math.clamp(mouse.X - slidermain.AbsolutePosition.X, 0, 98), 0, 9),
                            Enum.EasingDirection.InOut,
                            Enum.EasingStyle.Linear,
                            0.1
                        )
                    end
                end
            )
            local ss = {}

            function ss:Set(SliderAmount)
                SliderAmount = tonumber(SliderAmount) or 0
                SliderAmount = (((SliderAmount >= 0 and SliderAmount <= 100) and SliderAmount) / 100)
                TweenService:Create(
                    slidermain,
                    TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                    {Size = UDim2.new(SliderAmount or 0, 0, 0, 9)}
                ):Play()
                local p = math.floor((SliderAmount or 0) * 100)

                local difference = maxvalue - minvalue

                local Value = math.floor(((difference / 100) * p) + minvalue)

                slidernumber.Text = Value
                pcall(callback, Value)
            end
            return ss
        end
        return tab
    end
    return asd
end
return library
