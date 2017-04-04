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
	OnCommand=cmd(x,xPos);
	LoadActor("_menu/_op/dm")..{
		OnCommand=cmd(y,-127);
		OffCommand=cmd(sleep,.167;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/fp")..{
		OnCommand=cmd(y,-100);
		OffCommand=cmd(sleep,.184;linear,.184;x,xInit);
	};
	LoadActor("_menu/_op/wm")..{
		OnCommand=cmd(y,-73);
		OffCommand=cmd(sleep,.201;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/am")..{
		OnCommand=cmd(y,-46);
		OffCommand=cmd(sleep,.217;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/lm")..{
		OnCommand=cmd(y,-19);
		OffCommand=cmd(sleep,.234;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/tm")..{
		OnCommand=cmd(y,8);
		OffCommand=cmd(sleep,.267;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/em")..{
		OnCommand=cmd(y,35);
		OffCommand=cmd(sleep,.284;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/op")..{
		OnCommand=cmd(y,62);
		OffCommand=cmd(sleep,.317;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/re")..{
		OnCommand=cmd(y,89);
		OffCommand=cmd(sleep,.334;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/ot")..{
		OnCommand=cmd(y,116;x,-13;diffuse,color("#FFFF00"));
		OffCommand=cmd(sleep,.367;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/sh")..{
		OnCommand=cmd(y,143);
		OffCommand=cmd(sleep,.401;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/ex")..{
		OnCommand=cmd(y,170);
		OffCommand=cmd(sleep,.434;linear,.167;x,xInit);
	};
	LoadActor("_menu/_op/mr")..{
		OnCommand=cmd(y,197);
		OffCommand=cmd(sleep,.451;linear,.167;x,xInit);
	};
};

--Title
t[#t+1] = LoadActor("_menu/_tit/ot")..{
	OnCommand=cmd(x,261;y,143);
	OffCommand=cmd(sleep,.08;linear,.184;x,SCREEN_RIGHT+188);
};

--Description
t[#t+1] = LoadActor("_menu/_desc/ot")..{
	OnCommand=cmd(x,251;y,189);
	OffCommand=cmd(sleep,.01;linear,.184;x,SCREEN_RIGHT+188);
};

--Art
t[#t+1] = LoadActor("_menu/_art/ot")..{
	OnCommand=cmd(x,259;y,-12);
	OffCommand=cmd(sleep,.116;linear,.151;diffusealpha,0);
};

--Frame
t[#t+1] = LoadActor("_menu/frame")..{
	OnCommand=cmd(x,272;y,2);
	OffCommand=cmd(sleep,.267;linear,.116;diffusealpha,0);
};

--Cursor
t[#t+1] = LoadActor("_menu/cursor")..{
	OnCommand=cmd(x,xPos-97;y,115);
};

return t;