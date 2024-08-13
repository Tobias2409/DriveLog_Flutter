
CREATE TABLE Car(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(255) NOT NULL,
    Image VARCHAR(255) NOT NULL,
    Manufacturer VARCHAR(255),                      -- The company that makes the car
    Model VARCHAR(255),                             -- The specific model of the car
    Year INTEGER,                                   -- The manufacturing year of the car
    EngineType VARCHAR(100),                        -- The type of engine (e.g., Petrol, Diesel, Electric, Hybrid)
    TransmissionType VARCHAR(50),                   -- Type of transmission (e.g., Manual, Automatic, CVT)
    FuelType VARCHAR(50),                           -- Type of fuel used (e.g., Gasoline, Diesel, Electric)
    Mileage DECIMAL(10,2),                          -- The mileage of the car (e.g., miles per gallon or liters per 100km)
    Color VARCHAR(50),                              -- The color of the car
    Price DECIMAL(10,2),                            -- Price of the car
    VIN VARCHAR(17) UNIQUE,                         -- Vehicle Identification Number (a unique identifier for each car)
    NumberOfDoors INTEGER,                          -- Number of doors
    SeatingCapacity INTEGER,                        -- Number of seats available
    Horsepower INTEGER,                             -- Engine power in horsepower
    Torque DECIMAL(10,2),                           -- Torque in Nm or lb-ft
    DriveType VARCHAR(50),                          -- Type of drive (e.g., FWD, RWD, AWD)
    SafetyRating DECIMAL(3,2),                      -- Safety rating of the car
    Features TEXT,                                  -- Additional features (e.g., Sunroof, Bluetooth, GPS)
    Description TEXT,                               -- A description or overview of the car
    DateAdded DATETIME DEFAULT CURRENT_TIMESTAMP    -- The date when the car information was added to the database
);


CREATE TABLE Trip(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Distance DECIMAL NOT NULL,
    FuelConsumption DECIMAL,

    CarFK INTEGER NOT NULL,
    FOREIGN KEY(CarFK) REFERENCES Car(ID)
);

CREATE TABLE Refuel(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    FuelAmount DECIMAL NOT NULL,
    Distance DECIMAL,

    CarFK INTEGER NOT NULL,
    FOREIGN KEY (CarFK) REFERENCES Car(ID)
);
