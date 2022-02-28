return Def.ActorFrame{
	Def.ActorFrame{
		LoadActor(getenv("advMode") == "Comboch" and "../Common advanced/cc_base" or "../Common advanced/adv_base");
		LoadActor("../Common advanced/"..getenv("advMode"));
		OnCommand=cmd(x,SCREEN_CENTER_X-47;y,27);
	};
	LoadActor(THEME:GetPathG("","_footer"));
	Def.ActorFrame{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-33);
		LoadActor(THEME:GetPathG("Common","button/arrow_up"))..{
			OnCommand=cmd(x,74);
		};
		LoadActor(THEME:GetPathG("Common","button/arrow_down"))..{
			OnCommand=cmd(x,86);
		};
		LoadActor(THEME:GetPathG("Common","button/lbl_difficulty"))..{
			OnCommand=cmd(x,155);
		};
		LoadActor(THEME:GetPathG("Common","button/btn_cross"))..{
			OnCommand=cmd(x,199);
		};
		LoadActor(THEME:GetPathG("Common","button/lbl_confirm"))..{
			OnCommand=cmd(x,274);
		};
	};
	Def.ActorFrame{
		OnCommand=cmd(x,SCREEN_LEFT+200;y,SCREEN_BOTTOM-221;horizalign,left;vertalign,bottom);
		LoadActor(THEME:GetPathG("Common","wheel/bnbg"))..{
			OnCommand=cmd(x,-38;y,-167;zoomto,276,85);
		};
		LoadActor(THEME:GetPathG("Common","wheel/banner"));
		LoadActor(THEME:GetPathG("Common","wheel/pad_clean"))..{
			OnCommand=cmd(x,-34;y,162);
		};
	};
}