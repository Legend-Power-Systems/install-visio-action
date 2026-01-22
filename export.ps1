$input_rel  = ".\drawing.vsdx"
$input = (Resolve-Path $input_rel).Path
$output = (Resolve-Path ".").Path + "\drawing.pdf"

$visio = New-Object -ComObject Visio.Application
$visio.Visible = $false

$doc = $visio.Documents.Open($input)
$doc.ExportAsFixedFormat(
    1,
    $output,
    1,
    0
)

# When tested inside Windows Sandbox, the Visio process gets hung up
# by an error dialog that cannot be dissmissed. Forcefully terminate
# the application after exporting so we don't keep a lock on the file.
Stop-Process -Name "visio"
# $doc.Close()
# $visio.Quit()