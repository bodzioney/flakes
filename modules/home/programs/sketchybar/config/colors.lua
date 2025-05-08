return {
	black = 0xff181926,
	white = 0xffcad3f5,
	red = 0xffed8796,
	green = 0xffa6da95,
	blue = 0xff8aadf4,
	yellow = 0xffeed49f,
	orange = 0xfff5a97f,
	magenta = 0xffc6a0f6,
	grey = 0xff939ab7,
	transparent = 0x00000000,

	bar = {
		bg = 0xA411111b, -- corresponds to BAR_COLOR
		border = 0xff939ab7, -- using $GREY as border color
	},
	popup = {
		bg = 0xff181926, -- corresponds to POPUP_BACKGROUND_COLOR ($BLACK)
		border = 0xffcad3f5, -- corresponds to POPUP_BORDER_COLOR ($WHITE)
	},
	bg1 = 0xff1e1e2e, -- ITEM_COLOR
	bg2 = 0xffa6adc8, -- SPACE_BACKGROUND2
	bg3 = 0xffcdd6f4, -- SPACE_SELECTED

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
