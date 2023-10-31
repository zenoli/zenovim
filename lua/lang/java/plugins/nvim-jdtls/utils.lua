local M = {
    -- See:
    -- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    execution_environment = {
        J2SE_1_5 = "J2SE-1.5",
        JavaSE_1_6 = "JavaSE-1.6",
        JavaSE_1_7 = "JavaSE-1.7",
        JavaSE_1_8 = "JavaSE-1.8",
        JavaSE_9 = "JavaSE-9",
        JavaSE_10 = "JavaSE-10",
        JavaSE_11 = "JavaSE-11",
        JavaSE_12 = "JavaSE-12",
        JavaSE_13 = "JavaSE-13",
        JavaSE_14 = "JavaSE-14",
        JavaSE_15 = "JavaSE-15",
        JavaSE_16 = "JavaSE-16",
        JavaSE_17 = "JavaSE-17",
        JavaSE_18 = "JavaSE-18",
        JAVASE_19 = "JavaSE-19",
    },
}

function M.get_root_dir()
    local fname = vim.api.nvim_buf_get_name(0)
    return require("lspconfig.server_configurations.jdtls").default_config.root_dir(fname)
end

function M.get_project_name()
    local root_dir = M.get_root_dir()
    return root_dir and vim.fs.basename(root_dir)
end

function M.get_jdtls_config_dir()
    local project_name = M.get_project_name()
    return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
end

function M.get_jdtls_workspace_dir()
    local project_name = M.get_project_name()
    return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
end

function M.get_cmd()
    return {
        "jdtls",
        "-configuration",
        M.get_jdtls_config_dir(),
        "-data",
        M.get_jdtls_workspace_dir(),
        "--jvm-arg=" .. string.format(
            "-javaagent:%s",
            require("plugins.mason.utils").mason_package_path() .. "/jdtls/lombok.jar"
        ),
    }
end

function M.get_bundles()
    local mason_registry = require("mason-registry")
    local bundles = {}
    if mason_registry.is_installed("java-debug-adapter") then
        local java_dbg_pkg = mason_registry.get_package("java-debug-adapter")
        local java_dbg_path = java_dbg_pkg:get_install_path()
        local jar_patterns = {
            java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
        }

        if mason_registry.is_installed("java-test") then
            local java_test_pkg = mason_registry.get_package("java-test")
            local java_test_path = java_test_pkg:get_install_path()
            vim.list_extend(jar_patterns, {
                java_test_path .. "/extension/server/*.jar",
            })
        end
        for _, jar_pattern in ipairs(jar_patterns) do
            for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
                table.insert(bundles, bundle)
            end
        end
    end
    return bundles
end

return M
