local t = Def.ActorFrame {

	LoadActor( "top" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;addy,52);
		OffCommand=cmd();
	};

	LoadActor( "JudgeRows" )..{
		OnCommand=cmd(Center;addy,-9);
		OffCommand=cmd();
	};
};

return t;