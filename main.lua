local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "IsaHub (The ultra hub)",
   LoadingTitle = "Carregando... duração 34 trilhões de anos",
   LoadingSubtitle = "by IsaacLindo123 (Github)",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "IsafigConfig", 
      FileName = "PrincipalConfig"
   }
})

---------------------------------------------------------
--- ABAS DO MENU
---------------------------------------------------------
local TabAdm = Window:CreateTab("Adm Scripts", 4483362458)
local TabBrook = Window:CreateTab("Brookhaven (pra trola us amiguito)", 4483362458)
local TabLucky = Window:CreateTab("Break a Lucky Block meu jogo FAVORITO", 4483362458)
local TabKnock = Window:CreateTab("Knockout (OP) (baterfora)", 4483362458)

---------------------------------------------------------
--- SEÇÃO: ADM SCRIPTS
---------------------------------------------------------
TabAdm:CreateButton({
   Name = "Infinite Yield IY",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/Edgeiy/infiniteyield/master/source'))()
   end,
})

TabAdm:CreateButton({
   Name = "Nameless Admin NA",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
   end,
})

---------------------------------------------------------
--- SEÇÃO: BROOKHAVEN (ZONA DE CAOS)
---------------------------------------------------------
local Clip = true
game:GetService("RunService").Stepped:Connect(function()
    if not Clip and game.Players.LocalPlayer.Character then
        for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if child:IsA("BasePart") then child.CanCollide = false end
        end
    end
end)

TabBrook:CreateToggle({
   Name = "Noclip (sem a cripage)",
   CurrentValue = false,
   Callback = function(Value) Clip = not Value end,
})

TabBrook:CreateButton({
   Name = "Fly (Vua)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})

TabBrook:CreateToggle({
   Name = "Fling (joga as pessoa pru quintu dus infernu)",
   CurrentValue = false,
   Callback = function(Value)
      _G.FlingEnabled = Value
      if _G.FlingEnabled then
          Rayfield:Notify({Title = "Fling Ativado", Content = "Encoste em alguém!", Duration = 2})
          task.spawn(function()
              while _G.FlingEnabled do
                  task.wait(0.1)
                  local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                  if hrp then hrp.Velocity = Vector3.new(0, 10000, 0) end
              end
          end)
      end
   end,
})


local TornadoActive = false
TabBrook:CreateToggle({
   Name = "🌪️ Ativa u furação (pra leva as pessoa pu djabu)",
   CurrentValue = false,
   Callback = function(Value)
      TornadoActive = Value
      if TornadoActive then
          Rayfield:Notify({Title = "FURACÃO ATIVADO!", Content = "Corra em direção às pessoas ou carros pra leva pu djabu", Duration = 3})
          task.spawn(function()
              while TornadoActive do
                  task.wait()
                  local char = game.Players.LocalPlayer.Character
                  local hrp = char and char:FindFirstChild("HumanoidRootPart")
                  if hrp then
                      hrp.Velocity = Vector3.new(0, 2500, 0) -- Força pra cima
                      hrp.RotVelocity = Vector3.new(0, 8000, 0) -- Giro furioso
                  end
              end
          end)
      else
          local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
          if hrp then 
              hrp.RotVelocity = Vector3.new(0,0,0) 
              hrp.Velocity = Vector3.new(0,0,0) 
          end
      end
   end,
})

---------------------------------------------------------
--- SEÇÃO: BREAK A LUCKY BLOCK
---------------------------------------------------------
TabLucky:CreateButton({
   Name = "Quebrar os lucky brocki próximo (Auto Break)",
   Callback = function()
      for _, v in pairs(game.Workspace:GetChildren()) do
          if (v.Name:find("Block") or v:FindFirstChild("ClickDetector")) and v:FindFirstChild("ClickDetector") then
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
          if not _G.Loot then break end
          for _, item in pairs(game.Workspace:GetChildren()) do
              if item:IsA("Tool") and item:FindFirstChild("Handle") then
                  local char = game.Players.LocalPlayer.Character
                  if char and char:FindFirstChild("HumanoidRootPart") then
                      item.Handle.CFrame = char.HumanoidRootPart.CFrame
                  end
              end
          end
      end
   end,
})

---------------------------------------------------------
--- SEÇÃO: KNOCKOUT (OP)
---------------------------------------------------------
local ReachSize = 15
local KAura = false

TabKnock:CreateToggle({
   Name = "Kill Aura (quintu dus infernu)",
   CurrentValue = false,
   Callback = function(Value)
      KAura = Value
      task.spawn(function()
         while KAura do
            task.wait(0.2)
            if not KAura then break end
            local p = game.Players.LocalPlayer
            for _, v in pairs(game.Players:GetPlayers()) do
               if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                  local dist = (p.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                  if dist <= ReachSize then
                     local tool = p.Character:FindFirstChildOfClass("Tool")
                     if tool then tool:Activate() end
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
   Callback = function(Value) ReachSize = Value end,
})

---------------------------------------------------------
--- Script endzado
---------------------------------------------------------
Rayfield:Notify({Title = "IsaHub Carregado mn", Content = "Divirta-se ou não...", Duration = 5})
