local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Sigmaboy Explorer",
    SubTitle = "Simple DEX Lite",
    TabWidth = 160,
    Size = UDim2.fromOffset(450, 320),
    Acrylic = true,
    Theme = "Dark"
})

local Tabs = {
    Main = Window:AddTab({ Title = "Explorer", Icon = "folder" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Fungsi untuk mendapatkan semua object di Workspace
local function GetObjects()
    local list = {}
    for _, obj in pairs(game:GetChildren()) do
        table.insert(list, obj.Name)
    end
    return list
end

Tabs.Main:AddParagraph({
    Title = "Game Hierarchy",
    Content = "Pilih Service di bawah untuk melihat isi objek dasar."
})

local Dropdown = Tabs.Main:AddDropdown("ServiceSelector", {
    Title = "Select Service",
    Values = GetObjects(),
    Multi = false,
    Default = 1,
})

Dropdown:OnChanged(function(Value)
    Fluent:Notify({
        Title = "Explorer Info",
        Content = "Kamu memilih: " .. Value,
        Duration = 3
    })
end)

Tabs.Main:AddButton({
    Title = "Print Full Hierarchy (Console)",
    Description = "Mencetak semua nama objek ke F9 Console",
    Callback = function()
        for i, v in pairs(game:GetChildren()) do
            print("[" .. i .. "] Service: " .. v.Name)
        end
    end
})

Window:SelectTab(1)
