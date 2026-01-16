local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- existing snippet
    s("imp", {
        t("import "),
        i(1, "module"),
    }),

    -- new 'cuda' snippet
    s("cuda", {
        t({
            "import torch",
            "import torch.nn as nn",
            "import torch.optim as optim",
            "",
            "# Device setup",
            "device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')",
            "print('🔥 Using device:', device)",
            "if device.type == 'cuda':",
            "    print(f'  GPU: {torch.cuda.get_device_name(0)}')",
            "",
            "# Example model",
            "model = nn.Sequential(",
            "    nn.Linear(10, 50),",
            "    nn.ReLU(),",
            "    nn.Linear(50, 1)",
            ").to(device)",
            "",
            "# Example data",
            "x = torch.randn(100, 10, device=device)",
            "y = torch.randn(100, 1, device=device)",
            "",
            "criterion = nn.MSELoss()",
            "opt = optim.Adam(model.parameters(), lr=1e-3)",
            "",
            "for epoch in range(3):",
            "    opt.zero_grad()",
            "    loss = criterion(model(x), y)",
            "    loss.backward()",
            "    opt.step()",
            "    print(f'Epoch {epoch+1}, loss={loss.item():.4f}')",
            "",
            "print('Tensor device:', x.device)",
        }),
    }),
}
