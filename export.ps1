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


$doc.Close()
$visio.Quit()