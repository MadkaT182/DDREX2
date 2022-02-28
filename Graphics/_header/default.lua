-- return Def.ActorFrame {
-- 	LoadActor( "header" )..{
-- 		OnCommand=cmd(x,SCREEN_LEFT+109;y,SCREEN_TOP;vertalign,top;);
-- 		OffCommand=cmd(linear,0.133;addy,-999);
-- 	};
-- }

local function getx(title)
	local pos={
		["ScreenAdvanced"] = SCREEN_CENTER_X-221,
		["ScreenSelectMusic"] = SCREEN_CENTER_X-231,
	};
	return pos[title] or SCREEN_CENTER_X;
end

return Def.ActorFrame {
	LoadActor(THEME:GetPathG("Common","titles/"..Var("LoadingScreen")))..{
		OnCommand=function(self)
			self:vertalign(top);
			self:x(getx(Var("LoadingScreen")));
			self:y(-38);
			self:decelerate(.2);
			self:y(0);
		end;
		OffCommand=cmd(sleep,.3;accelerate,.2;y,-38);
	};
};