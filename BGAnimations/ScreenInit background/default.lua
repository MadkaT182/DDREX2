return Def.ActorFrame {
	LoadActor( "../_black" )..{
		BeginCommand=cmd(StretchTo,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffusealpha,1);
	};

	LoadActor( "warning1" )..{
		OnCommand=cmd(Center;FullScreen;diffusealpha,0;decelerate,0.6;diffusealpha,1;sleep,6;accelerate,0.6;diffusealpha,0
);
	};
}

-- Center;FullScreen;
-- x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;