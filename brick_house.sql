
CREATE TABLE Colours (
	ColourID VARCHAR(10) PRIMARY KEY,
	ColourName VARCHAR(50) NOT NULL
);

INSERT INTO Colours
VALUES
('R001', 'Bright Red'),
('R002', 'Mid Red'),
('R003', 'Light Red'),
('P001', 'Bright Pink'),
('P002', 'Mid Pink'),
('P003', 'Pale Pink'),
('P004', 'Barbie Pink'),
('G001', 'Dark Green'),
('G002', 'Bright Green'),
('G003', 'Light Green'),
('BR001', 'Dark Brown'),
('BR002', 'Mid Brown'),
('BR003', 'Light Brown'),
('W001', 'White'),
('K001', 'Black'),
('GR001', 'Grey'),
('O001', 'Bright Orange'),
('O002', 'Mid Orange'),
('O003', 'Light Orange'),
('Y001', 'Bright Yellow'),
('Y002', 'Mid Yellow'),
('Y003', 'Light Yellow'),
('B001', 'Bright Blue'),
('B002', 'Mid Blue'),
('B003', 'Light Blue');

SELECT * 
FROM Colours;


CREATE TABLE Parts (
	PartID VARCHAR(10) PRIMARY KEY,
	Category VARCHAR(50) NOT NULL,
	PartName VARCHAR(50) NOT NULL,
	Comment VARCHAR (255)
);

INSERT INTO Parts
VALUES
('BK001', 'Brick', 'Brick', NULL),
('TR001', 'Tile', 'Roof Tile', NULL),
('RR001', 'Rafter', 'Roof Rafter', NULL),
('WW001', 'Window', 'Window', NULL),
('DE001', 'Door', 'External Door', NULL),
('DI001', 'Door', 'Internal Door', NULL),
('TF001', 'Tile', 'Floor Tile', NULL),
('CS001', 'Chimney', 'Chimney Stack', NULL),
('CP001', 'Chimney', 'Chimney Pot', NULL),
('A001', 'Accessory', 'Booby Trap', 'For MacCallister House only')
;

SELECT * 
FROM Parts;

CREATE TABLE Houses (
	HouseID VARCHAR(10) PRIMARY KEY,
	HouseName VARCHAR(50) NOT NULL
	);

INSERT INTO Houses
VALUES
('H001', 'Ed House'),
('H002', '9 Privet Drive'),
('H003', 'Barbie Dreamhouse'),
('H004', 'The MacCallister House'),
('H005', 'Wayne Manor'),
('H006', 'Bag End')
;

SELECT * 
FROM Houses;


CREATE TABLE HouseComponent (
	ComponentID VARCHAR(10) PRIMARY KEY,
	HouseID VARCHAR (10) NOT NULL,
	ComponentType VARCHAR(50) NOT NULL,
	ComponentName VARCHAR (50) NOT NULL,
	CONSTRAINT fk_housecomponent_house
		FOREIGN KEY (HouseID)
		REFERENCES Houses(HouseID)
	);

INSERT INTO HouseComponent
VALUES
('C001', 'H004', 'Wall', 'North Wall'),
('C002', 'H004', 'Wall', 'South Wall'),
('C003', 'H004', 'Wall', 'West Wall'),
('C004', 'H004', 'Wall', 'East Wall'),
('C005', 'H004', 'Roof', 'Roof'),
('C006', 'H004', 'Floor', 'Floor'),
('C007', 'H004', 'Window', 'North Window'),
('C008', 'H004', 'Window', 'South Window'),
('C009', 'H004', 'Door', 'External Door'),
('C010', 'H004', 'Door', 'Internal Door'),
('C011', 'H004', 'Wall', 'Internal Wall')
;

CREATE TABLE PartColours (
	PartColourID VARCHAR(20) PRIMARY KEY,
	PartID VARCHAR(20) NOT NULL,
	ColourID VARCHAR (20) NOT NULL,

	CONSTRAINT fk_partcolour_part
		FOREIGN KEY (PartID)
		REFERENCES Parts(PartID),

	CONSTRAINT fk_partcolour_colour
		FOREIGN KEY (ColourID)
		REFERENCES Colours(ColourID),

	CONSTRAINT partcolour_combo
		UNIQUE (PartID, ColourID)
);	
	
INSERT INTO PartColours (
	PartColourID,
	PartID,
	ColourID
)
SELECT
	p.PartID || '-' || c.ColourID,
	p.PartID,
	c.ColourID
FROM Parts p
CROSS JOIN Colours c;

SELECT *
FROM PartColours
ORDER BY PartID, ColourID;

CREATE TABLE Rooms (
    RoomID VARCHAR(10) PRIMARY KEY,
    HouseID VARCHAR(10) NOT NULL,
    RoomName VARCHAR(50) NOT NULL,
    FloorComponentID VARCHAR(10) NOT NULL,
    FOREIGN KEY (HouseID)
        REFERENCES Houses(HouseID),
 
    FOREIGN KEY (FloorComponentID)
 
        REFERENCES HouseComponent(ComponentID)
 
);

CREATE TABLE BillOfMaterials (
	BOMID VARCHAR(10) PRIMARY KEY,
	entID VARCHAR(20) NOT NULL,
	PartColourID VARCHAR (20) NOT NULL,
	Quantity INT NOT NULL,

	CONSTRAINT fk_bom_ent
		FOREIGN KEY (entID)
		REFERENCES Houseent(ComponentID),

	CONSTRAINT fk_bom_partcolour
		FOREIGN KEY (PartColourID)
		REFERENCES PartColours(PartColourID),
	
	CONSTRAINT check_quantity
		CHECK (Quantity > 0)
);

INSERT INTO BillOfMaterials
VALUES
('BM001', 'C001', 'BK001-R003', 40),
('BM002', 'C002', 'BK001-R003', 40),
('BM003', 'C003', 'BK001-R003', 40),
('BM004', 'C004', 'BK001-R003', 40),
('BM005', 'C005', 'TR001-K001', 30),
('BM006', 'C005', 'RR001-K001', 8),
('BM007', 'C006', 'TF001-B002', 40),
('BM008', 'C007', 'WW001-W001', 1),
('BM009', 'C008', 'WW001-W001', 1),
('BM0010', 'C009', 'DE001-W001', 1),
('BM0011', 'C010', 'DI001-W001', 1),
('BM0012', 'C011', 'BK001-W001', 40)
;

SELECT * 
FROM BillOfMaterials
ORDER BY BOMID

SELECT
HouseID,
Count(*) AS RoomCount
FROM Rooms
GROUP BY HouseID
