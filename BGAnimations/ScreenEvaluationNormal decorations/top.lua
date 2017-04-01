local hFix=0;
local t = Def.ActorFrame {};

if IsUsingWideScreen() == true then
	fType="framew";
	hFix=53;
else
	fType="framen";
end;

t[#t+1] = Def.ActorFrame {
	LoadActor("evalbg")..{
		OnCommand=cmd(addx,-216-hFix;addy,3);
		OffCommand=cmd();
	};
	LoadActor("evalbg")..{
		OnCommand=cmd(addx,216+hFix;addy,3;zoomx,-1);
		OffCommand=cmd();
	};
	LoadActor(fType)..{};
};

return t;