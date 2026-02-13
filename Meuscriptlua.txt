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

-- ABAS PRINCIPAIS
local TabAdm = Window:CreateTab("Adm Scripts", 4483362458)
local TabBrook = Window:CreateTab("Brookhaven", 4483362458)
local TabLucky = Window:CreateTab("Lucky Block", 4483362458)
local TabKnock = Window:CreateTab("Knockout", 4483362458)

---------------------------------------------------------
--- SEÇÃO: ADM SCRIPTS (para ser o ADM)
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
--- SEÇÃO: BROOKHAVEN (para trollar amiguitos)
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
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))()
   end,
})

TabBrook:CreateButton({
   Name = "fing (joga as pessoa pru quintu dus infernu)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DigitalityScripts/unpatched-fling/main/gui"))()
   end,
})

------------------------------------------------------------
--- SEÇÃO: BREAK A LUCKY BLOCK (um dos meu jogos FAVORITOS)
------------------------------------------------------------
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
          for _, item in pairs(game.Workspace:GetChildren()) do
              if item:IsA("Tool") and item:FindFirstChild("Handle") then
                  item.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
              end
          end
      end
   end,
})

---------------------------------------------------------
--- SEÇÃO: KNOCKOUT (OP) (baterfora)
---------------------------------------------------------
local ReachSize = 15
local KAura = false

TabKnock:CreateToggle({
   Name = "Kill Aura (Para atacar us inimigu e enfia nu quintu dus infernu)",
   CurrentValue = false,
   Callback = function(Value)
      KAura = Value
      task.spawn(function()
         while KAura do
            task.wait(0.2)
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
   Name = "Alcance do Reach (para taca us inimigu pu quintu dus infernu)",
   Min = 10, Max = 40, Default = 15,
   Callback = function(Value) ReachSize = Value end,
})


Rayfield:Notify({Title = "Carregado o IsaHub KEYLESS!!", Content = "Divirta-se (ou não...)", Duration = 5})
