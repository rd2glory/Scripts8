game:GetService("RunService").RenderStepped:Connect(function()
    if shared.on then
        for _,v in pairs(workspace.Carts:GetChildren()) do
            for _,train in pairs(v:GetChildren()) do
                if train.Name == "Cart" and train:FindFirstChild("Up") then
                    fireclickdetector(train.Up.Click)
                end
            end
        end
    end
end)
shared.on = true
