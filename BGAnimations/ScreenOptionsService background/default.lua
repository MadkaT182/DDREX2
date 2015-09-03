return Def.ActorFrame {

	LoadActor( "../_main background" )..{
	};

	LoadActor( "../../Graphics/_header" )..{};

	LoadActor( "title_option.png" )..{
		OnCommand=cmd(x,SCREEN_LEFT+63;y,SCREEN_TOP+22);
	};

}