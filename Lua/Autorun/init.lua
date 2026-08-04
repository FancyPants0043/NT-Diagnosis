-- Set up

NTAddon = {}
NTAddon.Name = "Addon"
NTAddon.Version = "1.0.0h0"
NTAddon.VersionNum = 000000001
NTAddon.MinNTVersion = "A1.12.1"
NTAddon.MinNTVersionNum = 01120100
NTAddon.Path = table.pack(...)[1]

-- Not Required but nice to visualize.
NTAddon.UpdateAfflictions = {}
NTAddon.UpdateLimbAfflictions = {}
NTAddon.UpdateBloodAfflictions = {}
NTAddon.OnDamagedMethods = {}

Timer.Wait(function ()
    if NTC ~= nil then
        NTC.RegisterExpansion(NTAddon) -- Register your addon to NT
    end
end, 1)

-- Ensure that NT is installed.
Timer.Wait(function()
	if (SERVER or (CLIENT and not Game.IsMultiplayer)) and (NTC == nil) then --check if NT is installed
		print("Error loading NT Addon: It Seems Neurotrauma isn't loaded!")
		return
	end

    --Server Side scripts
	if SERVER or (CLIENT and not Game.IsMultiplayer) then
    	-- Put your dofiles here!
		dofile(NTAddon.Path .. "/Lua/Scripts/Server/addonfunctions.lua") 	-- Your addons helper functions
		dofile(NTAddon.Path .. "/Lua/Scripts/Server/humanupdate.lua") 	    -- Your addons helper functions
		dofile(NTAddon.Path .. "/Lua/Scripts/Server/items.lua") 	        -- Your addons helper functions
		dofile(NTAddon.Path .. "/Lua/Scripts/Server/ondamaged.lua") 	    -- Your addons helper functions
	end

end, 1)

Timer.Wait(function()
    dofile(NTAddon.Path .. "/Lua/Scripts/Shared/configdata.lua") 			--Config.
end, 1)
