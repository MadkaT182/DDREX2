local t = Def.ActorFrame {};

--Pulse Anim
t[#t+1] = Def.ActorFrame{
	LoadActor("pulse")..{
		OnCommand=cmd(y,-60;linear,2;addy,-SCREEN_HEIGHT;queuecommand,"Animate");
		AnimateCommand=cmd(sleep,5;queuecommand,"On");
		OffCommand=cmd();
	};
	LoadActor("pulse")..{
		OnCommand=cmd(zoomy,-1;y,60;linear,2;addy,SCREEN_HEIGHT;queuecommand,"Animate");
		AnimateCommand=cmd(sleep,5;queuecommand,"On");
		OffCommand=cmd();
	};
};

--Main part
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(diffuse,color("#FFFF00"));
	LoadActor("mainc")..{
		OnCommand=cmd(y,82);
		OffCommand=cmd();
	};
	LoadActor("mainc")..{
		OnCommand=cmd(zoomy,-1;y,-82);
		OffCommand=cmd();
	};
};

return t;