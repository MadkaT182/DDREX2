return Def.ActorFrame{
	OnCommand=cmd(Center;addx,-129;addy,25);
	GainFocusCommand=cmd(stoptweening;linear,.1;x,SCREEN_CENTER_X-144;linear,.1;x,SCREEN_CENTER_X-129);
	--BG Picture
	LoadActor("_advanced/combo_in")..{
		OnCommand=cmd(x,24;y,4);
		GainFocusCommand=cmd(diffusealpha,0);
		LoseFocusCommand=cmd(diffusealpha,1);
	};
	LoadActor("_advanced/combo_ac")..{
		OnCommand=cmd(x,24;y,4);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	--BG Frame
	LoadActor("_advanced/inactive_bg")..{
		GainFocusCommand=cmd(diffusealpha,0);
		LoseFocusCommand=cmd(diffusealpha,1);
	};
	LoadActor("_advanced/active_bg")..{
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	--Icon
	LoadActor("_advanced/prev_com")..{
		OnCommand=cmd(x,-108;y,-36);
		GainFocusCommand=cmd(diffusealpha,0);
		LoseFocusCommand=cmd(diffusealpha,.5);
	};
	LoadActor("_advanced/icon_com")..{
		OnCommand=cmd(x,-108;y,-36);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	--Title
	LoadActor("_advanced/tit_com_ac")..{
		OnCommand=cmd(x,22;y,-47);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	LoadActor("_advanced/tit_com_in")..{
		OnCommand=cmd(x,22;y,-47);
		GainFocusCommand=cmd(diffusealpha,0);
		LoseFocusCommand=cmd(diffusealpha,.5);
	};
};