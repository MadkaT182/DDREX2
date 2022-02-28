return Def.ActorFrame {
	LoadActor("../OptionRow box")..{
		OnCommand=cmd(x,169);
	};
	LoadActor("../OptionRow endline")..{
		OnCommand=cmd(x,267;y,3);
	};
	LoadActor("../OptionRow endline")..{
		OnCommand=cmd(x,72;y,3;zoomx,-1);
	};
	LoadActor("../OptionRow arrow")..{
		OnCommand=cmd(x,87);
	};
	LoadActor("../OptionRow arrow")..{
		OnCommand=cmd(x,252;zoomx,-1);
	};
	Def.ActorFrame{
		OnCommand=cmd(x,300);
		LoadActor("../OptionRow CursorP2B")..{
			OnCommand=cmd(spin);
		};
		LoadActor("../OptionRow CursorP2F");
	};
};