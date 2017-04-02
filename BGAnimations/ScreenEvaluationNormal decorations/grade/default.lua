local t = Def.ActorFrame {
--P1--
--GRADEP1---
	LoadActor("Grade_01")..{
		InitCommand=cmd(player,PLAYER_1; x,SCREEN_CENTER_X-237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier01") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_02")..{
		InitCommand=cmd(player,PLAYER_1; x,SCREEN_CENTER_X-237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier02") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_03")..{
		InitCommand=cmd(player,PLAYER_1; x,SCREEN_CENTER_X-237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier03") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_04")..{
		InitCommand=cmd(player,PLAYER_1; x,SCREEN_CENTER_X-237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier04") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_05")..{
		InitCommand=cmd(player,PLAYER_1; x,SCREEN_CENTER_X-237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier05") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_06")..{
		InitCommand=cmd(player,PLAYER_1; x,SCREEN_CENTER_X-237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier06") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_07")..{
		InitCommand=cmd(player,PLAYER_1; x,SCREEN_CENTER_X-237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Failed") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
--FCStarP1--
	LoadActor("star")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-193;y,SCREEN_CENTER_Y-159;zoom,0);
		OnCommand=function(self)
		local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetStageAward();
			if staw =="StageAward_SingleDigitW3" or staw =="StageAward_OneW3" or staw =="StageAward_FullComboW3" or staw =="StageAward_SingleDigitW2" or staw =="StageAward_OneW2" or staw =="StageAward_FullComboW2" or staw =="StageAward_FullComboW1" then
				(cmd(linear,0.2;zoom,1;wag))(self);
			end;
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};

--P2--
--GradeP2--
	LoadActor("Grade_01")..{
		InitCommand=cmd(player,PLAYER_2; x,SCREEN_CENTER_X+237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier01") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_02")..{
		InitCommand=cmd(player,PLAYER_2; x,SCREEN_CENTER_X+237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier02") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_03")..{
		InitCommand=cmd(player,PLAYER_2; x,SCREEN_CENTER_X+237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier03") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_04")..{
		InitCommand=cmd(player,PLAYER_2; x,SCREEN_CENTER_X+237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier04") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_05")..{
		InitCommand=cmd(player,PLAYER_2; x,SCREEN_CENTER_X+237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier05") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_06")..{
		InitCommand=cmd(player,PLAYER_2; x,SCREEN_CENTER_X+237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier06") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
	LoadActor("Grade_07")..{
		InitCommand=cmd(player,PLAYER_2; x,SCREEN_CENTER_X+237;y,SCREEN_CENTER_Y-177;zoom,0);
		OnCommand=function(self)
			if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Failed") then
				(cmd(sleep,0.2;linear,0.2;zoom,1))(self);
			end;
		end;
	};
--FCStarP2--
	LoadActor("star")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X+280;y,SCREEN_CENTER_Y-159;zoom,0);
		OnCommand=function(self)
		local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetStageAward();
			if staw =="StageAward_SingleDigitW3" or staw =="StageAward_OneW3" or staw =="StageAward_FullComboW3" or staw =="StageAward_SingleDigitW2" or staw =="StageAward_OneW2" or staw =="StageAward_FullComboW2" or staw =="StageAward_FullComboW1" then
				(cmd(linear,0.2;zoom,1;wag))(self);
			end;
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};
};
return t;
