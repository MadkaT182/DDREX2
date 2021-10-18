return Def.ActorFrame{
	LoadActor(THEME:GetPathG("","_style/info_dou"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X+96;y,SCREEN_CENTER_Y+28);
	};
	Def.ActorFrame{
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		LoadActor(THEME:GetPathG("Common","wheel/bnbg"))..{
			OnCommand=cmd(x,61;y,53;zoomto,273,85);
		};
		LoadActor(THEME:GetPathG("","_style/icon_pad"))..{
			OnCommand=cmd(x,17;y,53);
		};
		LoadActor(THEME:GetPathG("","_style/icon_pad"))..{
			OnCommand=cmd(x,90;y,53);
		};
		LoadActor(THEME:GetPathG("Common","wheel/banner"))..{
			OnCommand=cmd(x,100;y,219);
		};
		LoadActor(GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "Art1" or "Art2")..{
			InitCommand=cmd(Center;addx,-247;addy,38);
		};
		LoadActor(THEME:GetPathG("","_style/dou_scan"))..{
			OnCommand=cmd(x,SCREEN_CENTER_X-50;y,SCREEN_CENTER_Y+28);
		};
	};
}