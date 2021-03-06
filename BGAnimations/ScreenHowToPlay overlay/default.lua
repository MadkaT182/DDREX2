return Def.ActorFrame {
	LoadActor("htp")..{
		OnCommand=cmd(Center;sleep,1.434;linear,.167;addy,48;cropbottom,1);
	};
	LoadActor("feet")..{
		OnCommand=cmd(Center;addy,-32;croptop,1;sleep,1.668;linear,.167;addy,32;croptop,0;sleep,1.284;linear,.167;addy,-32;croptop,1);
	};
	Def.Quad{
		OnCommand=cmd(Center;addx,-145;addy,50;setsize,320,78;diffusealpha,.5;diffusecolor,color("#000000");zoomy,0;sleep,5.72;linear,.28;zoomy,1;sleep,2;diffusealpha,0);
	};
	LoadActor("m1")..{
		OnCommand=cmd(Center;addx,-146;addy,52;zoomy,0;sleep,5.72;linear,.28;zoomy,1;sleep,2;diffusealpha,0);
	};
	Def.Quad{
		OnCommand=cmd(Center;addx,-145;addy,50;setsize,320,78;diffusealpha,.5;diffusecolor,color("#000000");zoomy,0;sleep,12.145;linear,.28;zoomy,1;sleep,2;diffusealpha,0);
	};
	LoadActor("m2")..{
		OnCommand=cmd(Center;addx,-146;addy,52;zoomy,0;sleep,12.145;linear,.28;zoomy,1;sleep,2;diffusealpha,0);
	};
	Def.Quad{
		OnCommand=cmd(Center;addx,-145;addy,50;setsize,320,78;diffusealpha,.5;diffusecolor,color("#000000");zoomy,0;sleep,17.45;linear,.28;zoomy,1;sleep,2;diffusealpha,0);
	};
	LoadActor("m3")..{
		OnCommand=cmd(Center;addx,-146;addy,52;zoomy,0;sleep,17.45;linear,.28;zoomy,1;sleep,2;diffusealpha,0);
	};
	Def.Quad{
		OnCommand=cmd(Center;addx,-145;addy,50;setsize,320,78;diffusealpha,.5;diffusecolor,color("#000000");zoomy,0;sleep,22.705;linear,.28;zoomy,1;sleep,2;diffusealpha,0);
	};
	LoadActor("m4")..{
		OnCommand=cmd(Center;addx,-146;addy,52;zoomy,0;sleep,22.705;linear,.28;zoomy,1;sleep,2;diffusealpha,0);
	};
	Def.Quad{
		OnCommand=cmd(Center;addx,-145;addy,50;setsize,320,78;diffusealpha,.5;diffusecolor,color("#000000");zoomy,0;sleep,27.961;linear,.28;zoomy,1;sleep,2;diffusealpha,0);
	};
	LoadActor("m5")..{
		OnCommand=cmd(Center;addx,-146;addy,66;zoomy,0;sleep,27.961;linear,.28;zoomy,1;sleep,2;diffusealpha,0);
	};
	Def.Quad{
		OnCommand=cmd(Center;addx,-145;addy,50;setsize,320,122;diffusealpha,.5;diffusecolor,color("#000000");zoomy,0;sleep,34.284;linear,.28;zoomy,1;);
	};
	LoadActor("m6")..{
		OnCommand=cmd(Center;addx,-146;addy,52;zoomy,0;sleep,34.284;linear,.28;zoomy,1;);
	};
	LoadActor("hbl")..{
		OnCommand=cmd(Center;rotationz,90;addx,-48;addy,45;diffusealpha,0;sleep,3.887;diffusealpha,1;linear,.267;addx,41;sleep,.8;diffusealpha,0);
	};
	LoadActor("hp")..{
		OnCommand=cmd(Center;addx,-108;addy,-17;diffusealpha,0;sleep,5.555;diffusealpha,1;linear,0.167;addy,-50;sleep,2.135;linear,0.167;addy,50;sleep,0;diffusealpha,0);
	};
	LoadActor("hbl")..{
		OnCommand=cmd(Center;rotationz,90;addx,-83;addy,87;diffusealpha,0;sleep,10.31;diffusealpha,1;linear,.267;addx,40;sleep,.817;diffusealpha,0);
	};
	LoadActor("hbl")..{
		OnCommand=cmd(Center;addx,-230;addy,-22;diffusealpha,0;sleep,11.995;diffusealpha,1;linear,0.15;addy,-50;sleep,2.135;linear,0.184;addy,50;sleep,0;diffusealpha,0);
	};
	LoadActor("hbr")..{
		OnCommand=cmd(Center;addx,-122;addy,-22;diffusealpha,0;sleep,11.995;diffusealpha,1;linear,0.15;addy,-50;sleep,2.135;linear,0.184;addy,50;sleep,0;diffusealpha,0);
	};
	LoadActor("hp")..{
		OnCommand=cmd(Center;addx,-108;addy,-20;diffusealpha,0;sleep,17.3;diffusealpha,1;linear,0.15;addy,-50;sleep,0;queuecommand,"Anim");
		AnimCommand=cmd(bob;effectperiod,.5;effectmagnitude,0,36,0;sleep,2.803;diffusealpha,0);
	};
	LoadActor("hbl")..{
		OnCommand=cmd(Center;addx,-230;addy,-22;diffusealpha,0;sleep,22.555;diffusealpha,1;linear,0.15;addy,-50;sleep,0;queuecommand,"Anim");
		AnimCommand=cmd(bob;effectperiod,.5;effectmagnitude,0,36,0;sleep,2.803;diffusealpha,0);
	};
	LoadActor("hbr")..{
		OnCommand=cmd(Center;addx,-122;addy,-22;diffusealpha,0;sleep,22.555;diffusealpha,1;linear,0.15;addy,-50;sleep,0;queuecommand,"Anim");
		AnimCommand=cmd(bob;effectperiod,.5;effectmagnitude,0,36,0;sleep,2.803;diffusealpha,0);
	};
	LoadActor("hp")..{
		OnCommand=cmd(Center;addx,-108;addy,-20;diffusealpha,0;sleep,27.811;diffusealpha,1;linear,0.15;addy,-50;sleep,0;queuecommand,"Anim");
		AnimCommand=cmd(bob;effectperiod,.5;effectmagnitude,0,36,0;sleep,2.803;diffusealpha,0);
	};
	LoadActor("hg")..{
		OnCommand=cmd(Center;addx,-178;addy,-18;diffusealpha,0;sleep,32.982;diffusealpha,1;linear,0;addy,-126;sleep,.234;queuecommand,"Anim");
		AnimCommand=cmd(bob;effectperiod,.5;effectmagnitude,0,36,0;);
	};
}