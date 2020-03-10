function increaseValue(idr) {
  var numInc = $("#" + idr).val();
    numInc++;
    $("#" + idr).val(numInc);
}
  
function decreaseValue(idr) {
  var numInc = $("#" + idr).val();
    if(numInc > 0){
      numInc--;
      $("#" + idr).val(numInc);
  }
}