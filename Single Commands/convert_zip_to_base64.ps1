$SourceFile    = "C:\Pictures\n.zip"
$B64File       = "C:\n_as_B64.txt"
$Reconstituted = "C:\re_n.zip"

[IO.File]::WriteAllBytes($B64File,[char[]][Convert]::ToBase64String([IO.File]::ReadAllBytes($SourceFile)))

[IO.File]::WriteAllBytes($Reconstituted, [Convert]::FromBase64String([char[]][IO.File]::ReadAllBytes($B64File)))