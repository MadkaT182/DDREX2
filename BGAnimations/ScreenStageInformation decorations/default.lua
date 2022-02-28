local sTime = .1;

return Def.ActorFrame {
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,color("#000000"));
	};
	Def.ActorFrame {
		OnCommand=cmd(Center);
		LoadActor("00")..{
			OnCommand=cmd(x,-44);
		};
		LoadActor("00")..{
			OnCommand=cmd(x,44);
		};
		LoadActor("00")..{
			OnCommand=cmd(x,-132);
		};
		LoadActor("00")..{
			OnCommand=cmd(x,132);
		};
		LoadActor("00")..{
			OnCommand=cmd(x,-220);
		};
		LoadActor("00")..{
			OnCommand=cmd(x,220);
		};
	};
	Def.ActorFrame {
		OnCommand=cmd(Center);
		LoadActor("01")..{
			OnCommand=cmd(playcommand,"Anim");
			AnimCommand=cmd(diffusealpha,0;sleep,sTime;diffusealpha,1;x,-220;sleep,sTime;x,-132;sleep,sTime;x,-44;sleep,sTime;x,44;sleep,sTime;x,132;sleep,sTime;x,220;queuecommand,"repeat");
			repeatCommand=cmd(sleep,sTime;queuecommand,"Anim");
		};
		LoadActor("02")..{
			OnCommand=cmd(diffusealpha,0;sleep,sTime;playcommand,"Anim");
			AnimCommand=cmd(diffusealpha,0;sleep,sTime;diffusealpha,1;x,-220;sleep,sTime;x,-132;sleep,sTime;x,-44;sleep,sTime;x,44;sleep,sTime;x,132;sleep,sTime;x,220;queuecommand,"repeat");
			repeatCommand=cmd(sleep,sTime;queuecommand,"Anim");
		};
		LoadActor("01")..{
			OnCommand=cmd(diffusealpha,0;sleep,sTime*2;playcommand,"Anim");
			AnimCommand=cmd(diffusealpha,0;sleep,sTime;diffusealpha,1;x,-220;sleep,sTime;x,-132;sleep,sTime;x,-44;sleep,sTime;x,44;sleep,sTime;x,132;sleep,sTime;x,220;queuecommand,"repeat");
			repeatCommand=cmd(sleep,sTime;queuecommand,"Anim");
		};
	};
	LoadActor("SoundStage")..{
		Condition=getenv("advMode") ~= "Survival" and ThemePrefs.Get("StgNfoAnn")
	};
};