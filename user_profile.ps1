#Prompt
Import-Module posh-git
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons

function Get-ScriptDirectory {Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) "fusunnn.omp.json"
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression


Set-PoshPrompt bubbles

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

#Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'



# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git


#which
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}



