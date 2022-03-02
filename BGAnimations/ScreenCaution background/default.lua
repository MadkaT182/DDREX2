return Def.ActorFrame {
	LoadActor(IsUsingWideScreen() and "caution_w" or "caution_n")..{
		OnCommand=cmd(FullScreen;diffusealpha,0;decelerate,0.3;diffusealpha,1;sleep,2.4;accelerate,0.3;diffusealpha,0);
	};
}