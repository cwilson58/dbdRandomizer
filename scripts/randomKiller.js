//Cameron Wilson
document.getElementById("getBuild").addEventListener("submit", ajaxBuild, false);
//This is an ajax request to a php script that will pull all the items from a database, filter them based on the user and then display a build based on the returned json object
function ajaxBuild(e) {
  e.preventDefault();
  const form = document.getElementById("getBuild");
  filteredOut = ["The Mastermind"];
  //find all filtered out killers items then add them to the array. Going to have to determin if its a killr, perk, addon or offering.
  for (var i = 1; i < form.elements.length; i++) {
    if (!form.elements[i].checked) {
      filteredOut.push(form.elements[i].name);
    }
  }
  console.log(JSON.stringify(filteredOut)); //Temp console log to test for correctness, should be able to send with ?filters=filteredOut (?a=[1,2,3]) and json_decode
  const xhr = new XMLHttpRequest();
  xhr.open("GET", "scripts/randomKiller.php?filters=" + JSON.stringify(filteredOut), true);
  xhr.onload = function () {
    if (this.status == 200) {
      const theBuild = JSON.parse(this.responseText);
      document.getElementById("theKiller").innerHTML = theBuild[0];
      if (theBuild[1] != "No Addons available!") {
        document.getElementById("theAddons").innerHTML = theBuild[1];
        document.getElementById("theAddons2").innerHTML = theBuild[2];
      }
      document.getElementById("thePerks1").innerHTML = theBuild[3];
      document.getElementById("thePerks2").innerHTML = theBuild[4];
      document.getElementById("thePerks3").innerHTML = theBuild[5];
      document.getElementById("thePerks4").innerHTML = theBuild[6];
      document.getElementById("theOffering").innerHTML = theBuild[7];
    }
  };
  xhr.onerror = function () {
    console.log("xhr Error!");
  };
  //Validate before sending
  xhr.send();
}
