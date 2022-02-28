function Actor:LyricCommand(side)
	self:settext( Var "LyricText" )
	self:draworder(102)

	self:stoptweening()
	self:shadowlengthx(2)
	self:shadowlengthy(2)
	self:strokecolor(color("#000000"))

	local Zoom = SCREEN_WIDTH / (self:GetZoomedWidth()+1)
	if( Zoom > 1 ) then
		Zoom = 1
	end
	self:zoomx( Zoom )

	local lyricColor = Var "LyricColor"
	local Factor = 1
	if side == "Back" then
		Factor = 0.5
	elseif side == "Front" then
		Factor = 0.9
	end
	self:diffuse( {
		lyricColor[1] * Factor,
		lyricColor[2] * Factor,
		lyricColor[3] * Factor,
		lyricColor[4] * Factor } )

	if side == "Front" then
		self:cropright(1)
	else
		self:cropleft(0)
	end

	self:diffusealpha(0)
	self:linear(0.2)
	self:diffusealpha(1)
	self:linear( Var "LyricDuration" * 0.75)
	if side == "Front" then
		self:cropright(0)
	else
		self:cropleft(1)
	end
	self:sleep( Var "LyricDuration" * 0.25 )
	self:linear(0.2)
	self:diffusealpha(0)
	return self
end