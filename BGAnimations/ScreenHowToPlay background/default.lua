local t = Def.ActorFrame{
	LoadActor("bgtile")..{
		InitCommand=cmd(FullScreen;);
		OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
			local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
			self:customtexturerect(0,0,w,h);
			self:texcoordvelocity(0.5,-0.5);
		end;
	};
}

if IsArcade() then
	t[#t+1] = LoadActor("machine")..{
		OnCommand=cmd(Center;addy,-16);
	};
	t[#t+1] = LoadActor("lights")..{
		InitCommand=cmd(Center;addy,-117);
		OnCommand=cmd(diffusealpha,0;sleep,5.533;diffusealpha,1;sleep,3.367;diffusealpha,0;sleep,3.066;diffusealpha,1;sleep,3.4;diffusealpha,0;sleep,2.033;diffusealpha,1;sleep,2.937;diffusealpha,0;sleep,2.235;diffusealpha,1;sleep,2.937;diffusealpha,0;sleep,2.402;diffusealpha,1;sleep,1.418;diffusealpha,0);
	};
else
	t[#t+1] = LoadActor("pad")..{
		OnCommand=cmd(Center);
	};
end;

t[#t+1] = Def.ActorFrame{
	LoadActor("stepcircle")..{
		OnCommand=cmd(Center;addy,20;addx,122;diffusealpha,0;sleep,3.67;diffusealpha,1;linear,.384;blend,"BlendMode_Add";zoom,.5;addy,-17;addx,0;sleep,1.034;linear,.183;zoom,0);
	};
	LoadActor("stepcircle")..{
		OnCommand=cmd(Center;zoom,1.02;addy,84;addx,40;diffusealpha,0;sleep,10.076;diffusealpha,1;linear,.384;blend,"BlendMode_Add";zoom,.5;addy,-24;addx,0;sleep,1.034;linear,.183;zoom,0);
	};
	LoadActor("stepcircle")..{
		OnCommand=cmd(Center;zoom,1.02;addy,84;addx,207;diffusealpha,0;sleep,10.076;diffusealpha,1;linear,.384;blend,"BlendMode_Add";zoom,.5;addy,-24;addx,0;sleep,1.034;linear,.183;zoom,0);
	};
	--
	LoadActor("stepcircle")..{
		OnCommand=cmd(Center;addy,20;addx,122;diffusealpha,0;sleep,16.516;diffusealpha,1;linear,.651;blend,"BlendMode_Add";addy,-17;addx,0;zoom,0);
	};
	LoadActor("stepcircle")..{
		OnCommand=cmd(Center;zoom,1.02;addy,84;addx,40;diffusealpha,0;sleep,21.771;diffusealpha,1;linear,.734;blend,"BlendMode_Add";addy,-24;addx,0;zoom,0);
	};
	LoadActor("stepcircle")..{
		OnCommand=cmd(Center;zoom,1.02;addy,84;addx,207;diffusealpha,0;sleep,21.771;diffusealpha,1;linear,.734;blend,"BlendMode_Add";addy,-24;addx,0;zoom,0);
	};
	--
	LoadActor("stepcircle")..{
		OnCommand=cmd(Center;addy,20;addx,122;diffusealpha,0;sleep,27.026;diffusealpha,1;linear,.584;blend,"BlendMode_Add";addy,-17;addx,0;zoom,0);
	};
	---
	LoadActor("freeze")..{
		OnCommand=cmd(zoom,.8;Center;addx,117;blend,"BlendMode_Add";diffuseshift;effectperiod,.083,0;diffusealpha,0;sleep,17.333;diffusealpha,1;sleep,2.937;diffusealpha,0;);
	};
	LoadActor("freeze")..{
		OnCommand=cmd(zoom,.8;Center;addx,47;addy,57;blend,"BlendMode_Add";diffuseshift;effectperiod,.083,0;diffusealpha,0;sleep,22.505;diffusealpha,1;sleep,2.937;diffusealpha,0;);
	};
	LoadActor("freeze")..{
		OnCommand=cmd(zoom,.8;Center;addx,203;addy,57;blend,"BlendMode_Add";diffuseshift;effectperiod,.083,0;diffusealpha,0;sleep,22.505;diffusealpha,1;sleep,2.937;diffusealpha,0;);
	};
	--
	LoadActor("freeze")..{
		OnCommand=cmd(zoom,.8;Center;addx,117;blend,"BlendMode_Add";diffuseshift;effectperiod,.083,0;diffusealpha,0;sleep,27.844;diffusealpha,1;sleep,1.418;diffusealpha,0;);
	};
	LoadActor("lifebg")..{
		OnCommand=cmd(cropright,.5;x,SCREEN_LEFT+320;y,SCREEN_TOP+25);
	};
	LoadActor("lifebg")..{
		OnCommand=cmd(cropleft,.5;x,SCREEN_RIGHT-320;y,SCREEN_TOP+25);
	};
};

return t;