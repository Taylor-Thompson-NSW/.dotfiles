local silent = { silent = true }

-- Terminal commands
-- ueoa is first through fourth finger left hand home row.
-- This just means I can crush, with opposite hand, the 4 terminal positions
--
-- These functions are stored in harpoon.  A plugn that I am developing
vim.keymap.set("n", "<leader><leader>g", function() require("harpoon.mark").add_file() end, silent)
vim.keymap.set("n", "<leader><leader>f", function() require("harpoon.ui").toggle_quick_menu() end, silent)

vim.keymap.set("n", "<leader><leader>j", function() require("harpoon.ui").nav_file(1) end, silent)
vim.keymap.set("n", "<leader><leader>k", function() require("harpoon.ui").nav_file(2) end, silent)
vim.keymap.set("n", "<leader><leader>l", function() require("harpoon.ui").nav_file(3) end, silent)
vim.keymap.set("n", "<leader><leader>;", function() require("harpoon.ui").nav_file(4) end, silent)
