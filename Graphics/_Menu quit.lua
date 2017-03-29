local xPos=0;
local t = Def.ActorFrame {};

if IsUsingWideScreen() == true then
	xPos = -162;
else
	--TODO ^_^
	xPos = 0;
end

--Option List
t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(x,xPos);
	LoadActor("_menu/_op/dm")..{
		OnCommand=cmd(y,-127);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/fp")..{
		OnCommand=cmd(y,-100);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/wm")..{
		OnCommand=cmd(y,-73);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/am")..{
		OnCommand=cmd(y,-46);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/lm")..{
		OnCommand=cmd(y,-19);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/tm")..{
		OnCommand=cmd(y,8);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/em")..{
		OnCommand=cmd(y,35);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/op")..{
		OnCommand=cmd(y,62);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/re")..{
		OnCommand=cmd(y,89);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/ot")..{
		OnCommand=cmd(y,116);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/sh")..{
		OnCommand=cmd(y,143);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/ex")..{
		OnCommand=cmd(y,170);
		OffCommand=cmd();
	};
	LoadActor("_menu/_op/mr")..{
		OnCommand=cmd(y,197);
		OffCommand=cmd();
	};
};

--Title
t[#t+1] = LoadActor("_menu/_tit/quit")..{
	OnCommand=cmd(x,261;y,143);
	OffCommand=cmd();
};

--Description
-- t[#t+1] = LoadActor("_menu/_desc/quit")..{
-- 	OnCommand=cmd(x,251;y,189);
-- 	OffCommand=cmd();
-- };

--Art
t[#t+1] = LoadActor("_menu/_art/quit")..{
	OnCommand=cmd(x,259;y,-12);
	OffCommand=cmd();
};

--Frame
t[#t+1] = LoadActor("_menu/frame")..{
	OnCommand=cmd(x,272;y,2);
	OffCommand=cmd();
};

--Cursor
-- t[#t+1] = LoadActor("_menu/cursor")..{
-- 	OnCommand=cmd(x,xPos-97;y,-128);
-- 	OffCommand=cmd();
-- };

return t;