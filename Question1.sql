/*
My relational database consists of 10 tables in total.
VEHICLE table consists of all keys that are present in outer dictionary in the json file. Each nested dictionary is made into a separate table. 
Each table's PRIMARY KEY is the unique VIN number provided in the json. 
All tables reference VEHICLE table using VIN. 

ANY VIN that is not part of VEHICLE table already cannot be added to other tables because of FOREIGN KEY CONSTRAINT 

I've used TEXT as datatype for all columns in all tables which is necessarily not a good design. 
I had initially declared columns as INTEGER, VARCHAR and TEXT based on what I could observe in the json file. 
But, I ended up changing all colunms to TEXT to solve a problem that I encountered in bonus question - populating tables. 

For any analysis like prices over time or aggregate values, columns can be CAST as either FLOAT or INTEGER/
*/

CREATE DATABASE IF NOT EXISTS vehicle_database;

USE vehicle_database;
DROP TABLE IF EXISTS VEHICLE;
DROP TABLE IF EXISTS AIRBAG;
DROP TABLE IF EXISTS BATTERY;
DROP TABLE IF EXISTS BRAKE;
DROP TABLE IF EXISTS ENGINE;
DROP TABLE IF EXISTS LANE;
DROP TABLE IF EXISTS NCSA;
DROP TABLE IF EXISTS TRAILER;
DROP TABLE IF EXISTS PlANT;
DROP TABLE IF EXISTS WHEEL;

CREATE TABLE IF NOT EXISTS VEHICLE(
	VIN CHAR(17) NOT NULL,
    PRIMARY KEY (VIN),
	ABS TEXT,
	ActiveSafetySysNote TEXT,
	AdaptiveCruiseControl TEXT,
	AdaptiveDrivingBeam TEXT,
	AdaptiveHeadlights TEXT,
	AdditionalErrorText TEXT,
	AutoReverseSystem TEXT,
	AutomaticPedestrianAlertingSound TEXT,
	AxleConfiguration TEXT,
	Axles TEXT,
	BasePrice TEXT,
	BedLengthIN TEXT,
	BedType TEXT,
	BlindSpotIntervention TEXT,
	BlindSpotMon TEXT,
	BodyCabType TEXT,
	BodyClass TEXT,
	BusFloorConfigType TEXT,
	BusLength TEXT,
	BusType TEXT,
	CAN_AACN TEXT,
	CIB TEXT,
	CashForClunkers TEXT,
	ChargerLevel TEXT,
	ChargerPowerKW TEXT,
	CoolingType TEXT,
	CurbWeightLB TEXT,
	CustomMotorcycleType TEXT,
	DaytimeRunningLight TEXT,
	DestinationMarket TEXT,
	DisplacementCC TEXT,
	DisplacementCI TEXT,
	DisplacementL TEXT,
	Doors TEXT,
	DriveType TEXT,
	DriverAssist TEXT,
	EDR TEXT,
	ESC TEXT,
	EVDriveUnit TEXT,
	ElectrificationLevel TEXT,
	EntertainmentSystem TEXT,
	ErrorCode TEXT,
	ErrorText TEXT,
	ForwardCollisionWarning TEXT,
	FuelInjectionType TEXT,
	FuelTypePrimary TEXT,
	FuelTypeSecondary TEXT,
	GCWR TEXT,
	GCWR_to TEXT,
	GVWR TEXT,
	GVWR_to TEXT,
	KeylessIgnition TEXT,
	LowerBeamHeadlampLightSource TEXT,
	MakeID TEXT,
    MAKE TEXT,
	Manufacturer TEXT,
	ManufacturerId TEXT,
	Model TEXT,
	ModelID TEXT,
	ModelYear TEXT,
	MotorcycleChassisType TEXT,
	MotorcycleSuspensionType TEXT,
	Note TEXT,
	OtherBusInfo TEXT,
	OtherMotorcycleInfo TEXT,
	OtherRestraintSystemInfo TEXT,
	ParkAssist TEXT,
	PedestrianAutomaticEmergencyBraking TEXT,
	PossibleValues TEXT,
	Pretensioner TEXT,
	RearAutomaticEmergencyBraking TEXT,
	RearCrossTrafficAlert TEXT,
	RearVisibilitySystem TEXT,
	SAEAutomationLevel TEXT,
	SAEAutomationLevel_to TEXT,
	SeatBeltsAll TEXT,
	SeatRows TEXT,
	Seats TEXT,
	SemiautomaticHeadlampBeamSwitching TEXT,
    Series TEXT,
	Series2 TEXT,
	SteeringLocation TEXT,
	SuggestedVIN TEXT,
	TPMS TEXT,
	TopSpeedMPH TEXT,
	TrackWidth TEXT,
	TractionControl TEXT,
	TransmissionSpeeds TEXT,
	TransmissionStyle TEXT,
	Trim TEXT,
	Trim2 TEXT,
	Turbo TEXT,
	ValveTrainDesign TEXT,
	VehicleType TEXT,
	Windows TEXT
);

CREATE TABLE IF NOT EXISTS AIRBAG (
	VIN CHAR(17) NOT NULL,
    loccurtain TEXT,
    locfront TEXT,
    locknee TEXT,
    locseatcushion TEXT,
    locside TEXT,
    PRIMARY KEY (VIN),
    CONSTRAINT AIRBAG_VEHICLES FOREIGN KEY(VIN) REFERENCES VEHICLE(VIN)
);

CREATE TABLE IF NOT EXISTS BATTERY(
	VIN CHAR(17) NOT NULL,
    a TEXT,
    a_to TEXT, -- NO value in file to determine the type, TEXT to be safe
    cells TEXT,-- NO value in file to determine the type, TEXT to be safe
    info TEXT, 
    kwh TEXT,
    kwh_to TEXT,
    modules TEXT,
    packs TEXT,
    type TEXT,
    v TEXT,
    v_to TEXT,
    PRIMARY KEY (VIN),
    CONSTRAINT BATTERY_VEHICLES FOREIGN KEY(VIN) REFERENCES VEHICLE(VIN)
);

CREATE TABLE IF NOT EXISTS BRAKE ( 
	VIN CHAR(17) NOT NULL,
    systemdesc TEXT,
    systemtype TEXT,
    dynamicsupport TEXT,
    PRIMARY KEY (VIN),
    CONSTRAINT BRAKE_VEHICLES FOREIGN KEY(VIN) REFERENCES VEHICLE(VIN)
);

CREATE TABLE IF NOT EXISTS ENGINE ( 
	VIN CHAR(17) NOT NULL,
    configuration TEXT,
    cycles TEXT,
    cylinders TEXT,
    hp TEXT,
    hp_to TEXT,
    kw TEXT,
    manufacturer TEXT,
    model TEXT,
    otherinfo TEXT,
    PRIMARY KEY (VIN),
    CONSTRAINT ENGINE_VEHICLES FOREIGN KEY(VIN) REFERENCES VEHICLE(VIN)
);

CREATE TABLE IF NOT EXISTS LANE( 
	VIN CHAR(17) NOT NULL,
    centeringassistance TEXT,
    departurewarning TEXT,
    keepsystem TEXT,
    PRIMARY KEY (VIN),
    CONSTRAINT LANE_VEHICLES FOREIGN KEY(VIN) REFERENCES VEHICLE(VIN)
);

CREATE TABLE IF NOT EXISTS NCSA(
	VIN CHAR(17) NOT NULL,
    bodytype TEXT,
    make TEXT,
    mapexcapprovedby TEXT,
    mapexcapprovedon TEXT,
    mappingexception TEXT,
    model TEXT,
    note TEXT,
    PRIMARY KEY (VIN),
    CONSTRAINT NCSA_VEHICLES FOREIGN KEY(VIN) REFERENCES VEHICLE(VIN)
);

CREATE TABLE IF NOT EXISTS TRAILER( 
	VIN CHAR(17) NOT NULL,
    otherinfo TEXT,
    bodytype TEXT,
    length TEXT,
    type TEXT,
	PRIMARY KEY (VIN),
    CONSTRAINT TRAILER_VEHICLES FOREIGN KEY(VIN) REFERENCES VEHICLE(VIN)
    
);

CREATE TABLE IF NOT EXISTS PLANT(
	VIN CHAR(17) NOT NULL,
    city TEXT,
    companyname TEXT,
    country TEXT,
    state TEXT,
    PRIMARY KEY (VIN),
    CONSTRAINT PLANT_VEHICLES FOREIGN KEY(VIN) REFERENCES VEHICLE(VIN)
);

CREATE TABLE IF NOT EXISTS WHEEL(
	VIN CHAR(17) NOT NULL,
    baselong TEXT,
    baseshort TEXT,
    basetype TEXT,
    sizefront TEXT,
    sizerear TEXT,
    s TEXT,
    PRIMARY KEY (VIN),
    CONSTRAINT WHEEL_VEHICLES FOREIGN KEY(VIN) REFERENCES VEHICLE(VIN)
);
