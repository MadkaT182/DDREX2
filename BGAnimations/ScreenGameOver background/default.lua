return Def.ActorFrame{
	LoadActor("gameover")..{
		InitCommand=cmd(Center;diffusealpha,0;zoom,10);
		OnCommand=cmd(sleep,0.1;accelerate,0.4;diffusealpha,0.6;zoom,0.3;linear,0.05;zoom,1;linear,0.05;zoom,1.0;sleep,2;linear,0.1;diffusealpha,0);
	};
	LoadActor("gameover")..{
		InitCommand=cmd(Center;diffusealpha,0;zoom,10);
		OnCommand=cmd(sleep,0.15;accelerate,0.4;diffusealpha,0.6;zoom,0.3;linear,0.05;zoom,1;linear,0.05;zoom,1.0;sleep,2;linear,0.1;diffusealpha,0);
	};
};