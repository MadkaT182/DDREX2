local function CreditsText(playr)
	local posX=SCREEN_CENTER_X-301;

	if playr == 'PLAYER_2' then
		posX=SCREEN_CENTER_X+161;
	end

	return LoadFont("ScreenSystemLayer credits normal")..{
		InitCommand=cmd(x,posX;y,SCREEN_BOTTOM-9;shadowlength,2;playcommand,"Refresh");
		RefreshCommand=function(self)
			if GAMESTATE:GetCoinMode() == 'CoinMode_Free' or GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
				self:diffusealpha(0);
			elseif GAMESTATE:IsEventMode() then
				self:diffusealpha(0);
			else
				local coins = GAMESTATE:GetCoins()
				local coinsPerCredit = PREFSMAN:GetPreference('CoinsPerCredit')
				if coinsPerCredit > 1 then
					local credits=math.floor(coins/coinsPerCredit)
					local remainder=math.mod(coins,coinsPerCredit)
					local cStr='COIN(S):'
					cStr=cStr..' ('..remainder..'/'..coinsPerCredit..')'
					self:horizalign(left)
					self:settext(cStr)
					self:diffusealpha(1);
				else
					self:diffusealpha(0);
				end
			end
		end;
		CoinInsertedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		CoinModeChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		RefreshCreditTextMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};

end;

local function OtherText()
	return LoadFont("ScreenSystemLayer credits normal")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-9;shadowlength,2;playcommand,"Refresh");
		RefreshCommand=function(self)
			if GAMESTATE:GetCoinMode() == 'CoinMode_Free' then
				self:settext("FREE PLAY")
				self:diffusealpha(1);
			elseif GAMESTATE:IsEventMode() then
				self:settext("EVENT MODE")
				self:diffusealpha(1);
			elseif GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
				self:diffusealpha(0);
			else
				local coins = GAMESTATE:GetCoins()
				local coinsPerCredit = PREFSMAN:GetPreference('CoinsPerCredit')
				local credits=math.floor(coins/coinsPerCredit)
				local cStr='CREDIT:'

				if credits < 1 then
					cStr='CREDIT:'
				else
					cStr='CREDITS:'
				end

				if credits < 10 then
					cStr=cStr.." "..credits
				else
					cStr=cStr..credits
				end

				self:settext(cStr)
				self:diffusealpha(1);
			end
		end;
		CoinInsertedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		CoinModeChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		RefreshCreditTextMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
end;

local t = Def.ActorFrame {}

t[#t+1] = Def.ActorFrame {
 	CreditsText( 'PLAYER_1' );
	CreditsText( 'PLAYER_2' );
	OtherText();
	ScreenChangedMessageCommand=function(self)
			self:visible(THEME:GetMetric(SCREENMAN:GetTopScreen():GetName(),"ShowCreditDisplay"));
	end;
};

-- SystemMessage Text
t[#t+1] = Def.ActorFrame {
	SystemMessageMessageCommand=function(self, params)
		SystemMessageText:settext( params.Message )
		self:playcommand( "On" )
		if params.NoAnimate then
			self:finishtweening()
		end
		self:playcommand( "Off" )
	end,
	HideSystemMessageMessageCommand=cmd(finishtweening),

	Def.Quad {
		InitCommand=function(self)
			self:zoomto(_screen.w, 30):horizalign(left):vertalign(top)
				:diffuse(Color.Black):diffusealpha(0)
		end,
		OnCommand=function(self)
			self:finishtweening():diffusealpha(0.85)
				:zoomto(_screen.w, (SystemMessageText:GetHeight() + 16) * 0.8 )
		end,
		OffCommand=function(self) self:sleep(3):linear(0.5):diffusealpha(0) end,
	},

	LoadFont("Common normal")..{
		Name="Text",
		InitCommand=function(self)
			self:maxwidth(750):horizalign(left):vertalign(top)
				:xy(SCREEN_LEFT+10, 10):diffusealpha(0):zoom(0.5)
			SystemMessageText = self
		end,
		OnCommand=function(self) self:finishtweening():diffusealpha(1) end,
		OffCommand=function(self) self:sleep(3):linear(0.5):diffusealpha(0) end,
	}
}

return t;