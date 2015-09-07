return Def.ActorFrame {

	LoadActor( "../_shared background" )..{
	};

	LoadActor( "JudgeRows" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);--zoomy,0;sleep,0.000;linear,0.2;zoomy,1);
		--OffCommand=cmd(sleep,0.0000;sleep,0.016;linear,0.3;zoomy,0);
	};

}