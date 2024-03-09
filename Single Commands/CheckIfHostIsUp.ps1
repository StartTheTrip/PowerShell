##Host Check
#LAN
$hosts="192.168.0.1"
	if(Test-connection $hosts -Count 1 -Quiet){
	$status='True'
	Write-Host $hosts is Alive -ForegroundColor Green
}else{
	$hosta='False'
	Write-Host $hosts is Down -ForegroundColor Red
}
