function Start-PSEXOnline {
    $pwsh_exch_online_module = "C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft Corporation\Microsoft Exchange Online Powershell Module.appref-ms"
    explorer.exe $pwsh_exch_online_module
    }
    
    
    function Add-CustomStaticRoute {
    # Grab OpenVPN tunnel interface index
    $ifIndex = (Get-NetAdapter | Where-Object {$_.InterfaceDescription -eq "TAP-Windows Adapter V9"}).ifIndex
    # Prompt for dest and hop
    $Dest = Read-Host -Prompt "What is the destination? eg. <x.x.x.x>/32"
    $Hop = Read-Host -Prompt "What is the gateway you want to route via? eg. <x.x.x.x>"
    
    New-NetRoute -DestinationPrefix $Dest -InterfaceIndex $ifIndex -NextHop $Hop
    
    }
    