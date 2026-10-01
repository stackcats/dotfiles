return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  config = function()
    local custom = require("stackcats.plugins.utils.lsp")

    local filename = vim.api.nvim_buf_get_name(0)

    local cargo_root = vim.fs.find({ "Cargo.toml" }, {
      upward = true,
      path = vim.fs.dirname(filename),
    })[1]

    local rust_analyzer = {
      notifications = {
        cargoTomlNotFound = false,
      },
      diagnostics = {
        disabled = { "unlinked-file" },
      },
      linkedProjects = {
        filename,
      },
    }

    if cargo_root then
      rust_analyzer = {
        cargo = {
          allFeatures = true,
        },
      }
    end

    vim.g.rustaceanvim = {
      server = {
        on_init = custom.on_init,
        on_attach = function(client, bufnr)
          custom.attach(client, bufnr)
          local format_sync_grp = vim.api.nvim_create_augroup("RustaceanFormat", {})

          -- format file
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
            group = format_sync_grp,
          })
        end,
        capabilities = custom.capabilities(),
        settings = {
          ["rust-analyzer"] = rust_analyzer,
        },
      },
    }
  end,
}
