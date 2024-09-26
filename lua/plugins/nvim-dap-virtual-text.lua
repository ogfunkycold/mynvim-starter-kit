-- Inline Debug Text
return {
  -- https://github.com/theHamsta/nvim-dap-virtual-text
  'theHamsta/nvim-dap-virtual-text',
  lazy = true,
  opts = {
    -- Display debug text as a comment
    commented = true,
    -- Customize virtual text
    display_callback = function(variable, buf, stackframe, node, options)
      if options.virt_text_pos == 'inline' then
        return ' = ' .. variable.value
      else
        return variable.name .. ' = ' .. variable.value
      end
    end,
  },
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
