function getDifficultyColor(diff)
	local Colors = {
		["Difficulty_Beginner"] = "#60BDE2",
		["Difficulty_Easy"] = "#F8F800",
		["Difficulty_Medium"] = "#E10687",
		["Difficulty_Hard"] = "#00FD98",
		["Difficulty_Challenge"] = "#C566FC",
		["Difficulty_Edit"] = "#E4E2E5",
	};
	return Colors[diff] or "#FFFFFF";
end

function GetSongColor(songtit)
	local Song = {
		--Green - New KONAMI originals 
		["1998"] = "#5EFD5F",
		["ABSOLUTE (Cuff -N- Stuff it Mix)"] = "#5EFD5F",
		["air"] = "#5EFD5F",
		["BE LOVIN"] = "#5EFD5F",
		["Can Be Real"] = "#5EFD5F",
		["CANDY HEART"] = "#5EFD5F",
		["Colors ~for EXTREME~"] = "#5EFD5F",
		["DAIKENKAI"] = "#5EFD5F",
		["Happy Wedding"] = "#5EFD5F",
		["Heaven is a '57 metallic gray ~gimmix~"] = "#5EFD5F",
		["I Need You (Insideout Door Mix)"] = "#5EFD5F",
		["INFINITE PRAYER"] = "#5EFD5F",
		["INJECTION OF LOVE (HINA MIX)"] = "#5EFD5F",
		["INSERTiON (Machine Gun Kelly Mix)"] = "#5EFD5F",
		["INSIDE YOUR HEART"] = "#5EFD5F",
		["KEEP ON MOVIN' (DMX Mix)"] = "#5EFD5F",
		["La Bamba"] = "#5EFD5F",
		["L'amour et la liberte(DDR Ver.)"] = "#5EFD5F",
		["LOVE IS ORANGE"] = "#5EFD5F",
		["Make A Difference"] = "#5EFD5F",
		["MARIA(I believe...)"] = "#5EFD5F",
		["Miracle Moon ~L.E.D.LIGHT STYLE MIX~"] = "#5EFD5F",
		["PASSION OF LOVE"] = "#5EFD5F",
		["Polovtsian Dances And Chorus"] = "#5EFD5F",
		["Quickening"] = "#5EFD5F",
		["SAKURA"] = "#5EFD5F",
		["SANA MOLLETE NE ENTE (B.L.T.STYLE)"] = "#5EFD5F",
		["Saturday Night Love"] = "#5EFD5F",
		["SEDUCTION"] = "#5EFD5F",
		["SEXY PLANET"] = "#5EFD5F",
		["Sweet Sweet Love Magic"] = "#5EFD5F",
		["sync (EXTREME version)"] = "#5EFD5F",
		["TOMORROW"] = "#5EFD5F",
		["Twin Bee -Generation X-"] = "#5EFD5F",
		["un deux trois"] = "#5EFD5F",
		["You gotta move it (feat. Julie Rugaard)"] = "#5EFD5F",
		--Yellow - Returning KONAMI originals 
		["AFRONOVA PRIMEVAL"] = "#FBFB5F",
		["BRILLIANT 2U"] = "#FBFB5F",
		["BURNIN' THE FLOOR"] = "#FBFB5F",
		["DIVE"] = "#FBFB5F",
		["DYNAMITE RAVE"] = "#FBFB5F",
		["Look To The Sky(True Color Mix)"] = "#FBFB5F",
		["PARANOiA"] = "#FBFB5F",
		--Blue - CHALLENGE-only Songs 
		["AFRONOVA(FROM NONSTOP MEGAMIX)"] = "#FBFB5F",
		["BRILLIANT 2U(K.O.G G3 MIX)"] = "#FBFB5F",
		["BURNIN' THE FLOOR (BLUE FIRE mix)"] = "#FBFB5F",
		["DYNAMITE RAVE (B4 ZA BEAT MIX)"] = "#FBFB5F",
		["Look To The Sky (Trance Mix)"] = "#FBFB5F",
		["SEXY PLANET(FROM NONSTOP MEGAMIX)"] = "#FBFB5F",
		--Red - Boss Songs 
		["PARANOIA survivor"] = "#FD5E5E",
		["PARANOIA survivor MAX"] = "#FD5E5E",
	};
	return Song[songtit] or "#FFFFFF";
end