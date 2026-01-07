# keepAwake

一个简单的 Windows 保持唤醒工具（基于 VBS）。

包含文件
- `keepAwake.vbs` — 主脚本，用于定时模拟按键以防止系统进入睡眠。
- 其他辅助脚本：`cscript`、`wscript`、`tasklist`（按需使用）。

使用方法
- 直接双击 `keepAwake.vbs` 运行。
- 或在 PowerShell/CMD 中运行：

```powershell
cscript keepAwake.vbs
# 或
wscript keepAwake.vbs
```

说明
- 默认每 60 秒模拟一次按键（ScrollLock），并在脚本内部根据时间决定何时退出。
- 如需修改行为，请编辑 `keepAwake.vbs` 中的时间或间隔参数。

许可
- 如需公开使用或贡献，建议添加 `LICENSE` 文件。
