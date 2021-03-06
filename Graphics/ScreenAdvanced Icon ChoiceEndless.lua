return Def.ActorFrame{
	OnCommand=cmd(Center;addx,131;addy,-127);
	GainFocusCommand=cmd(stoptweening;linear,.1;x,SCREEN_CENTER_X+116;linear,.1;x,SCREEN_CENTER_X+131);
	--BG Picture
	LoadActor("_advanced/endless_in")..{
		OnCommand=cmd(x,24;y,4);
		GainFocusCommand=cmd(diffusealpha,0);
		LoseFocusCommand=cmd(diffusealpha,1);
	};
	LoadActor("_advanced/endless_ac")..{
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
	LoadActor("_advanced/prev_end")..{
		OnCommand=cmd(x,-108;y,-36);
		GainFocusCommand=cmd(diffusealpha,0);
		LoseFocusCommand=cmd(diffusealpha,.5);
	};
	LoadActor("_advanced/icon_end")..{
		OnCommand=cmd(x,-108;y,-36);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	--Title
	LoadActor("_advanced/tit_end_ac")..{
		OnCommand=cmd(x,22;y,-47);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	LoadActor("_advanced/tit_end_in")..{
		OnCommand=cmd(x,22;y,-47);
		GainFocusCommand=cmd(diffusealpha,0);
		LoseFocusCommand=cmd(diffusealpha,.5);
	};
};