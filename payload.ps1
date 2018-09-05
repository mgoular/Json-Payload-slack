################################################################################
################################################################################
## Script description                                                         ##
##                                                                            ##
## Name      : payload.ps1                                                    ##
## Version   : 0.1                                                            ##
## Date      :                                                                ##
## Language  : PowerShell cmd-lets                                            ##
## License   : MIT                                                            ##
## Owner     : M.G                                                            ##
## Authors   : M.G                                                            ##
################################################################################
################################################################################

$ad = Search-ADAccount -LockedOut
$result = Write-Output ("The total of users locked in our PROD domain is = "+$ad.Count)

Set-StrictMode -Version Latest

$payload = @{
	"channel" = "#inf-ad-channel"
	"icon_emoji" = ":robot_face:"
	"text" = "$result"
	"username" = "Mr. Robot"
}

Invoke-WebRequest `
	-Body (ConvertTo-Json -Compress -InputObject $payload) `
    -Method Post `
	-Uri "WEBHOOK HERE" | Out-Null
