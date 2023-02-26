-- ノーマルモード
-- ページ全体コピー
vim.keymap.set('n', 'YY', ':%y<CR>')
-- 数値インクリメント
vim.keymap.set('n', '+', '<C-a>')
-- 数値デクリメント
vim.keymap.set('n', '-', '<C-x>')
-- 検索ハイライト解除
vim.keymap.set('n', '<Esc>', ':noh<CR>')

-- インサートモードはVSCodeのプラグインが対応していないので使えない
-- https://github.com/vscode-neovim/vscode-neovim#composite-escape-keys 