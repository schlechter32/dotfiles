local host = vim.loop.os_gethostname()
if not host:find("cobra1") then
	print(host)
	require("sidekick").setup({
		opts = { cli = { mux = { backend = "tmux" }, enabled = true } },
	})
	return
end
