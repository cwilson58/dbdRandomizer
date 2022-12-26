<?php
    $config = parse_ini_file("../websiteConfigFiles/dbd.ini");
    $db = new mysqli("127.0.0.1",$config["username"],$config["password"],$config["database"]);
    if ($db->connect_error) {
        die ("Connection failed: " . $db->connect_error);
    }
    $qAllKillers = "SELECT killerName, killer_id FROM Killers";
    $allKillers = $db->query($qAllKillers);
    $qAllPerks = "SELECT perkName, kPerk_id FROM KillerPerks";
    $allPerks = $db->query($qAllPerks);
    $qAllOfferings = "SELECT o_id, offeringName FROM Offerings";
    $allOfferings = $db->query($qAllOfferings);
    $qAllAddons = "SELECT add_id,B.killer_id,killerName,addonName FROM KillerAddons as A,Killers as B WHERE A.killer_id = B.killer_id order by B.killer_id";
    $allAddons = $db->query($qAllAddons);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/dbdRandomBuild.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <title>Random Killer Build</title>
</head>
<body>
    <div class="container" >
        <nav>
            <ul class="nav justify-content-center nav-pills mt-1">
                <li class="nav-item">
                    <label for="getBuildSubmit" class="nav-link"> Generate Build </label>
                </li>
                <li class="nav-item">
                    <button class="nav-link"> Flip Cards</button>
                </li>
            </ul>
        </nav>
    </div>
    <!-- Filters Hidden in Menu -->
    <div class="container-fluid">
        <div class="navbar">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                <label>Filters</label>
            </button>
        </div>
        <div class="collapse" id="navbarToggleExternalContent">
            <form id = "getBuild" method="get">
                <input type="submit" id="getBuildSubmit" style="visibility: hidden;">
                <!-- Filters Generated From DB -->
                <div class="row">
                    <div class="col">
                        <h6>Killers</h6>
                        <?php
                        while($row = $allKillers->fetch_assoc()){ 
                        ?>
                        <div>
                            <input type="checkbox" checked name="<?php echo $row['killerName']; ?>" id="<?php echo $row['killerName']; ?>" value="<?php echo $row['killer_id']; ?>">
                            <label for="<?php echo $row['killerName']; ?>"><?php echo $row['killerName']; ?></label>
                        </div>
                        <?php } ?>
                    </div>
                    <div class="col">
                        <h6>Perks</h6>
                        <?php while($row = $allPerks->fetch_assoc()){ ?>
                        <div>
                            <input type="checkbox" checked name="<?php echo $row['perkName']; ?>" id="<?php echo $row['perkName']; ?>" value="<?php echo $row['kPerk_id']; ?>">
                            <label for="<?php echo $row['perkName']; ?>"><?php echo $row['perkName']; ?></label>
                        </div>
                        <?php } ?>
                    </div>
                    <div class="col">
                        <h6>Addons</h6>
                        <!-- TODO this needs to be refactored in the view so it looks cleaner -->
                        <?php
                        $killerName = ""; 
                        while($row = $allAddons->fetch_assoc()){
                            if($killerName != $row["killerName"]){
                            $killerName = $row["killerName"];
                            ?> 
                                <h6><?php echo $killerName ?></h6>
                            <?php 
                            }
                            ?>
                        <div>
                            <input type="checkbox" checked name="<?php echo $row['addonName']; ?>" id="<?php echo $row['addonName']; ?>" value="<?php echo $row['add_id']; ?>">
                            <label for="<?php echo $row['addonName']; ?>"><?php echo $row['addonName']; ?></label>
                        </div>
                        <?php } ?>
                    </div>
                    <div class="col">
                        <h6>Offerings</h6>
                        <?php while($row = $allOfferings->fetch_assoc()){ ?>
                        <div>
                            <input type="checkbox" checked name="<?php echo $row['offeringName']; ?>" id="<?php echo $row['offeringName']; ?>" value="<?php echo $row['o_id']; ?>">
                            <label for="<?php echo $row['offeringName']; ?>"><?php echo $row['offeringName']; ?></label>
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="container">
        <div class="row pt-2" id="killerRow">
            <div class="card mx-2" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Killer</h5>
                    <p id="theKiller" class="card-text"></p>
                </div>
            </div>
            <div class="card mx-2" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Addon</h5>
                    <p id="theAddons" class="card-text"></p>
                </div>
            </div>
            <div class="card mx-2" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Addon</h5>
                    <p id="theAddons2" class="card-text"></p>
                </div>
            </div>
            <div class="card mx-2" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Offering</h5>
                    <p id="theOffering" class="card-text"></p>
                </div>
            </div>
        </div>
        <div class="row pt-2" id="perkRow">
            <div class="card mx-2" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Perk</h5>
                    <p id="thePerks1" class="card-text"></p>
                </div>
            </div>
            <div class="card mx-2" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Perk</h5>
                    <p id="thePerks2" class="card-text"></p>
                </div>
            </div>
            <div class="card mx-2" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Perk</h5>
                    <p id="thePerks3" class="card-text"></p>
                </div>
            </div>
            <div class="card mx-2" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Perk</h5>
                    <p id="thePerks4" class="card-text"></p>
                </div>
            </div>
        </div>
    </div>

    <script src="./scripts/randomKiller.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>