-- ノーマルモード
-- ページ全体コピー
vim.keymap.set('n', 'YY', ':%y<CR>')
-- 数値インクリメント
vim.keymap.set('n', '+', '<C-a>')
-- 数値デクリメント
vim.keymap.set('n', '-', '<C-x>')
-- 検索ハイライト解除
vim.keymap.set('n', '<Esc>', ':noh<CR>')
-- 下に少しスクロール
vim.keymap.set('n', '<C-j>', '5j')
-- 上に少しスクロール
vim.keymap.set('n', '<C-k>', '5k')

-- インサートモード
-- VSCodeのプラグインが対応していないので、別途設定する必要があるため注意(https://github.com/vscode-neovim/vscode-neovim#composite-escape-keys)
-- ノーマルモードに戻る
vim.keymap.set('i', 'jj', '<Esc>')
