return Def.ActorFrame {

	LoadActor( "bgm" )..{
		OnCommand=cmd(play);
		OffCommand=cmd(stop);
	};

	LoadActor( "konami" )..{
		OnCommand=cmd(Center;FullScreen;diffusealpha,0;decelerate,0.6;diffusealpha,1;sleep,5.2;accelerate,0.6;diffusealpha,0);
	};

	LoadActor( "bemani" )..{
		OnCommand=cmd(Center;FullScreen;diffusealpha,0;sleep,6.4;decelerate,0.6;diffusealpha,1;sleep,5.2;accelerate,0.6;diffusealpha,0);
	};
}