local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  move_in_saga = { prev = "Up", next = "Down" },
  finder_action_keys = { open = "<CR>" },
  definition_action_keys = { edit = "<CR>" },
  ui = {
    code_action = ""
  },
})
