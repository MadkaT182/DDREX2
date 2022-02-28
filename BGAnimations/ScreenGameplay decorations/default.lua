local t = Def.ActorFrame{
	LoadActor("../_stg_frm")..{
		OnCommand=cmd(draworder,2;x,SCREEN_CENTER_X;y,28);
		OffCommand=cmd(linear,.5;y,-44);
		Condition=GAMESTATE:IsCourseMode() or ThemePrefs.Get("RegStgInd")
	};
	LoadActor("lifebars")..{
		OnCommand=cmd(draworder,2);
		OffCommand=cmd(linear,.5;y,-44);
	};
	LoadActor("score")..{
		OnCommand=cmd(draworder,2);
		OffCommand=cmd();
	};
};

for player in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("../OptionIcons", player)..{
		InitCommand=function(self)
			self:x(player == PLAYER_1 and SCREEN_CENTER_X-133 or SCREEN_CENTER_X+133);
			self:y(GAMESTATE:GetPlayerState(player):GetCurrentPlayerOptions():Reverse() ~= 0 and SCREEN_TOP+52 or SCREEN_BOTTOM-46);
			self:draworder(2);
		end;
		OffCommand=cmd();
	};
end

return t;