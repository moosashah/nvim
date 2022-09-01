local status_ok, rest = pcall(require, "rest-nvim")
if not status_ok then
	return
end

rest.setup({
	highlight = {
		enabled = true,
		timeout = 500,
	},
	result = {
		show_url = true,
		show_http_info = true,
		show_headers = true,
		formatters = {
			json = "jq",
			html = function(body)
				return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
			end,
		},
	},
	jump_to_request = false,
	env_file = ".env.rest",
})
