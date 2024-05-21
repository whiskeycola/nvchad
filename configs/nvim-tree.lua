local opts = {
  git = {
    enable = true,
  },

  sync_root_with_cwd = true,

  filters = {
    dotfiles = false,
    git_ignored = false,
  },

  view = {
    width = 35,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}
return opts
