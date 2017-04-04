local xPos=0;
local xInit=0;
local t = Def.ActorFrame {};

if IsUsingWideScreen() == true then
	xPos = -162;
	xInit = SCREEN_LEFT-380;
else
	--TODO ^_^
	xPos = 0;
	xInit = 0;
end

--Option List
t[#t+1] = Def.ActorFrame {
	LoadActor("_menu/_op/dm")..{
		OnCommand=cmd(x,xInit;y,-127;sleep,.167;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.167;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/fp")..{
		OnCommand=cmd(x,xInit;y,-100;diffuse,color("#FFFF00");sleep,.184;linear,.167;x,xPos;linear,.167;addx,-13;);
		OffCommand=cmd(sleep,.184;linear,.184;x,xInit);
	};
	LoadActor("_menu/_op/wm")..{
		OnCommand=cmd(x,xInit;y,-73;sleep,.201;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.201;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/am")..{
		OnCommand=cmd(x,xInit;y,-46;sleep,.217;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.217;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/lm")..{
		OnCommand=cmd(x,xInit;y,-19;sleep,.234;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.234;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/tm")..{
		OnCommand=cmd(x,xInit;y,8;sleep,.267;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.267;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/em")..{
		OnCommand=cmd(x,xInit;y,35;sleep,.284;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.284;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/op")..{
		OnCommand=cmd(x,xInit;y,62;sleep,.317;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.317;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/re")..{
		OnCommand=cmd(x,xInit;y,89;sleep,.334;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.334;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/ot")..{
		OnCommand=cmd(x,xInit;y,116;sleep,.367;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.367;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/sh")..{
		OnCommand=cmd(x,xInit;y,143;sleep,.401;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.401;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/ex")..{
		OnCommand=cmd(x,xInit;y,170;sleep,.434;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.434;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/mr")..{
		OnCommand=cmd(x,xInit;y,197;sleep,.451;linear,.167;x,xPos);
		OffCommand=cmd(sleep,.451;linear,.167;x,xInit);
	};
};

--Title
t[#t+1] = LoadActor("_menu/_tit/fp")..{
	OnCommand=cmd(x,SCREEN_RIGHT+188;y,143;sleep,.234;linear,.2;x,261;);
	OffCommand=cmd(sleep,.08;linear,.184;x,SCREEN_RIGHT+188);
};

--Description
t[#t+1] = LoadActor("_menu/_desc/fp")..{
	OnCommand=cmd(x,SCREEN_RIGHT+188;y,189;sleep,.301;linear,.2;x,251);
	OffCommand=cmd(sleep,.01;linear,.184;x,SCREEN_RIGHT+188);
};

--Art
t[#t+1] = LoadActor("_menu/_art/fp")..{
	OnCommand=cmd(x,259;y,-12;diffusealpha,0;sleep,.251;linear,.116;diffusealpha,1);
	OffCommand=cmd(sleep,.116;linear,.151;diffusealpha,0);
};

--Frame
t[#t+1] = LoadActor("_menu/frame")..{
	OnCommand=cmd(x,272;y,2;diffusealpha,0;sleep,.1;linear,.133;diffusealpha,1);
	OffCommand=cmd(sleep,.267;linear,.116;diffusealpha,0);
};

--Cursor
t[#t+1] = LoadActor("_menu/cursor")..{
	OnCommand=cmd(x,xPos-97;y,-101);
};

return t;