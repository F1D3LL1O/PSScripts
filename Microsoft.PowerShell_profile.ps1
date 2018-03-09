function signiere ($filename) {
  $cert = @(Get-ChildItem cert:\currentuser\my -codesigning)[0]
Set-AuthenticodeSignature $filename $cert
}
