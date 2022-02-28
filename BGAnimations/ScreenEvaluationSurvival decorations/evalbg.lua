local t = Def.ActorFrame {};

if IsUsingWideScreen() == true then
	t[#t+1] = LoadActor("evalW")..{};
else
	t[#t+1] = LoadActor("evalN")..{};
end

return t;