function LoadSteps(self,player)
	local difficultyStates = {
		Difficulty_Beginner	 = 0,
		Difficulty_Easy		 = 1,
		Difficulty_Medium	 = 2,
		Difficulty_Hard		 = 3,
		Difficulty_Challenge = 4,
		Difficulty_Edit		 = 5,
	};
	local selection;
	if GAMESTATE:IsCourseMode() then
		selection = GAMESTATE:GetCurrentTrail(player);
		local entry = selection:GetTrailEntry(GAMESTATE:GetLoadingCourseSongIndex()+1);
		selection = entry:GetSteps();
	else
		selection = GAMESTATE:GetCurrentSteps(player);
	end
	local diff = selection:GetDifficulty();
	local state = difficultyStates[diff] or 5;
	return state;
end;

local t = Def.ActorFrame{};

for player in ivalues(GAMESTATE:GetHumanPlayers()) do

	t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			LoadActor("_frame/score_n")..{
				OnCommand=function(self)
					self:x(player == PLAYER_1 and SCREEN_CENTER_X-189 or SCREEN_CENTER_X+189);
					self:y(SCREEN_BOTTOM-24);
					self:zoomx(player == PLAYER_1 and 1 or -1);
				end;
			};
		    Def.RollingNumbers{
		        File = THEME:GetPathF("ScreenEvaluation", "ScoreNumber");
				OnCommand=function(self)
					self:player(player);
					self:x(player == PLAYER_1 and SCREEN_CENTER_X-146 or SCREEN_CENTER_X+234);
					self:y(SCREEN_BOTTOM-24);
					self:diffusecolor(color("#FDFD00"));
					self:horizalign(right);
				end;
		        ScoreChangedMessageCommand=function(self,params)
		            self:Load("RollingNumbersScore");
		            self:targetnumber(STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetScore());
		        end;
		    };
			LoadFont("ScreenEvaluation points")..{
				OnCommand=function(self)
					self:x(player == PLAYER_1 and SCREEN_CENTER_X-68 or SCREEN_CENTER_X+312);
					self:y(SCREEN_BOTTOM-24);
					self:settext(string.format("% 5d", 0));
					self:horizalign(right);
				end;
				ScoreChangedMessageCommand=function(self,params)
					local Marvelous = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W1");
					local Perfect = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W2");
					local Great = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W3");
					local Ok = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetHoldNoteScores("HoldNoteScore_Held");
					local EXScore = (Marvelous * 3) + (Perfect * 2) + Great + (Ok * 3);
					self:settext(string.format("% 5d", EXScore));
				end;
			};
			Condition=getenv("advMode") ~= "Survival" and getenv("advMode") ~= "Comboch";
		};
		Def.ActorFrame{
			OnCommand=function(self)
				self:x(player == PLAYER_1 and SCREEN_CENTER_X-265 or SCREEN_CENTER_X+265);
				self:y(GAMESTATE:GetPlayerState(player):GetCurrentPlayerOptions():Reverse() ~= 0 and SCREEN_TOP+51 or SCREEN_BOTTOM-45);
			end;
			LoadActor(THEME:GetPathG("ScreenGameplay", "diffframe"))..{
				InitCommand=function(self)
					local po = GAMESTATE:GetPlayerState(player):GetCurrentPlayerOptions();
					if po:Reverse() ~= 0 then
						self:setstate(player == PLAYER_1 and 0 or 1);
					else
						self:setstate(player == PLAYER_1 and 2 or 3);
					end;
					self:pause();
				end;
			};
			LoadActor(THEME:GetPathG("ScreenGameplay", "difficulty"))..{
				InitCommand=cmd(playcommand,"Update");
				UpdateCommand=function(self)
					self:pause();
					self:setstate(LoadSteps(self,player));
				end;
				CurrentTraiP1ChangedMessageCommand=cmd(playcommand,"Update");
				CurrentTraiP2ChangedMessageCommand=cmd(playcommand,"Update");
				CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
				CurrentCourseChangedMessageCommand=cmd(playcommand,"Update");
				CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Update");
				CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Update");
			};
		};
	};

end

return t;