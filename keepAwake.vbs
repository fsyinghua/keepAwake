' 增强版防休眠脚本：包含错误处理，防止静默退出
On Error Resume Next ' 核心修复：遇到错误时继续执行下一句，而非退出[6](@ref)

Set WshShell = CreateObject("WScript.Shell")
If Err.Number <> 0 Then
    WshShell.Popup "错误：创建WScript.Shell对象失败。脚本无法继续。", 5, "致命错误", 16
    WScript.Quit
End If

' 设置工作结束提示时间（24小时制）
endHour = 18
endMinute = 5

' 记录启动信息
WshShell.LogEvent 0, "智能防休眠脚本已启动。计划在 " & endHour & ":" & endMinute & " 提示退出。"

Do
    ' 获取当前时间
    currentTime = Now()
    currentHour = Hour(currentTime)
    currentMinute = Minute(currentTime)

    ' 判断是否到达设定的结束时间（18:05）
    If currentHour >= endHour And currentMinute >= endMinute Then
        ' 到达18:05，弹出提示框并退出脚本
        WshShell.Popup "下班时间到！防休眠脚本已自动停止。", 10, "温馨提示", 64
        WshShell.LogEvent 0, "智能防休眠脚本已按计划退出。"
        WScript.Quit
    Else
        ' 在18:05之前，每分钟模拟一次按键[5](@ref)
        WshShell.SendKeys "{SCROLLLOCK}"
        WScript.Sleep 100 ' 短暂延迟，确保两次按键被识别
        WshShell.SendKeys "{SCROLLLOCK}" ' 再按一次取消

        ' 记录活动（可选，用于调试）
        ' WshShell.LogEvent 0, "脚本执行了一次防休眠操作。"

        WScript.Sleep 60000 ' 等待60秒
    End If

    ' 简单错误检查：如果之前有错误积累，则清除错误状态[6](@ref)
    If Err.Number <> 0 Then
        ' 可以在此处添加更详细的错误日志记录，例如写入文件
        Err.Clear ' 清除错误，避免循环出错
    End If
Loop