require("definition-or-references").setup({
  -- Prints useful logs about what event are triggered, and reasons actions are executed.
  debug = false,

  -- Callback that gets called just before sending first request
  before_start_callback = function() end,

  -- Callback that gets called just after opening entry and settig cursor position
  after_jump_callback = function(_) end,

  -- Callback that gets called with all of the references lsp result. You can do whatever you want
  -- with this data e.g. display it in the `telescope` window
  -- For example see Wiki pages
  on_references_result = nil,

  -- Specifies when should the notify be called (if at all)
  -- If you want to disable notify completely set it to `false`: `notify_options = false`
  notify_options = {
    errors = true,
    on_definition_no_reference = true,
    no_definition_no_reference = true,
    on_definition_one_reference = true,
    no_definition_one_reference = true,
  },
})
