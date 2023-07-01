
var reverseSpeed = false
var maxSpeed = 200.0
var currentSpeed = 0


function incrementNumbers(num) {
  num++;
  if (num > 3) {
    num = 0;
  }
  return num;
}


function increaseOrDecreaseSpeed(){
    if (!reverseSpeed)
        if (currentSpeed < 200){
            speedguageLeft.increaseSpeed(1); (speedguageLeft.speed <= 200) ? bottomBar.odometerDistance += 4 : bottomBar.odometerDistance += 0;
            currentSpeed = speedguageLeft.speed; //get speed from qml
        }
        else{
            reverseSpeed = true;
        }
    else
    {
        if (currentSpeed >= 1){ //console.log('i am decreasing speed');
            speedguageLeft.decreaseSpeed(); (speedguageLeft.speed === 0) ? bottomBar.odometerDistance += 0 : bottomBar.odometerDistance += 1;
            currentSpeed = speedguageLeft.speed;
        }
        else{
            reverseSpeed = false;
        }
    }
}

var maxCharge = 100.0
var currentCharge = 100.0
var decreaseBattery = true

function increaseOrDecreaseBattery(){
    if (decreaseBattery)
        if ((currentCharge <= 100) && (currentCharge > 1) ){
            //console.log('battery decrease triggered');
            battguage.decreaseCharge();
            currentCharge = battguage.batteryLevel
        }
        else{
            decreaseBattery = false;
            battguage.batteryState = 0
        }
    else{
        if (currentCharge < 100){
            //console.log('battery increase triggered');
            battguage.increaseCharge();
            currentCharge = battguage.batteryLevel
        }
        else{
            decreaseBattery = true;
            battguage.batteryState = 1
        }
    }
}



var counter = 0
function toggleIndicators() {
    counter++;
    //console.log ('Counter no is... ', counter)
  if (counter % 3 === 0) {tellTales.toggleVisibilityLeft()}
  else if (counter % 4 === 0){tellTales.toggleVisibilityRight()}
  else if (counter % 5 === 0){tellTales.toggleLowBeam()}
  else if (counter % 6 === 0){tellTales.toggleHighBeam()}
  else if (counter % 7 === 0){tellTales.toggleSeatBelt()}
  else if (counter % 8 === 0){tellTales.toggleLaneCenteringAssist()}
  else if (counter % 9 === 0){tellTales.togglelaneKeepingAssistance()}
  else if (counter % 10 === 0){tellTales.toggleSpeedLimiter()}
  else if (counter % 12 === 0){gear.currentDriveMode = (gear.currentDriveMode === 0) ? 1 : 0}
  else if (counter % 11 === 0){gear.currentGear = incrementNumbers(gear.currentGear)}
}


//function toggleTemperature() {
////{root.clusterMode = (root.clusterMode === 0) ? 1 : 0;};
//}



