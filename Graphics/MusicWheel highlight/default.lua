local part1 = 0;
local part2 = 0;

return Def.ActorFrame {
	LoadActor("highlight");
	Def.ActorFrame{
		OnCommand=cmd(x,-46;diffusealpha,.25);
		LoadActor("beat")..{
			OnCommand=cmd(y,23;setstate,9;pause);
		};
		LoadActor("beat")..{
			OnCommand=cmd(zoomy,-1;y,-23;setstate,9;pause);
		};
	};
	Def.ActorFrame{
		OnCommand=cmd(x,-46);
		LoadActor("full")..{
			OnCommand=cmd(zoomy,-1;y,-23;playcommand,"Set");
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				if song then
					local style = GAMESTATE:GetCurrentStyle():GetStepsType();
					local steps = song:GetOneSteps(style, "Difficulty_Hard");
					if steps then
						part1 = math.random(0,steps:GetMeter() >= ThemePrefs.Get("BossLevel") and 268 or 134);
					end
					local bpmtext = song:GetDisplayBpms();
					local bpmLimited = clamp(math.abs(bpmtext[2]),1,9999);
					local bps = (1/bpmLimited)*7.5;
					self:SetAllStateDelays(bps);
				else
					self:SetAllStateDelays(.075);
				end;
				self:setstate(part1);
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		};
		LoadActor("full")..{
			OnCommand=cmd(y,23;playcommand,"Set");
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				if song then
					local style = GAMESTATE:GetCurrentStyle():GetStepsType();
					local steps = song:GetOneSteps(style, "Difficulty_Hard");
					if steps then
						part2 = math.random(0,steps:GetMeter() >= ThemePrefs.Get("BossLevel") and 268 or 134);
					end
					local bpmtext = song:GetDisplayBpms();
					local bpmLimited = clamp(math.abs(bpmtext[2]),1,9999);
					local bps = (1/bpmLimited)*7.5;
					self:SetAllStateDelays(bps);
				else
					self:SetAllStateDelays(.075);
				end;
				self:setstate(part2);
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		};
	};
	Def.ActorFrame{
		LoadFont("SelectMusic score")..{
			OnCommand=cmd(x,132;y,-21;diffuse,color("#F6F6B0");horizalign,right;player,PLAYER_1);
			UpdateCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_1);
				local profile = PROFILEMAN:GetProfile(PLAYER_1);
				if song and steps and profile then
					local score_list = profile:GetHighScoreList(song,steps);
					local scores = score_list:GetHighScores();
					local top_score = scores[1];
					if top_score then
	                	local hs = top_score:GetScore();
	                	-- local hs = top_score:GetGrade();
	                	if hs ~= "" then
	                		self:settext(string.format("%09d",hs));
	                	end
					else
						self:settext("");
					end
				else
					self:settext("");
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Update");
		};
		LoadFont("SelectMusic score")..{
			OnCommand=cmd(x,132;y,21;diffuse,color("#F6F6B0");horizalign,right;player,PLAYER_2);
			UpdateCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_2);
				local profile = PROFILEMAN:GetProfile(PLAYER_2);
				if song and steps and profile then
					local score_list = profile:GetHighScoreList(song,steps);
					local scores = score_list:GetHighScores();
					local top_score = scores[1];
					if top_score then
	                	local hs = top_score:GetScore();
	                	if hs ~= "" then
	                		self:settext(string.format("%09d",hs));
	                	end
					else
						self:settext("");
					end
				else
					self:settext("");
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Update");
		};
		Def.Sprite{
			OnCommand=cmd(x,154;y,-20);
			UpdateCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_1);
				local profile = PROFILEMAN:GetProfile(PLAYER_1);
				if song and steps and profile then
					local score_list = profile:GetHighScoreList(song,steps);
					local scores = score_list:GetHighScores();
					local top_score = scores[1];
					if top_score then
	                	local hs = top_score:GetGrade();
	                	if hs == "Grade_Tier01" then
	                		self:Load(THEME:GetPathG("MusicWheel","highlight/red"));
	                	else
	                		self:Load(THEME:GetPathG("MusicWheel","highlight/black"));
	                	end
	                else
	                	self:Load(THEME:GetPathG("MusicWheel","highlight/black"));
					end
				else
					self:Load(THEME:GetPathG("MusicWheel","highlight/black"));
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Update");
		};
		Def.Sprite{
			OnCommand=cmd(x,154;y,-20);
			UpdateCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_1);
				local profile = PROFILEMAN:GetProfile(PLAYER_1);
				if song and steps and profile then
					local score_list = profile:GetHighScoreList(song,steps);
					local scores = score_list:GetHighScores();
					local top_score = scores[1];
					if top_score then
	                	local hs = top_score:GetGrade();
	                	if hs then
	                		self:Load(THEME:GetPathG("MusicWheel","grades/"..hs));
	                	else
	                		self:Load(THEME:GetPathG("MusicWheel","grades/fallback"));
	                	end
	                else
	                	self:Load(THEME:GetPathG("MusicWheel","grades/fallback"));
					end
				else
					self:Load(THEME:GetPathG("MusicWheel","grades/fallback"));
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Update");
		};
		LoadActor("fc")..{
			OnCommand=cmd(x,166;y,-8);
			UpdateCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_1);
				local profile = PROFILEMAN:GetProfile(PLAYER_1);
				if song and steps and profile then
					local score_list = profile:GetHighScoreList(song,steps);
					local scores = score_list:GetHighScores();
					local top_score = scores[1];
					if top_score then
	                	local hs = top_score:GetStageAward();
	                	if hs == "StageAward_FullComboW1" or hs == "StageAward_FullComboW2" or hs == "StageAward_FullComboW3" or hs == "StageAward_OneW2" or hs == "StageAward_SingleDigitW2" or hs == "StageAward_OneW3" or hs == "StageAward_SingleDigitW3" then
	                		self:diffusealpha(1);
	                	else
	                		self:diffusealpha(0);
	                	end
	                else
	                	self:diffusealpha(0);
					end
				else
					self:diffusealpha(0);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Update");
		};
		Def.Sprite{
			OnCommand=cmd(x,154;y,20);
			UpdateCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_2);
				local profile = PROFILEMAN:GetProfile(PLAYER_2);
				if song and steps and profile then
					local score_list = profile:GetHighScoreList(song,steps);
					local scores = score_list:GetHighScores();
					local top_score = scores[1];
					if top_score then
	                	local hs = top_score:GetGrade();
	                	if hs == "Grade_Tier01" then
	                		self:Load(THEME:GetPathG("MusicWheel","highlight/red"));
	                	else
	                		self:Load(THEME:GetPathG("MusicWheel","highlight/black"));
	                	end
	                else
	                	self:Load(THEME:GetPathG("MusicWheel","highlight/black"));
					end
				else
					self:Load(THEME:GetPathG("MusicWheel","highlight/black"));
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Update");
		};
		Def.Sprite{
			OnCommand=cmd(x,154;y,20);
			UpdateCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_2);
				local profile = PROFILEMAN:GetProfile(PLAYER_2);
				if song and steps and profile then
					local score_list = profile:GetHighScoreList(song,steps);
					local scores = score_list:GetHighScores();
					local top_score = scores[1];
					if top_score then
	                	local hs = top_score:GetGrade();
	                	if hs then
	                		self:Load(THEME:GetPathG("MusicWheel","grades/"..hs));
	                	else
	                		self:Load(THEME:GetPathG("MusicWheel","grades/fallback"));
	                	end
	                else
	                	self:Load(THEME:GetPathG("MusicWheel","grades/fallback"));
					end
				else
					self:Load(THEME:GetPathG("MusicWheel","grades/fallback"));
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Update");
		};
		LoadActor("fc")..{
			OnCommand=cmd(x,166;y,8);
			UpdateCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_2);
				local profile = PROFILEMAN:GetProfile(PLAYER_2);
				if song and steps and profile then
					local score_list = profile:GetHighScoreList(song,steps);
					local scores = score_list:GetHighScores();
					local top_score = scores[1];
					if top_score then
	                	local hs = top_score:GetStageAward();
	                	if hs == "StageAward_FullComboW1" or hs == "StageAward_FullComboW2" or hs == "StageAward_FullComboW3" or hs == "StageAward_OneW2" or hs == "StageAward_SingleDigitW2" or hs == "StageAward_OneW3" or hs == "StageAward_SingleDigitW3" then
	                		self:diffusealpha(1);
	                	else
	                		self:diffusealpha(0);
	                	end
	                else
	                	self:diffusealpha(0);
					end
				else
					self:diffusealpha(0);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Update");
		};
	};
};