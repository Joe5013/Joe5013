-- Table 1: AdjustDistributions
CREATE TABLE AdjustDistributions (
    DistributionID INT PRIMARY KEY,
    AdjustmentsPID INT,
    ZoneID INT,
    Distribution DECIMAL(18,4),
    FOREIGN KEY (ZoneID) REFERENCES Zone(ZoneID) ON DELETE CASCADE,
    FOREIGN KEY (AdjustmentsPID) REFERENCES AdjustmentsP(AdjustmentsPID) ON DELETE CASCADE
);

-- Table 2: Adjustments
CREATE TABLE Adjustments (
    AdjustmentsID INT PRIMARY KEY,
    EstimateID INT,
    AdjustDescription VARCHAR(50),
    Adjustment DECIMAL(18,4),
    FOREIGN KEY (EstimateID) REFERENCES EstimateNos(EstimateID) ON DELETE CASCADE
);

-- Table 3: AdjustmentsP
CREATE TABLE AdjustmentsP (
    AdjustmentsPID INT PRIMARY KEY,
    EstimateID INT,
    AdjustDescription VARCHAR(60),
    AmountA DECIMAL(18,4),
    PercentA DECIMAL(18,4),
    Manual BOOLEAN,
    FormulaA VARCHAR(250),
    TotalLine BOOLEAN,
    GTotalLine BOOLEAN,
    LineNo INT,
    LineCalc INT,
    SFMethod BOOLEAN,
    FormulaMethod BOOLEAN,
    cCode VARCHAR(20),
    ccDescription VARCHAR(40),
    ccCompanyID VARCHAR(4),
    FOREIGN KEY (EstimateID) REFERENCES EstimateNos(EstimateID) ON DELETE CASCADE,
    FOREIGN KEY (ccCompanyID) REFERENCES ccCompany(CompanyID)
);

-- Table 4: Alternates
CREATE TABLE Alternates (
    AlternateID INT PRIMARY KEY,
    EstimateID INT,
    AlternateName VARCHAR(80),
    Total INT,
    Date DATETIME,
    FOREIGN KEY (EstimateID) REFERENCES EstimateNos(EstimateID)
);

-- Table 5: BornTemp
CREATE TABLE BornTemp (
    BomID INT,
    strMyPcID VARCHAR(30),
    CsiNo VARCHAR(5),
    CsiDescription VARCHAR(30),
    ZoneName VARCHAR(15),
    ZoneLineNo INT,
    ElineID INT,
    ElineNo INT,
    ElineDescription VARCHAR(80),
    ElinesSeeComponents BOOLEAN,
    ComponentID INT,
    COrderNo INT,
    Component VARCHAR(80),
    ComponentsSeeComponents BOOLEAN,
    Qty DECIMAL(18,4),
    QtyTot DECIMAL(18,4),
    Divider DECIMAL(18,4),
    plHeadingID INT,
    HOrderNo INT,
    Heading VARCHAR(40),
    PlItemID INT,
    OrderNo INT,
    Description VARCHAR(50),
    Unit VARCHAR(6),
    UnitCost DECIMAL(18,4),
    EstDollars DECIMAL(18,4),
    Component2ID INT,
    PlCsiNo VARCHAR(5),
    PlCsiDescription VARCHAR(30)
);

-- Table 6: ccCompany
CREATE TABLE ccCompany (
    CompanyID VARCHAR(4) PRIMARY KEY,
    EntryOrder INT
);

-- Table 7: ccEstimateCodes
CREATE TABLE ccEstimateCodes (
    EstimateCodeID INT PRIMARY KEY,
    cCode VARCHAR(20),
    ccDescription VARCHAR(40),
    ccInsurance VARCHAR(20),
    ccSpecial1 VARCHAR(20),
    CompanyID VARCHAR(4),
    EstimateID INT,
    CsiLineID INT,
    ElineID INT,
    AdjustmentsPID INT,
    Amount INT,
    Unit VARCHAR(6),
    Quantity DECIMAL(18,4),
    EstColumn VARCHAR(1),
    Select BOOLEAN,
    ZoneName VARCHAR(15),
    TurnYellow BOOLEAN,
    AddQty BOOLEAN,
    FOREIGN KEY (CompanyID) REFERENCES ccCompany(CompanyID),
    FOREIGN KEY (EstimateID) REFERENCES EstimateNos(EstimateID) ON DELETE CASCADE,
    FOREIGN KEY (CsiLineID) REFERENCES CsiLines(CsiLineID),
    FOREIGN KEY (ElineID) REFERENCES Elines(ElineID),
    FOREIGN KEY (AdjustmentsPID) REFERENCES AdjustmentsP(AdjustmentsPID)
);

-- Table 8: ccMethod
CREATE TABLE ccMethod (
    ccMethodID INT PRIMARY KEY,
    ccFilePath VARCHAR(255),
    MultiFilesPerComp BOOLEAN,
    MethodName VARCHAR(30),
    FieldSeparator VARCHAR(12),
    ShowColName BOOLEAN,
    TextQualifier INT,
    Tip1 TEXT,
    TipHeading VARCHAR(80),
    Tip2 TEXT,
    FileExtension VARCHAR(3),
    FirstPassAllRecords INT
);

-- Table 9: ccMethodCodes
CREATE TABLE ccMethodCodes (
    ccMethodDetailID INT PRIMARY KEY,
    ccMethodID INT,
    ColNo INT,
    ColName VARCHAR(25),
    DataType VARCHAR(6),
    MaxCharacters INT,
    NumberDecimals INT,
    CharIfNull VARCHAR(16),
    Rule1A VARCHAR(50),
    Rule1B VARCHAR(50),
    Rule1C VARCHAR(50),
    Rule1D VARCHAR(50),
    Rule1E VARCHAR(50),
    Conditional INT,
    Text1D VARCHAR(50),
    Text1E VARCHAR(50),
    Condition2 BOOLEAN,
    Rule2A VARCHAR(50),
    Rule2B VARCHAR(50),
    Rule2C VARCHAR(50),
    Rule3C VARCHAR(50),
    Rule4C VARCHAR(50),
    Rule5C VARCHAR(50),
    Rule6C VARCHAR(50),
    Rule7C VARCHAR(50),
    Text3D VARCHAR(50),
    Text4D VARCHAR(50),
    Text5D VARCHAR(50),
    Text6D VARCHAR(50),
    Text7D VARCHAR(50),
    Text8D VARCHAR(50),
    ReverseSign BOOLEAN,
    FOREIGN KEY (ccMethodID) REFERENCES ccMethod(ccMethodID) ON DELETE CASCADE
);

-- Table 10: ccMethodDetail
CREATE TABLE ccMethodDetail (
    ccMethodDetailID INT PRIMARY KEY,
    ccMethodID INT,
    ColNo INT,
    ColName VARCHAR(25),
    DataType VARCHAR(6),
    MaxCharacters INT,
    NumberDecimals INT,
    CharIfNull VARCHAR(16),
    Rule1A VARCHAR(50),
    Rule1B VARCHAR(50),
    Rule1C VARCHAR(50),
    Rule1D VARCHAR(50),
    Rule1E VARCHAR(50),
    Conditional INT,
    Text1D VARCHAR(50),
    Text1E VARCHAR(50),
    Condition2 BOOLEAN,
    Rule2A VARCHAR(50),
    Rule2B VARCHAR(50),
    Rule2C VARCHAR(50),
    Rule3C VARCHAR(50),
    Rule4C VARCHAR(50),
    Rule5C VARCHAR(50),
    Rule6C VARCHAR(50),
    Rule7C VARCHAR(50),
    Text3D VARCHAR(50),
    Text4D VARCHAR(50),
    Text5D VARCHAR(50),
    Text6D VARCHAR(50),
    Text7D VARCHAR(50),
    Text8D VARCHAR(50),
    ReverseSign BOOLEAN,
    FOREIGN KEY (ccMethodID) REFERENCES ccMethod(ccMethodID) ON DELETE CASCADE
);

-- Table 11: ccPrimaryCodes
CREATE TABLE ccPrimaryCodes (
    PrimaryCodeID INT PRIMARY KEY,
    cCode VARCHAR(20),
    ccDescription VARCHAR(40),
    Unit VARCHAR(6),
    ccInsurance VARCHAR(20),
    ccSpecial1 VARCHAR(20),
    CompanyID VARCHAR(4),
    EntryOrder INT,
    LCol BOOLEAN,
    ECol BOOLEAN,
    MCol BOOLEAN,
    SCol BOOLEAN,
    FOREIGN KEY (CompanyID) REFERENCES ccCompany(CompanyID)
);

-- Table 12: ccSections
CREATE TABLE ccSections (
    ccSectionsID INT PRIMARY KEY,
    ccMethodID INT,
    LineNo VARCHAR(5),
    Field1 VARCHAR(50),
    Field2 VARCHAR(50),
    Field3 VARCHAR(50),
    Field4 VARCHAR(50),
    Field5 VARCHAR(50),
    Field6 VARCHAR(50),
    Field7 VARCHAR(50),
    Field8 VARCHAR(50),
    Field9 VARCHAR(50),
    Field10 VARCHAR(50),
    Field11 VARCHAR(50),
    Field12 VARCHAR(50),
    Field13 VARCHAR(50),
    Field14 VARCHAR(50),
    Field15 VARCHAR(50),
    Field16 VARCHAR(50),
    Field17 VARCHAR(50),
    Field18 VARCHAR(50),
    Field19 VARCHAR(50),
    Field20 VARCHAR(50),
    FOREIGN KEY (ccMethodID) REFERENCES ccMethod(ccMethodID) ON DELETE CASCADE
);

-- Table 13: Cities
CREATE TABLE Cities (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(40)
);

-- Table 14: Clients
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    ClientCompanyName VARCHAR(50),
    Street1 VARCHAR(50),
    Street2 VARCHAR(50),
    City VARCHAR(20),
    StateOrProvince VARCHAR(2),
    PostalCode VARCHAR(20),
    ContactLastName VARCHAR(20),
    ContactFirstName VARCHAR(20),
    ContactTitle VARCHAR(20),
    PhoneNumber VARCHAR(30),
    FaxNumber VARCHAR(30),
    EmailAddress VARCHAR(50)
);

-- Table 15: Components
CREATE TABLE Components (
    ComponentID INT PRIMARY KEY,
    ElineID INT,
    Component VARCHAR(80),
    LabC DECIMAL(18,4),
    MatC DECIMAL(18,4),
    SubC DECIMAL(18,4),
    EquipC DECIMAL(18,4),
    Qty DECIMAL(18,4),
    Unit VARCHAR(6),
    Component2ID INT,
    OrderNo INT,
    SeeComponents BOOLEAN,
    TaxL BOOLEAN,
    TaxE BOOLEAN,
    TaxM BOOLEAN,
    TaxS BOOLEAN,
    DailyOutput DECIMAL(18,4),
    DailyLabCost DECIMAL(18,4),
    DailyEqCost DECIMAL(18,4),
    CrewID INT,
    TradeQty DECIMAL(18,4),
    EquipQty DECIMAL(18,4),
    MTradeID INT,
    MEquipID INT,
    SeeDetails BOOLEAN,
    Divider DECIMAL(18,4),
    ccLab VARCHAR(20),
    ccEquip VARCHAR(20),
    ccMat VARCHAR(20),
    ccSub VARCHAR(20),
    ccLabCompanyID VARCHAR(4),
    ccEquipCompanyID VARCHAR(4),
    ccMatCompanyID VARCHAR(4),
    ccSubCompanyID VARCHAR(4),
    PdlcID INT,
    plItemID INT,
    plMultiplier DECIMAL(18,4),
    RsmMainLineNo VARCHAR(12),
    PercentHrsOnOT DECIMAL(18,4),
    MultiplierForOTRate DECIMAL(18,4),
    AssMhrsPunit DOUBLE,
    AssEqDaysPunit DOUBLE,
    OldComponentID INT,
    OldComponent2ID INT,
    FOREIGN KEY (ElineID) REFERENCES Elines(ElineID) ON DELETE CASCADE,
    FOREIGN KEY (Component2ID) REFERENCES Components(ComponentID) ON DELETE CASCADE
);

-- Table 16: CrewEquip
CREATE TABLE CrewEquip (
    CrewEquipID INT PRIMARY KEY,
    CrewID INT,
    EquipQty DECIMAL(18,4),
    MEquipID INT,
    FOREIGN KEY (CrewID) REFERENCES Crews(CrewID) ON DELETE CASCADE,
    FOREIGN KEY (MEquipID) REFERENCES MasterEquip(MEquipID) ON DELETE CASCADE
);

-- Table 17: Crews
CREATE TABLE Crews (
    CrewID INT PRIMARY KEY,
    CrewName VARCHAR(40),
    RsMeans BOOLEAN
);

-- Table 18: CrewTrades
CREATE TABLE CrewTrades (
    CrewTradesID INT PRIMARY KEY,
    CrewID INT,
    TradeQty DECIMAL(18,4),
    MTradeID INT,
    FOREIGN KEY (CrewID) REFERENCES Crews(CrewID) ON DELETE CASCADE,
    FOREIGN KEY (MTradeID) REFERENCES MasterTrades(MTradeID) ON DELETE CASCADE
);

-- Table 19: CsiDistributions
CREATE TABLE CsiDistributions (
    DistributionID INT PRIMARY KEY,
    CsiLineID INT,
    ZoneID INT,
    Distribution DECIMAL(18,4),
    FOREIGN KEY (CsiLineID) REFERENCES CsiLines(CsiLineID) ON DELETE CASCADE,
    FOREIGN KEY (ZoneID) REFERENCES Zone(ZoneID) ON DELETE CASCADE
);

-- Table 20: CsiLines
CREATE TABLE CsiLines (
    CsiLineID INT PRIMARY KEY,
    EstimateID INT,
    CsiNo VARCHAR(12),
    CsiDescription VARCHAR(30),
    CsiEstimator VARCHAR(15),
    Override1 DECIMAL(18,4),
    Override2 DECIMAL(18,4),
    Override1Desc VARCHAR(13),
    Override2Desc VARCHAR(13),
    Sub1Name VARCHAR(13),
    Sub2Name VARCHAR(13),
    Sub3Name VARCHAR(13),
    Sub4Name VARCHAR(13),
    Sub5Name VARCHAR(13),
    Sub6Name VARCHAR(13),
    Sub7Name VARCHAR(13),
    Sub8Name VARCHAR(13),
    Sub9Name VARCHAR(13),
    Sub10Name VARCHAR(13),
    cCodeOR1 VARCHAR(20),
    cCodeOR2 VARCHAR(20),
    ccDescriptionOR1 VARCHAR(40),
    ccDescriptionOR2 VARCHAR(40),
    ccCompanyOR1ID VARCHAR(4),
    ccCompanyOR2ID VARCHAR(4),
    CsiNoNew VARCHAR(12),
    FOREIGN KEY (EstimateID) REFERENCES EstimateNos(EstimateID) ON DELETE CASCADE,
    FOREIGN KEY (ccCompanyOR1ID) REFERENCES ccCompany(CompanyID)
);

-- Table 21: DbList
CREATE TABLE DbList (
    dbEstimateID INT PRIMARY KEY,
    PrimaryDb BOOLEAN,
    LabMF FLOAT,
    EqMF FLOAT,
    MatMF FLOAT,
    SubMF FLOAT,
    MatchScreen_ExportDbID INT,
    MatchScreen_ExistingDbID INT
);

-- Table 22: Elines
CREATE TABLE Elines (
    ElineID INT PRIMARY KEY,
    CsiLineID INT,
    ZoneID INT,
    ElineNo INT,
    ElineDescription VARCHAR(80),
    ElineQty DECIMAL(18,4),
    ElineUnit VARCHAR(6),
    UnitL DECIMAL(18,4),
    UnitM DECIMAL(18,4),
    UnitS DECIMAL(18,4),
    Con1 DECIMAL(18,4),
    Con2 DECIMAL(18,4),
    Con3 DECIMAL(18,4),
    Con1Label VARCHAR(18),
    Con2Label VARCHAR(18),
    Con3Label VARCHAR(18),
    Tqty1Label VARCHAR(18),
    Tqty2Label VARCHAR(18),
    Tqty3Label VARCHAR(18),
    Tqty4Label VARCHAR(18),
    Tqty5Label VARCHAR(18),
    SeeTakeoff BOOLEAN,
    SeeComponents BOOLEAN,
    TaxL BOOLEAN,
    TaxM BOOLEAN,
    TaxS BOOLEAN,
    Check BOOLEAN,
    TaxE BOOLEAN,
    UnitE DECIMAL(18,4),
    DailyOutput DECIMAL(18,4),
    DailyLabCost DECIMAL(18,4),
    DailyEqCost DECIMAL(18,4),
    CrewID INT,
    TradeQty DECIMAL(18,4),
    EquipQty DECIMAL(18,4),
    MTradeID INT,
    MEquipID INT,
    SeeDetails BOOLEAN,
    Divider DECIMAL(18,4),
    ccLab VARCHAR(20),
    ccEquip VARCHAR(20),
    ccMat VARCHAR(20),
    ccSub VARCHAR(20),
    ccLabDesc VARCHAR(40),
    ccEquipDesc VARCHAR(40),
    ccMatDesc VARCHAR(40),
    ccSubDesc VARCHAR(40),
    ccLabCompanyID VARCHAR(4),
    ccEquipCompanyID VARCHAR(4),
    ccMatCompanyID VARCHAR(4),
    ccSubCompanyID VARCHAR(4),
    PdlcID INT,
    plItemID INT,
    plMultiplier DECIMAL(18,4),
    rsmMainLineNo VARCHAR(12),
    PercentHrsOnOT DECIMAL(18,4),
    MultiplierForOTRate DECIMAL(18,4),
    AssMhrsPunit DOUBLE,
    AssEqDaysPunit DOUBLE,
    FOREIGN KEY (CsiLineID) REFERENCES CsiLines(CsiLineID) ON DELETE CASCADE,
    FOREIGN KEY (ZoneID) REFERENCES Zone(ZoneID) ON DELETE CASCADE,
    FOREIGN KEY (ccLabCompanyID) REFERENCES ccCompany(CompanyID)
);

-- Table 23: EquipCosts
CREATE TABLE EquipCosts (
    EquipCostID INT PRIMARY KEY,
    MEquipID INT,
    CityID INT,
    EquipDailyOperCost DECIMAL(18,4),
    EquipDailyCost DECIMAL(18,4),
    FOREIGN KEY (MEquipID) REFERENCES MasterEquip(MEquipID) ON DELETE CASCADE,
    FOREIGN KEY (CityID) REFERENCES Cities(CityID) ON DELETE CASCADE
);

-- Table 24: EquipSubDiv
CREATE TABLE EquipSubDiv (
    EquipSubDivID INT PRIMARY KEY,
    EquipSubDivName VARCHAR(40),
    EquipKey VARCHAR(10)
);

-- Table 25: EstimateNos
CREATE TABLE EstimateNos (
    EstimateID INT PRIMARY KEY,
    EstimateNo VARCHAR(20),
    ClientID INT,
    ProjectName VARCHAR(80),
    ProjectDescription TEXT,
    EstimateDescription VARCHAR(60),
    EstimateDate DATETIME,
    Estimator VARCHAR(15),
    WageIncrease DECIMAL(18,4),
    TaxPercent DECIMAL(18,4),
    OwnersProtectiveRateM DECIMAL(18,4),
    BuildersRiskRateM DECIMAL(18,4),
    LiquidatedDamages DECIMAL(18,4),
    Permit DECIMAL(18,4),
    BondSubs DECIMAL(18,4),
    InterestOnRetainage DECIMAL(18,4),
    MarkupLumpSum DECIMAL(18,4),
    MarkupPercent DECIMAL(18,4),
    BondRequired BOOLEAN,
    GenLiabilityRateM DECIMAL(18,4),
    FinalQuote DECIMAL(18,4),
    SquareFeet DECIMAL(18,4),
    DispSFSummary BOOLEAN,
    DispSFDetail BOOLEAN,
    MarkupFA DECIMAL(18,4),
    BondFA DECIMAL(18,4),
    GenLiabilityFA DECIMAL(18,4),
    Comments TEXT,
    SetDefTaxL BOOLEAN,
    SetDefTaxM BOOLEAN,
    SetDefTaxS BOOLEAN,
    OverrideTaxable DECIMAL(18,4),
    CkPermit BOOLEAN,
    CkLiqDam BOOLEAN,
    CkBonds BOOLEAN,
    CkIntOnRet BOOLEAN,
    CkWageIncr BOOLEAN,
    SetDefTaxE BOOLEAN,
    EstimateLocked BOOLEAN,
    LockedBy VARCHAR(10),
    DbUsedID INT,
    DbZoneID INT,
    LabCityUsedID INT,
    RsmCityMethod INT,
    RsmCciCity VARCHAR(16),
    RsmCciState VARCHAR(2),
    DisCsiNoNew BOOLEAN,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID) ON DELETE CASCADE
);

-- Table 26: hcItems
CREATE TABLE hcItems (
    ItemID INT PRIMARY KEY,
    ProjectID INT,
    ItemDesc VARCHAR(40),
    Amount INT,
    Qty INT,
    CsiNo VARCHAR(20),
    Unit VARCHAR(20),
    Contractor VARCHAR(20),
    Detail VARCHAR(30),
    CostCode VARCHAR(15),
    CopyColumn VARCHAR(1),
    TotalHrs INT,
    CsiNoNew VARCHAR(12),
    FOREIGN KEY (ProjectID) REFERENCES hcProjects(ProjectID) ON DELETE CASCADE
);

-- Table 27: hcProjects
CREATE TABLE hcProjects (
    ProjectID INT PRIMARY KEY,
    Client VARCHAR(50),
    Project VARCHAR(50),
    JobNo VARCHAR(10),
    YrStarted INT,
    SFNew INT,
    SFRen INT,
    SFTotal INT,
    PTIncTot INT,
    Arch INT,
    Borings INT,
    FFE INT,
    Land INT,
    Financing INT,
    Contingency INT,
    TotIncidentals INT,
    BidsWOinc INT,
    Building INT,
    Site INT,
    Plumbing INT,
    FireProt INT,
    PlumFP INT,
    HVAC INT,
    Electric INT,
    CMstaff INT,
    Public BOOLEAN,
    CityState VARCHAR(50)
);

-- Table 28: hcYears
CREATE TABLE hcYears (
    YearID INT PRIMARY KEY,
    Year INT,
    InflationPercent DECIMAL(18,4)
);

-- Table 29: Labels
CREATE TABLE Labels (
    LabelID INT PRIMARY KEY,
    LabelName VARCHAR(25),
    Con1 DECIMAL(18,4),
    Con2 DECIMAL(18,4),
    Con3 DECIMAL(18,4),
    Con1Label VARCHAR(18),
    Con2Label VARCHAR(18),
    Con3Label VARCHAR(18),
    Tqty1Label VARCHAR(18),
    Tqty2Label VARCHAR(18),
    Tqty3Label VARCHAR(18),
    Tqty4Label VARCHAR(18),
    Tqty5Label VARCHAR(18)
);

-- Table 30: License
CREATE TABLE License (
    LicenseID INT PRIMARY KEY,
    License TEXT,
    Agree BOOLEAN
);

-- Table 31: MasterEquip
CREATE TABLE MasterEquip (
    MEquipID INT PRIMARY KEY,
    MEquipName VARCHAR(80),
    RsmEquipKey VARCHAR(12),
    SubDivEquipKey VARCHAR(12)
);

-- Table 32: MasterTrades
CREATE TABLE MasterTrades (
    MTradeID INT PRIMARY KEY,
    MTradeName VARCHAR(50),
    RsmTradeKey VARCHAR(10)
);

-- Table 33: MyCompanyGlob
CREATE TABLE MyCompanyGlob (
    MyCompanyID INT PRIMARY KEY,
    MyCompanyName1 VARCHAR(50),
    MyCompanyName2 VARCHAR(50),
    MyCompStreet1 VARCHAR(50),
    MyCompStreet2 VARCHAR(50),
    MyCompCity VARCHAR(50),
    MyCompState VARCHAR(50),
    MyCompZip VARCHAR(15),
    MyCompPhone VARCHAR(25),
    MyCompFax VARCHAR(25),
    BuildersRiskRateK DECIMAL(18,4),
    GenLiabilityRateK DECIMAL(18,4),
    OwnersProtectRateK DECIMAL(18,4),
    BondRange1L DECIMAL(18,4),
    BondRange1H DECIMAL(18,4),
    BondRange1Rate DECIMAL(18,4),
    BondRange2L DECIMAL(18,4),
    BondRange2H DECIMAL(18,4),
    BondRange2Rate DECIMAL(18,4),
    BondRange3L DECIMAL(18,4),
    BondRange3H DECIMAL(18,4),
    BondRange3Rate DECIMAL(18,4),
    BondRange4L DECIMAL(18,4),
    BondRange4H DECIMAL(18,4),
    BondRange4Rate DECIMAL(18,4),
    BondRange5L DECIMAL(18,4),
    BondRange5H DECIMAL(18,4),
    BondRange5Rate DECIMAL(18,4),
    BondRange6L DECIMAL(18,4),
    BondRange6H DECIMAL(18,4),
    BondRange6Rate DECIMAL(18,4),
    defClientTemplateID INT,
    defEstimateTemplateID INT,
    defCsiLineID INT,
    defZoneID INT,
    lastClientTemplateID INT,
    lastEstimateTemplateID INT,
    lastCsiLineID INT,
    lastZoneID INT,
    DesignStatus VARCHAR(60),
    ProjectDescription TEXT,
    Estimator VARCHAR(15),
    WorkersCompMethod INT,
    RsmCityMethod INT,
    RsmCciCity VARCHAR(16),
    RsmCciState VARCHAR(2),
    LabCityUsedID INT,
    Compact_on VARCHAR(7),
    DisCsiNoNew BOOLEAN,
    DuplicatingRecords BOOLEAN
);

-- Table 34: MyFormulas
CREATE TABLE MyFormulas (
    myFormulasID INT PRIMARY KEY,
    Description VARCHAR(60),
    myFormula VARCHAR(250),
    LineNo INT
);

-- Table 35: PCs
CREATE TABLE PCs (
    PcID INT PRIMARY KEY,
    PcName VARCHAR(20),
    PcCode INT,
    Administrator BOOLEAN,
    C1PcBookCode INT,
    C2PcBookCode INT,
    C3PcBookCode INT,
    C4PcBookCode INT,
    C5PcBookCode INT,
    C6PcBookCode INT,
    C7PcBookCode INT,
    C8PcBookCode INT,
    C9PcBookCode INT,
    C10PcBookCode INT,
    NoMessage BOOLEAN
);

-- Table 36: plHeadings
CREATE TABLE plHeadings (
    plHeadingID INT PRIMARY KEY,
    Heading VARCHAR(40),
    HOrderNo INT,
    CsiLineID INT,
    FOREIGN KEY (CsiLineID) REFERENCES CsiLines(CsiLineID) ON DELETE CASCADE
);

-- Table 37: plItems
CREATE TABLE plItems (
    plItemID INT PRIMARY KEY,
    plHeadingID INT,
    Description VARCHAR(50),
    OrderNo INT,
    Unit VARCHAR(6),
    ListPrice DECIMAL(18,4),
    FOREIGN KEY (plHeadingID) REFERENCES plHeadings(plHeadingID) ON DELETE CASCADE
);

-- Table 38: plMultipliers
CREATE TABLE plMultipliers (
    plMultiplierID INT PRIMARY KEY,
    dbEstimateID INT,
    plItemID INT,
    Multiplier DECIMAL(18,4),
    FOREIGN KEY (dbEstimateID) REFERENCES EstimateNos(EstimateID),
    FOREIGN KEY (plItemID) REFERENCES plItems(plItemID) ON DELETE CASCADE
);

-- Table 39: SubLines
CREATE TABLE SubLines (
    SubLinesID INT PRIMARY KEY,
    CsiLineID INT,
    Item VARCHAR(20),
    Sub1 VARCHAR(250),
    Sub2 VARCHAR(250),
    Sub3 VARCHAR(250),
    Sub4 VARCHAR(250),
    Sub5 VARCHAR(250),
    Sub6 VARCHAR(250),
    Sub7 VARCHAR(250),
    Sub8 VARCHAR(250),
    Sub9 VARCHAR(250),
    Sub10 DECIMAL(18,4),
    FOREIGN KEY (CsiLineID) REFERENCES CsiLines(CsiLineID) ON DELETE CASCADE
);

-- Table 40: Tlines
CREATE TABLE Tlines (
    TlineID INT PRIMARY KEY,
    ElineID INT,
    Tqty1 DECIMAL(18,4),
    Tqty2 DECIMAL(18,4),
    Tqty3 DECIMAL(18,4),
    Tqty4 DECIMAL(18,4),
    Tqty5 DECIMAL(18,4),
    Tcomment VARCHAR(18),
    TlineNo INT,
    FOREIGN KEY (ElineID) REFERENCES Elines(ElineID) ON DELETE CASCADE
);

-- Table 41: TradeCosts
CREATE TABLE TradeCosts (
    TradeCostID INT PRIMARY KEY,
    MTradeID INT,
    CityID INT,
    TradeBaseCost DECIMAL(18,4),
    TradeWCp DECIMAL(18,4),
    TradePTp DECIMAL(18,4),
    HrsPerDay DECIMAL(18,4),
    FOREIGN KEY (MTradeID) REFERENCES MasterTrades(MTradeID) ON DELETE CASCADE,
    FOREIGN KEY (CityID) REFERENCES Cities(CityID) ON DELETE CASCADE
);

-- Table 42: Zone
CREATE TABLE Zone (
    ZoneID INT PRIMARY KEY,
    ZoneName VARCHAR(15),
    EstimateID INT,
    TempZoneID INT,
    TempZoneName VARCHAR(15),
    LineNo INT,
    SF INT,
    FOREIGN KEY (EstimateID) REFERENCES EstimateNos(EstimateID) ON DELETE CASCADE
);

-- Table 43: Crews (repeated in file, defined earlier)
-- Already included as Table 17; no additional definition needed here