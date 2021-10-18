return Def.ActorFrame{
	LoadActor(THEME:GetPathG("","_style/info_sin"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X+45;y,SCREEN_CENTER_Y-131);
	};
	Def.ActorFrame{
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		LoadActor(THEME:GetPathG("Common","wheel/bnbg"))..{
			OnCommand=cmd(x,61;y,53;zoomto,273,85);
		};
		LoadActor(THEME:GetPathG("","_style/icon_pad"))..{
			OnCommand=cmd(x,4;y,53);
		};
		LoadActor(THEME:GetPathG("Common","wheel/banner"))..{
			OnCommand=cmd(x,100;y,219);
		};
		LoadActor(GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "Art1" or "Art2")..{
			InitCommand=cmd(Center;addx,-250;addy,30);
		};
		LoadActor(THEME:GetPathG("","_style/sin_scan"))..{
			OnCommand=cmd(x,SCREEN_CENTER_X-101;y,SCREEN_CENTER_Y-131);
		};
	};
}