local telescope_setup, setup = pcall(require, "telescope")
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actins then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["Up"] = actions.move_selection_previous,
        ["Down"] = actions.move_selection_next,
      }
    }
  }
})

telescope.load_extension("fzf")
