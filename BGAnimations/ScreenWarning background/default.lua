return Def.ActorFrame {
	LoadActor( "warning1" )..{
		OnCommand=cmd(FullScreen;diffusealpha,0;decelerate,0.6;diffusealpha,1;sleep,6;accelerate,0.6;diffusealpha,0);
	};
}