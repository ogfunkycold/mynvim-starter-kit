-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- NOTE:

return {

  -- NOTE: avante.nvim is a Neovim plugin designed to emulate the behaviour of
  -- the Cursor AI IDE.  It provides users with AI-driven code suggestions and
  -- the ability to apply these recommendations directly to their source files
  -- with minimal effort.

  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
      -- provider = 'openai',
      provider = 'copilot',
      mappings = {
        ask = '<leader>aa',
        -- ask = '<leader>ra',
        edit = '<leader>ae',
        -- edit = '<leader>re',
        refresh = '<leader>ar',
        -- refresh = '<leader>rr',
        toggle = {
          default = '<leader>at',
          debug = '<leader>ad',
          hint = '<leader>ah',
          suggestion = '<leader>as',
        },
        sidebar = {
          switch_windows = '<Tab>',
          reverse_switch_windows = '<S-Tab>',
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
    config = function(_, options)
      require('avante').setup(options)

      local wk = require 'which-key'
      wk.add {
        -- { "<leader>ra", desc = "Ask AI" },
        { '<leader>aa', desc = 'Ask AI' },
        -- { "<leader>re", desc = "Edit selected" },
        { '<leader>ae', desc = 'Edit selected' },
        -- { "<leader>rr", desc = "Refresh AI" },
        { '<leader>ar', desc = 'Refresh AI' },
        { '<leader>at', desc = 'Toggle AI' },
        { '<leader>ad', desc = 'Debug AI' },
        { '<leader>ah', desc = 'Show AI hint' },
        { '<leader>as', desc = 'Show AI suggestion' },
      }
    end,
  },

  -- NOTE: ChatGPT is a Neovim plugin that allows you to effortlessly utilize
  -- the OpenAI ChatGPT API, empowering you to generate natural language
  -- responses from OpenAI's ChatGPT directly within the editor in response to
  -- your inquiries.

  {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = function()
      require('chatgpt').setup {
        -- NOTE: this config assumes you have OPENAI_API_KEY environment 
        -- variable set.
        --
        -- Default values
        -- api_key_cmd = nil,
        yank_register = '+',
        extra_curl_params = nil,
        show_line_numbers = true,
        edit_with_instructions = {
          diff = false,
          keymaps = {
            close = '<C-c>',
            accept = '<C-y>',
            yank = '<C-u>',
            toggle_diff = '<C-d>',
            toggle_settings = '<C-o>',
            toggle_help = '<C-h>',
            cycle_windows = '<Tab>',
            use_output_as_input = '<C-i>',
          },
        },
        chat = {
          welcome_message = WELCOME_MESSAGE,
          loading_text = 'Loading, please wait ...',
          question_sign = '', -- 🙂
          answer_sign = 'ﮧ', -- 🤖
          border_left_sign = '',
          border_right_sign = '',
          max_line_length = 120,
          sessions_window = {
            active_sign = '  ',
            inactive_sign = '  ',
            current_line_sign = '',
            border = {
              style = 'rounded',
              text = {
                top = ' Sessions ',
              },
            },
            win_options = {
              winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
            },
          },
          keymaps = {
            close = '<C-c>',
            yank_last = '<C-y>',
            yank_last_code = '<C-k>',
            scroll_up = '<C-u>',
            scroll_down = '<C-d>',
            new_session = '<C-n>',
            cycle_windows = '<Tab>',
            cycle_modes = '<C-f>',
            next_message = '<C-j>',
            prev_message = '<C-k>',
            select_session = '<Space>',
            rename_session = 'r',
            delete_session = 'd',
            draft_message = '<C-r>',
            edit_message = 'e',
            delete_message = 'd',
            toggle_settings = '<C-o>',
            toggle_sessions = '<C-p>',
            toggle_help = '<C-h>',
            toggle_message_role = '<C-r>',
            toggle_system_role_open = '<C-s>',
            stop_generating = '<C-x>',
          },
        },
        popup_layout = {
          default = 'center',
          center = {
            width = '80%',
            height = '80%',
          },
          right = {
            width = '30%',
            width_settings_open = '50%',
          },
        },
        popup_window = {
          border = {
            highlight = 'FloatBorder',
            style = 'rounded',
            text = {
              top = ' ChatGPT ',
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
            foldcolumn = '1',
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
          buf_options = {
            filetype = 'markdown',
          },
        },
        system_window = {
          border = {
            highlight = 'FloatBorder',
            style = 'rounded',
            text = {
              top = ' SYSTEM ',
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
            foldcolumn = '2',
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
        popup_input = {
          prompt = '  ',
          border = {
            highlight = 'FloatBorder',
            style = 'rounded',
            text = {
              top_align = 'center',
              top = ' Prompt ',
            },
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
          submit = '<C-Enter>',
          submit_n = '<Enter>',
          max_visible_lines = 20,
        },
        settings_window = {
          setting_sign = '  ',
          border = {
            style = 'rounded',
            text = {
              top = ' Settings ',
            },
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
        help_window = {
          setting_sign = '  ',
          border = {
            style = 'rounded',
            text = {
              top = ' Help ',
            },
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
        -- Configure to use the latest OpenAI model
        openai_params = {
          -- NOTE: model can be a function returning the model name
          -- this is useful if you want to change the model on the fly
          -- using commands
          -- Example:
          -- model = function()
          --     if some_condition() then
          --         return "gpt-4-1106-preview"
          --     else
          --         return "gpt-3.5-turbo"
          --     end
          -- end,
          model = 'gpt-4o',
          -- model = 'gpt-4o-2024-08-06',
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 4095,
          -- max_tokens = 65536,
          temperature = 0.3,
          top_p = 0.1,
          n = 1,
        },
        openai_edit_params = {
          model = 'gpt-4o',
          frequency_penalty = 0,
          presence_penalty = 0,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        use_openai_functions_for_edits = false,
        actions_paths = {},
        show_quickfixes_cmd = 'Trouble quickfix',
        predefined_chat_gpt_prompts = 'https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv',
        highlights = {
          help_key = '@symbol',
          help_description = '@comment',
          params_value = 'Identifier',
          input_title = 'FloatBorder',
          active_session = 'ErrorMsg',
          code_edit_result_title = 'FloatBorder',
        },
        -- -- Optional settings
        -- keymaps = {
        --   close = { '<C-c>' },
        --   submit = '<C-Enter>',
        -- },
      }
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },

  -- NOTE: Copilot plugin configuration

  --[[ {
    'github/copilot.vim',
  } ]]

  {
    {
      -- NOTE: This plugin is the pure lua replacement for github/copilot.vim.
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      opts = {
        suggestion = { enabled = true },
        panel = { enabled = true },
        filetypes = {
          markdown = true,
          help = true,
          ["*"] = true,
        },
      },
    },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = "copilot.lua",
      opts = {},
    },
  },

  {
    'robitx/gp.nvim',
    config = function()
      local conf = {
        -- NOTE: For customization, refer to Install > Configuration in the Documentation/Readme
        -- Gp (GPT prompt) lua plugin for Neovim
        -- https://github.com/Robitx/gp.nvim/

        --------------------------------------------------------------------------------
        -- NOTE: Default config
        --------------------------------------------------------------------------------

        -- Please start with minimal config possible.
        -- Just openai_api_key if you don't have OPENAI_API_KEY env set up.
        -- Defaults change over time to improve things, options might get deprecated.
        -- It's better to change only things where the default doesn't fit your needs.

        -- required openai api key (string or table with command and arguments)
        -- openai_api_key = { "cat", "path_to/openai_api_key" },
        -- openai_api_key = { "bw", "get", "password", "OPENAI_API_KEY" },
        -- openai_api_key: "sk-...",
        -- openai_api_key = os.getenv("env_name.."),
        openai_api_key = os.getenv 'OPENAI_API_KEY',

        -- at least one working provider is required
        -- to disable a provider set it to empty table like openai = {}
        providers = {
          -- secrets can be strings or tables with command and arguments
          -- secret = { "cat", "path_to/openai_api_key" },
          -- secret = { "bw", "get", "password", "OPENAI_API_KEY" },
          -- secret : "sk-...",
          -- secret = os.getenv("env_name.."),
          openai = {
            disable = false,
            endpoint = 'https://api.openai.com/v1/chat/completions',
            -- secret = os.getenv("OPENAI_API_KEY"),
          },
          --[[ azure = {
                  disable = true,
                  endpoint = "https://$URL.openai.azure.com/openai/deployments/{{model}}/chat/completions",
                  secret = os.getenv("AZURE_API_KEY"),
                }, ]]
          copilot = {
            disable = true,
            endpoint = 'https://api.githubcopilot.com/chat/completions',
            secret = {
              'bash',
              '-c',
              "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
            },
          },
          ollama = {
            disable = true,
            endpoint = 'http://localhost:11434/v1/chat/completions',
            secret = 'dummy_secret',
          },
          lmstudio = {
            disable = true,
            endpoint = 'http://localhost:1234/v1/chat/completions',
            secret = 'dummy_secret',
          },
          --[[ googleai = {
                  disable = true,
                  endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
                  secret = os.getenv("GOOGLEAI_API_KEY"),
                }, ]]
          --[[ pplx = {
                  disable = true,
                  endpoint = "https://api.perplexity.ai/chat/completions",
                  secret = os.getenv("PPLX_API_KEY"),
                }, ]]
          --[[ anthropic = {
                  disable = true,
                  endpoint = "https://api.anthropic.com/v1/messages",
                  secret = os.getenv("ANTHROPIC_API_KEY"),
                }, ]]
        },

        -- prefix for all commands
        -- cmd_prefix = 'Gp',
        --
        -- optional curl parameters (for proxy, etc.)
        -- curl_params = { "--proxy", "http://X.X.X.X:XXXX" }
        -- curl_params = {},

        -- log file location
        -- log_file = vim.fn.stdpath("log"):gsub("/$", "") .. "/gp.nvim.log",
        --
        -- write sensitive data to log file for	debugging purposes (like api keys)
        -- log_sensitive = false,

        -- directory for persisting state dynamically changed by user (like model or persona)
        -- state_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/persisted",

        -- default agent names set during startup, if nil last used agent is used
        -- default_command_agent = nil,
        -- default_chat_agent = nil,

        -- default command agents (model + persona)
        -- name, model and system_prompt are mandatory fields
        -- to use agent for chat set chat = true, for command set command = true
        -- to remove some default agent completely set it like:
        -- agents = {  { name = "ChatGPT3-5", disable = true, }, ... },
        agents = {
          --[[ {
            name = 'ExampleDisabledAgent',
            disable = true,
          }, ]]
          -- Disable ChatGPT 3.5
          --[[ {
            provider = 'openai',
            name = 'ChatGPT3-5',
            disable = true,
          }, ]]
          --[[ {
            provider = 'openai',
            name = 'ChatGPT4',
            disable = true,
          }, ]]
          {
            provider = 'openai',
            name = 'CodeGPT4o',
            chat = true,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = 'gpt-4o', temperature = 0.1, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = 'You are a specialized coding AI assistant.\n\n'
              .. 'The user provided the additional info about how they would like you to respond:\n\n'
              .. "- If you're unsure don't guess and say you don't know instead.\n"
              .. '- Ask question if you need clarification to provide better answer.\n'
              .. '- Think deeply and carefully from first principles step by step.\n'
              .. '- Make your answers short, conscience, to the point and helpful.\n'
              .. '- Produce only valid and actionable code.\n'
              .. '- Include only essencial response like code etc, DO NOT provide explanations unless specifically asked for\n'
              .. "- Take a deep breath; You've got this!",
          },
          --[[ {
            provider = 'openai',
            name = 'CodeGPT4o-mini',
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = 'gpt-4o-mini', temperature = 0.1, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = 'You are a specialized coding AI assistant.\n\n'
              .. 'The user provided the additional info about how they would like you to respond:\n\n'
              .. "- If you're unsure don't guess and say you don't know instead.\n"
              .. '- Ask question if you need clarification to provide better answer.\n'
              .. '- Think deeply and carefully from first principles step by step.\n'
              .. '- Make your answers short, conscience, to the point and helpful.\n'
              .. '- Produce only valid and actionable code.\n'
              .. '- Include only essencial response like code etc, DO NOT provide explanations unless specifically asked for\n'
              .. "- Take a deep breath; You've got this!",
          }, ]]
          --[[ {
            provider = 'openai',
            name = 'ChatGPT4o-mini',
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = 'gpt-4o-mini', temperature = 1.1, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require('gp.defaults').chat_system_prompt,
          }, ]]
          --[[ {
            provider = 'ollama',
            name = 'ChatOllamaLlama3.1-8B',
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = {
              model = 'llama3.1',
              temperature = 0.6,
              top_p = 1,
              min_p = 0.05,
            },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = 'You are a general AI assistant.',
          }, ]]
          --[[ {
            provider = 'ollama',
            name = 'CodeOllamaLlama3.1-8B',
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = {
              model = 'llama3.1',
              temperature = 0.4,
              top_p = 1,
              min_p = 0.05,
            },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require('gp.defaults').code_system_prompt,
          }, ]]
          --[[ {
            provider = 'lmstudio',
            name = 'ChatLMStudio',
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = {
              model = 'dummy',
              temperature = 0.97,
              top_p = 1,
              num_ctx = 8192,
            },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = 'You are a general AI assistant.',
          }, ]]
          --[[ {
            provider = 'copilot',
            name = 'ChatCopilot',
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = 'gpt-4o', temperature = 1.1, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require('gp.defaults').chat_system_prompt,
          }, ]]
          --[[ {
            provider = 'copilot',
            name = 'CodeCopilot',
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = 'gpt-4o', temperature = 0.8, top_p = 1, n = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require('gp.defaults').code_system_prompt,
          }, ]]
          --[[ {
            provider = "anthropic",
            name = "ChatClaude-3-5-Sonnet",
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = "claude-3-5-sonnet-20240620", temperature = 0.8, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").chat_system_prompt,
          }, ]]
          --[[ {
            provider = "anthropic",
            name = "ChatClaude-3-Haiku",
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = "claude-3-haiku-20240307", temperature = 0.8, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").chat_system_prompt,
          }, ]]
          --[[ {
            provider = 'anthropic',
            name = 'CodeClaude-3-5-Sonnet',
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = 'claude-3-5-sonnet-20240620', temperature = 0.8, top_p = 1 },
            system_prompt = require('gp.defaults').code_system_prompt,
          }, ]]
          --[[ {
            provider = 'anthropic',
            name = 'CodeClaude-3-Haiku',
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = 'claude-3-haiku-20240307', temperature = 0.8, top_p = 1 },
            system_prompt = require('gp.defaults').code_system_prompt,
          }, ]]
        },

        -- directory for storing chat files
        -- chat_dir = vim.fn.stdpath('data'):gsub('/$', '') .. '/gp/chats',
        --
        -- chat user prompt prefix
        chat_user_prefix = '💬:',
        -- chat assistant prompt prefix (static string or a table {static, template})
        -- first string has to be static, second string can contain template {{agent}}
        -- just a static string is legacy and the [{{agent}}] element is added automatically
        -- if you really want just a static string, make it a table with one element { "🤖:" }
        --
        chat_assistant_prefix = { '🤖:', '[{{agent}}]' },
        -- The banner shown at the top of each chat file.
        -- chat_template = require('gp.defaults').chat_template,
        -- if you want more real estate in your chat files and don't need the helper text
        -- chat_template = require("gp.defaults").short_chat_template,
        -- chat topic generation prompt
        --
        -- chat_topic_gen_prompt = 'Summarize the topic of our conversation above' .. ' in two or three words. Respond only with those words.',
        -- chat topic model (string with model name or table with model name and parameters)
        -- explicitly confirm deletion of a chat file
        --
        -- chat_confirm_delete = true,
        -- conceal model parameters in chat
        --
        -- chat_conceal_model_params = true,
        -- local shortcuts bound to the chat buffer
        -- (be careful to choose something which will work across specified modes)
        --
        --[[ chat_shortcut_respond = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g><C-g>' },
        chat_shortcut_delete = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g>d' },
        chat_shortcut_stop = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g>s' },
        chat_shortcut_new = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g>c' }, ]]

        -- default search term when using :GpChatFinder
        -- chat_finder_pattern = 'topic ',
        -- if true, finished ChatResponder won't move the cursor to the end of the buffer
        -- chat_free_cursor = false,
        -- use prompt buftype for chats (:h prompt-buffer)
        -- chat_prompt_buf_type = false,
        -- how to display GpChatToggle or GpContext
        ---@type "popup" | "split" | "vsplit" | "tabnew"
        -- toggle_target = 'vsplit',
        -- styling for chatfinder
        ---@type "single" | "double" | "rounded" | "solid" | "shadow" | "none"
        -- style_chat_finder_border = 'single',
        -- margins are number of characters or lines
        --[[ style_chat_finder_margin_bottom = 8,
        style_chat_finder_margin_left = 1,
        style_chat_finder_margin_right = 2,
        style_chat_finder_margin_top = 2, ]]
        -- how wide should the preview be, number between 0.0 and 1.0
        -- style_chat_finder_preview_ratio = 0.5,

        -- styling for popup
        ---@type "single" | "double" | "rounded" | "solid" | "shadow" | "none"
        -- style_popup_border = 'single',
        -- margins are number of characters or lines
        --[[ style_popup_margin_bottom = 8,
        style_popup_margin_left = 1,
        style_popup_margin_right = 2,
        style_popup_margin_top = 2,
        style_popup_max_width = 160, ]]

        -- in case of visibility colisions with other plugins, you can increase/decrease zindex
        -- zindex = 49,

        -- command config and templates below are used by commands like GpRewrite, GpEnew, etc.
        -- command prompt prefix for asking user for input (supports {{agent}} template variable)
        -- command_prompt_prefix_template = '🤖 {{agent}} ~ ',
        -- auto select command response (easier chaining of commands)
        -- if false it also frees up the buffer cursor for further editing elsewhere
        -- command_auto_select_response = true,

        -- templates
        -- template_selection = 'I have the following from {{filename}}:' .. '\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}',
        --[[ template_rewrite = 'I have the following from {{filename}}:'
          .. '\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}'
          .. '\n\nRespond exclusively with the snippet that should replace the selection above.',
        template_append = 'I have the following from {{filename}}:'
          .. '\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}'
          .. '\n\nRespond exclusively with the snippet that should be appended after the selection above.',
        template_prepend = 'I have the following from {{filename}}:'
          .. '\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}'
          .. '\n\nRespond exclusively with the snippet that should be prepended before the selection above.', ]]
        -- template_command = '{{command}}',

        -- https://platform.openai.com/docs/guides/speech-to-text/quickstart
        -- Whisper costs $0.006 / minute (rounded to the nearest second)
        -- by eliminating silence and speeding up the tempo of the recording
        -- we can reduce the cost by 50% or more and get the results faster
        --[[
        whisper = {
          -- you can disable whisper completely by whisper = {disable = true}
          disable = false,

          -- OpenAI audio/transcriptions api endpoint to transcribe audio to text
          endpoint = 'https://api.openai.com/v1/audio/transcriptions',
          -- directory for storing whisper files
          store_dir = (os.getenv 'TMPDIR' or os.getenv 'TEMP' or '/tmp') .. '/gp_whisper',
          -- multiplier of RMS level dB for threshold used by sox to detect silence vs speech
          -- decibels are negative, the recording is normalized to -3dB =>
          -- increase this number to pick up more (weaker) sounds as possible speech
          -- decrease this number to pick up only louder sounds as possible speech
          -- you can disable silence trimming by setting this a very high number (like 1000.0)
          silence = '1.75',
          -- whisper tempo (1.0 is normal speed)
          tempo = '1.75',
          -- The language of the input audio, in ISO-639-1 format.
          language = 'en',
          -- command to use for recording can be nil (unset) for automatic selection
          -- string ("sox", "arecord", "ffmpeg") or table with command and arguments:
          -- sox is the most universal, but can have start/end cropping issues caused by latency
          -- arecord is linux only, but has no cropping issues and is faster
          -- ffmpeg in the default configuration is macos only, but can be used on any platform
          -- (see https://trac.ffmpeg.org/wiki/Capture/Desktop for more info)
          -- below is the default configuration for all three commands:
          -- whisper_rec_cmd = {"sox", "-c", "1", "--buffer", "32", "-d", "rec.wav", "trim", "0", "60:00"},
          -- whisper_rec_cmd = {"arecord", "-c", "1", "-f", "S16_LE", "-r", "48000", "-d", "3600", "rec.wav"},
          -- whisper_rec_cmd = {"ffmpeg", "-y", "-f", "avfoundation", "-i", ":0", "-t", "3600", "rec.wav"},
          rec_cmd = nil,
        }, ]]

        --[[ -- image generation settings
        image = {
          -- you can disable image generation logic completely by image = {disable = true}
          disable = false,

          -- openai api key (string or table with command and arguments)
          -- secret = { "cat", "path_to/openai_api_key" },
          -- secret = { "bw", "get", "password", "OPENAI_API_KEY" },
          -- secret =  "sk-...",
          -- secret = os.getenv("env_name.."),
          -- if missing openai_api_key is used
          secret = os.getenv 'OPENAI_API_KEY',

          -- image prompt prefix for asking user for input (supports {{agent}} template variable)
          prompt_prefix_template = '🖌️ {{agent}} ~ ',
          -- image prompt prefix for asking location to save the image
          prompt_save = '🖌️💾 ~ ',
          -- default folder for saving images
          store_dir = (os.getenv 'TMPDIR' or os.getenv 'TEMP' or '/tmp') .. '/gp_images',
          -- default image agents (model + settings)
          -- to remove some default agent completely set it like:
          -- image.agents = {  { name = "DALL-E-3-1024x1792-vivid", disable = true, }, ... },
          agents = {
            {
              name = 'ExampleDisabledAgent',
              disable = true,
            },
            {
              name = 'DALL-E-3-1024x1024-vivid',
              model = 'dall-e-3',
              quality = 'standard',
              style = 'vivid',
              size = '1024x1024',
            },
            {
              name = 'DALL-E-3-1792x1024-vivid',
              model = 'dall-e-3',
              quality = 'standard',
              style = 'vivid',
              size = '1792x1024',
            },
            {
              name = 'DALL-E-3-1024x1792-vivid',
              model = 'dall-e-3',
              quality = 'standard',
              style = 'vivid',
              size = '1024x1792',
            },
            {
              name = 'DALL-E-3-1024x1024-natural',
              model = 'dall-e-3',
              quality = 'standard',
              style = 'natural',
              size = '1024x1024',
            },
            {
              name = 'DALL-E-3-1792x1024-natural',
              model = 'dall-e-3',
              quality = 'standard',
              style = 'natural',
              size = '1792x1024',
            },
            {
              name = 'DALL-E-3-1024x1792-natural',
              model = 'dall-e-3',
              quality = 'standard',
              style = 'natural',
              size = '1024x1792',
            },
            {
              name = 'DALL-E-3-1024x1024-vivid-hd',
              model = 'dall-e-3',
              quality = 'hd',
              style = 'vivid',
              size = '1024x1024',
            },
            {
              name = 'DALL-E-3-1792x1024-vivid-hd',
              model = 'dall-e-3',
              quality = 'hd',
              style = 'vivid',
              size = '1792x1024',
            },
            {
              name = 'DALL-E-3-1024x1792-vivid-hd',
              model = 'dall-e-3',
              quality = 'hd',
              style = 'vivid',
              size = '1024x1792',
            },
            {
              name = 'DALL-E-3-1024x1024-natural-hd',
              model = 'dall-e-3',
              quality = 'hd',
              style = 'natural',
              size = '1024x1024',
            },
            {
              name = 'DALL-E-3-1792x1024-natural-hd',
              model = 'dall-e-3',
              quality = 'hd',
              style = 'natural',
              size = '1792x1024',
            },
            {
              name = 'DALL-E-3-1024x1792-natural-hd',
              model = 'dall-e-3',
              quality = 'hd',
              style = 'natural',
              size = '1024x1792',
            },
          },
        }, ]]

        --[[ -- example hook functions (see Extend functionality section in the README)
        hooks = {
          -- GpInspectPlugin provides a detailed inspection of the plugin state
          InspectPlugin = function(plugin, params)
            local bufnr = vim.api.nvim_create_buf(false, true)
            local copy = vim.deepcopy(plugin)
            local key = copy.config.openai_api_key or ''
            copy.config.openai_api_key = key:sub(1, 3) .. string.rep('*', #key - 6) .. key:sub(-3)
            local plugin_info = string.format('Plugin structure:\n%s', vim.inspect(copy))
            local params_info = string.format('Command params:\n%s', vim.inspect(params))
            local lines = vim.split(plugin_info .. '\n' .. params_info, '\n')
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
            vim.api.nvim_win_set_buf(0, bufnr)
          end,

          -- GpInspectLog for checking the log file
          InspectLog = function(plugin, params)
            local log_file = plugin.config.log_file
            local buffer = plugin.helpers.get_buffer(log_file)
            if not buffer then
              vim.cmd('e ' .. log_file)
            else
              vim.cmd('buffer ' .. buffer)
            end
          end,

          -- GpImplement rewrites the provided selection/range based on comments in it
          Implement = function(gp, params)
            local template = 'Having following from {{filename}}:\n\n'
              .. '```{{filetype}}\n{{selection}}\n```\n\n'
              .. 'Please rewrite this according to the contained instructions.'
              .. '\n\nRespond exclusively with the snippet that should replace the selection above.'

            local agent = gp.get_command_agent()
            gp.logger.info('Implementing selection with agent: ' .. agent.name)

            gp.Prompt(
              params,
              gp.Target.rewrite,
              agent,
              template,
              nil, -- command will run directly without any prompting for user input
              nil -- no predefined instructions (e.g. speech-to-text from Whisper)
            )
          end,

          -- your own functions can go here, see README for more examples like
          -- :GpExplain, :GpUnitTests.., :GpTranslator etc.

          -- -- example of making :%GpChatNew a dedicated command which
          -- -- opens new chat with the entire current buffer as a context
          -- BufferChatNew = function(gp, _)
          -- 	-- call GpChatNew command in range mode on whole buffer
          -- 	vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
          -- end,

          -- -- example of adding command which opens new chat dedicated for translation
          -- Translator = function(gp, params)
          -- 	local chat_system_prompt = "You are a Translator, please translate between English and Chinese."
          -- 	gp.cmd.ChatNew(params, chat_system_prompt)
          --
          -- 	-- -- you can also create a chat with a specific fixed agent like this:
          -- 	-- local agent = gp.get_chat_agent("ChatGPT4o")
          -- 	-- gp.cmd.ChatNew(params, chat_system_prompt, agent)
          -- end,

          -- -- example of adding command which writes unit tests for the selected code
          -- UnitTests = function(gp, params)
          -- 	local template = "I have the following code from {{filename}}:\n\n"
          -- 		.. "```{{filetype}}\n{{selection}}\n```\n\n"
          -- 		.. "Please respond by writing table driven unit tests for the code above."
          -- 	local agent = gp.get_command_agent()
          -- 	gp.Prompt(params, gp.Target.enew, agent, template)
          -- end,

          -- -- example of adding command which explains the selected code
          -- Explain = function(gp, params)
          -- 	local template = "I have the following code from {{filename}}:\n\n"
          -- 		.. "```{{filetype}}\n{{selection}}\n```\n\n"
          -- 		.. "Please respond by explaining the code above."
          -- 	local agent = gp.get_chat_agent()
          -- 	gp.Prompt(params, gp.Target.popup, agent, template)
          -- end,
        }, ]]
      }

      require('gp').setup(conf)

      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
      require('which-key').add {
        -- VISUAL mode mappings
        -- s, x, v modes are handled the same way by which_key
        {
          mode = { 'v' },
          nowait = true,
          remap = false,
          { '<C-g><C-t>', ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = 'ChatNew tabnew' },
          { '<C-g><C-v>', ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = 'ChatNew vsplit' },
          { '<C-g><C-x>', ":<C-u>'<,'>GpChatNew split<cr>", desc = 'ChatNew split' },
          { '<C-g>a', ":<C-u>'<,'>GpAppend<cr>", desc = 'Visual Append (after)' },
          { '<C-g>b', ":<C-u>'<,'>GpPrepend<cr>", desc = 'Visual Prepend (before)' },
          { '<C-g>c', ":<C-u>'<,'>GpChatNew<cr>", desc = 'Visual Chat New' },
          { '<C-g>g', group = 'generate into new ..' },
          { '<C-g>ge', ":<C-u>'<,'>GpEnew<cr>", desc = 'Visual GpEnew' },
          { '<C-g>gn', ":<C-u>'<,'>GpNew<cr>", desc = 'Visual GpNew' },
          { '<C-g>gp', ":<C-u>'<,'>GpPopup<cr>", desc = 'Visual Popup' },
          { '<C-g>gt', ":<C-u>'<,'>GpTabnew<cr>", desc = 'Visual GpTabnew' },
          { '<C-g>gv', ":<C-u>'<,'>GpVnew<cr>", desc = 'Visual GpVnew' },
          { '<C-g>i', ":<C-u>'<,'>GpImplement<cr>", desc = 'Implement selection' },
          { '<C-g>n', '<cmd>GpNextAgent<cr>', desc = 'Next Agent' },
          { '<C-g>p', ":<C-u>'<,'>GpChatPaste<cr>", desc = 'Visual Chat Paste' },
          { '<C-g>r', ":<C-u>'<,'>GpRewrite<cr>", desc = 'Visual Rewrite' },
          { '<C-g>s', '<cmd>GpStop<cr>', desc = 'GpStop' },
          { '<C-g>t', ":<C-u>'<,'>GpChatToggle<cr>", desc = 'Visual Toggle Chat' },
          { '<C-g>w', group = 'Whisper' },
          { '<C-g>wa', ":<C-u>'<,'>GpWhisperAppend<cr>", desc = 'Whisper Append' },
          { '<C-g>wb', ":<C-u>'<,'>GpWhisperPrepend<cr>", desc = 'Whisper Prepend' },
          { '<C-g>we', ":<C-u>'<,'>GpWhisperEnew<cr>", desc = 'Whisper Enew' },
          { '<C-g>wn', ":<C-u>'<,'>GpWhisperNew<cr>", desc = 'Whisper New' },
          { '<C-g>wp', ":<C-u>'<,'>GpWhisperPopup<cr>", desc = 'Whisper Popup' },
          { '<C-g>wr', ":<C-u>'<,'>GpWhisperRewrite<cr>", desc = 'Whisper Rewrite' },
          { '<C-g>wt', ":<C-u>'<,'>GpWhisperTabnew<cr>", desc = 'Whisper Tabnew' },
          { '<C-g>wv', ":<C-u>'<,'>GpWhisperVnew<cr>", desc = 'Whisper Vnew' },
          { '<C-g>ww', ":<C-u>'<,'>GpWhisper<cr>", desc = 'Whisper' },
          { '<C-g>x', ":<C-u>'<,'>GpContext<cr>", desc = 'Visual GpContext' },
        },

        -- NORMAL mode mappings
        {
          mode = { 'n' },
          nowait = true,
          remap = false,
          { '<C-g><C-t>', '<cmd>GpChatNew tabnew<cr>', desc = 'New Chat tabnew' },
          { '<C-g><C-v>', '<cmd>GpChatNew vsplit<cr>', desc = 'New Chat vsplit' },
          { '<C-g><C-x>', '<cmd>GpChatNew split<cr>', desc = 'New Chat split' },
          { '<C-g>a', '<cmd>GpAppend<cr>', desc = 'Append (after)' },
          { '<C-g>b', '<cmd>GpPrepend<cr>', desc = 'Prepend (before)' },
          { '<C-g>c', '<cmd>GpChatNew<cr>', desc = 'New Chat' },
          { '<C-g>f', '<cmd>GpChatFinder<cr>', desc = 'Chat Finder' },
          { '<C-g>g', group = 'generate into new ..' },
          { '<C-g>ge', '<cmd>GpEnew<cr>', desc = 'GpEnew' },
          { '<C-g>gn', '<cmd>GpNew<cr>', desc = 'GpNew' },
          { '<C-g>gp', '<cmd>GpPopup<cr>', desc = 'Popup' },
          { '<C-g>gt', '<cmd>GpTabnew<cr>', desc = 'GpTabnew' },
          { '<C-g>gv', '<cmd>GpVnew<cr>', desc = 'GpVnew' },
          { '<C-g>n', '<cmd>GpNextAgent<cr>', desc = 'Next Agent' },
          { '<C-g>r', '<cmd>GpRewrite<cr>', desc = 'Inline Rewrite' },
          { '<C-g>s', '<cmd>GpStop<cr>', desc = 'GpStop' },
          { '<C-g>t', '<cmd>GpChatToggle<cr>', desc = 'Toggle Chat' },
          { '<C-g>w', group = 'Whisper' },
          { '<C-g>wa', '<cmd>GpWhisperAppend<cr>', desc = 'Whisper Append (after)' },
          { '<C-g>wb', '<cmd>GpWhisperPrepend<cr>', desc = 'Whisper Prepend (before)' },
          { '<C-g>we', '<cmd>GpWhisperEnew<cr>', desc = 'Whisper Enew' },
          { '<C-g>wn', '<cmd>GpWhisperNew<cr>', desc = 'Whisper New' },
          { '<C-g>wp', '<cmd>GpWhisperPopup<cr>', desc = 'Whisper Popup' },
          { '<C-g>wr', '<cmd>GpWhisperRewrite<cr>', desc = 'Whisper Inline Rewrite' },
          { '<C-g>wt', '<cmd>GpWhisperTabnew<cr>', desc = 'Whisper Tabnew' },
          { '<C-g>wv', '<cmd>GpWhisperVnew<cr>', desc = 'Whisper Vnew' },
          { '<C-g>ww', '<cmd>GpWhisper<cr>', desc = 'Whisper' },
          { '<C-g>x', '<cmd>GpContext<cr>', desc = 'Toggle GpContext' },
        },

        -- INSERT mode mappings
        {
          mode = { 'i' },
          nowait = true,
          remap = false,
          { '<C-g><C-t>', '<cmd>GpChatNew tabnew<cr>', desc = 'New Chat tabnew' },
          { '<C-g><C-v>', '<cmd>GpChatNew vsplit<cr>', desc = 'New Chat vsplit' },
          { '<C-g><C-x>', '<cmd>GpChatNew split<cr>', desc = 'New Chat split' },
          { '<C-g>a', '<cmd>GpAppend<cr>', desc = 'Append (after)' },
          { '<C-g>b', '<cmd>GpPrepend<cr>', desc = 'Prepend (before)' },
          { '<C-g>c', '<cmd>GpChatNew<cr>', desc = 'New Chat' },
          { '<C-g>f', '<cmd>GpChatFinder<cr>', desc = 'Chat Finder' },
          { '<C-g>g', group = 'generate into new ..' },
          { '<C-g>ge', '<cmd>GpEnew<cr>', desc = 'GpEnew' },
          { '<C-g>gn', '<cmd>GpNew<cr>', desc = 'GpNew' },
          { '<C-g>gp', '<cmd>GpPopup<cr>', desc = 'Popup' },
          { '<C-g>gt', '<cmd>GpTabnew<cr>', desc = 'GpTabnew' },
          { '<C-g>gv', '<cmd>GpVnew<cr>', desc = 'GpVnew' },
          { '<C-g>n', '<cmd>GpNextAgent<cr>', desc = 'Next Agent' },
          { '<C-g>r', '<cmd>GpRewrite<cr>', desc = 'Inline Rewrite' },
          { '<C-g>s', '<cmd>GpStop<cr>', desc = 'GpStop' },
          { '<C-g>t', '<cmd>GpChatToggle<cr>', desc = 'Toggle Chat' },
          { '<C-g>w', group = 'Whisper' },
          { '<C-g>wa', '<cmd>GpWhisperAppend<cr>', desc = 'Whisper Append (after)' },
          { '<C-g>wb', '<cmd>GpWhisperPrepend<cr>', desc = 'Whisper Prepend (before)' },
          { '<C-g>we', '<cmd>GpWhisperEnew<cr>', desc = 'Whisper Enew' },
          { '<C-g>wn', '<cmd>GpWhisperNew<cr>', desc = 'Whisper New' },
          { '<C-g>wp', '<cmd>GpWhisperPopup<cr>', desc = 'Whisper Popup' },
          { '<C-g>wr', '<cmd>GpWhisperRewrite<cr>', desc = 'Whisper Inline Rewrite' },
          { '<C-g>wt', '<cmd>GpWhisperTabnew<cr>', desc = 'Whisper Tabnew' },
          { '<C-g>wv', '<cmd>GpWhisperVnew<cr>', desc = 'Whisper Vnew' },
          { '<C-g>ww', '<cmd>GpWhisper<cr>', desc = 'Whisper' },
          { '<C-g>x', '<cmd>GpContext<cr>', desc = 'Toggle GpContext' },
        },
      }
    end,
  }





}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
