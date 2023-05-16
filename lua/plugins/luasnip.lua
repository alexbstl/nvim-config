return {

	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
  config = function()
    require('luasnip.loaders.from_snipmate').lazy_load({paths='~/.config/nvim/snippets'})
    require('luasnip.loaders.from_lua').lazy_load({paths='~/.config/nvim/LuaSnip/'})
  end,

} 
