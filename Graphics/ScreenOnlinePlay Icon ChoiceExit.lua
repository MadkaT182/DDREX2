return Def.ActorFrame{
	OnCommand=cmd(Center;addx,-1;addy,0);
	--BG Picture
	LoadActor("_online/item_active")..{
		OnCommand=cmd(x,0;y,0);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	LoadActor("_online/item_inactive")..{
		OnCommand=cmd(x,0;y,0);
		GainFocusCommand=cmd(diffusealpha,0);
		LoseFocusCommand=cmd(diffusealpha,1);
	};
	--Icon
	LoadActor("_online/icon_exit")..{
		OnCommand=cmd(x,-151;y,0);
	};
	--Label
	LoadActor("_online/labels/exit_ac")..{
		OnCommand=cmd(x,-43;y,0);
	};
};