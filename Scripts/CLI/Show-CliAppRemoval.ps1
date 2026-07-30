# Shows the CLI app removal menu and prompts the user to select which apps to remove.
function Show-CliAppRemoval {
    Write-CliHeader "App Removal"

    Write-Output "> 正在打开应用选择界面..."

    $result = Show-AppSelectionWindow

    if ($result -eq $true) {
        Write-Output "已选择 $($script:SelectedApps.Count) 个应用进行移除"
        Add-Parameter 'RemoveApps'
        Add-Parameter 'Apps' ($script:SelectedApps -join ',')

        Save-Settings

        # Suppress prompt if Silent parameter was passed
        if (-not $Silent) {
            Write-Output ""
            Write-Output ""
            Write-Output "按 Enter 键移除所选应用，或按 CTRL+C 退出..."
            Read-Host | Out-Null
            Write-CliHeader "App Removal"
        }
    }
    else {
        Write-Host "选择已取消，未移除任何应用" -ForegroundColor Red
        Write-Output ""
    }
}