local status_ok, overseer = pcall(require, 'overseer')
if not status_ok then
	return
end

overseer.setup({
	templates = { 'builtin', 'user.run_script' },
})
