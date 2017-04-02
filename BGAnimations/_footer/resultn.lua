return Def.ActorFrame {
	LoadActor("cross")..{
	OnCommand=cmd(x,-100);
	Condition=not IsArcade();
	};
	LoadActor("confirm")..{
	OnCommand=cmd(x,-24);
	Condition=not IsArcade();
	};
	LoadActor("selbut")..{
	OnCommand=cmd(x,35);
	Condition=not IsArcade();
	};
	LoadActor("exit")..{
	OnCommand=cmd(x,121);
	Condition=not IsArcade();
	};
	LoadActor("start")..{
	OnCommand=cmd(x,28);
	Condition=IsArcade();
	};
	LoadActor("exit")..{
	OnCommand=cmd(x,28);
	Condition=IsArcade();
	};
};