# scroll_eof_ctrl_e

Allows you to scroll past the end of the file based on the scrolloff setting.
Based on [Aasim-A/scrollEOF.nvim](https://github.com/Aasim-A/scrollEOF.nvim/tree/master).

[!demo](https://github.com/user-attachments/assets/cfb9aa8c-7a3a-42fc-82be-3463dab22fb3)


## Install 

Lazy
```lua
return {
     "Owen-Dechow/scroll_eof_ctrl_e",
    config = function()
       require("scroll_eof").setup()
    end
}
```

Packer
```lua
use("Owen-Dechow/scroll_eof_crtl_e")
```

Vim-Plug
```lua
Plug "Owen-Dechow/scroll_eof_crtl_e"
```

***YOU MUST RUN THE SETUP FUNCTION OTHERWISE THE PLUGIN WILL NOT WORK***
```lua
require("scroll_eof").setup()
```
