$ad = Search-ADAccount -LockedOut
$result = Write-Output ("The total of users locked in our PROD domain is = "+$ad.Count)

Set-StrictMode -Version Latest

$payload = @{
	"channel" = "#inf-ad-oncall-inc"
	"icon_emoji" = ":robot_face:"
	"text" = "$result"
	"username" = "Mr. Robot"
}

Invoke-WebRequest `
	-Body (ConvertTo-Json -Compress -InputObject $payload) `
    -Method Post `
	-Uri "WEBHOOK HERE" | Out-Null
