[span_3](start_span)local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()[span_3](end_span)

local Window = Rayfield:CreateWindow({
   Name = "IsaHub (The ultra hub)",
   LoadingTitle = "Carregando... duração 34 trilhões de anos",
   LoadingSubtitle = "by IsaacLindo123 (Github)",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "IsafigConfig", 
      FileName = "PrincipalConfig"
   }
[span_4](start_span)})[span_4](end_span)

-- ABAS PRINCIPAIS
local TabAdm = Window:CreateTab("Adm Scripts", 4483362458)
local TabBrook = Window:CreateTab("Brookhaven", 4483362458)
local TabLucky = Window:CreateTab("Lucky Block", 4483362458)
[span_5](start_span)local TabKnock = Window:CreateTab("Knockout", 4483362458)[span_5](end_span)

--- SEÇÃO: ADM SCRIPTS
TabAdm:CreateButton({
   Name = "Infinite Yield IY",
   Callback = function()
      [span_6](start_span)loadstring(game:HttpGet('https://raw.githubusercontent.com/Edgeiy/infiniteyield/master/source'))()[span_6](end_span)
   end,
})

TabAdm:CreateButton({
   Name = "Nameless Admin NA",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
   end,
})

--- SEÇÃO: Brookhavem (para trolar os amiguitos)
local Clip = true
game:GetService("RunService").Stepped:Connect(function()
    if not Clip and game.Players.LocalPlayer.Character then
        for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if child:IsA("BasePart") then child.CanCollide = false end
        end
    end
[span_7](start_span)end)[span_7](end_span)

TabBrook:CreateToggle({
   Name = "Noclip (sem a cripage)",
   CurrentValue = false,
   Callback = function(Value) Clip = not Value end,
[span_8](start_span)})[span_8](end_span)

TabBrook:CreateButton({
   Name = "Fly (Vua)",
   Callback = function()
      -- Link .txt atualizado por você
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})

TabBrook:CreateButton({
   Name = "Fling (joga as pessoa pru quintu dus infernu)",
   Callback = function()
      -- Novo Fling unpatched (mais estável)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Mini-C4/Roblox-Fling-Script/main/Fling.lua"))()
   end,
})

--- SEÇÃO: Break a lucky block (Meu jogo favorito)
TabLucky:CreateButton({
   Name = "Quebrar os lucky brocki próximo (Auto Break)",
   Callback = function()
      for _, v in pairs(game.Workspace:GetChildren()) do
          [span_9](start_span)if (v.Name:find("Block") or v:FindFirstChild("ClickDetector")) and v:FindFirstChild("ClickDetector") then[span_9](end_span)
              fireclickdetector(v.ClickDetector)
          end
      end
   end,
})

TabLucky:CreateToggle({
   Name = "Puxa us item du chão (Praticamente um spawn)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Loot = Value
      while _G.Loot do
          task.wait(0.5)
          [span_10](start_span)for _, item in pairs(game.Workspace:GetChildren()) do[span_10](end_span)
              if item:IsA("Tool") and item:FindFirstChild("Handle") then
                  item.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
              end
          end
      end
   end,
})

--- SEÇÃO: Knockout (OP) (baterfora)
local ReachSize = 15
local KAura = false

TabKnock:CreateToggle({
   Name = "Kill Aura (Para atacar us inimigu)",
   CurrentValue = false,
   [span_11](start_span)Callback = function(Value)[span_11](end_span)
      KAura = Value
      task.spawn(function()
         while KAura do
            task.wait(0.2)
            local p = game.Players.LocalPlayer
            for _, v in pairs(game.Players:GetPlayers()) do
               [span_12](start_span)if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then[span_12](end_span)
                  local dist = (p.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                  if dist <= ReachSize then
                     local tool = p.Character:FindFirstChildOfClass("Tool")
                     [span_13](start_span)if tool then tool:Activate() end[span_13](end_span)
                  end
               end
            end
         end
      end)
   end,
})

TabKnock:CreateSlider({
   Name = "Alcance do Reach",
   Min = 10, Max = 40, Default = 15,
   [span_14](start_span)Callback = function(Value) ReachSize = Value end,[span_14](end_span)
})

Rayfield:Notify({Title = "Carregado o IsaHub KEYLESS!!", Content = "Divirta-se (ou não...)", Duration = 5})
