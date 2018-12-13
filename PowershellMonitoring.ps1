$powershells = (Get-WmiObject win32_process | where {$_.ProcessName -eq 'powershell.exe'});
$gotmshta = $null;

 foreach ($powershell in $powershells){
    #$powershellid = $powershell.ProcessId
   $Parentprocess = Get-CimInstance Win32_Process | where {$_.ProcessId -eq $powershell.ParentProcessId};

   if ($Parentprocess.ProcessName -eq 'mshta.exe')
   {
        $Parentprocess;
        $gotmshta = $true;

   }
}

if($gotmshta -eq $true)
{
    echo $gotmshta;
}
else
{
   echo $gotmshta;
   SCHTASKS /Run /TN "PowershellCheck" /I;
}


