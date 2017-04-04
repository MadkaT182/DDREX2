local t = Def.ActorFrame {};

--Pulse Anim
t[#t+1] = Def.ActorFrame{
	LoadActor("pulse")..{
		OnCommand=cmd(diffusealpha,0;sleep,1;diffusealpha,1;queuecommand,"Start");
		StartCommand=cmd(y,-60;linear,2;addy,-SCREEN_HEIGHT;queuecommand,"Animate");
		AnimateCommand=cmd(sleep,5;queuecommand,"Start");
		OffCommand=cmd(stoptweening;linear,.116;diffusealpha,0);
	};
	LoadActor("pulse")..{
		OnCommand=cmd(diffusealpha,0;sleep,1;diffusealpha,1;queuecommand,"Start");
		StartCommand=cmd(zoomy,-1;y,60;linear,2;addy,SCREEN_HEIGHT;queuecommand,"Animate");
		AnimateCommand=cmd(sleep,5;queuecommand,"Start");
		OffCommand=cmd(stoptweening;linear,.116;diffusealpha,0);
	};
};

--Main part
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(diffuse,color("#FFFF00"));
	LoadActor("mainc")..{
		OnCommand=cmd(y,SCREEN_TOP-280;sleep,.584;linear,.117;y,82);
		OffCommand=cmd(linear,.117;addy,-(SCREEN_HEIGHT+140));
	};
	LoadActor("mainc")..{
		OnCommand=cmd(zoomy,-1;y,SCREEN_BOTTOM+280;sleep,.584;linear,.117;y,-82);
		OffCommand=cmd(linear,.117;addy,(SCREEN_HEIGHT+140));
	};
};

return t;