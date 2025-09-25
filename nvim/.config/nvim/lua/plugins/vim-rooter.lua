return {
  "airblade/vim-rooter",
  config = function()
    -- Configure rooter to look for these patterns to identify project root
    vim.g.rooter_patterns = {'.git', '.git/', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json'}
    -- Optional: Change to project root when opening a file
    vim.g.rooter_change_directory_for_non_project_files = 'current'
    -- Optional: Silent mode (don't echo the project directory)
    vim.g.rooter_silent_chdir = 1
  end
}
