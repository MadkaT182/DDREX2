return Def.ActorFrame{
	LoadActor("video")..{
		InitCommand=cmd(pause;x,SCREEN_CENTER_X+111;y,SCREEN_CENTER_Y-39;sleep,.5;queuecommand,"Play");
		PlayCommand=cmd(play;linear,94;sleep,0;linear,1;diffusealpha,0;queuecommand,"Hide");
		HideCommand=cmd(pause);
	};
	Def.ActorFrame{
		--CS
		-- OnCommand=cmd(x,SCREEN_CENTER_X-288;y,SCREEN_BOTTOM);
		-- OnCommand=cmd(x,SCREEN_CENTER_X-288;y,SCREEN_BOTTOM;sleep,8.5;linear,52.385;y,SCREEN_TOP-2360);
		-- LoadActor("csstaff");
		OnCommand=cmd(x,SCREEN_CENTER_X-288;y,SCREEN_CENTER_Y);
		LoadActor("acstaff");
		Condition=IsHome()
	};
	Def.ActorFrame{
		--AC
		Condition=not IsHome()
	};
	Def.ActorFrame{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;sleep,119.285;linear,104.572;y,SCREEN_CENTER_Y-6869);
		LoadActor("music");
	};
	LoadActor("dolby")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM+34;sleep,222;linear,8.5;y,SCREEN_TOP-34);
	};
	LoadActor("konami")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM+40;sleep,229.36;linear,8.5;y,SCREEN_TOP-40);
	};
	Def.ActorFrame{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM+40;sleep,236.93;linear,4;y,SCREEN_CENTER_Y);
		LoadActor("konami")..{
			OnCommand=cmd(cropbottom,.4);
		};
		LoadActor("copy")..{
			OnCommand=cmd(y,40);
		};
	};
};