
local widgetInfo  = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, --This can be changed--
	false,
	false,
	200,
	200,
	150,
	150)
local widget = plugin:CreateDockWidgetPluginGui("Viewport", widgetInfo)
widget.Title = "Viewport"

--[[
	TOGGLING THE WIDGET
]]
local ui = script.Parent.ScreenGui
ui.Parent = widget

ui.ViewportFrame.CurrentCamera = game.Workspace.Camera

local toolbar = plugin:CreateToolbar("Edit Viewport")
local toggle = toolbar:CreateButton("Toggle Eidtor", "Toggle the widget", "")

toggle.Click:Connect(function()
	widget.Enabled = not widget.Enabled
end)

ui.model.MouseButton1Click:Connect(function()
	local Selection = game:GetService("Selection")

	for _, object in pairs(Selection:Get()) do
		object:Clone().Parent = ui.ViewportFrame				
		local newbuttonselect = ui.Frame.TextButton:Clone()
		newbuttonselect.Visible = true
		newbuttonselect.Name = object.Name
		newbuttonselect.Parent = ui.Frame
		newbuttonselect.Text = "Delete: "..object.Name
		newbuttonselect.MouseButton1Click:Connect(function()
			ui.ViewportFrame:FindFirstChild(object.Name):Destroy()
			newbuttonselect:Destroy()
			
		end)
		
	end
end)

ui.insert.MouseButton1Click:Connect(function()
	local Selection = game:GetService("Selection")
	local new = ui.ViewportFrame:Clone()
	new.Parent = workspace
end)
