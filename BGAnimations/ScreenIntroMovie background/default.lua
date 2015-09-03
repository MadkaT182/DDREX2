return Def.ActorFrame {
	LoadActor( "Intro" )..{
		InitCommand=cmd(FullScreen);
	};

	LoadActor( "music" )..{
		OnCommand=cmd(play);
		OffCommand=cmd(stop);
	};

}