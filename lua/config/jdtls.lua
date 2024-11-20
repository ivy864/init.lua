vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

        local config = {
            cmd = {
                -- 💀
                'java', -- or '/path/to/java17_or_newer/bin/java'
                        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

                '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                '-Dosgi.bundles.defaultStartLevel=4',
                '-Declipse.product=org.eclipse.jdt.ls.core.product',
                '-Dlog.protocol=true',
                '-Dlog.level=ALL',
                '-Xmx1g',
                '--add-modules=ALL-SYSTEM',
                '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

                -- 💀
                '-jar', vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar'),
                     -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
                     -- Must point to the                                                     Change this to
                     -- eclipse.jdt.ls installation                                           the actual version


                -- 💀
                '-configuration', vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls/config_linux'),
                --'/path/to/jdtls_install_location/config_SYSTEM',
                                -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                                -- Must point to the                      Change to one of `linux`, `win` or `mac`
                                -- eclipse.jdt.ls installation            Depending on your system.


                -- 💀
                -- See `data directory configuration` section in the README
                '-data', vim.fn.expand('~/.cache/jdtls/workspace') .. project_name
                --'/path/to/unique/per/project/workspace/folder'
            },

            --root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),
            --root_dir = vim.fs.expand('%:p:k'),
            root_dir = vim.fn.getcwd(),

            settings = {
                java = {}
            },
            init_options = {
                bundles = {}
            },
            capabilities = capabilities,
        }

        require("jdtls").start_or_attach(config)
        local on_attach = require("lsp")
        on_attach(_, 0)
    end,
})
