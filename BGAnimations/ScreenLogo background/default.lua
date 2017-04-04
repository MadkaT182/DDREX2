return Def.ActorFrame {
	LoadActor( "../_main background" )..{};
	LoadActor( "ddrex2_logo" )..{
		OnCommand=cmd(Center);
	};
}