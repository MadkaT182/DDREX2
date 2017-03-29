local t = Def.ActorFrame {};

if IsUsingWideScreen() == true then
	t[#t+1] = LoadActor("framew")..{};
else
	t[#t+1] = LoadActor("framen")..{};
end

return t;