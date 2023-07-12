# backup-logitech-ghub
This is a copy of Ginden's ghub backup script, thankfully it is still working.

https://github.com/Ginden/backup-logitech-ghub/tree/master

One addition I had to do to improve though:

I have read on reddit, that the local AND the roaming folder were necessary to backup, so I added it and also I prefer the ghub-backup folder inside my documents folder so I did that too.

# Requirements

I had to activate scripts on Windows:

- click data and open Powershell in Administrator mode
  - execute the following code

```ps
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

- afterwards you can execute the script:

```ps
./backup-ghub.ps1
```
