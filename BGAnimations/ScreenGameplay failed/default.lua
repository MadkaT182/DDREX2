local travelDist = SCREEN_WIDTH*1.5;

local LeftToRight = Def.ActorFrame{
	LoadActor("LeftToRight");
	Def.Quad{
		InitCommand=cmd(halign,1;addx,-64);
	};
};

local RightToLeft = Def.ActorFrame{
	LoadActor("RightToLeft");
	Def.Quad{
		InitCommand=cmd(halign,0;addx,64);
	};
};

local t = Def.ActorFrame{};

if GAMESTATE:IsCourseMode() then
--oni
t[#t+1] = Def.ActorFrame {

    LoadActor("_door_close") .. {
		StartTransitioningCommand=cmd(play);
	};

	LoadActor( "door1" )..{
		OnCommand=cmd(zoomx,1.34;x,SCREEN_CENTER_X-214;y,SCREEN_CENTER_Y;zoomtoheight,SCREEN_HEIGHT;addx,-320;sleep,0.000;sleep,0;linear,0.1;addx,320;sleep,1.75;sleep,3.4;);
	};

	LoadActor( "door2" )..{
		OnCommand=cmd(zoomx,1.34;x,SCREEN_CENTER_X+214;y,SCREEN_CENTER_Y;zoomtoheight,SCREEN_HEIGHT;addx,320;sleep,0.000;sleep,0;linear,0.1;addx,-320;sleep,1.75;sleep,3.4;);
	};

};

else
--normal

t[#t+1] = Def.ActorFrame {

	LoadActor("bg")..{
		InitCommand=cmd(Center;FullScreen;);
	};

	-- 7 left -> right
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y-192);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y-128);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y-64);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_CENTER_Y);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y+64);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y+128);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y+192);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};

	-- -- 8 right -> left
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+64;y,SCREEN_CENTER_Y-224);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+128;y,SCREEN_CENTER_Y-160);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+192;y,SCREEN_CENTER_Y-96);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+256;y,SCREEN_CENTER_Y-32);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+256;y,SCREEN_CENTER_Y+32);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+192;y,SCREEN_CENTER_Y+96);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+128;y,SCREEN_CENTER_Y+160);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+64;y,SCREEN_CENTER_Y+224);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};

	LoadActor("failed")..{
		InitCommand=cmd(Center;diffusealpha,0;zoom,10);
		OnCommand=cmd(sleep,1.1;accelerate,0.4;diffusealpha,0.6;zoom,0.3;linear,0.05;zoom,1;linear,0.05;zoom,1.0;sleep,2;linear,0.1;diffusealpha,0);
	};

	LoadActor("failed")..{
		InitCommand=cmd(Center;diffusealpha,0;zoom,10);
		OnCommand=cmd(sleep,1.15;accelerate,0.4;diffusealpha,0.6;zoom,0.3;linear,0.05;zoom,1;linear,0.05;zoom,1.0;sleep,2;linear,0.1;diffusealpha,0);
	};

};

end

return t