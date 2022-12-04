# PowerShell
#------------------------------------------------
# 进入容器的交互终端
# bin/terminal.ps1 [-s ${SHELL}]
#------------------------------------------------

param(
    [string]$s="bash"
)

$SHELL = "zsh"
if(![String]::IsNullOrEmpty($s)) {
    $SHELL = $s
}


$CONTAINER_NAME = "SYS_FOR_TEST"
$CONTAINER_ID = (docker ps -aq --filter name="$CONTAINER_NAME")
if([String]::IsNullOrEmpty($CONTAINER_ID)) {
    Write-Host "[$CONTAINER_NAME] is not running ..."

} else {
    docker exec -it -u root $CONTAINER_ID $SHELL
}
