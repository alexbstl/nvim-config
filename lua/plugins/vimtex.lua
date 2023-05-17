return  {
  {
    "lervag/vimtex",
    lazy = false, -- already lazy loaded by virtue
    init = function()
      
      --Vimtex Stuff
      vim.g.tex_flavor = 'latex'
      if(vim.loop.os_uname().sysname=='Darwin')
      then
        vim.g.vimtex_view_method='skim'
        --vim.g.vimtex_view_skim_activate=1
        vim.g.vimtex_view_skim_sync=1
        vim.g.vimtex_view_skim_reading_bar=1
      else
        vim.g.vimtex_view_general_viewer='okular'
        vim.g.vimtex_view_general_options = '--noraise --unique @pdf\\#src:@line@tex'
      end
      vim.g.vimtex_quickfix_mode = 0
      vim.opt_local.conceallevel = 2
      vim.g.tex_conceal='abdmg'
      vim.g.vimtex_compile_progname='nvr'
    end
  }
}
