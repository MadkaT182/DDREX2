local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {

	LoadActor("../main_frame")..{
--	OnCommand=cmd(draworder,1000);
	};

};

return t;