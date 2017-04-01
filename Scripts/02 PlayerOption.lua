local function GetModsAndPlayerOptions(player)
	--local mods = SL[ToEnumShortString(player)].ActiveModifiers
	local topscreen = SCREENMAN:GetTopScreen():GetName()
	local modslevel = topscreen  == "ScreenEditOptions" and "ModsLevel_Stage" or "ModsLevel_Preferred"
	local playeroptions = GAMESTATE:GetPlayerState(player):GetPlayerOptions(modslevel)

	return mods, playeroptions
end

local Overrides = {
	-------------------------------------------------------------------------
	NoteSkin = {
		Choices = function()

			local all = NOTESKIN:GetNoteSkinNames()

			if ThemePrefs.Get("HideStockNoteSkins") then

				-- Apologies, midiman. :(
				local stock = {
					"default", "delta", "easyv2", "exactv2", "midi-note",
					"midi-note-3d", "midi-routine-p1", "midi-routine-p2",
					"midi-solo", "midi-vivid", "midi-vivid-3d", "retro",
					"retrobar", "retrobar-splithand_whiteblue"
				}

				for stock_noteskin in ivalues(stock) do
					for i=1,#all do
						if stock_noteskin == all[i] then
							table.remove(all, i)
							break
						end
					end
				end
			end

			-- It's possible a user might want to hide stock notesksins
			-- but only have stock noteskins.  If so, just return all noteskins.
			if #all == 0 then all = NOTESKIN:GetNoteSkinNames() end

			return all
		end,
		LoadSelections = function(self, list, pn)
			local mods, playeroptions = GetModsAndPlayerOptions(pn)
			local choice = mods.NoteSkin or playeroptions:NoteSkin() or "default"
			local i = FindInTable(choice, self.Choices) or 1
			list[i] = true
		end,
		SaveSelections = function(self, list, pn)
			local mods, playeroptions = GetModsAndPlayerOptions(pn)

			for i=1,#list do
				if list[i] then
					mods.NoteSkin = self.Choices[i]
				end
			end

			playeroptions:NoteSkin( mods.NoteSkin )
		end
	--],
	}
	-------------------------------------------------------------------------
}

------------------------------------------------------------
-- Generic OptionRow Definition
------------------------------------------------------------
local OptionRowDefault = {
	__index = {
		initialize = function(self, name)

			self.Name = name
			self.Choices = Overrides[name]:Choices()

			self.LayoutType = Overrides[name].LayoutType or "ShowAllInRow"
			self.SelectType = Overrides[name].SelectType or "SelectOne"
			self.OneChoiceForAllPlayers = Overrides[name].OneChoiceForAllPlayers or false
			self.ExportOnChange = Overrides[name].ExportOnChange or false
			self.ReloadRowMessages = Overrides[name].ReloadRowMessages or {}

			self.LoadSelections = Overrides[name].LoadSelections or function(subself, list, pn)
				-- --local choice = SL[ToEnumShortString(pn)].ActiveModifiers[name]
				-- local choice = SL[ToEnumShortString(pn)].ActiveModifiers[name]
				-- local i = FindInTable(choice, self.Choices) or 1
				-- list[i] = true
			end

			self.SaveSelections = Overrides[name].SaveSelections or function(subself, list, pn)
				local mods, playeroptions = GetModsAndPlayerOptions(pn)

				for i=1,#list do
					if list[i] then
						mods[name] = Overrides[name]:Choices()[i]
					end
				end
			end

			return self
		end
	}
}

function OptionRowSpecialArrow()
	return{
		Name="SpecialArrow",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = {
			"Vivid",
			"Note",
			"Flat",
			"Rainbow"
		},
		LoadSelections = function(self, list, pn)
			if GetUserPrefB("UserPrefSpecialArrow" .. ToEnumShortString(pn)) then
				local sNote = GetUserPrefB("UserPrefSpecialArrow" .. ToEnumShortString(pn))
				if sNote then
					list[2] = sNote
				else
					list[1] = "Vivid"
				end
			else
				list[1] = "Vivid"
			end
		end,
		SaveSelections = function(self, list, pn)
			local sSave = list[2] and sNote or "Vivid"
			SetUserPref("UserPrefSpecialArrow" .. ToEnumShortString(pn), sSave)
		end
	}
end

function CustomOptionRow( name )
	local OptRow = setmetatable( {}, OptionRowDefault )
	return OptRow:initialize( name )
end