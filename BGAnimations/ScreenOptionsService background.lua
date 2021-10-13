local t = Def.ActorFrame{};
InitUserPrefs();
t[#t+1] = Def.ActorFrame {
    OnCommand=function(self)
        if not FILEMAN:DoesFileExist("Save/ThemePrefs.ini") then
            Trace("ThemePrefs doesn't exist; creating file")
            ThemePrefs.ForceSave()
        end
        ThemePrefs.Save()
    end;
};

return t;