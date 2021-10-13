return Def.ActorFrame{
	LoadFont("Common normal")..{
		Text="MAIN MENU";
		OnCommand=cmd(x,SCREEN_CENTER_X;y,33);
	};
	LoadFont("Common normal")..{
		Text="PRESS P1 LEFT/RIGHT BUTTON = SELECT ITEM";
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-51;zoom,.8);
	};
	LoadFont("Common normal")..{
		Text="PRESS P1 START BUTTON = EXECUTE";
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-32;zoom,.8);
	};
}