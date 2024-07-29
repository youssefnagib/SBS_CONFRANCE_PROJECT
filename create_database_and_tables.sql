CREATE DATABASE ReRice;

USE ReRice;

-- Create Company table
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    ContactInfo VARCHAR(255)
);

-- Create WasteSource table
CREATE TABLE WasteSource (
    SourceID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Type VARCHAR(50),
    Location VARCHAR(255)
);

-- Create ProcessingPlant table
CREATE TABLE ProcessingPlant (
    PlantID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyID INT,
    Location VARCHAR(255),
    Capacity INT,
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

-- Create WasteCollection table
CREATE TABLE WasteCollection (
    CollectionID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE,
    Weight DECIMAL(10, 2),
    WasteSourceID INT,
    ProcessingPlantID INT,
    FOREIGN KEY (WasteSourceID) REFERENCES WasteSource(SourceID),
    FOREIGN KEY (ProcessingPlantID) REFERENCES ProcessingPlant(PlantID)
);

-- Create ProcessedMaterial table
CREATE TABLE ProcessedMaterial (
    MaterialID INT PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(50),
    QualityGrade VARCHAR(50),
    PlantID INT,
    FOREIGN KEY (PlantID) REFERENCES ProcessingPlant(PlantID)
);

-- Create Inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    MaterialID INT,
    Quantity INT,
    Location VARCHAR(255),
    FOREIGN KEY (MaterialID) REFERENCES ProcessedMaterial(MaterialID)
);

-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255),
    Address VARCHAR(255)
);

-- Create Order table
CREATE TABLE `Order` (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    MaterialID INT,
    Quantity INT,
    OrderDate DATE,
    DeliveryDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (MaterialID) REFERENCES ProcessedMaterial(MaterialID)
);
