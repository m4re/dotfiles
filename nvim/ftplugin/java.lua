local config = {
    cmd = { vim.fn.expand '~/.local/share/nvim/mason/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', '.idea' ,
        '.classpath', '.iml'}, { upward = true })[1]),
}
