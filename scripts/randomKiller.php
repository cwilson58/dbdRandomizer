<?php
    $db = new mysqli("127.0.0.1","webpage","Cr@te#24","dbdProj"); //REMOVE BEFORE PUTTING ON GITHUB
    if ($db->connect_error) {
        die ("Connection failed: " . $db->connect_error);
    }
    $theBuildArray = array();
    $killerFilterArray = json_decode($_GET["filters"]); //should get the filters from the db
    $q = "SELECT * FROM Killers ORDER BY RAND()"; //rand should be okay given that there are only 26 killers
    $r = $db->query($q);
    $selectedKiller;
    if($r->num_rows > 0) {
        $selectedKiller = $r->fetch_assoc();
        for($i = 0; $i < sizeof($killerFilterArray); $i++){
            if($r->num_rows > 0 && $selectedKiller["killerName"] == $killerFilterArray[$i]){ //if we have rows AND the killer is filtered out, get a new killer
                $selectedKiller = $r->fetch_assoc();
                $i = -1;
            } 
        }
        $theBuildArray[] = $selectedKiller["killerName"];
    } 
    else {
        $theBuildArray[] = "No killers available!";
    }
    $killerId = $selectedKiller["killer_id"];
    /*Addons (Killers all have their own)*/
    $qAddons = "SELECT * FROM KillerAddons WHERE killer_id = '$killerId' ORDER BY RAND()";
    $r = $db->query($qAddons);
    if($r->num_rows > 1) {
        $selectedAddon = $r->fetch_assoc();
        $theBuildArray[] = $selectedAddon["addonName"];
        $selectedAddon = $r->fetch_assoc();
        $theBuildArray[] = $selectedAddon["addonName"];
    } 
    else {
        $theBuildArray[] = "No Addons available!";
    }
    $qPerks = "SELECT * FROM KillerPerks ORDER BY RAND()";
    $r = $db->query($qPerks);
    if($r->num_rows > 3) {
        for($i = 0; $i < 4; $i++){
            $selectedPerk = $r->fetch_assoc();
            $theBuildArray[] = $selectedPerk["perkName"]; 
        }
    }
    $qOfferings = "SELECT * FROM Offerings ORDER BY RAND()";
    $r = $db->query($qOfferings);
    if($r->num_rows > 0) {
        $selectedOffering = $r->fetch_assoc();
        $theBuildArray[] = $selectedOffering["offeringName"];
    }
    echo json_encode($theBuildArray);
?>