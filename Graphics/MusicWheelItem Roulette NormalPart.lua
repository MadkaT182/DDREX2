return Def.ActorFrame {
	LoadActor("bg_roulette");
	LoadActor("Common wheel/lbl_roulette")..{
		InitCommand=cmd(x,-28);
	};
};