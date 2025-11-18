local host = vim.loop.os_gethostname()
if not host:find("cobra1") then
	print(host)
	return {}
end

return { src = "https://github.com/folke/sidekick.nvim" }
