vim.g.coq_settings = {
  auto_start = 'shut-up',
}

return {
  {
    "ms-jpq/coq_nvim",
    enabled = true,
    branch = 'coq',
    config = function()
      vim.g.coq_settings = {
        auto_start = true,
      }
    end
  }
}
