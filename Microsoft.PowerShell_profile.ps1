function Get-Current-Terminal{
    if ($env:WSLENV -ne $null)
    {
        return "Windows Terminal";
    }
    if ($env:TERM_PROGRAM -eq 'vscode')
    {
        return "VS Code";
    }
    if ($env:MSYSTEM -ne $null)
    {
        return "MSYS";
    }
    if ($env:SESSIONNAME -eq 'Console')
    {
        if ($env:PROMPT -ne $null)
        {
            return "CMD";
        } else {
            return "PowerShell";
        }
    }
    return "Other";
}
$current_terminal = Get-Current-Terminal;
$xposh_terms = "Windows Terminal", "VS Code";
if ($xposh_terms -notcontains $current_terminal) {
    $xposh_min = ".minimal";
}
$env:ShellName = (Get-Process -pid $pid).Name;
$env:HiddenUserHost = 0;
$POSH_PATH = "$env:LOCALAPPDATA\Programs\oh-my-posh";
& "${POSH_PATH}\bin\oh-my-posh.exe" init pwsh --config "${POSH_PATH}\themes\xposh${xposh_min}.omp.json" | iex;
