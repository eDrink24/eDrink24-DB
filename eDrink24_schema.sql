DROP TABLE IF EXISTS `POINTDETAILS`;
DROP TABLE IF EXISTS `REVIEWS`;
DROP TABLE IF EXISTS `ORDERHISTORY`;
DROP TABLE IF EXISTS `ORDERS`;
DROP TABLE IF EXISTS `PRODUCTIMAGE`;
DROP TABLE IF EXISTS `basketItem`;
DROP TABLE IF EXISTS `basket`;
DROP TABLE IF EXISTS `INVENTORY`;
DROP TABLE IF EXISTS `dibs`;
DROP TABLE IF EXISTS `coupon`;
DROP TABLE IF EXISTS `STORE`;
DROP TABLE IF EXISTS `CUSTOMER`;
DROP TABLE IF EXISTS `Product`;
DROP TABLE IF EXISTS `PROMOTIONS`;

-- 테이블 생성
CREATE TABLE CUSTOMER (
    `userId` INT NOT NULL AUTO_INCREMENT,
    `userName` VARCHAR(20) NOT NULL,
    `gender` ENUM('남','여') NOT NULL DEFAULT '남',
    `loginId` VARCHAR(50) NOT NULL UNIQUE,
    `pw` VARCHAR(100) NOT NULL UNIQUE,
    `birthdate` DATETIME NOT NULL,
    `phoneNum` VARCHAR(20) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `postalCode` VARCHAR(50) NOT NULL,
    `address1` VARCHAR(20) NOT NULL,
    `address2` VARCHAR(20) NOT NULL,
    `currentLocation` VARCHAR(50) NULL,
    `currentStore` VARCHAR(50) NULL,
    `totalPoint` INT NOT NULL DEFAULT 0,
    `role` VARCHAR(20) NOT NULL DEFAULT '일반회원',
    `linkedId` BIGINT NULL,
    PRIMARY KEY (`userId`)
);

CREATE TABLE PROMOTIONS (
    `promotionId` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `contentImage` VARCHAR(255) NOT NULL,
    `startDate` TIMESTAMP NOT NULL,
    `endDate` TIMESTAMP NOT NULL,
    PRIMARY KEY (`promotionId`)
);

CREATE TABLE PRODUCT (
    `productId` INT NOT NULL AUTO_INCREMENT,
    `productName` VARCHAR(30) NOT NULL,
    `category1` VARCHAR(30) NOT NULL,
    `category2` VARCHAR(30) NULL,
    `promotionId` INT NULL,
    `price` INT NOT NULL DEFAULT 0,
    `defaultImage` VARCHAR(255) NULL,
    `countDibs` INT NOT NULL DEFAULT 0,
    `isCoupon` BOOLEAN NOT NULL DEFAULT FALSE,
    `isPoint` BOOLEAN NOT NULL DEFAULT FALSE,
    `enrollDate` TIMESTAMP NULL,
    PRIMARY KEY (`productId`),
    FOREIGN KEY (`promotionId`) REFERENCES `PROMOTIONS`(`promotionId`)
);

CREATE TABLE STORE (
    `storeId` INT NOT NULL AUTO_INCREMENT,
    `storeName` VARCHAR(50) NOT NULL,
    `storeAddress` VARCHAR(100) NOT NULL,
    `storePhoneNum` VARCHAR(50) NULL,
    PRIMARY KEY (`storeId`)
);

CREATE TABLE DIBS (
    `DibsId` INT NOT NULL AUTO_INCREMENT,
    `userId` INT NOT NULL,
    `productId` INT NOT NULL,
    PRIMARY KEY (`DibsId`),
    FOREIGN KEY (`userId`) REFERENCES `CUSTOMER`(`userId`),
    FOREIGN KEY (`productId`) REFERENCES `Product`(`productId`)
);

CREATE TABLE INVENTORY (
    `inventoryId` INT NOT NULL AUTO_INCREMENT,
    `storeId` INT NOT NULL,
    `productId` INT NOT NULL,
    `quantity` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`inventoryId`),
    FOREIGN KEY (`storeId`) REFERENCES `STORE`(`storeId`),
    FOREIGN KEY (`productId`) REFERENCES `Product`(`productId`)
);

CREATE TABLE ORDERS (
    `ordersId` INT NOT NULL AUTO_INCREMENT,
    `storeId` INT NOT NULL,
    `userId` INT NOT NULL,
    `productId` INT NOT NULL,
    `orderDate` TIMESTAMP NOT NULL,
    `pickupDate` TIMESTAMP NOT NULL,
    `isCompleted` BOOLEAN NOT NULL DEFAULT FALSE,
    `orderStatus` VARCHAR(20) NOT NULL DEFAULT 'ORDERED',
    PRIMARY KEY (`ordersId`),
    FOREIGN KEY (`storeId`) REFERENCES `STORE`(`storeId`),
    FOREIGN KEY (`userId`) REFERENCES `CUSTOMER`(`userId`),
    FOREIGN KEY (`productId`) REFERENCES `Product`(`productId`)
);

CREATE TABLE COUPON (
    `couponId` INT NOT NULL AUTO_INCREMENT,
    `userId` INT NOT NULL DEFAULT 0,
    `discountAmount` INT NULL,
    `issueDate` TIMESTAMP NOT NULL,
    `endDate` TIMESTAMP NOT NULL,
    `useDate` DATETIME NULL,
    `used` BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`couponId`),
    FOREIGN KEY (`userId`) REFERENCES `CUSTOMER`(`userId`)
);

CREATE TABLE POINTDETAILS (
    `pointDetailsId` INT NOT NULL AUTO_INCREMENT,
    `ordersId` INT NOT NULL,
    `saveDate` TIMESTAMP NOT NULL,
    `point` INT NOT NULL,
    PRIMARY KEY (`pointDetailsId`),
    FOREIGN KEY (`ordersId`) REFERENCES `ORDERS`(`ordersId`)
);

CREATE TABLE BASKET (
    basketId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL    
);

CREATE TABLE BASKETITEM (
    itemId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    basketId INT,
    productId INT NOT NULL,
    defaultImage VARCHAR(255) NULL,
    productName VARCHAR(255) NOT NULL,
    price INT NULL DEFAULT 0,
    basketQuantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (basketId) REFERENCES basket(basketId)
);

CREATE TABLE PRODUCTIMAGE (
    `productImageId` INT NOT NULL AUTO_INCREMENT,
    `productId` INT NOT NULL,
    `detailImage` VARCHAR(255) NULL,
    PRIMARY KEY (`productImageId`),
    FOREIGN KEY (`productId`) REFERENCES `Product`(`productId`)
);

CREATE TABLE REVIEWS (
    `reviewsId` INT NOT NULL AUTO_INCREMENT,
    `ordersId` INT NOT NULL,
    `content` VARCHAR(255) NULL,
    `enrolledDate` TIMESTAMP NOT NULL,
    `modifiedDate` TIMESTAMP NULL,
    `reviewImage` VARCHAR(255) NULL,
    `rating` INT NULL DEFAULT 1,
    `sugarRating` INT NULL DEFAULT 1,
    `acidityRating` INT NULL DEFAULT 1,
    `throatRating` INT NULL DEFAULT 1,
    PRIMARY KEY (`reviewsId`),
    FOREIGN KEY (`ordersId`) REFERENCES `ORDERS`(`ordersId`)
);

CREATE TABLE ORDERHISTORY (
    `historyId` INT NOT NULL AUTO_INCREMENT,
    `ordersId` INT NOT NULL,
    `changeStatus` VARCHAR(20) NOT NULL DEFAULT 'ORDERED',
    `changeDate` TIMESTAMP NULL,
    PRIMARY KEY (`historyId`),
    FOREIGN KEY (`ordersId`) REFERENCES `ORDERS`(`ordersId`)
);