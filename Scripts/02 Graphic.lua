function Sprite:LoadFromCurrentSongBanner()
	local song = GAMESTATE:GetCurrentSong()
	local Path = song:GetBannerPath()
	if not song then
		local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
		local e = trail:GetTrailEntries()
		if #e > 0 then
			song = e[1]:GetSong()
		end
	end
	if not Path then
		Path = THEME:GetPathG("Common","fallback banner")
	end

	self:LoadBanner( Path )
end

function Sprite:LoadFromSongBanner(song)
	if song then
		local Path = song:GetBannerPath()
		if not Path then
			Path = THEME:GetPathG("Common","fallback banner")
		end

		self:LoadBanner( Path )
	else
		self:LoadBanner( THEME:GetPathG("Common","fallback banner") )
	end
end