local UIS = game:GetService("UserInputService")
function dragify(Frame)
	dragToggle = nil
	local dragSpeed = 0
	dragInput = nil
	dragStart = nil
	local dragPos = nil
	function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.1), {
			Position = Position
		}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
local library = {}
function library:CreateWindow(text)
	local sg = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local line = Instance.new("Frame")
	local gamename = Instance.new("TextLabel")
	local tabtoggle = Instance.new("ImageButton")
	local tabholder = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Close = Instance.new("TextButton")
	local tabs = Instance.new("Folder")
	local UICorner = Instance.new("UICorner")
	sg.Name = "sg"
	sg.Parent = game.CoreGui
	sg.DisplayOrder = 1
	sg.ResetOnSpawn = false
	Main.Name = "Main"
	Main.Parent = sg
	Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Main.BorderColor3 = Color3.fromRGB(85, 85, 85)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.178707227, 0, 0.164688423, 0)
	Main.Size = UDim2.new(0, 332, 0, 219)
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
	gamename.Position = UDim2.new(0.0696969703, 0, 0, 0)
	gamename.Size = UDim2.new(0, 103, 0, 22)
	gamename.Font = Enum.Font.SourceSans
	gamename.TextColor3 = Color3.fromRGB(255, 255, 255)
	gamename.TextSize = 21.000
	gamename.Text = text
	tabtoggle.Name = "tabtoggle"
	tabtoggle.Parent = Main
	tabtoggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabtoggle.BackgroundTransparency = 1.000
	tabtoggle.Size = UDim2.new(0, 23, 0, 22)
	tabtoggle.Image = "http://www.roblox.com/asset/?id=5076535498"
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
	Close.MouseButton1Down:Connect(function()
		sg:Destroy()		
	end)
	tabs.Name = "tabs"
	tabs.Parent = Main
	UICorner.CornerRadius = UDim.new(0.0149999997, 0)
	UICorner.Parent = Main
	tas = false
	tabtoggle.MouseButton1Click:Connect(function()
		if tas == false then
			tas = true
			tabholder:TweenSize(UDim2.new(0, 71, 0, 196), "Out", "Sine", 0.2)
		elseif tas == true then
			tas = false
			tabholder:TweenSize(UDim2.new(0, 71, 0, 0), "Out", "Sine", 0.2)
		end
	end)
	open = false
	UIS.InputBegan:Connect(function(key, gp)
		if key.KeyCode == Enum.KeyCode.RightShift then
			if open == false then
				open = true
				Main.Visible = false
			elseif open == true then
				open = false
				Main.Visible = true
			end
		end
	end)
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
		tabbutton.MouseButton1Click:Connect(function()
			for i, v in next, tabs:GetChildren() do
				v.Visible = false
			end
			gaming.Visible = true
		end)
		UIGradient.Color = ColorSequence.new{
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
			TextButton.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
			UIGradient.Color = ColorSequence.new{
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
			TextLabel.Size = UDim2.new(0, 72, 0, 33)
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.Text = text
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 16
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
			local Toggled = false
			togglebutton.MouseButton1Click:Connect(function()
				Toggled = not Toggled
				if Toggled then
					pointer:TweenPosition(UDim2.new(0.5, 0, 0, 0), "In", "Sine", 0.2)
				else
					pointer:TweenPosition(UDim2.new(-0.018, 0, 0, 0), "Out", "Sine", 0.2)
				end
				callback(Toggled)
			end)
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
			slidernumber.Text = minvalue
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
			TextLabel.Text = text
			minvalue = minvalue
			maxvalue = maxvalue
			callback = callback or function()
			end
			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")
			local Value
			local down = false
			sliderbutton.MouseButton1Down:Connect(function()
				down = true
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 98) * slidermain.AbsoluteSize.X) + tonumber(minvalue)) or 0
				slidernumber.Text = Value
				pcall(callback, Value)
				slidermain:TweenSize(UDim2.new(0, math.clamp(mouse.X - slidermain.AbsolutePosition.X, 0, 98), 0, 9), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, .07)
				while game:GetService("RunService").RenderStepped:wait() and down do
					Value  = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 98) * slidermain.AbsoluteSize.X) + tonumber(minvalue)) or 0
					slidernumber.Text = Value
					pcall(callback, Value)
					slidermain:TweenSize(UDim2.new(0, math.clamp(mouse.X - slidermain.AbsolutePosition.X, 0, 98), 0, 9), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, .07)
				end
			end)
			uis.InputEnded:connect(function(key)
				if key.UserInputType == Enum.UserInputType.MouseButton1 and down then
					down = false
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 98) * slidermain.AbsoluteSize.X) + tonumber(minvalue)) or 0
					slidernumber.Text = Value
					pcall(callback, Value)
					slidermain:TweenSize(UDim2.new(0, math.clamp(mouse.X - slidermain.AbsolutePosition.X, 0, 98), 0, 9), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.1)
				end
			end)
			local terq = {}
			function terq:Set(SliderAmount)
				SliderAmount = tonumber(SliderAmount) or 0
				SliderAmount = (((SliderAmount >= 0 and SliderAmount <= 100) and SliderAmount) / 100)
				TweenService:Create(slidermain, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Size = UDim2.new(SliderAmount or 0, 0, 0, 9)
				}):Play()
				local p = math.floor((SliderAmount or 0) * 100)
				local difference = maxvalue - minvalue
				local Value = math.floor(((difference / 100) * p) + minvalue)
				slidernumber.Text = Value
				pcall(callback, Value)
			end
			return terq
		end
		function tab:CreateDropdown(text, list, callback)
			local list = list or {}
			local callback = callback or function() end
			local dropped = false
			local dropdownopen = Instance.new("TextButton")
            local UIGradient = Instance.new("UIGradient")
            local buttonlabel = Instance.new("TextLabel")
            local dropdown = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local UIPadding = Instance.new("UIPadding")
            local ScrollingFrame = Instance.new("ScrollingFrame")
            local UIListLayout = Instance.new("UIListLayout")
            local indicator = Instance.new("TextLabel")
            
            dropdownopen.Name = "dropdownopen"
            dropdownopen.Parent = gaming
            dropdownopen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            dropdownopen.Position = UDim2.new(-0.00903614424, 0, 0.0612244904, 0)
            dropdownopen.Size = UDim2.new(0, 105, 0, 40)
            dropdownopen.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
            dropdownopen.Font = Enum.Font.SourceSans
            dropdownopen.Text = ''
            dropdownopen.TextColor3 = Color3.fromRGB(0, 0, 0)
            dropdownopen.TextSize = 14.000
            
            UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(45, 45, 45)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(45, 45, 45))}
            UIGradient.Parent = dropdownopen
            
            buttonlabel.Name = "buttonlabel"
            buttonlabel.Parent = dropdownopen
            buttonlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            buttonlabel.BackgroundTransparency = 1.000
            buttonlabel.Position = UDim2.new(-0.00680267997, 0, -0.132652789, 0)
            buttonlabel.Size = UDim2.new(0, 88, 0, 24)
            buttonlabel.Font = Enum.Font.SourceSans
            buttonlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            buttonlabel.TextSize = 18.000
            buttonlabel.TextWrapped = true
            buttonlabel.TextXAlignment = Enum.TextXAlignment.Left
            buttonlabel.Text = text
            
            dropdown.Name = "dropdown"
            dropdown.Parent = dropdownopen
            dropdown.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
            dropdown.BorderSizePixel = 0
            dropdown.ClipsDescendants = true
            dropdown.Position = UDim2.new(-0.118623868, 0, 1.67161775, 0)
            dropdown.Size = UDim2.new(0, 100, 0, 0)
            
            UICorner.CornerRadius = UDim.new(0, 2)
            UICorner.Parent = dropdown
            
            UIPadding.Parent = dropdown
            UIPadding.PaddingTop = UDim.new(0, 2)
            
            ScrollingFrame.Parent = dropdown
            ScrollingFrame.Active = false
            ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollingFrame.BackgroundTransparency = 2.000
            ScrollingFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ScrollingFrame.ClipsDescendants = false
            ScrollingFrame.Size = UDim2.new(0, 100, 0, 103)
            ScrollingFrame.ScrollBarThickness = 3
            

            
            UIListLayout.Parent = ScrollingFrame
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 4)
            
            indicator.Name = "indicator"
            indicator.Parent = dropdownopen
            indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            indicator.BackgroundTransparency = 1.000
            indicator.Position = UDim2.new(0.497959077, 0, 0.0748298168, 0)
            indicator.Size = UDim2.new(0, 68, 0, 16)
            indicator.Font = Enum.Font.SourceSans
            indicator.Text = "+"
            indicator.TextColor3 = Color3.fromRGB(255, 255, 255)
            indicator.TextSize = 21.000
			dropdownopen.MouseButton1Click:Connect(function()
				if dropped == false then
				    dropped = not dropped
					indicator.Text = "-"
					dropdown:TweenSize(UDim2.new(0, 100, 0, 103), "Out", "Sine", 0.1)
					ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y+5)
				else
				    dropped = not dropped
					indicator.Text = "+"
					dropdown:TweenSize(UDim2.new(0, 100, 0, 0), "Out", "Sine", 0.1)
					ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y+5)
				end
			end)
			for i,v in pairs(list or {}) do
                local dropbutton = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                
                dropbutton.Name = "dropbutton"
                dropbutton.Parent = ScrollingFrame
                dropbutton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                dropbutton.BorderSizePixel = 0
                dropbutton.Position = UDim2.new(0.0299999993, 0, 0.0199999996, 0)
                dropbutton.Size = UDim2.new(0, 90, 0, 30)
                dropbutton.Font = Enum.Font.SourceSans
                dropbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
                dropbutton.TextSize = 14.000
                dropbutton.Text = v
                
                UICorner.CornerRadius = UDim.new(0, 3)
                UICorner.Parent = dropbutton
				dropbutton.MouseButton1Click:Connect(function()
					buttonlabel.Text = v
					callback(v)
					indicator.Text = "+"
					dropped = false
					dropdown:TweenSize(UDim2.new(0, 100, 0, 0), "Out", "Sine", 0.1)
				end)
			end
		end
		return tab
	end
	return asd
end
return library
