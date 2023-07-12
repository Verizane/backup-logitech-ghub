# Settings
$file_name = "ghub-$(Get-Date -Format 'dd.MM.yyyy.hh.mm').backup.zip";
$ghub_local_settings_path = "$($env:LOCALAPPDATA)\LGHUB";
$ghub_roaming_settings_path = "$($env:APPDATA)\LGHUB";
$output_dir = "$($env:HOMEDRIVE)$($env:HOMEPATH)\Documents\ghub-backup\";
$output_dir_tmp = "$($output_dir)\tmp\";
$output_dir_tmp_local = "$($output_dir_tmp)\local\";
$output_dir_tmp_roaming = "$($output_dir_tmp)\roaming\";
$output_path = "$output_dir\$file_name";

# Change this to prefered time
$time_limit = (Get-Date).AddDays(-90);

# Creates directory
New-Item -ItemType Directory -Force -Path "$output_dir_tmp_local";

New-Item -ItemType Directory -Force -Path "$output_dir_tmp_roaming";

Copy-Item -Recurse -Path "$ghub_local_settings_path" -Destination "$output_dir_tmp_local";

Copy-Item -Recurse -Path "$ghub_roaming_settings_path" -Destination "$output_dir_tmp_roaming";

Compress-Archive -Path "$output_dir_tmp_local", "$output_dir_tmp_roaming" -DestinationPath "$output_path";

Get-Item $output_dir_tmp | Remove-Item -Force -Recurse;

# Source: https://stackoverflow.com/a/19326146/2446102
# Remove files older than $time_limit
Get-ChildItem -Path $output_path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $time_limit } | Remove-Item -Force;
