/*Drop bad tables*/
/*DROP TABLE IF EXISTS Killers;*/
DROP TABLE IF EXISTS KillerAddons;
DROP TABLE IF EXISTS KillerPerks;
DROP TABLE IF EXISTS Offerings;

/*CREATE TABLES*/
/*CREATE TABLE Killers (
    killer_id int NOT NULL AUTO_INCREMENT,
    killerName varchar(30) NOT NULL,
    imageLocation varchar(30),
    PRIMARY KEY(killer_id)
);*/

CREATE TABLE KillerAddons(
    add_id int NOT NULL AUTO_INCREMENT,
    killer_id int NOT NULL,
    addonName varchar(30) NOT NULL,
    addonDesc varchar(500) NOT NULL,
    imageLocation varchar(30),
    PRIMARY KEY(add_id),
    FOREIGN KEY (killer_id) REFERENCES Killers(killer_id)
);
CREATE TABLE KillerPerks(
    kPerk_id int NOT NULL AUTO_INCREMENT,
    perkName varchar(30) NOT NULL,
    perkDesc varchar(500),
    imageLocation varchar(30),
    PRIMARY KEY(kPerk_id)
);

CREATE TABLE Offerings(
    o_id int NOT NULL AUTO_INCREMENT,
    offeringName varchar(30) NOT NULL,
    offeringDesc varchar(500),
    imageLocation varchar(30),
    PRIMARY KEY(o_id)
);

/*INSERTS*/
/*Killers*/
/*INSERT INTO Killers (killer_id,killerName,imageLocation) values (0,"The Huntress",NULL);
INSERT INTO Killers (killer_id,killerName,imageLocation) values (0,"The Wraith",NULL);
INSERT INTO Killers (killer_id,killerName,imageLocation) values (0,"The Trapper",NULL);
INSERT INTO Killers (killer_id,killerName,imageLocation) values (0,"The Hillbilly",NULL);
INSERT INTO Killers (killer_id,killerName,imageLocation) values (0,"The Nurse",NULL);
INSERT INTO Killers (killer_id,killerName,imageLocation) values (0,"The Doctor",NULL);*/
/*Addons*/
/* Huntress */
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,1,"Iridescent Head","A glass-like Hatchet head moulded from The Fog itself. 
The blade is warm and reverberating with The Entity's power.
Survivors hit by Hatchets are automatically put into the Dying State.You can only carry a maximum of 1 Hatchet.",NULL);
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,1,"Soldier's Puttee","A wrap taken from a dead soldier.
It provides protection and support to the ankle and lower leg.
Increases the Movement speed of The Huntress to 4.6 m/s whenever she is out of Hatchets.",NULL);
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,1,"Begrimed Head","	This Hatchet head is stained with a foul substance that afflicts anyone who it touches with debilities.
Survivors hit with Hunting Hatchets suffer from the Mangled and Haemorrhage",NULL);
/*Wraith*/
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,2,"All Seeing -Spirit","The Kra-Frabai symbol, representing the Entity watching over us, ominously glows on the head of the Bell.
Unlocks hidden potential in The Wraith's Aura-reading ability:
When cloaked, the intensity of the Aura of Generators reveal their Repair progression.",NULL);
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,2,"Coxcombed Clapper","A simple coxcomb knotted rope wrapped around the bell clapper to muffle its sound.
A malevolent Aura emanates from it. Silences the Wailing Bell tolls.",NULL);
/* Trapper */
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,3,"Bloody Coil","Part sticky, part slippery, this grim liquid makes handling the Bear Trap's spring more dangerous.
When a healthy Survivor disarms a Bear Trap, the Bloody Coil exacts its price, putting the Survivor into the Injured State",NULL);
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,3,"Iridescent Stone","Bear Traps sharpened with the sickly gleaming Iridescent Stone seem to gain a life of their own.
Every 30 seconds, a randomly chosen disarmed Bear Trap is automatically reset and armed.",NULL);
/* Hillbilly*/
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,4,"Apex Muffler","A masterfully crafted chainsaw muffler that outperforms all others.
Silences the Chainsaw for all Survivors outside The Hillbilly's Terror Radius",NULL);
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,4,"Iridescent Brick","	Once representative of Max Junior's confinement, this was the first brick to fall when his room's barricade came crashing down.
Gain the Undetectable Status Effect until you stop sprinting after maintaining a Chainsaw Sprint for 2 seconds.",NULL);
/* Nurse */
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,5,"Matchbox","A matchbox containing an odd collection of mismatched buttons.
Serves as a reminder of a horrible place.
Increases the Movement speed of The Nurse to 4.2 m/s for the entire Trial.
Reduces available Power Tokens by -1 Token.",NULL);
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,5,"Torn Bookmark","A white and pristine piece of ribbon once attached to a sacred book.
Serves as the symbol of a dispute.
Increases available Power Tokens by +1 Token.
Increases the Power Recharge time by +50 %.",NULL);
/* Doctor */
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,6,"Iridescent King","A glass-like king chess piece moulded from The Fog itself.
The Entity's trace reverberating within can break the most powerful minds.
Survivors with Madness suffer from all available Afflictions: Calm, Discipline, Order, and Restraint.
Survivors intermittently hear a distant Illusionary Terror Radius.
During a Chase, Survivors perceive an Illusionary Red Stain and Terror Radius as though The Doctor were directly behind them.
This effect persists for 6 seconds after the Chase ends in Madness II and is constantly active in Madness III.
Broken Pallets have a chance to become replaced with Illusionary Pallets that persist until approached.
Every 20 seconds, a new Illusionary Pallet is generated at the location of a random Broken Pallet.
Increases the Illusionary Doctor duration by +8 seconds.
The Doctor shares in his patients' Madness in order to see the various Afflictions, including the Auras of Illusionary Pallets and Doctors.",NULL);
INSERT INTO KillerAddons (add_id,killer_id,addonName,addonDesc,imageLocation) values (0,6,"Iridescent Queen","A glass-like queen chess piece moulded from The Fog itself.
It cannot be touched without receiving a considerable jolt of electricity.
Any Survivor struck by the Shock Therapy or Static Blast Attack acquires a lingering Static Charge.
The Static Charge remains with the Survivor until it is discharged.
Any time a Survivor is within 4 metres of a Survivor carrying a Static Charge, both receive a shock identical to a Shock Therapy Attack and the Static Charge is discharged immediately.
If Survivors are within 4 metres of one another when being struck by the same Shock Therapy or Static Blast Attack, they do not acquire a Static Charge.",NULL);

/*PERKS*/
INSERT INTO KillerPerks (kPerk_id,perkName,perkDesc,imageLocation) values (0,"A Nurse's Calling",NULL,NULL);
INSERT INTO KillerPerks (kPerk_id,perkName,perkDesc,imageLocation) values (0,"Agitation",NULL,NULL);
INSERT INTO KillerPerks (kPerk_id,perkName,perkDesc,imageLocation) values (0,"Bamboozle",NULL,NULL);
INSERT INTO KillerPerks (kPerk_id,perkName,perkDesc,imageLocation) values (0,"Barbecue & Chilli",NULL,NULL);
INSERT INTO KillerPerks (kPerk_id,perkName,perkDesc,imageLocation) values (0,"Beast of Prey",NULL,NULL);
INSERT INTO KillerPerks (kPerk_id,perkName,perkDesc,imageLocation) values (0,"Bitter Murmur",NULL,NULL);
INSERT INTO KillerPerks (kPerk_id,perkName,perkDesc,imageLocation) values (0,"Blood Echo",NULL,NULL);

/*Offerings*/
INSERT INTO Offerings (o_id,offeringName,offeringDesc,imageLocation) values (0,"Ebont Memento Mori",NULL,NULL);
INSERT INTO Offerings (o_id,offeringName,offeringDesc,imageLocation) values (0,"Putrid Oak",NULL,NULL);
INSERT INTO Offerings (o_id,offeringName,offeringDesc,imageLocation) values (0,"Vigo's Blueprint",NULL,NULL);
INSERT INTO Offerings (o_id,offeringName,offeringDesc,imageLocation) values (0,"Cut Coin",NULL,NULL);
INSERT INTO Offerings (o_id,offeringName,offeringDesc,imageLocation) values (0,"Ardent Tanager Wreath",NULL,NULL);
INSERT INTO Offerings (o_id,offeringName,offeringDesc,imageLocation) values (0,"Ardent Raven Wreath",NULL,NULL);
INSERT INTO Offerings (o_id,offeringName,offeringDesc,imageLocation) values (0,"Ardent Spotted Owl Wreath",NULL,NULL);
INSERT INTO Offerings (o_id,offeringName,offeringDesc,imageLocation) values (0,"Ardent Shrike Wreath",NULL,NULL);