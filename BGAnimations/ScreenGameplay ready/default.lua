return Def.ActorFrame{
	InitCommand=cmd(Center;sleep,1;diffusealpha,0);
	LoadActor("ready") .. {
		Condition=getenv("advMode") ~= "Survival" and getenv("advMode") ~= "Comboch"
	};	
};