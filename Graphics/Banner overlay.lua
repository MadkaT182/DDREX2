return Def.ActorFrame {
	InitCommand=function(self) c = self:GetChildren(); end;
	Def.ActorFrame{
		Name="SRoulette";
		LoadActor("Common wheel/bnbg")..{
			InitCommand=cmd(scaletoclipped,274,86);
		};
		LoadFont("Common Normal")..{
			InitCommand=cmd(diffuse,color("#16CE1D");settext,"ROULETTE";horizalign,left;x,-120;y,-25);
		};
		LoadFont("Common Normal")..{
			InitCommand=cmd(diffuse,color("#16CE1D");settext,"Musics spin like a roulette wheel.";x,-120;zoom,.75;horizalign,left);
		};
		InitCommand=cmd(diffusealpha,0);
	};
	Def.ActorFrame{
		Name="SRandom";
		LoadActor("Common wheel/bnbg")..{
			InitCommand=cmd(scaletoclipped,274,86);
		};
		LoadFont("Common Normal")..{
			InitCommand=cmd(diffuse,color("#16CE1D");settext,"RANDOM";horizalign,left;x,-120;y,-25);
		};
		LoadFont("Common Normal")..{
			InitCommand=cmd(diffuse,color("#16CE1D");settext,"Musics are seleted at random.";x,-120;zoom,.75;horizalign,left);
		};
		InitCommand=cmd(diffusealpha,0);
	};
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();

		if not song then
			local topscreen = SCREENMAN:GetTopScreen();
			local MusicWheel = topscreen:GetMusicWheel();

			if MusicWheel:GetCurrentIndex() ~= 0 then
				local mType = MusicWheel:GetSelectedType();
				if mType == "WheelItemDataType_Roulette" then
					c.SRoulette:diffusealpha(1);
					c.SRandom:diffusealpha(0);
				elseif mType == "WheelItemDataType_Custom" then
					c.SRoulette:diffusealpha(0);
					c.SRandom:diffusealpha(1);
				else
					c.SRoulette:diffusealpha(0);
					c.SRandom:diffusealpha(0);
				end
			end
		else
			c.SRoulette:diffusealpha(0);
			c.SRandom:diffusealpha(0);
		end;
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
};