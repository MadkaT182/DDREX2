return Def.ActorFrame {
	LoadActor(GAMESTATE:IsCourseMode() and "BGC" or "BGA")..{
		InitCommand=cmd(FullScreen);
	};
}