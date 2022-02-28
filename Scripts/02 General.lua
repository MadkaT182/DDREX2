--Retrieve configured sort
function GetSortName()
	local sortList ={
		[0] = "Preferred",
		[1] = "Group",
		[2] = "Title",
		[3] = "BPM",
		[4] = "Popularity",
		[5] = "TopGrades",
		[6] = "Artist",
		[7] = "Genre"
	}
	local name = sortList[ThemePrefs.Get("DefSort")] or "Preferred";
	return name;
end

--Clear env data
function ClearEnv()
	setenv("advMode",null);
	setenv("advLives",null);
end