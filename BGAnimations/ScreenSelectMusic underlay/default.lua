return Def.ActorFrame {
	LoadActor("frame")..{
		OnCommand=cmd(x,SCREEN_RIGHT-20;y,SCREEN_CENTER_Y);
	};
}