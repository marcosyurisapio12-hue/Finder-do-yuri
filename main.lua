
-- EGG FINDER | ROUBE UM OVO
-- Painel visual para Delta Executor

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EggFinder"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 280, 0, 330)
Frame.Position = UDim2.new(0.5, -140, 0.5, -165)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Frame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Text = "🥚 EGG FINDER"
Title.TextColor3 = Color3.fromRGB(255, 220, 70)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.85, 0, 0, 40)
Button.Position = UDim2.new(0.075, 0, 0, 55)
Button.BackgroundColor3 = Color3.fromRGB(100, 70, 220)
Button.Text = "PROCURAR OVOS"
Button.TextColor3 = Color3.new(1,1,1)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 14
Button.Parent = Frame

local Results = Instance.new("TextLabel")
Results.Size = UDim2.new(0.9, 0, 0, 210)
Results.Position = UDim2.new(0.05, 0, 0, 110)
Results.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
Results.TextColor3 = Color3.fromRGB(255,255,255)
Results.TextSize = 13
Results.Font = Enum.Font.Gotham
Results.TextWrapped = true
Results.TextYAlignment = Enum.TextYAlignment.Top
Results.TextXAlignment = Enum.TextXAlignment.Left
Results.Text = "Clique em PROCURAR OVOS."
Results.Parent = Frame

local function FindEggs()
    local Found = {}

    for _, obj in ipairs(Workspace:GetDescendants()) do
        if string.find(string.lower(obj.Name), "egg") then
            table.insert(Found, obj.Name)
        end
    end

    local Text = "OVOS ENCONTRADOS:\n\n"

    for i, name in ipairs(Found) do
        if i > 20 then break end
        Text = Text .. "🥚 " .. name .. "\n"
    end

    if #Found == 0 then
        Text = "Nenhum objeto com 'egg' no nome foi encontrado."
    end

    Results.Text = Text .. "\nTotal: " .. #Found
end

Button.MouseButton1Click:Connect(FindEggs)

print("EGG FINDER carregado!")
