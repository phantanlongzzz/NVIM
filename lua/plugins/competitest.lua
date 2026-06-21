return {
    "xeluxee/competitest.nvim",

    dependencies = {
        "MunifTanjim/nui.nvim",
    },

    config = function()
        require("competitest").setup({
            local_config_file_name = ".competitest.lua",

            save_current_file = true,
            save_all_files = false,

            
            template_file = {
                cpp = vim.fn.stdpath("config") .. "/templates/cp.cpp",
                py = vim.fn.stdpath("config") .. "/templates/cp.py",
            },

            compile_directory = ".",

            compile_command = {
                cpp = {
                    exec = "g++",
                    args = {
                        "-std=c++20",
                        "-O2",
                        "-Wall",
                        "$(FNAME)",
                        "-o",
                        "$(FNOEXT)",
                    },
                },
            },

            running_directory = ".",

            runner_ui = {
                interface = "popup",
            },

            received_files_extension = "cpp",

            received_problems_path = "$(PROBLEM).$(FEXT)",

            received_contests_directory = "$(CWD)",

            received_contests_problems_path = "$(PROBLEM).$(FEXT)",
            
            testcases_directory = ".cph",

            replace_received_testcases = true,
        })
    end,
}