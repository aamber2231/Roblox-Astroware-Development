-- New example script written by wally
-- You can suggest changes with a pull request or something

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'astroware',
    Center = true,
    AutoShow = true,
})

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'),
    Visuals = Window:AddTab('Visuals'),
    Exploits = Window:AddTab('Exploits'),
    Debug = Window:AddTab('Debug'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Groupboxes = {
    Main = {
        LeftBoxOne = Tabs.Main:AddLeftGroupbox('General')
    }
}

local WalkSpeedSlider = Groupboxes.Main.LeftBoxOne:AddSlider('WalkSpeed', {
    Text = 'Walk Speed',
    Default = 16,
    Min = 16,
    Max = 30,
    Rounding = 0,

    Combat = false
})

Options.WalkSpeed:OnChanged(function ()

end)

Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

ThemeManager:SetLibrary(Library)

ThemeManager:ApplyToTab(Tabs['UI Settings'])
