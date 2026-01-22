$odt_link = "https://download.microsoft.com/download/6c1eeb25-cf8b-41d9-8d0d-cc1dbc032140/officedeploymenttool_19628-20046.exe"
$odt_exe = ".\odt.exe"
$odt_extract_path = "Visio365"
$setup_path = "$odt_extract_path\setup.exe"
$odt_xmls_path = "$odt_extract_path\*.xml"
$config_path = "config.xml"

echo "Downloading O365 Deployment Tool"

Invoke-WebRequest -Uri $odt_link -OutFile $odt_exe

echo "Extracting setup"
& $odt_exe /quiet /extract:$odt_extract_path

# Seems necessary for the cleanup to work?
sleep 1

echo "Cleaning up default ODT configs"
Remove-Item -Path $odt_xmls_path -Force

echo "Downloading install files"
& $setup_path /download $config_path

echo "Running installer"
& $setup_path /configure $config_path

