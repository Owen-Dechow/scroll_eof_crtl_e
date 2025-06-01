# scroll_eof_ctrl_e

Allows you to scroll past the end of the file based on the scrolloff setting.
Based on [Aasim-A/scrollEOF.nvim](https://github.com/Aasim-A/scrollEOF.nvim/tree/master).

[!demo](https://github.com/user-attachments/assets/cfb9aa8c-7a3a-42fc-82be-3463dab22fb3)


## Install 

Lazy
```lua
return {
     "Owen-Dechow/scroll_eof_ctrl_e",
     opts = {
        -- scrolloff = nil
        -- -- Set default scrolloff for
        --    vim.opt.scrolloff. If the
        --    value is nil or false, the
        --    the scrolloff will not be
        --    set or overwritten.
     }
}
```

> [!NOTE]
> Unless you include the opts option in lazy then the plugin will not set up.
> If you are using a different plugin manager the system will word as soon as
> the plugin is required. You do not need to explicitly run the `setup`
> function. The setup function only deals with opts.
