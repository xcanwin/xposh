# xposh

<br>

## 项目简介

- 兼容万物的oh-my-posh主题

<br>

## 优点

- 科学的展示
- 美观的色调
- 顺手修复官方BUG
- 兼容这些系统：Windows、MasOS、LinuxMint、Ubuntu
- 兼容这些终端：Windows Terminal、CMD、Powershell、MSYS、iTerm、Termius、GNOME、VS Code、Tilix、MacOS Terminal
- 兼容这些命令处理器：Powershell、bash、zsh
- 兼容以上所有系统、终端、命令处理器的各种混搭
- 兼容powershell5和powershell7的语法，共用一个powershell脚本，方便统一维护和二开
- 兼容bash和zsh的语法，共用一个linux shell脚本，方便统一维护和二开
- powershell和linux shell编码逻辑尽量一致，方便统一维护和二开
- omp主题和omp.minimal主题结构一致，方便统一维护和二开
- 非常适合强迫症患者维护和二开

<br>

## 效果图

| 系统 | 终端 | 命令处理器 | 展示 |
| --- | --- | --- | --- |
| Windows | Windows Terminal | Powershell | <img src="./assets/Windows-Windows Terminal-Powershell.png" width="750"> |
| Windows | Powershell | Powershell | <img src="./assets/Windows-Powershell.png" width="750"> |
| Windows | CMD | Powershell | <img src="./assets/Windows-CMD-Powershell.png" width="750"> |
| Windows | MSYS | bash | <img src="./assets/Windows-MSYS-bash.png" width="750"> |
| Windows | Windows Terminal + MSYS | bash | <img src="./assets/Windows-Windows Terminal-MSYS-bash.png" width="750"> |
| Windows | wsl + Ubuntu + Tilix | bash | <img src="./assets/Windows-wsl-Ubuntu-Tilix-bash.png" width="750"> |
| Windows | Windows Terminal + Ubuntu | bash | <img src="./assets/Windows-Windows Terminal-Ubuntu-bash.png" width="750"> |
| MacOS | iTerm | zsh | <img src="./assets/MacOS-iTerm-zsh.png" width="750"> |
| MacOS | Termius | zsh | <img src="./assets/MacOS-Termius-zsh.png" width="750"> |
| MacOS | VS Code | zsh | <img src="./assets/MacOS-VS Code-zsh.png" width="750"> |
| LinuxMint | GNOME | bash | <img src="./assets/LinuxMint-GNOME-bash.png" width="750"> |

<br>

## 安装方法

### 安装字体
1. 所有系统都必须安装新字体
2. 访问链接 ```https://github.com/ryanoasis/nerd-fonts/releases/``` 下载 ```FiraCode.zip```
3. 解压并双击 ```Fira Code SemiBold Nerd Font Complete.ttf``` 即可安装成功
4. 下面的步骤根据自身情况部署

### Windows + Powershell
1. 从 ```https://github.com/JanDeDobbeleer/oh-my-posh/releases``` 下载 ```posh-windows-amd64.exe``` 和 ```themes.zip```
2. 把主程序 ```posh-windows-amd64.exe``` 改名为 ```oh-my-posh.exe``` 并保存在目录 ```C:\oh-my-posh\```
3. 把官方主题文件 ```themes.zip``` 解压在目录 ```C:\oh-my-posh\themes\```
4. 把本项目中的主题文件 ```xposh.omp.json``` 和 ```xposh.minimal.omp.json``` 保存在目录 ```C:\oh-my-posh\themes\```
5. 复制 ```Microsoft.PowerShell_profile.ps1``` 里的内容
6. 以管理员权限打开 ```powershell``` 窗口
7. 执行powershell命令 ```notepad $PROFILE```，在弹出的编辑器中的最底下粘贴刚刚复制的内容，保存，关闭编辑器
8. 执行powershell命令 ```[Environment]::SetEnvironmentVariable('POSH_PATH', 'C:\oh-my-posh\' , 'Machine')```
9. 关闭```powershell``` 窗口，新建 ```powershell``` 窗口，即可生效

### Windows + Windows Terminal
1. 先完成上述 ```Windows + Powershell``` 步骤
2. 打开 ```Windows Terminal```，点击顶部设置
3. 配置文件，```默认值```，外观，字体，选择 ```FiraCode Nerd Font```
4. 配置文件，```Powershell```，外观，字体，选择 ```FiraCode Nerd Font```
5. 配置文件，```Powershell```，命令行，把 ```-noprofile``` 删掉，保存
6. 关闭 ```Windows Terminal``` 窗口，新建 ```Windows Terminal``` 窗口，即可生效

### MacOS + MacOS Terminal
1. 从 ```https://github.com/JanDeDobbeleer/oh-my-posh/releases``` 下载 ```posh-darwin-amd64``` 和 ```themes.zip```
2. 把主程序 ```posh-darwin-amd64``` 改名为 ```oh-my-posh``` 并保存在目录 ```/usr/local/bin/```，或者通过brew安装 ```brew install oh-my-posh```
3. 把官方主题文件 ```themes.zip``` 解压在目录 ```/usr/local/opt/oh-my-posh/themes/```
4. 把本项目中的主题文件 ```xposh.omp.json``` 和 ```xposh.minimal.omp.json``` 保存在目录 ```/usr/local/opt/oh-my-posh/themes/```
5. 复制 ```.bashrc``` 里的内容
6. 打开 ```MacOS Terminal``` 窗口
7. 如果当前命令处理器是bash则执行bash命令 ```vi ~/.bash_profile```，如果当前命令处理器是zsh则执行zsh命令 ```vi ~/.zshrc```，在弹出的编辑器中的最底下粘贴刚刚复制的内容，保存，关闭编辑器
9. 关闭 ```MacOS Terminal``` 窗口，新建 ```MacOS Terminal``` 窗口，即可生效

### MacOS + iTerm
1. 先完成上述 ```MacOS + MacOS Terminal``` 步骤
2. 打开 ```iTerm```，点击顶部iTerm2，Preferences
3. Profiles，Text，Font，选择 ```FiraCode Nerd Font```
4. 关闭 ```iTerm``` 窗口，新建 ```iTerm``` 窗口，即可生效

### Linux
1. 从 ```https://github.com/JanDeDobbeleer/oh-my-posh/releases``` 下载 ```posh-linux-amd64``` 和 ```themes.zip```
2. 其他步骤类似 ```MacOS + MacOS Terminal``` 步骤

### VS Code
1. 打开 ```VS Code```，设置
2. 搜索 ```terminal.integrated.fontFamily```
3. 粘贴 ```FiraCode Nerd Font```，回车，即可生效
