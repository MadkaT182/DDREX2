return Def.ActorFrame {
	LoadActor("bg_random");
	LoadActor("Common wheel/lbl_random")..{
		InitCommand=cmd(x,-28);
	};
};