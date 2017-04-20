return Def.ActorFrame {
	LoadActor("bg")..{
		OnCommand=cmd(FullScreen);
	};
}