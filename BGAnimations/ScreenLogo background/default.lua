return Def.ActorFrame {

	LoadActor( "../_main background" )..{
	};

	LoadActor( "ddrex2_logo.png" )..{
		OnCommand=cmd(queuecommand,"Logo");
		LogoCommand=cmd(y,SCREEN_CENTER_Y;x,SCREEN_CENTER_X);
	};

}