return Def.ActorFrame{
	LoadActor("OptionRow bg")..{
		OnCommand=cmd(x,-169;player,PLAYER_1);
	};
	LoadActor("OptionRow bg")..{
		OnCommand=cmd(x,169;player,PLAYER_2);
	};
}