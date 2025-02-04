-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- Overrides some inbuilt spring functions

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- Scaling
-- hack window geometry

Spring.Orig = Spring.Orig or {}

Spring.Orig.GetWindowGeometry = Spring.GetWindowGeometry
Spring.Orig.GetViewGeometry = Spring.GetViewGeometry
Spring.Orig.GetViewSizes = gl.GetViewSizes	-- gl.GetViewSizes intentionally not overridden
Spring.Orig.GetMouseState = Spring.GetMouseState

Spring.GetWindowGeometry = function()
	local vsx, vsy, vx, vy = Spring.Orig.GetWindowGeometry()
	return vsx/(WG.uiScale or 1), vsy/(WG.uiScale or 1), vx, vy
end

Spring.GetViewGeometry = function()
	local vsx, vsy, vx, vy = Spring.Orig.GetViewGeometry()
	return vsx/(WG.uiScale or 1), vsy/(WG.uiScale or 1), vx, vy
end

Spring.GetViewSizes = function()
	local vsx, vsy = Spring.Orig.GetViewSizes()
	return vsx/(WG.uiScale or 1), vsy/(WG.uiScale or 1), vx, vy
end

Spring.GetMouseState = function()
	local mx, my, left, right, mid, offscreen = Spring.Orig.GetMouseState()
	return mx/(WG.uiScale or 1), my/(WG.uiScale or 1), left, right, mid, offscreen
end
