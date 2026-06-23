local keymap = vim.keymap


keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})


local Terminal = require("toggleterm.terminal").Terminal

local main_term = Terminal:new({
    direction = "horizontal",
    hidden = true,
})

keymap.set("n", "<F4>", function()
    main_term:toggle()
end, { silent = true })



-- F5: Python
keymap.set("n", "<F5>", function()
    vim.cmd("w")

    local file = vim.fn.expand("%:p")

    main_term:open()
    main_term:send("python \"" .. file .. "\"", true)
end)

--F6 compile + run C++
keymap.set("n", "<F6>", function()
    vim.cmd("w")

    local file = vim.fn.expand("%:p")
    local exe = vim.fn.expand("%:r") .. ".exe"

    main_term:open()

    main_term:send(
        'g++ -std=c++23 -O2 -Wall -Wextra "'
            .. file
            .. '" -o "'
            .. exe
            .. '" && "'
            .. exe
            .. '"',
        true
    )
end)


keymap.set("n", "<leader>th", ":Huez<CR>", { silent = true })
keymap.set("n", "<leader>tf", ":HuezFavorites<CR>", { silent = true })

local opts = { silent = true }

keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)


-- Competitive Programming
keymap.set("n", "<F7>", function()
    vim.ui.select(
        { "cpp", "py" },
        { prompt = "Language:" },
        function(choice)
            if not choice then
                return
            end

            require("competitest").setup({
                received_files_extension = choice,
            })

            vim.cmd("CompetiTest receive problem")
        end
    )
end, opts)

keymap.set("n", "<F8>", function()
    vim.cmd("CompetiTest run")
end, opts)

vim.cmd([[cd E:/Computer Science/Codeforces]])
