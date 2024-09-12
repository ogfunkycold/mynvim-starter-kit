-- NOTE:
--
return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = {
    'echasnovski/mini.icons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local logo = [[
       .-.
         __/   (
       , '-.____\
        u=='/  \
           /_/  \
         .-''   |
        (  ____/_____
        _>_/.--------
        \///
         //
        //
    ]]

    local logo2 = [[
    =================     ===============     ===============   ========  ========
    \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
    ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
    || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
    ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
    || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
    ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
    || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
    ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
    ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
    ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
    ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
    ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
    ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
    ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
    ||.=='    _-'                                                     `' |  /==.||
    =='    _-'                        N E O V I M                         \/   `==
    \   _-'                                                                `-_   /
     `''                                                                      ``' 
    ]]

    -- Set header
    dashboard.section.header.val = vim.split(logo, '\n')
    -- dashboard.section.header.val = vim.split(logo2, '\n')
    -- dashboard.section.header.val = {
    --   "                                                     ",
    --   "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    --   "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    --   "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    --   "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    --   "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    --   "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    --   "                                                     ",
    -- }

    -- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    -- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    -- '⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ',
    -- '⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ',
    -- '⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ',
    -- '⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ',
    -- '⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ',
    -- '⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ',
    -- '⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ',
    -- '⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ',
    -- '⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ',
    -- '⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ',
    -- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    -- '⠀⠀⠀⠐⢤⣀⣀⢀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀  ',
    -- '⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ',

    -- '                                                                                  ',
    -- '                      *((##*                                                      ',
    -- '                  /###%%#%&&&%,                           .%((//(/.              ',
    -- '                  #%%&&&&@@@@@@@*                        #%#&%@&%%##%%            ',
    -- '                 &&&@@@@@@@@@@@@@   .**(/(,*,/,*,       &@@@@@@@@@&&%%%*          ',
    -- '                 @@@@@@@@@@&@*                         %@@@@@@@@@@@@&&&&          ',
    -- '                  @@@@%/,               ,                 /@&%@@@@@@@&&&*         ',
    -- '                   &@,                 .                      /%@@@@@@@&.         ',
    -- '                .(..                  ,                         *#@@@@@#          ',
    -- '              .(                                                 .@@@@*           ',
    -- '              #                                                    (              ',
    -- '             ,             *%@%             .@@@@&*                 ,             ',
    -- '          *            /@@@@@@&            @@@@@@@@&                .*           ',
    -- '          ,            @@@@@@@@,   ...  .   .@@@@@@@@@                 /          ',
    -- '          /           @@@@@@/                  *&@@@@@&                           ',
    -- '         /           ,@&@@@.    %@@@@@@@@@,     .#@@@&&                 ,         ',
    -- '         #            (%%%/    *@@@@@@@@@%*      *&%#(*                 /         ',
    -- '         *        .     .           /                   , .,.                     ',
    -- '          .                /                     *                      *         ',
    -- '          *                #.    ./%,%/.      ,%                       /..        ',
    -- '          .,                                                        ,,*  *        ',
    -- '            %*                                 (%%#%%(,          *&*..    ,       ',
    -- '           ,/**#@%,**         ........ ...    #&&&@&&&%%%&(,#@@@@@&##%(%%#,,.     ',
    -- '          .%@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@(@@@@@@&&@@%&%%&&&#@@@@@@@@&&&%(,    ',
    -- '          (%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@&&%&@%&@@@@@@@@@%#,   ',
    -- '        *&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@&%&&*&@@@@@@&&#.  ',
    -- '        &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@&@@@&&(@@@@@@&%* ',
    -- '      .#@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@%@@@(@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@##@@@@#.',
    -- '      /@@@@@@@@@@@%%&%@&##%&#%/(@(&#%%###%&%@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&/',
    -- '     @@@@@@@@@@%((/((**,.,,,,*,,.,*.*.,*,,,,.. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/',
    -- '    .@@@@@@@@@/.*   .                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(',
    -- }
    -- {
    --   "            :h-                                  Nhy`               ",
    --   "           -mh.                           h.    `Ndho               ",
    --   "           hmh+                          oNm.   oNdhh               ",
    --   "          `Nmhd`                        /NNmd  /NNhhd               ",
    --   "          -NNhhy                      `hMNmmm`+NNdhhh               ",
    --   "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
    --   "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
    --   "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
    --   "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
    --   " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
    --   " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
    --   " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
    --   " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
    --   "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
    --   "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
    --   "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
    --   "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
    --   "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
    --   "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
    --   "       //+++//++++++////+++///::--                 .::::-------::   ",
    --   "       :/++++///////////++++//////.                -:/:----::../-   ",
    --   "       -/++++//++///+//////////////               .::::---:::-.+`   ",
    --   "       `////////////////////////////:.            --::-----...-/    ",
    --   "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
    --   "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
    --   "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
    --   "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
    --   "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
    --   "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
    --   "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
    --   "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
    --   "                        .-:mNdhh:.......--::::-`                    ",
    --   "                           yNh/..------..`                          ",
    --   "                                                                    ",
    -- }

    -- Set men
    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New File', '<cmd>ene<CR>'),
      dashboard.button('t', ' > Toggle file explorer', '<cmd>NvimTreeToggle<CR>'),
      dashboard.button('f', '󰱼 > Find File', '<cmd>Telescope find_files<CR>'),
      dashboard.button('r', '󰱼 > Recent files', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('g', ' > Find text', ':Telescope live_grep <CR>'),
      dashboard.button('l', '󰂖 > Lazy', '<Cmd>Lazy<CR>'),
      --      dashboard.button('SPC wr', '󰁯 > Restore Session For Current Directory', '<cmd>SessionRestore<CR>'),
      dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
