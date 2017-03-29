return Def.ActorFrame {

	LoadActor( "demo.png" )..{
		OnCommand=cmd(x,SCREEN_LEFT+157;y,SCREEN_TOP+31);
	};

	LoadActor( "demo.png" )..{
		OnCommand=cmd(x,SCREEN_RIGHT-155;y,SCREEN_BOTTOM-34);
	};

}