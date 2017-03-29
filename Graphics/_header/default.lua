return Def.ActorFrame {
	LoadActor( "header" )..{
		OnCommand=cmd(x,SCREEN_LEFT+109;y,SCREEN_TOP;vertalign,top;);
		OffCommand=cmd(linear,0.133;addy,-999);
	};
}