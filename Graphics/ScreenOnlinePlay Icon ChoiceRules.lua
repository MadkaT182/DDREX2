return Def.ActorFrame{
	OnCommand=cmd(Center;addx,-21;addy,-51);
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
	LoadActor("_online/icon_rules")..{
		OnCommand=cmd(x,-151;y,0);
	};
	--Label
	LoadActor("_online/labels/rules_ac")..{
		OnCommand=cmd(x,-43;y,0);
	};
};