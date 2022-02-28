function GetBGM()
	local Tracks={
		["Comboch"] = "ScreenAdvanced comboch", 
		["Survival"] = "ScreenAdvanced survival", 
		["Endless"] = "ScreenAdvanced endless", 
		["Course"] = "ScreenSelectMusic course music",
	};
	return Tracks[getenv("advMode")] or "_silent";
end;

return Def.ActorFrame {
	LoadActor("ScreenSelectCourse background");
	LoadActor(THEME:GetPathS("",GetBGM()))..{
		OnCommand=cmd(play);
	};
};