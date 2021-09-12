for i,v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
	if v:IsA("BoolValue") and v.Name == "kills" then
		v.Parent:Destroy()
	end
end

print("Cleaned kill parts")
