--[[
  packerでパッケージを行なっています
  以下のコマンドを使用します

  :PackerUpdate
  無効になっているプラグインを削除し、インストール及びアップデートする
]]

-- optプラグインでpackerを使う場合に必要
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Luaが使えるNeovim用パッケージマネージャ
  use 'wbthomason/packer.nvim'

  -- 遅延読み込み・非同期実行
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- 検索強化・autocommandイベント読み込み
  use {'andymass/vim-matchup', event = 'VimEnter'}
end)
