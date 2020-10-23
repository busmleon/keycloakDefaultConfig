-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 35.198.130.32    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('079d8b4f-a17c-46ae-806b-230dcb684001',NULL,'registration-password-action','master','b70b33e7-fd82-40de-824b-1b8d4bc14fbf',0,50,_binary '\0',NULL,NULL),('0a27c567-0220-4505-bc21-f30e0d353a68',NULL,NULL,'APP_REALM','b1e7a92d-6213-4d9b-af04-e82cd1ab94f9',1,40,_binary '','3882bd53-4cfb-4d18-9a67-2242b74ec47c',NULL),('0b5d0c9f-1271-4d45-afb2-076851a27080',NULL,'conditional-user-configured','master','63741a66-12d3-4107-bdb3-fb47b245b809',0,10,_binary '\0',NULL,NULL),('153736e5-4bc0-416a-937c-0dbf5f43b418',NULL,NULL,'APP_REALM','fc2c77eb-5e8d-4344-a408-a4dce9faf018',2,30,_binary '','ee4d9169-cfef-44cb-9578-eb2d28cfd6fc',NULL),('1629d253-4af8-4dd6-95b6-6fa97ac9d2e1',NULL,'registration-recaptcha-action','APP_REALM','bdc6cfb8-56b3-4da0-84b9-7945994abbd3',3,60,_binary '\0',NULL,NULL),('168b17cf-6916-425a-878b-edcc4eb4207d',NULL,'auth-otp-form','master','63741a66-12d3-4107-bdb3-fb47b245b809',0,20,_binary '\0',NULL,NULL),('17fbf2b0-b751-4947-90c6-d93c3c346203',NULL,'client-x509','APP_REALM','846bcdc0-558d-4456-a352-da7ecadc243d',2,40,_binary '\0',NULL,NULL),('19387a0e-27db-4904-af95-aae2e5e8d6d9',NULL,'basic-auth-otp','APP_REALM','858556d6-f0db-4801-a06a-d5e85d8de26f',3,20,_binary '\0',NULL,NULL),('1c733357-81e5-4e68-8e85-463938bbaa9b',NULL,'idp-confirm-link','APP_REALM','f49c5b02-2669-434c-8297-1d719e0ad847',0,10,_binary '\0',NULL,NULL),('1d4e3ede-4aff-4686-9470-2a38982a7c4f',NULL,'conditional-user-configured','APP_REALM','3882bd53-4cfb-4d18-9a67-2242b74ec47c',0,10,_binary '\0',NULL,NULL),('24d25a9d-59fe-47ed-b0c8-bed3f387ed46',NULL,NULL,'APP_REALM','577e81ae-83ed-40fb-9e03-916686d3eaf4',1,20,_binary '','f4d29635-db99-4e0e-958b-6cad6156bc01',NULL),('2aa94897-eeb1-4563-848d-1dfed35db729',NULL,NULL,'master','d8931467-b905-41c2-bfc7-fb5a155bcb26',1,40,_binary '','a4015080-4cb0-4fff-8d1b-60bac7587dfd',NULL),('2d9d37fd-27af-4351-9e02-069dbb6efd03',NULL,'idp-email-verification','APP_REALM','dfb5cf31-3300-45c1-86f6-344d2b67d620',2,10,_binary '\0',NULL,NULL),('2d9eb7e0-132c-49e1-b2b9-4d2a50442473',NULL,NULL,'APP_REALM','7ba5e255-fbf8-4a53-91d1-0a02e0234cd0',1,30,_binary '','311b98ae-95a5-454e-aab5-a06349e3ef9d',NULL),('2ee65a90-24cf-471a-b625-165679e2503a',NULL,'idp-review-profile','APP_REALM','3fb21164-ec98-47c4-acf6-d73d9ae048b7',0,10,_binary '\0',NULL,'0dd724a7-78a5-4b94-995d-c022d61154c0'),('2f80b685-6ce7-4978-8954-d54ad7bc4f78',NULL,'client-secret','APP_REALM','846bcdc0-558d-4456-a352-da7ecadc243d',2,10,_binary '\0',NULL,NULL),('30160856-e85d-4c04-bba8-b6db88cae34d',NULL,NULL,'APP_REALM','f49c5b02-2669-434c-8297-1d719e0ad847',0,20,_binary '','dfb5cf31-3300-45c1-86f6-344d2b67d620',NULL),('31707a68-be78-426c-991a-0fc3c313f401',NULL,'conditional-user-configured','APP_REALM','f4d29635-db99-4e0e-958b-6cad6156bc01',0,10,_binary '\0',NULL,NULL),('33ba3511-e1a1-4b97-9263-34aa650f2fa8',NULL,NULL,'master','9eddef6a-c3b0-4367-a80b-2648fc76e0e4',1,20,_binary '','63741a66-12d3-4107-bdb3-fb47b245b809',NULL),('3650202e-3d8d-4ffd-babf-0f9e9b2b0796',NULL,'idp-review-profile','master','1eaf9a33-3635-45df-b155-5b7678e31424',0,10,_binary '\0',NULL,'d668b38d-f1af-4143-9fff-610f3a9113dd'),('38f248b8-fe78-4321-99aa-15fbe7f64a62',NULL,'reset-credential-email','APP_REALM','b1e7a92d-6213-4d9b-af04-e82cd1ab94f9',0,20,_binary '\0',NULL,NULL),('393e583a-1439-4ac7-a957-67554b31c77e',NULL,'auth-otp-form','APP_REALM','f4d29635-db99-4e0e-958b-6cad6156bc01',0,20,_binary '\0',NULL,NULL),('3a532e17-f146-4907-a6bc-ac2aef99528d',NULL,'identity-provider-redirector','APP_REALM','fc2c77eb-5e8d-4344-a408-a4dce9faf018',2,25,_binary '\0',NULL,NULL),('3b153729-2463-4803-a16f-ec735e3f57f9',NULL,'http-basic-authenticator','master','765ea98e-ac86-40ae-9a59-39f61a3fea70',0,10,_binary '\0',NULL,NULL),('3db15d01-6aa5-4896-a05d-076cab4ec386',NULL,'basic-auth-otp','master','c7226461-b028-42c3-b309-fd87c57190b0',3,20,_binary '\0',NULL,NULL),('3f51b60c-2271-49e8-adfd-97e18811f68c',NULL,'client-secret-jwt','master','7bee3332-ddb2-4c7a-badb-8749267a5e61',2,30,_binary '\0',NULL,NULL),('46f47f06-a76f-4d18-8bc7-fa10db5fe043',NULL,'auth-spnego','APP_REALM','858556d6-f0db-4801-a06a-d5e85d8de26f',3,30,_binary '\0',NULL,NULL),('49eb3125-2056-4b01-8aa1-e814e0895737',NULL,'client-jwt','master','7bee3332-ddb2-4c7a-badb-8749267a5e61',2,20,_binary '\0',NULL,NULL),('4b3223ac-3fb9-42c2-adcf-fdfe0139c87f',NULL,'idp-username-password-form','APP_REALM','577e81ae-83ed-40fb-9e03-916686d3eaf4',0,10,_binary '\0',NULL,NULL),('4dc1dfd3-fb93-4c03-90d0-dc9666656202',NULL,'direct-grant-validate-otp','master','16130220-977e-4680-a2e9-5d08a4a358c8',0,20,_binary '\0',NULL,NULL),('4e5ee68e-72cf-4ce4-86c8-96295a381168',NULL,'auth-cookie','APP_REALM','fc2c77eb-5e8d-4344-a408-a4dce9faf018',2,10,_binary '\0',NULL,NULL),('4f452d0d-b998-4376-bb3c-a77c58e4e9f4',NULL,NULL,'master','a0413398-7510-456d-bf5b-925e84a855c5',0,20,_binary '','8f410caf-1f2d-4954-bcc3-809eef9aa838',NULL),('4fa43c51-1210-4214-8249-fabcf19f9640',NULL,NULL,'master','41e26dec-9828-41a9-8576-7ddf866f519c',2,30,_binary '','f5051e4a-2336-4b1d-9df0-38533a4b7b41',NULL),('521938fd-8614-45d9-83ae-af90d51c79a3',NULL,'auth-username-password-form','master','f5051e4a-2336-4b1d-9df0-38533a4b7b41',0,10,_binary '\0',NULL,NULL),('5259248c-0f43-489e-85a0-770966418168',NULL,'auth-spnego','APP_REALM','fc2c77eb-5e8d-4344-a408-a4dce9faf018',3,20,_binary '\0',NULL,NULL),('561de3ef-2f43-41a3-96c3-59096e7f3cce',NULL,'idp-create-user-if-unique','APP_REALM','6ea06461-a1ef-4487-928a-d36e8d1f40e4',2,10,_binary '\0',NULL,'5592a88f-f4c6-4909-89e8-fe4dbb8816af'),('5964d731-846d-4e42-860c-1e43e614d194',NULL,'registration-password-action','APP_REALM','bdc6cfb8-56b3-4da0-84b9-7945994abbd3',0,50,_binary '\0',NULL,NULL),('5c87d80b-f920-49ea-b880-e1711aa2a81f',NULL,NULL,'APP_REALM','dfb5cf31-3300-45c1-86f6-344d2b67d620',2,20,_binary '','577e81ae-83ed-40fb-9e03-916686d3eaf4',NULL),('5ec57dd1-481c-4531-8bfc-cfebe6b5f024',NULL,'basic-auth','APP_REALM','858556d6-f0db-4801-a06a-d5e85d8de26f',0,10,_binary '\0',NULL,NULL),('5f3c7206-71ba-4902-b472-537e1d3d6e58',NULL,'client-x509','master','7bee3332-ddb2-4c7a-badb-8749267a5e61',2,40,_binary '\0',NULL,NULL),('6001a268-e1b5-4b6a-88f6-f1cab06b9f1c',NULL,NULL,'APP_REALM','3fb21164-ec98-47c4-acf6-d73d9ae048b7',0,20,_binary '','6ea06461-a1ef-4487-928a-d36e8d1f40e4',NULL),('6ad0d3c4-d4d0-467a-89cc-642f04c1af30',NULL,'reset-password','APP_REALM','b1e7a92d-6213-4d9b-af04-e82cd1ab94f9',0,30,_binary '\0',NULL,NULL),('6d3832c2-be3a-44c8-b668-f62fd3b8f3b1',NULL,'conditional-user-configured','APP_REALM','311b98ae-95a5-454e-aab5-a06349e3ef9d',0,10,_binary '\0',NULL,NULL),('7548800b-b4ee-4ebb-8eed-a3624114ece1',NULL,'direct-grant-validate-password','APP_REALM','7ba5e255-fbf8-4a53-91d1-0a02e0234cd0',0,20,_binary '\0',NULL,NULL),('7afade47-290c-4e69-8afe-d43b8c8ed69f',NULL,'conditional-user-configured','master','16130220-977e-4680-a2e9-5d08a4a358c8',0,10,_binary '\0',NULL,NULL),('7b175d77-17c4-49d9-b1de-23e27f6b069a',NULL,'docker-http-basic-authenticator','APP_REALM','6aad7605-080b-447e-8068-02a2790058e9',0,10,_binary '\0',NULL,NULL),('7b55de4a-b275-4810-a253-c83f3f3e5aaf',NULL,NULL,'master','8f410caf-1f2d-4954-bcc3-809eef9aa838',2,20,_binary '','9eddef6a-c3b0-4367-a80b-2648fc76e0e4',NULL),('7d387f35-553f-46df-9f01-c14607d16f8c',NULL,'reset-otp','master','a4015080-4cb0-4fff-8d1b-60bac7587dfd',0,20,_binary '\0',NULL,NULL),('7e690b4f-5ffa-4c3e-bb40-ee296e5764ff',NULL,NULL,'master','f5051e4a-2336-4b1d-9df0-38533a4b7b41',1,20,_binary '','e5da8223-1f72-4636-8057-2a7d07ab622a',NULL),('7f092cd1-dcfb-4666-8dfd-a058b8bea908',NULL,'auth-otp-form','master','e5da8223-1f72-4636-8057-2a7d07ab622a',0,20,_binary '\0',NULL,NULL),('7f0a1700-80ff-4ec9-afb1-c6a9e970adbf',NULL,'reset-credential-email','master','d8931467-b905-41c2-bfc7-fb5a155bcb26',0,20,_binary '\0',NULL,NULL),('871e63c0-da4d-4e9d-afb9-39ba3d3a96ef',NULL,NULL,'master','27ca6e7c-e797-4c05-b41c-03c0e8c0b1be',2,20,_binary '','a0413398-7510-456d-bf5b-925e84a855c5',NULL),('8723a6c2-4681-4aaa-9849-02cb961f5a46',NULL,NULL,'APP_REALM','ee4d9169-cfef-44cb-9578-eb2d28cfd6fc',1,20,_binary '','06eb3002-004c-400a-b5de-162a50c1c913',NULL),('876106db-68e8-44b9-a224-7ef55d4682a0',NULL,'auth-otp-form','APP_REALM','06eb3002-004c-400a-b5de-162a50c1c913',0,20,_binary '\0',NULL,NULL),('8f91a86e-bce0-4014-8ee7-5149b9259f41',NULL,'direct-grant-validate-username','APP_REALM','7ba5e255-fbf8-4a53-91d1-0a02e0234cd0',0,10,_binary '\0',NULL,NULL),('90171f1c-6881-4627-b32a-30234cf8e30e',NULL,'client-secret','master','7bee3332-ddb2-4c7a-badb-8749267a5e61',2,10,_binary '\0',NULL,NULL),('9150eb12-acdf-4b6f-9649-9e44d02b38a9',NULL,'registration-user-creation','master','b70b33e7-fd82-40de-824b-1b8d4bc14fbf',0,20,_binary '\0',NULL,NULL),('91a09203-04be-45e2-baca-a981fcac627d',NULL,'auth-username-password-form','APP_REALM','ee4d9169-cfef-44cb-9578-eb2d28cfd6fc',0,10,_binary '\0',NULL,NULL),('91c0a0d0-e3af-4bac-bfe8-3eb12e4b6112',NULL,'client-jwt','APP_REALM','846bcdc0-558d-4456-a352-da7ecadc243d',2,20,_binary '\0',NULL,NULL),('93315258-2923-4253-9078-7a29b8df6b79',NULL,'idp-email-verification','master','8f410caf-1f2d-4954-bcc3-809eef9aa838',2,10,_binary '\0',NULL,NULL),('9c41996c-14eb-408a-ad88-2fe5a31de16e',NULL,'registration-user-creation','APP_REALM','bdc6cfb8-56b3-4da0-84b9-7945994abbd3',0,20,_binary '\0',NULL,NULL),('9db15d8e-4dcc-45b8-9ec0-13728991173b',NULL,'identity-provider-redirector','master','41e26dec-9828-41a9-8576-7ddf866f519c',2,25,_binary '\0',NULL,NULL),('ac59c0ea-b814-450e-88b7-95d77dd9e357',NULL,'auth-spnego','master','c7226461-b028-42c3-b309-fd87c57190b0',3,30,_binary '\0',NULL,NULL),('ad1b580e-9503-4b39-be1e-f1bceae1ce77',NULL,'client-secret-jwt','APP_REALM','846bcdc0-558d-4456-a352-da7ecadc243d',2,30,_binary '\0',NULL,NULL),('b120986e-999b-4db1-90ff-99de2a2349a0',NULL,'registration-profile-action','APP_REALM','bdc6cfb8-56b3-4da0-84b9-7945994abbd3',0,40,_binary '\0',NULL,NULL),('b23f10bd-e2c0-45fe-af3d-9f38a8c6e728',NULL,'conditional-user-configured','master','a4015080-4cb0-4fff-8d1b-60bac7587dfd',0,10,_binary '\0',NULL,NULL),('b41a2596-db50-4952-950e-3bdcf6198638',NULL,'registration-recaptcha-action','master','b70b33e7-fd82-40de-824b-1b8d4bc14fbf',3,60,_binary '\0',NULL,NULL),('b460c8e8-f8bf-4bb3-8bbd-ef22ecf728f4',NULL,'idp-username-password-form','master','9eddef6a-c3b0-4367-a80b-2648fc76e0e4',0,10,_binary '\0',NULL,NULL),('b6e442a6-a233-4e38-9c45-d1d2b274d0b7',NULL,NULL,'master','1eaf9a33-3635-45df-b155-5b7678e31424',0,20,_binary '','27ca6e7c-e797-4c05-b41c-03c0e8c0b1be',NULL),('b768f801-edf0-48fc-ba50-7dd7acc7f484',NULL,'reset-credentials-choose-user','APP_REALM','b1e7a92d-6213-4d9b-af04-e82cd1ab94f9',0,10,_binary '\0',NULL,NULL),('b9ca3b9f-6c19-473c-bea0-950e31d486ae',NULL,NULL,'APP_REALM','6ea06461-a1ef-4487-928a-d36e8d1f40e4',2,20,_binary '','f49c5b02-2669-434c-8297-1d719e0ad847',NULL),('be6240ae-79e0-4e32-b01c-c976c537a4c3',NULL,NULL,'master','37683f86-00b7-4c65-a6f9-f4a10e68be84',0,20,_binary '','c7226461-b028-42c3-b309-fd87c57190b0',NULL),('c67593ea-ea50-4f8c-8993-f7cafbfebdaf',NULL,'conditional-user-configured','master','e5da8223-1f72-4636-8057-2a7d07ab622a',0,10,_binary '\0',NULL,NULL),('cbf3870e-11d8-4c3e-b284-bc36dd191ec7',NULL,'registration-profile-action','master','b70b33e7-fd82-40de-824b-1b8d4bc14fbf',0,40,_binary '\0',NULL,NULL),('cd1fa2d7-1dc0-45c4-8ae0-0b1fa26b5ece',NULL,'reset-otp','APP_REALM','3882bd53-4cfb-4d18-9a67-2242b74ec47c',0,20,_binary '\0',NULL,NULL),('d1430477-8b6d-4e00-beb9-f75a97370a80',NULL,'docker-http-basic-authenticator','master','f6595d4e-b7d1-42b5-b626-92c66b0d59e2',0,10,_binary '\0',NULL,NULL),('d19885c8-05f7-4a07-b264-52f792f4beb4',NULL,'no-cookie-redirect','master','37683f86-00b7-4c65-a6f9-f4a10e68be84',0,10,_binary '\0',NULL,NULL),('d1a9b5cc-e551-49c7-ba87-145d8054622f',NULL,'idp-confirm-link','master','a0413398-7510-456d-bf5b-925e84a855c5',0,10,_binary '\0',NULL,NULL),('d5a8aa94-0acd-4a7a-9c1f-15e4aded6635',NULL,'basic-auth','master','c7226461-b028-42c3-b309-fd87c57190b0',0,10,_binary '\0',NULL,NULL),('d7a8a988-9d2d-4f47-8558-ebf9590ec233',NULL,'direct-grant-validate-password','master','eee2569d-7fd8-4b7a-940a-bb6687647f3f',0,20,_binary '\0',NULL,NULL),('d87a6c9e-8470-4569-b053-21d58f45dc03',NULL,'auth-spnego','master','41e26dec-9828-41a9-8576-7ddf866f519c',3,20,_binary '\0',NULL,NULL),('d8c74b9a-1ee5-4fc2-bbd3-28cd1e6a43a6',NULL,NULL,'APP_REALM','908bfea6-22d7-45c0-9945-92507bc371c1',0,20,_binary '','858556d6-f0db-4801-a06a-d5e85d8de26f',NULL),('d8e2ae5b-2c6f-453a-bfd1-75c7671f9e49',NULL,'registration-page-form','APP_REALM','72e75eca-7836-4dc9-9bdf-ba41d604a863',0,10,_binary '','bdc6cfb8-56b3-4da0-84b9-7945994abbd3',NULL),('da079e47-a261-4239-9117-da12e85d5be9',NULL,'reset-credentials-choose-user','master','d8931467-b905-41c2-bfc7-fb5a155bcb26',0,10,_binary '\0',NULL,NULL),('dfe17e27-5ad9-41a4-a445-a62cd47902e3',NULL,'registration-page-form','master','7bd40b08-a155-4a74-9942-4936f6646bc0',0,10,_binary '','b70b33e7-fd82-40de-824b-1b8d4bc14fbf',NULL),('ea9077c4-5ccc-4c60-b683-14bff49b5344',NULL,'no-cookie-redirect','APP_REALM','908bfea6-22d7-45c0-9945-92507bc371c1',0,10,_binary '\0',NULL,NULL),('ed403180-6f1c-442e-9577-c5e7d555ff42',NULL,'conditional-user-configured','APP_REALM','06eb3002-004c-400a-b5de-162a50c1c913',0,10,_binary '\0',NULL,NULL),('f11c39a2-d9e1-4fdf-b03d-8efcfb06118e',NULL,'direct-grant-validate-otp','APP_REALM','311b98ae-95a5-454e-aab5-a06349e3ef9d',0,20,_binary '\0',NULL,NULL),('f11d417e-ac3e-4b16-84c7-79cbd9508f76',NULL,NULL,'master','eee2569d-7fd8-4b7a-940a-bb6687647f3f',1,30,_binary '','16130220-977e-4680-a2e9-5d08a4a358c8',NULL),('f4e23329-ed3c-4349-81ec-9e9b4afb768e',NULL,'idp-create-user-if-unique','master','27ca6e7c-e797-4c05-b41c-03c0e8c0b1be',2,10,_binary '\0',NULL,'49c885c9-0cd5-4d37-bfee-d1c6c9082aad'),('f547201a-0c1c-4f4b-bebe-31edfe478b76',NULL,'reset-password','master','d8931467-b905-41c2-bfc7-fb5a155bcb26',0,30,_binary '\0',NULL,NULL),('f5f2a531-2c7f-4972-a830-1110fa373332',NULL,'direct-grant-validate-username','master','eee2569d-7fd8-4b7a-940a-bb6687647f3f',0,10,_binary '\0',NULL,NULL),('fde7e5c2-136c-4dd2-a012-f97ef8dca73e',NULL,'http-basic-authenticator','APP_REALM','dcd899c8-02ed-4fe4-8a0a-73723e6d31dc',0,10,_binary '\0',NULL,NULL),('ffcc926f-efc3-4ac4-9073-a837e361b4d3',NULL,'auth-cookie','master','41e26dec-9828-41a9-8576-7ddf866f519c',2,10,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('06eb3002-004c-400a-b5de-162a50c1c913','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','APP_REALM','basic-flow',_binary '\0',_binary ''),('16130220-977e-4680-a2e9-5d08a4a358c8','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('1eaf9a33-3635-45df-b155-5b7678e31424','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('27ca6e7c-e797-4c05-b41c-03c0e8c0b1be','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('311b98ae-95a5-454e-aab5-a06349e3ef9d','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','APP_REALM','basic-flow',_binary '\0',_binary ''),('37683f86-00b7-4c65-a6f9-f4a10e68be84','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('3882bd53-4cfb-4d18-9a67-2242b74ec47c','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','APP_REALM','basic-flow',_binary '\0',_binary ''),('3fb21164-ec98-47c4-acf6-d73d9ae048b7','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','APP_REALM','basic-flow',_binary '',_binary ''),('41e26dec-9828-41a9-8576-7ddf866f519c','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('577e81ae-83ed-40fb-9e03-916686d3eaf4','Verify Existing Account by Re-authentication','Reauthentication of existing account','APP_REALM','basic-flow',_binary '\0',_binary ''),('63741a66-12d3-4107-bdb3-fb47b245b809','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('6aad7605-080b-447e-8068-02a2790058e9','docker auth','Used by Docker clients to authenticate against the IDP','APP_REALM','basic-flow',_binary '',_binary ''),('6ea06461-a1ef-4487-928a-d36e8d1f40e4','User creation or linking','Flow for the existing/non-existing user alternatives','APP_REALM','basic-flow',_binary '\0',_binary ''),('72e75eca-7836-4dc9-9bdf-ba41d604a863','registration','registration flow','APP_REALM','basic-flow',_binary '',_binary ''),('765ea98e-ac86-40ae-9a59-39f61a3fea70','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('7ba5e255-fbf8-4a53-91d1-0a02e0234cd0','direct grant','OpenID Connect Resource Owner Grant','APP_REALM','basic-flow',_binary '',_binary ''),('7bd40b08-a155-4a74-9942-4936f6646bc0','registration','registration flow','master','basic-flow',_binary '',_binary ''),('7bee3332-ddb2-4c7a-badb-8749267a5e61','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('846bcdc0-558d-4456-a352-da7ecadc243d','clients','Base authentication for clients','APP_REALM','client-flow',_binary '',_binary ''),('858556d6-f0db-4801-a06a-d5e85d8de26f','Authentication Options','Authentication options.','APP_REALM','basic-flow',_binary '\0',_binary ''),('8f410caf-1f2d-4954-bcc3-809eef9aa838','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('908bfea6-22d7-45c0-9945-92507bc371c1','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','APP_REALM','basic-flow',_binary '',_binary ''),('9eddef6a-c3b0-4367-a80b-2648fc76e0e4','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('a0413398-7510-456d-bf5b-925e84a855c5','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('a4015080-4cb0-4fff-8d1b-60bac7587dfd','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('b1e7a92d-6213-4d9b-af04-e82cd1ab94f9','reset credentials','Reset credentials for a user if they forgot their password or something','APP_REALM','basic-flow',_binary '',_binary ''),('b70b33e7-fd82-40de-824b-1b8d4bc14fbf','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('bdc6cfb8-56b3-4da0-84b9-7945994abbd3','registration form','registration form','APP_REALM','form-flow',_binary '\0',_binary ''),('c7226461-b028-42c3-b309-fd87c57190b0','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('d8931467-b905-41c2-bfc7-fb5a155bcb26','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('dcd899c8-02ed-4fe4-8a0a-73723e6d31dc','saml ecp','SAML ECP Profile Authentication Flow','APP_REALM','basic-flow',_binary '',_binary ''),('dfb5cf31-3300-45c1-86f6-344d2b67d620','Account verification options','Method with which to verity the existing account','APP_REALM','basic-flow',_binary '\0',_binary ''),('e5da8223-1f72-4636-8057-2a7d07ab622a','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('ee4d9169-cfef-44cb-9578-eb2d28cfd6fc','forms','Username, password, otp and other auth forms.','APP_REALM','basic-flow',_binary '\0',_binary ''),('eee2569d-7fd8-4b7a-940a-bb6687647f3f','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('f49c5b02-2669-434c-8297-1d719e0ad847','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','APP_REALM','basic-flow',_binary '\0',_binary ''),('f4d29635-db99-4e0e-958b-6cad6156bc01','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','APP_REALM','basic-flow',_binary '\0',_binary ''),('f5051e4a-2336-4b1d-9df0-38533a4b7b41','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('f6595d4e-b7d1-42b5-b626-92c66b0d59e2','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('fc2c77eb-5e8d-4344-a408-a4dce9faf018','browser','browser based authentication','APP_REALM','basic-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('0dd724a7-78a5-4b94-995d-c022d61154c0','review profile config','APP_REALM'),('49c885c9-0cd5-4d37-bfee-d1c6c9082aad','create unique user config','master'),('5592a88f-f4c6-4909-89e8-fe4dbb8816af','create unique user config','APP_REALM'),('d668b38d-f1af-4143-9fff-610f3a9113dd','review profile config','master');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('0dd724a7-78a5-4b94-995d-c022d61154c0','missing','update.profile.on.first.login'),('49c885c9-0cd5-4d37-bfee-d1c6c9082aad','false','require.password.update.after.registration'),('5592a88f-f4c6-4909-89e8-fe4dbb8816af','false','require.password.update.after.registration'),('d668b38d-f1af-4143-9fff-610f3a9113dd','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',_binary '',_binary '\0','account',0,_binary '\0','53ce3582-52d2-4bfd-9c1d-ffc806b4b30d','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '',_binary '','master-realm',0,_binary '\0','d21fb736-b66d-4367-8cea-263f3dda3371',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('13f98761-41ff-4171-b3fe-ffc0c1e26738',_binary '',_binary '\0','broker',0,_binary '\0','294f70d5-567c-4515-b4c7-61336dea22a3',NULL,_binary '\0',NULL,_binary '\0','APP_REALM','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('25f2db29-4065-4b45-be1a-1c8140dcd383',_binary '',_binary '\0','security-admin-console',0,_binary '','0c1ca4a8-abbb-4e26-b078-14e5d69c37b0','/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1',_binary '',_binary '','FrontendClient',0,_binary '','025996be-77ce-4504-963c-fa7c42b9a0e2',NULL,_binary '\0','http://localhost:4200',_binary '\0','APP_REALM','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','http://localhost:4200',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '',_binary '\0','realm-management',0,_binary '\0','52b35384-f6b9-4d90-b520-0f97150ea87f',NULL,_binary '',NULL,_binary '\0','APP_REALM','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4fdad061-bf77-4490-9132-a9c477d5e84e',_binary '',_binary '\0','account',0,_binary '\0','f91552d0-cc3f-4f67-80bf-4a08af25fb78','/realms/APP_REALM/account/',_binary '\0',NULL,_binary '\0','APP_REALM','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('505c25f6-67e7-4738-9650-22d722cb0502',_binary '',_binary '\0','admin-cli',0,_binary '','f07412d3-fd4a-4d43-8f07-2dd94e53e272',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8',_binary '',_binary '','NodeJS',0,_binary '\0','750bf571-c29c-417e-9757-0d1f4d11e37e',NULL,_binary '','',_binary '\0','APP_REALM','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret','http://localhost:3000',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('61d4fd35-00a5-48ec-9eff-872a6880ace1',_binary '',_binary '\0','security-admin-console',0,_binary '','2ca465c7-4915-4b5b-b147-4b805c18c4a6','/admin/APP_REALM/console/',_binary '\0',NULL,_binary '\0','APP_REALM','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6f142b78-4794-4693-93da-80a5d59ee74d',_binary '',_binary '','APP_REALM-realm',0,_binary '\0','bb28f683-397a-4b12-bb19-2570f087f81d',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','APP_REALM Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('a4180149-b692-4554-8e75-406741de4e5b',_binary '',_binary '\0','admin-cli',0,_binary '','5a7b995f-4bf4-4258-abb3-20e826076dd5',NULL,_binary '\0',NULL,_binary '\0','APP_REALM','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('ccf7b354-82a2-4a42-a958-9c89155895a5',_binary '',_binary '\0','broker',0,_binary '\0','0beb67f3-2b8b-47d8-9780-50611a824844',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e8aff873-3dfd-4123-a5de-a855a6e5846a',_binary '',_binary '\0','account-console',0,_binary '','dcfe5328-cf45-4972-b55e-7e04e86c354c','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42',_binary '',_binary '\0','account-console',0,_binary '','ade82eff-2b6c-4b85-a9ba-061a5439fa99','/realms/APP_REALM/account/',_binary '\0',NULL,_binary '\0','APP_REALM','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('25f2db29-4065-4b45-be1a-1c8140dcd383','S256','pkce.code.challenge.method'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','display.on.consent.screen'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','exclude.session.state.from.auth.response'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','saml_force_name_id_format'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','saml.assertion.signature'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','saml.authnstatement'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','saml.client.signature'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','saml.encrypt'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','saml.force.post.binding'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','saml.multivalued.roles'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','saml.onetimeuse.condition'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','saml.server.signature'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','saml.server.signature.keyinfo.ext'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','false','tls.client.certificate.bound.access.tokens'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','display.on.consent.screen'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','exclude.session.state.from.auth.response'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','saml_force_name_id_format'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','saml.assertion.signature'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','saml.authnstatement'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','saml.client.signature'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','saml.encrypt'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','saml.force.post.binding'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','saml.multivalued.roles'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','saml.onetimeuse.condition'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','saml.server.signature'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','saml.server.signature.keyinfo.ext'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','false','tls.client.certificate.bound.access.tokens'),('61d4fd35-00a5-48ec-9eff-872a6880ace1','S256','pkce.code.challenge.method'),('e8aff873-3dfd-4123-a5de-a855a6e5846a','S256','pkce.code.challenge.method'),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('4fdad061-bf77-4490-9132-a9c477d5e84e','10387270-d81b-44e1-bb7b-ec147a208fff'),('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','1b854c50-9f5e-45ea-875c-cae18c83b819'),('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','a4891740-cbae-4bac-b5b0-79cd3faf5d72'),('4fdad061-bf77-4490-9132-a9c477d5e84e','fb5b9f0c-f400-4161-a5fe-8a9e591d1eef');
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`),
  CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('0765c7b0-6090-4e01-adc4-e4dd8301e6d1','offline_access','APP_REALM','OpenID Connect built-in scope: offline_access','openid-connect'),('09bc5378-0176-4b17-9724-069ef3604bca','email','APP_REALM','OpenID Connect built-in scope: email','openid-connect'),('0a503c70-1fb5-4273-a12d-7e0e67309a45','microprofile-jwt','APP_REALM','Microprofile - JWT built-in scope','openid-connect'),('17ac7f56-616c-4c80-8e3a-b695b70f976e','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('3096766e-49ec-4524-9ca5-f176b57e20e9','address','APP_REALM','OpenID Connect built-in scope: address','openid-connect'),('3d51b084-e895-4877-91f8-e41c75644cb6','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('3ff97939-6d32-456c-8035-66d8eb7808df','address','master','OpenID Connect built-in scope: address','openid-connect'),('4f44c47f-acc3-4e04-9e80-352a089e8f57','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('5e86c331-ba64-4015-b6fc-3b87ab7a8173','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('6ecaf5af-968d-4733-bde6-d5201a03ec4a','role_list','master','SAML role list','saml'),('81c61780-4ae6-4b9c-a39d-714c849e6964','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('95295b0d-5ce6-4a79-86dc-ef3584169c97','roles','APP_REALM','OpenID Connect scope for add user roles to the access token','openid-connect'),('bbc89e4a-6028-4354-98b2-ac0f46046cbb','email','master','OpenID Connect built-in scope: email','openid-connect'),('bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a','role_list','APP_REALM','SAML role list','saml'),('d1e91a49-a671-465d-bb7b-407673c90801','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('e39a0b78-bcf4-4ea9-97a8-7acde56904c0','web-origins','APP_REALM','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('fa149584-d261-4e89-94cb-d072a4a3347f','phone','APP_REALM','OpenID Connect built-in scope: phone','openid-connect'),('fb87bc7b-c6eb-452d-8bdd-f87a885d4c11','profile','APP_REALM','OpenID Connect built-in scope: profile','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0765c7b0-6090-4e01-adc4-e4dd8301e6d1','${offlineAccessScopeConsentText}','consent.screen.text'),('0765c7b0-6090-4e01-adc4-e4dd8301e6d1','true','display.on.consent.screen'),('09bc5378-0176-4b17-9724-069ef3604bca','${emailScopeConsentText}','consent.screen.text'),('09bc5378-0176-4b17-9724-069ef3604bca','true','display.on.consent.screen'),('09bc5378-0176-4b17-9724-069ef3604bca','true','include.in.token.scope'),('0a503c70-1fb5-4273-a12d-7e0e67309a45','false','display.on.consent.screen'),('0a503c70-1fb5-4273-a12d-7e0e67309a45','true','include.in.token.scope'),('17ac7f56-616c-4c80-8e3a-b695b70f976e','${phoneScopeConsentText}','consent.screen.text'),('17ac7f56-616c-4c80-8e3a-b695b70f976e','true','display.on.consent.screen'),('17ac7f56-616c-4c80-8e3a-b695b70f976e','true','include.in.token.scope'),('3096766e-49ec-4524-9ca5-f176b57e20e9','${addressScopeConsentText}','consent.screen.text'),('3096766e-49ec-4524-9ca5-f176b57e20e9','true','display.on.consent.screen'),('3096766e-49ec-4524-9ca5-f176b57e20e9','true','include.in.token.scope'),('3d51b084-e895-4877-91f8-e41c75644cb6','${rolesScopeConsentText}','consent.screen.text'),('3d51b084-e895-4877-91f8-e41c75644cb6','true','display.on.consent.screen'),('3d51b084-e895-4877-91f8-e41c75644cb6','false','include.in.token.scope'),('3ff97939-6d32-456c-8035-66d8eb7808df','${addressScopeConsentText}','consent.screen.text'),('3ff97939-6d32-456c-8035-66d8eb7808df','true','display.on.consent.screen'),('3ff97939-6d32-456c-8035-66d8eb7808df','true','include.in.token.scope'),('4f44c47f-acc3-4e04-9e80-352a089e8f57','${offlineAccessScopeConsentText}','consent.screen.text'),('4f44c47f-acc3-4e04-9e80-352a089e8f57','true','display.on.consent.screen'),('5e86c331-ba64-4015-b6fc-3b87ab7a8173','${profileScopeConsentText}','consent.screen.text'),('5e86c331-ba64-4015-b6fc-3b87ab7a8173','true','display.on.consent.screen'),('5e86c331-ba64-4015-b6fc-3b87ab7a8173','true','include.in.token.scope'),('6ecaf5af-968d-4733-bde6-d5201a03ec4a','${samlRoleListScopeConsentText}','consent.screen.text'),('6ecaf5af-968d-4733-bde6-d5201a03ec4a','true','display.on.consent.screen'),('81c61780-4ae6-4b9c-a39d-714c849e6964','false','display.on.consent.screen'),('81c61780-4ae6-4b9c-a39d-714c849e6964','true','include.in.token.scope'),('95295b0d-5ce6-4a79-86dc-ef3584169c97','${rolesScopeConsentText}','consent.screen.text'),('95295b0d-5ce6-4a79-86dc-ef3584169c97','true','display.on.consent.screen'),('95295b0d-5ce6-4a79-86dc-ef3584169c97','false','include.in.token.scope'),('bbc89e4a-6028-4354-98b2-ac0f46046cbb','${emailScopeConsentText}','consent.screen.text'),('bbc89e4a-6028-4354-98b2-ac0f46046cbb','true','display.on.consent.screen'),('bbc89e4a-6028-4354-98b2-ac0f46046cbb','true','include.in.token.scope'),('bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a','${samlRoleListScopeConsentText}','consent.screen.text'),('bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a','true','display.on.consent.screen'),('d1e91a49-a671-465d-bb7b-407673c90801','','consent.screen.text'),('d1e91a49-a671-465d-bb7b-407673c90801','false','display.on.consent.screen'),('d1e91a49-a671-465d-bb7b-407673c90801','false','include.in.token.scope'),('e39a0b78-bcf4-4ea9-97a8-7acde56904c0','','consent.screen.text'),('e39a0b78-bcf4-4ea9-97a8-7acde56904c0','false','display.on.consent.screen'),('e39a0b78-bcf4-4ea9-97a8-7acde56904c0','false','include.in.token.scope'),('fa149584-d261-4e89-94cb-d072a4a3347f','${phoneScopeConsentText}','consent.screen.text'),('fa149584-d261-4e89-94cb-d072a4a3347f','true','display.on.consent.screen'),('fa149584-d261-4e89-94cb-d072a4a3347f','true','include.in.token.scope'),('fb87bc7b-c6eb-452d-8bdd-f87a885d4c11','${profileScopeConsentText}','consent.screen.text'),('fb87bc7b-c6eb-452d-8bdd-f87a885d4c11','true','display.on.consent.screen'),('fb87bc7b-c6eb-452d-8bdd-f87a885d4c11','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','17ac7f56-616c-4c80-8e3a-b695b70f976e',_binary '\0'),('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','3d51b084-e895-4877-91f8-e41c75644cb6',_binary ''),('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','3ff97939-6d32-456c-8035-66d8eb7808df',_binary '\0'),('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','4f44c47f-acc3-4e04-9e80-352a089e8f57',_binary '\0'),('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','5e86c331-ba64-4015-b6fc-3b87ab7a8173',_binary ''),('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','6ecaf5af-968d-4733-bde6-d5201a03ec4a',_binary ''),('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','81c61780-4ae6-4b9c-a39d-714c849e6964',_binary '\0'),('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','bbc89e4a-6028-4354-98b2-ac0f46046cbb',_binary ''),('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','d1e91a49-a671-465d-bb7b-407673c90801',_binary ''),('13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c','17ac7f56-616c-4c80-8e3a-b695b70f976e',_binary '\0'),('13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c','3d51b084-e895-4877-91f8-e41c75644cb6',_binary ''),('13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c','3ff97939-6d32-456c-8035-66d8eb7808df',_binary '\0'),('13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c','4f44c47f-acc3-4e04-9e80-352a089e8f57',_binary '\0'),('13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c','5e86c331-ba64-4015-b6fc-3b87ab7a8173',_binary ''),('13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c','6ecaf5af-968d-4733-bde6-d5201a03ec4a',_binary ''),('13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c','81c61780-4ae6-4b9c-a39d-714c849e6964',_binary '\0'),('13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c','bbc89e4a-6028-4354-98b2-ac0f46046cbb',_binary ''),('13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c','d1e91a49-a671-465d-bb7b-407673c90801',_binary ''),('13f98761-41ff-4171-b3fe-ffc0c1e26738','0765c7b0-6090-4e01-adc4-e4dd8301e6d1',_binary '\0'),('13f98761-41ff-4171-b3fe-ffc0c1e26738','09bc5378-0176-4b17-9724-069ef3604bca',_binary ''),('13f98761-41ff-4171-b3fe-ffc0c1e26738','0a503c70-1fb5-4273-a12d-7e0e67309a45',_binary '\0'),('13f98761-41ff-4171-b3fe-ffc0c1e26738','3096766e-49ec-4524-9ca5-f176b57e20e9',_binary '\0'),('13f98761-41ff-4171-b3fe-ffc0c1e26738','95295b0d-5ce6-4a79-86dc-ef3584169c97',_binary ''),('13f98761-41ff-4171-b3fe-ffc0c1e26738','bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a',_binary ''),('13f98761-41ff-4171-b3fe-ffc0c1e26738','e39a0b78-bcf4-4ea9-97a8-7acde56904c0',_binary ''),('13f98761-41ff-4171-b3fe-ffc0c1e26738','fa149584-d261-4e89-94cb-d072a4a3347f',_binary '\0'),('13f98761-41ff-4171-b3fe-ffc0c1e26738','fb87bc7b-c6eb-452d-8bdd-f87a885d4c11',_binary ''),('25f2db29-4065-4b45-be1a-1c8140dcd383','17ac7f56-616c-4c80-8e3a-b695b70f976e',_binary '\0'),('25f2db29-4065-4b45-be1a-1c8140dcd383','3d51b084-e895-4877-91f8-e41c75644cb6',_binary ''),('25f2db29-4065-4b45-be1a-1c8140dcd383','3ff97939-6d32-456c-8035-66d8eb7808df',_binary '\0'),('25f2db29-4065-4b45-be1a-1c8140dcd383','4f44c47f-acc3-4e04-9e80-352a089e8f57',_binary '\0'),('25f2db29-4065-4b45-be1a-1c8140dcd383','5e86c331-ba64-4015-b6fc-3b87ab7a8173',_binary ''),('25f2db29-4065-4b45-be1a-1c8140dcd383','6ecaf5af-968d-4733-bde6-d5201a03ec4a',_binary ''),('25f2db29-4065-4b45-be1a-1c8140dcd383','81c61780-4ae6-4b9c-a39d-714c849e6964',_binary '\0'),('25f2db29-4065-4b45-be1a-1c8140dcd383','bbc89e4a-6028-4354-98b2-ac0f46046cbb',_binary ''),('25f2db29-4065-4b45-be1a-1c8140dcd383','d1e91a49-a671-465d-bb7b-407673c90801',_binary ''),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','0765c7b0-6090-4e01-adc4-e4dd8301e6d1',_binary '\0'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','09bc5378-0176-4b17-9724-069ef3604bca',_binary ''),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','0a503c70-1fb5-4273-a12d-7e0e67309a45',_binary '\0'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','3096766e-49ec-4524-9ca5-f176b57e20e9',_binary '\0'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','95295b0d-5ce6-4a79-86dc-ef3584169c97',_binary ''),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a',_binary ''),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','e39a0b78-bcf4-4ea9-97a8-7acde56904c0',_binary ''),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','fa149584-d261-4e89-94cb-d072a4a3347f',_binary '\0'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','fb87bc7b-c6eb-452d-8bdd-f87a885d4c11',_binary ''),('4ccdfe3d-278e-4083-ab42-386fe7ed13a8','0765c7b0-6090-4e01-adc4-e4dd8301e6d1',_binary '\0'),('4ccdfe3d-278e-4083-ab42-386fe7ed13a8','09bc5378-0176-4b17-9724-069ef3604bca',_binary ''),('4ccdfe3d-278e-4083-ab42-386fe7ed13a8','0a503c70-1fb5-4273-a12d-7e0e67309a45',_binary '\0'),('4ccdfe3d-278e-4083-ab42-386fe7ed13a8','3096766e-49ec-4524-9ca5-f176b57e20e9',_binary '\0'),('4ccdfe3d-278e-4083-ab42-386fe7ed13a8','95295b0d-5ce6-4a79-86dc-ef3584169c97',_binary ''),('4ccdfe3d-278e-4083-ab42-386fe7ed13a8','bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a',_binary ''),('4ccdfe3d-278e-4083-ab42-386fe7ed13a8','e39a0b78-bcf4-4ea9-97a8-7acde56904c0',_binary ''),('4ccdfe3d-278e-4083-ab42-386fe7ed13a8','fa149584-d261-4e89-94cb-d072a4a3347f',_binary '\0'),('4ccdfe3d-278e-4083-ab42-386fe7ed13a8','fb87bc7b-c6eb-452d-8bdd-f87a885d4c11',_binary ''),('4fdad061-bf77-4490-9132-a9c477d5e84e','0765c7b0-6090-4e01-adc4-e4dd8301e6d1',_binary '\0'),('4fdad061-bf77-4490-9132-a9c477d5e84e','09bc5378-0176-4b17-9724-069ef3604bca',_binary ''),('4fdad061-bf77-4490-9132-a9c477d5e84e','0a503c70-1fb5-4273-a12d-7e0e67309a45',_binary '\0'),('4fdad061-bf77-4490-9132-a9c477d5e84e','3096766e-49ec-4524-9ca5-f176b57e20e9',_binary '\0'),('4fdad061-bf77-4490-9132-a9c477d5e84e','95295b0d-5ce6-4a79-86dc-ef3584169c97',_binary ''),('4fdad061-bf77-4490-9132-a9c477d5e84e','bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a',_binary ''),('4fdad061-bf77-4490-9132-a9c477d5e84e','e39a0b78-bcf4-4ea9-97a8-7acde56904c0',_binary ''),('4fdad061-bf77-4490-9132-a9c477d5e84e','fa149584-d261-4e89-94cb-d072a4a3347f',_binary '\0'),('4fdad061-bf77-4490-9132-a9c477d5e84e','fb87bc7b-c6eb-452d-8bdd-f87a885d4c11',_binary ''),('505c25f6-67e7-4738-9650-22d722cb0502','17ac7f56-616c-4c80-8e3a-b695b70f976e',_binary '\0'),('505c25f6-67e7-4738-9650-22d722cb0502','3d51b084-e895-4877-91f8-e41c75644cb6',_binary ''),('505c25f6-67e7-4738-9650-22d722cb0502','3ff97939-6d32-456c-8035-66d8eb7808df',_binary '\0'),('505c25f6-67e7-4738-9650-22d722cb0502','4f44c47f-acc3-4e04-9e80-352a089e8f57',_binary '\0'),('505c25f6-67e7-4738-9650-22d722cb0502','5e86c331-ba64-4015-b6fc-3b87ab7a8173',_binary ''),('505c25f6-67e7-4738-9650-22d722cb0502','6ecaf5af-968d-4733-bde6-d5201a03ec4a',_binary ''),('505c25f6-67e7-4738-9650-22d722cb0502','81c61780-4ae6-4b9c-a39d-714c849e6964',_binary '\0'),('505c25f6-67e7-4738-9650-22d722cb0502','bbc89e4a-6028-4354-98b2-ac0f46046cbb',_binary ''),('505c25f6-67e7-4738-9650-22d722cb0502','d1e91a49-a671-465d-bb7b-407673c90801',_binary ''),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','0765c7b0-6090-4e01-adc4-e4dd8301e6d1',_binary '\0'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','09bc5378-0176-4b17-9724-069ef3604bca',_binary ''),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','0a503c70-1fb5-4273-a12d-7e0e67309a45',_binary '\0'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','3096766e-49ec-4524-9ca5-f176b57e20e9',_binary '\0'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','95295b0d-5ce6-4a79-86dc-ef3584169c97',_binary ''),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a',_binary ''),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','e39a0b78-bcf4-4ea9-97a8-7acde56904c0',_binary ''),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','fa149584-d261-4e89-94cb-d072a4a3347f',_binary '\0'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','fb87bc7b-c6eb-452d-8bdd-f87a885d4c11',_binary ''),('61d4fd35-00a5-48ec-9eff-872a6880ace1','0765c7b0-6090-4e01-adc4-e4dd8301e6d1',_binary '\0'),('61d4fd35-00a5-48ec-9eff-872a6880ace1','09bc5378-0176-4b17-9724-069ef3604bca',_binary ''),('61d4fd35-00a5-48ec-9eff-872a6880ace1','0a503c70-1fb5-4273-a12d-7e0e67309a45',_binary '\0'),('61d4fd35-00a5-48ec-9eff-872a6880ace1','3096766e-49ec-4524-9ca5-f176b57e20e9',_binary '\0'),('61d4fd35-00a5-48ec-9eff-872a6880ace1','95295b0d-5ce6-4a79-86dc-ef3584169c97',_binary ''),('61d4fd35-00a5-48ec-9eff-872a6880ace1','bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a',_binary ''),('61d4fd35-00a5-48ec-9eff-872a6880ace1','e39a0b78-bcf4-4ea9-97a8-7acde56904c0',_binary ''),('61d4fd35-00a5-48ec-9eff-872a6880ace1','fa149584-d261-4e89-94cb-d072a4a3347f',_binary '\0'),('61d4fd35-00a5-48ec-9eff-872a6880ace1','fb87bc7b-c6eb-452d-8bdd-f87a885d4c11',_binary ''),('6f142b78-4794-4693-93da-80a5d59ee74d','17ac7f56-616c-4c80-8e3a-b695b70f976e',_binary '\0'),('6f142b78-4794-4693-93da-80a5d59ee74d','3d51b084-e895-4877-91f8-e41c75644cb6',_binary ''),('6f142b78-4794-4693-93da-80a5d59ee74d','3ff97939-6d32-456c-8035-66d8eb7808df',_binary '\0'),('6f142b78-4794-4693-93da-80a5d59ee74d','4f44c47f-acc3-4e04-9e80-352a089e8f57',_binary '\0'),('6f142b78-4794-4693-93da-80a5d59ee74d','5e86c331-ba64-4015-b6fc-3b87ab7a8173',_binary ''),('6f142b78-4794-4693-93da-80a5d59ee74d','6ecaf5af-968d-4733-bde6-d5201a03ec4a',_binary ''),('6f142b78-4794-4693-93da-80a5d59ee74d','81c61780-4ae6-4b9c-a39d-714c849e6964',_binary '\0'),('6f142b78-4794-4693-93da-80a5d59ee74d','bbc89e4a-6028-4354-98b2-ac0f46046cbb',_binary ''),('6f142b78-4794-4693-93da-80a5d59ee74d','d1e91a49-a671-465d-bb7b-407673c90801',_binary ''),('a4180149-b692-4554-8e75-406741de4e5b','0765c7b0-6090-4e01-adc4-e4dd8301e6d1',_binary '\0'),('a4180149-b692-4554-8e75-406741de4e5b','09bc5378-0176-4b17-9724-069ef3604bca',_binary ''),('a4180149-b692-4554-8e75-406741de4e5b','0a503c70-1fb5-4273-a12d-7e0e67309a45',_binary '\0'),('a4180149-b692-4554-8e75-406741de4e5b','3096766e-49ec-4524-9ca5-f176b57e20e9',_binary '\0'),('a4180149-b692-4554-8e75-406741de4e5b','95295b0d-5ce6-4a79-86dc-ef3584169c97',_binary ''),('a4180149-b692-4554-8e75-406741de4e5b','bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a',_binary ''),('a4180149-b692-4554-8e75-406741de4e5b','e39a0b78-bcf4-4ea9-97a8-7acde56904c0',_binary ''),('a4180149-b692-4554-8e75-406741de4e5b','fa149584-d261-4e89-94cb-d072a4a3347f',_binary '\0'),('a4180149-b692-4554-8e75-406741de4e5b','fb87bc7b-c6eb-452d-8bdd-f87a885d4c11',_binary ''),('ccf7b354-82a2-4a42-a958-9c89155895a5','17ac7f56-616c-4c80-8e3a-b695b70f976e',_binary '\0'),('ccf7b354-82a2-4a42-a958-9c89155895a5','3d51b084-e895-4877-91f8-e41c75644cb6',_binary ''),('ccf7b354-82a2-4a42-a958-9c89155895a5','3ff97939-6d32-456c-8035-66d8eb7808df',_binary '\0'),('ccf7b354-82a2-4a42-a958-9c89155895a5','4f44c47f-acc3-4e04-9e80-352a089e8f57',_binary '\0'),('ccf7b354-82a2-4a42-a958-9c89155895a5','5e86c331-ba64-4015-b6fc-3b87ab7a8173',_binary ''),('ccf7b354-82a2-4a42-a958-9c89155895a5','6ecaf5af-968d-4733-bde6-d5201a03ec4a',_binary ''),('ccf7b354-82a2-4a42-a958-9c89155895a5','81c61780-4ae6-4b9c-a39d-714c849e6964',_binary '\0'),('ccf7b354-82a2-4a42-a958-9c89155895a5','bbc89e4a-6028-4354-98b2-ac0f46046cbb',_binary ''),('ccf7b354-82a2-4a42-a958-9c89155895a5','d1e91a49-a671-465d-bb7b-407673c90801',_binary ''),('e8aff873-3dfd-4123-a5de-a855a6e5846a','17ac7f56-616c-4c80-8e3a-b695b70f976e',_binary '\0'),('e8aff873-3dfd-4123-a5de-a855a6e5846a','3d51b084-e895-4877-91f8-e41c75644cb6',_binary ''),('e8aff873-3dfd-4123-a5de-a855a6e5846a','3ff97939-6d32-456c-8035-66d8eb7808df',_binary '\0'),('e8aff873-3dfd-4123-a5de-a855a6e5846a','4f44c47f-acc3-4e04-9e80-352a089e8f57',_binary '\0'),('e8aff873-3dfd-4123-a5de-a855a6e5846a','5e86c331-ba64-4015-b6fc-3b87ab7a8173',_binary ''),('e8aff873-3dfd-4123-a5de-a855a6e5846a','6ecaf5af-968d-4733-bde6-d5201a03ec4a',_binary ''),('e8aff873-3dfd-4123-a5de-a855a6e5846a','81c61780-4ae6-4b9c-a39d-714c849e6964',_binary '\0'),('e8aff873-3dfd-4123-a5de-a855a6e5846a','bbc89e4a-6028-4354-98b2-ac0f46046cbb',_binary ''),('e8aff873-3dfd-4123-a5de-a855a6e5846a','d1e91a49-a671-465d-bb7b-407673c90801',_binary ''),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','0765c7b0-6090-4e01-adc4-e4dd8301e6d1',_binary '\0'),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','09bc5378-0176-4b17-9724-069ef3604bca',_binary ''),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','0a503c70-1fb5-4273-a12d-7e0e67309a45',_binary '\0'),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','3096766e-49ec-4524-9ca5-f176b57e20e9',_binary '\0'),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','95295b0d-5ce6-4a79-86dc-ef3584169c97',_binary ''),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a',_binary ''),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','e39a0b78-bcf4-4ea9-97a8-7acde56904c0',_binary ''),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','fa149584-d261-4e89-94cb-d072a4a3347f',_binary '\0'),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','fb87bc7b-c6eb-452d-8bdd-f87a885d4c11',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('0765c7b0-6090-4e01-adc4-e4dd8301e6d1','39d7bafb-29ef-478f-aea8-c2b5bd080e24'),('4f44c47f-acc3-4e04-9e80-352a089e8f57','598235e4-b2c3-4843-bbf6-f7191acc1870');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('1681949b-50d9-457d-8fe0-35eec9c1bd0d','Full Scope Disabled','APP_REALM','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','APP_REALM','anonymous'),('250dddb9-bc0b-4f1c-9a40-19c682a14367','Allowed Client Scopes','APP_REALM','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','APP_REALM','anonymous'),('38eeef4d-d6c3-40b5-a58b-73ac76075798','Max Clients Limit','APP_REALM','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','APP_REALM','anonymous'),('3df33531-96e8-49d9-81e1-8d217a0c1422','Allowed Protocol Mapper Types','APP_REALM','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','APP_REALM','anonymous'),('4d7993ee-13ec-4025-b404-b1df4e1049a9','Consent Required','APP_REALM','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','APP_REALM','anonymous'),('52a5af94-84fb-4ded-a5f2-69f92b4276a0','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('55a63a72-ac48-47c2-a37e-990819efb9fd','rsa-generated','APP_REALM','rsa-generated','org.keycloak.keys.KeyProvider','APP_REALM',NULL),('66e5e1c0-f194-486e-a79c-13b6927e65b5','aes-generated','APP_REALM','aes-generated','org.keycloak.keys.KeyProvider','APP_REALM',NULL),('929b94ed-a8e3-4cea-bee3-1a725cbee81c','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9f9b3bbd-464c-4466-b246-e5d8800cf7a2','fallback-HS256','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('a011b7dd-d3f9-404a-8a56-325741140831','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('bb8f265d-db9c-4fda-914e-decee1cda284','fallback-RS256','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('cf0d3988-0d65-4e94-b04e-813641c3efae','hmac-generated','APP_REALM','hmac-generated','org.keycloak.keys.KeyProvider','APP_REALM',NULL),('cfeb0930-e695-4b90-8f92-eea1fe112a94','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('d20dc9fc-1faf-4638-a64e-f98f58e1822d','Allowed Protocol Mapper Types','APP_REALM','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','APP_REALM','authenticated'),('d530282c-2e4f-403a-9b78-255d67860b01','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('db9ac61d-ce54-4d40-ac96-2ea89de64fed','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('e412bee1-4cae-4538-8db0-c1fbba446c78','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('e7ef5efc-ffcb-4f6d-b389-06e1aa5513d0','Allowed Client Scopes','APP_REALM','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','APP_REALM','authenticated'),('f327673f-fbe2-46d5-9ca5-b1b90856c6b9','Trusted Hosts','APP_REALM','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','APP_REALM','anonymous'),('fe70f04e-d23b-4ebc-ac89-d0c46ead5494','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('014e8468-7cf0-467d-89ca-a5adbd35e5e2','55a63a72-ac48-47c2-a37e-990819efb9fd','privateKey','MIIEowIBAAKCAQEAzfnCKSGEahWPprUEReLuzqx1Ok2O3Qie8DIHeEJiHMG8EF3EXhg31nRFB3VhHLnSfP2gU9YnVyGgMbPb/72FM9wTK4YElzv8GQx43LEh0ln3Kcrhf/ndr5jYHCJLEq2CvrmSYDIUFjrWKZeUn2fhIWM5iO7pXChZCxr3H3UhexVsHURSxJBUP3n/rgVAUFsVi7/G3ws1rgvM6osUT35GJys66xI/g4LZMn6c/jQ9UUDVKdXXec0iDK5KdTMG8IcIUDOXlrMNg7/4/BP/nrieFUzESQ6mtnR05GI2ByjYDrJC3Lb2I2odE1nB6l0wGaB7pAAF2VOHyCzMYccIwS/xDQIDAQABAoIBAQCoDbJD2svtvf/BlYmR97C+QWk4E5WPc/wxn7AGh6sDKXJmrAqOdxX/zEeR6Uw9osNBJbINFPpuFcpdIxFJXHj0sgeWCDdwqQlr6ogmEAO3W53UpGpN/zDHl14jvjsgVx8Iu+HYyKMo7AJWVw107c16bzm/JqaRgX39GJguO2QAxiYJBYGtb3mUivPk7FRIQet3vHexMP/k00EthJdCFYk44JFFJ//MWMSa92V5oCsCHFDcE/kfydFpkBKzSeVantM9BEXRhRS/buTG8T/Fr5UOVMrtLBDBbQ7N/AXcHWHJB1dplAjQK4PbgYn66cy8jn20zj60WEoRqBOZp14nMcfBAoGBAP6BIILcF6UQ2eNksQnNPJHpkRE2XH52Hce7MrTrq/yPrG7fuxNB1Dn/TywBhzl7Y0h6yqN6JlKqMigxNiGOl3xkqgek+f2lBrqbOidIVdhMfSZMJCCWwQvXMNJHrDX6wU0BaqwDfTRMbTJ4E64DDsA56UtKX5vMSJioZZ8E0NZxAoGBAM8voBnLybXVAzjfwW6zsZKdnsHtLkW+HL9kTDGlQ8M/oi1Q7rFANahUzKHDboTT1+8MfCb2iUT2a7OPJ+GVX5BOagDAa5URv0oZaN4fCMGvxbmB6rYDI34kEbEAL5YI9mvEXitlinwcoWp9C8hjYFYzxfHFfmDhGCMcwMKFG6pdAoGAMofIwLKaLzfNSwyu6ddJ816AYv58Fs+00fck9i7kktyjy8+4APbNAEbknUQgaRVKfRWELjkOatNH6hr7OGZrRVNnPuVOjUG6uEohnbMK+EsXfgcYFTBZW9R56QY59u22e2eQml6G+V9DPwYAQkhxIVFeNIiruu8war7kjlISdMECgYA1BoZeM8bjL6pMcw/pijnnQUnxbgeKt/ZZkYzio95s6StTl8QPP1S8ST+6Iu91NVatiq93tV86dCrqYLgfRwCXSUpd+OFP3KPtjgVF3AF8uMTNDpAIl1MNJKQWfeqv5olS2YYUaz9/NkClpW1PkweD6Go/z4DhwJpR2jkHT9PdzQKBgB8V81J7RzjalHBo97zM25FKHWTq56LymBNsP7PaXHk/CmoZQrtm+hcur5fV8vVLVYFi+mEVIa+tANSiqwbmOQu5KopEX9FwU5yoLz76ugpymqTr34os2HWQSHYVKuL8vKho+Gw42Kk4Wu5eLO+gr+uczDOTWOOj4wot/P/pK3Gf'),('0a966c2b-02ec-4918-8083-590678511ef0','a011b7dd-d3f9-404a-8a56-325741140831','client-uris-must-match','true'),('0bcb944b-3513-456f-a605-73fc06c68447','db9ac61d-ce54-4d40-ac96-2ea89de64fed','max-clients','200'),('0f3a0cc8-125e-46eb-bfe9-38d9aab96bc7','cfeb0930-e695-4b90-8f92-eea1fe112a94','allowed-protocol-mapper-types','saml-role-list-mapper'),('14c503c1-b859-4891-9226-ac3e4fd48497','3df33531-96e8-49d9-81e1-8d217a0c1422','allowed-protocol-mapper-types','saml-role-list-mapper'),('18e8af22-6c3d-411e-8c12-ff4f70338008','d20dc9fc-1faf-4638-a64e-f98f58e1822d','allowed-protocol-mapper-types','oidc-address-mapper'),('227db653-6b9a-4919-80a0-4b6c99549b42','3df33531-96e8-49d9-81e1-8d217a0c1422','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('2a25c42c-2c2d-4e48-b9c6-507161b44043','3df33531-96e8-49d9-81e1-8d217a0c1422','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2addc447-5f8c-41cc-b29a-1476dfd617e6','d20dc9fc-1faf-4638-a64e-f98f58e1822d','allowed-protocol-mapper-types','oidc-full-name-mapper'),('2f9271b8-1133-4039-8043-d16b06156c6c','cfeb0930-e695-4b90-8f92-eea1fe112a94','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('31513d34-637e-4ed7-b83b-e6f0c0d1fedc','e412bee1-4cae-4538-8db0-c1fbba446c78','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('31e297fb-f502-4c25-b809-bb18bd5e572c','fe70f04e-d23b-4ebc-ac89-d0c46ead5494','allow-default-scopes','true'),('39a6f8d9-19cd-4ff9-ac3d-47c38a71bf24','9f9b3bbd-464c-4466-b246-e5d8800cf7a2','algorithm','HS256'),('39bb1821-a110-43a0-b26b-1e38650998a6','250dddb9-bc0b-4f1c-9a40-19c682a14367','allow-default-scopes','true'),('3b0d1eb8-3652-40ee-afd1-36f196db27a8','3df33531-96e8-49d9-81e1-8d217a0c1422','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('3c0a037d-f1fb-4997-bd07-5744785edd95','bb8f265d-db9c-4fda-914e-decee1cda284','priority','-100'),('4b0dc315-b969-4751-a1f5-02eab1f66895','d20dc9fc-1faf-4638-a64e-f98f58e1822d','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('4b0e9bfa-4303-42c3-beff-12854dfd9cd2','3df33531-96e8-49d9-81e1-8d217a0c1422','allowed-protocol-mapper-types','oidc-full-name-mapper'),('4b0f8d8f-cec3-4b6e-afe8-af3b9e1c3f28','9f9b3bbd-464c-4466-b246-e5d8800cf7a2','kid','51f216b4-7704-4377-8353-e0fa06d4b7df'),('517fc36d-6603-41c2-b321-83dd48a2e73d','3df33531-96e8-49d9-81e1-8d217a0c1422','allowed-protocol-mapper-types','oidc-address-mapper'),('53c36277-5bcd-497f-bf06-ab82f9e883c5','cfeb0930-e695-4b90-8f92-eea1fe112a94','allowed-protocol-mapper-types','oidc-full-name-mapper'),('5b5a1701-c3ab-4e80-a714-32ce6b2f8e55','a011b7dd-d3f9-404a-8a56-325741140831','host-sending-registration-request-must-match','true'),('62da617b-1c8d-46f3-b423-3337cd6e448a','d20dc9fc-1faf-4638-a64e-f98f58e1822d','allowed-protocol-mapper-types','saml-user-property-mapper'),('6649cb03-e700-48b7-ae12-766716e48384','bb8f265d-db9c-4fda-914e-decee1cda284','certificate','MIICmzCCAYMCBgF01Mi2pTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAwOTI4MTI1NDE3WhcNMzAwOTI4MTI1NTU3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCRK03bqNi7HrBJ7bTL+DaicdDM+CSS/alGLFxuaKSG5ue5hSPD/MLTU/tVhlRMlAUnUZuogpq0nNQQxOk7KfHSjbBk82PE2ITndFhcUt/6oLLHkHFgn6w6xW01HaPqGpdI/ANZvGfLTsZvCzKXZnHlSwsOFb+fEHObbHeUaXbpZ6Fmoc0gdML1QH6fkoatsCDHbzVsi6SsE/wWSHEhFeFN1iByH2qr8a02yDSuHNPkJScqqHM+34MW9seJPANfNvIMLCvnxbZ9fh3xwHONfXnMSiAflMGblNsqXHICUaXEQ9e3iOXTmD+NU0s5Re0HGNsxNdRmThUtczck/Lvcm27rAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIHwMsl07lbgYuY8W4yvxO5BQEqzlno6VBeP2rQQug2ZXA+k6rFGECJrCVkiMHTkeoFU/NUUFKR50wocRioZXWQH1td4gUSa3jPD7JgqJ8MfCCdwHmnQ1ghvW5xwLAa5MSfIBI6LEPkfIA+ha+kr6s+Y8nvuL6AaMXCXdw+s6jYlec00CShQEvDupjW/giMa864zFl3FFBqL4RbDpzSQzpU04EYGzMC64X2uqjj9+cxBoOhnozmKvI/nFXR0h1Aq94UXkzzFieZvWu90J7LZaS35hDHban6KI7w6rEv5EvGcMtvvie2KpYvkqMiBZzhHX3r1helG27BpeKesm6hBAPU='),('71740bbd-d51f-4510-acf3-ac9676fca120','bb8f265d-db9c-4fda-914e-decee1cda284','privateKey','MIIEowIBAAKCAQEAkStN26jYux6wSe20y/g2onHQzPgkkv2pRixcbmikhubnuYUjw/zC01P7VYZUTJQFJ1GbqIKatJzUEMTpOynx0o2wZPNjxNiE53RYXFLf+qCyx5BxYJ+sOsVtNR2j6hqXSPwDWbxny07Gbwsyl2Zx5UsLDhW/nxBzm2x3lGl26WehZqHNIHTC9UB+n5KGrbAgx281bIukrBP8FkhxIRXhTdYgch9qq/GtNsg0rhzT5CUnKqhzPt+DFvbHiTwDXzbyDCwr58W2fX4d8cBzjX15zEogH5TBm5TbKlxyAlGlxEPXt4jl05g/jVNLOUXtBxjbMTXUZk4VLXM3JPy73Jtu6wIDAQABAoIBAAMq5LoERyZeFw6l5yoEMnz86sduKq4iZs0nLqUiF2TyKOA9bXhbTYz66iMFmVVKbYpcF39nyiRiv6XWBhjKY4JqoQyy2txytQOv4DWzgTugwgXkuvSWx1VI9YcRLIBxMBfhl9kfaUxgXagSoHn5PEb6ijU2eEXqP/uGNF3Cp1uUZK2ZWo7/CiRk9urOWXKmmR/Scjxa0A/jLqIOeojaNZ5kdJ4kd4W/K2QIJyjSWyWCf25Fx/zZOMlVXeP0aS3675mx4wcO8QlvlvlAxl8DF8h6vZfk0hiRykTQ6x02raKZhM7lUBa65wtSRFeLKxZ8pjDRCR/2W8OBpJNILFm2XeECgYEA7/7yF5vhSf4p4KqJzGKFZiASLBTEP6bbHdwUnCGIQIq7jSf8v9ZTVkUgRsA4OOwiFb4dvCmmvSjSuAsVXxzLWBcHZylRclEtMIfgQ04ar0Wi9vVC3D/xXRWDvUJ4KWNpwPa/Pz1A9qYWUorI50YuZKwNK2U6b0UbxpvgaujgVqkCgYEAmtmJunfCLBZl3hZ2meQK51Vy3eBc+0XOFBHnGu+qi4en0jKrJCwkCy6a054i6QvEmbM3mlOpnymMY8ENBICy7US4grHtoB9QfvxcI2VvLiNhsAiW//ZVSg6MGPo/YDjnFZrQRvt9RxKvPz/w6j7+ZFsMYqY6AfLUvVlbZb0uGXMCgYAwiEjit1YexXQoh7QoDcBWP6QNIAHzsUVcS3YrgKhyDNwSloSJMslVh9MYG6UC9dWKuhB/TZj3Zbr/FtayjjsczENl/DgJOxs9Vizmz3OcACQNdtmXeqLPpRsn+boc/IqVSBCytCtf9YRMGt63zjxxhU2Aeg8QE1SjnEAMvp0nSQKBgBCRXe8ZiSj2bIfKl333rEL8HYIn00r/OQFkuPlk0zaCmS4gRbdlEaYwolgp/0o3/B0F09krQmbJJ0A1E5N7wakpRSSWrPoI36/2iFUxMSgamQUgpidUz+NQkyTJAabl77OcENTHa6wDD8UQrlIh004hf72+U06KEMEBoonMJ/aJAoGBALJxM2HPbRVIj5uEkhwwN0xuX9jnf54xwzCNVaDKLvfMvDmQ17SwWMHC7LaCBklll4z1Jy1Y5Js3Y9Lq3WETucu276c1aGqMtD+3TTllNshjk4jsvCV7q3rHmup86yiGiKNfbJsVej9fj9gWIMeKlrCgUfDBhHpFTl5dZOzr6S+5'),('7263ea39-072e-4fe6-8196-b253a6ef65de','66e5e1c0-f194-486e-a79c-13b6927e65b5','secret','CmY_eh_zR8UZJA3_GaMgtw'),('757cc4ad-ea7d-4e3a-8470-9ca902e5e84e','e412bee1-4cae-4538-8db0-c1fbba446c78','allowed-protocol-mapper-types','oidc-full-name-mapper'),('7645ced2-57c7-4d83-97b2-6483a4dd223a','e412bee1-4cae-4538-8db0-c1fbba446c78','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('7719502d-7a00-448f-9abb-86e6cdaa4e2e','d20dc9fc-1faf-4638-a64e-f98f58e1822d','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('79db6a08-f013-4ccc-8b7f-6e47e81fe1ae','9f9b3bbd-464c-4466-b246-e5d8800cf7a2','priority','-100'),('7ae44bd5-f8ca-4feb-94d6-116fa3d074f6','f327673f-fbe2-46d5-9ca5-b1b90856c6b9','client-uris-must-match','true'),('7e5b5dcd-24e0-4a80-808f-20ff16a258aa','3df33531-96e8-49d9-81e1-8d217a0c1422','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('7e857525-c9ec-4ed3-a5f2-0870c41e31a1','cfeb0930-e695-4b90-8f92-eea1fe112a94','allowed-protocol-mapper-types','saml-user-property-mapper'),('9081e7a2-7773-4647-8693-2c9d59a2b208','55a63a72-ac48-47c2-a37e-990819efb9fd','priority','100'),('95997aca-9d0c-4a43-b551-d08854dbce65','e7ef5efc-ffcb-4f6d-b389-06e1aa5513d0','allow-default-scopes','true'),('966f10e4-6816-4fb3-a3a1-2ae34818a6e1','cf0d3988-0d65-4e94-b04e-813641c3efae','kid','a75c695d-b7c7-49f3-97a2-9879d92b4f1b'),('9f1f6d74-13d9-4225-b1e2-3db47ceac689','e412bee1-4cae-4538-8db0-c1fbba446c78','allowed-protocol-mapper-types','saml-user-property-mapper'),('a1a3dea5-96cf-4e8a-bb03-5f0d0db35b41','38eeef4d-d6c3-40b5-a58b-73ac76075798','max-clients','200'),('a1e6c0c8-ce5b-4203-9a91-5f06aed5d143','e412bee1-4cae-4538-8db0-c1fbba446c78','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('a243c266-9fc7-4dba-bfc2-f5f2bb7ae981','bb8f265d-db9c-4fda-914e-decee1cda284','algorithm','RS256'),('a5bf0b9f-8780-4dbf-9932-2320b9abfa5d','e412bee1-4cae-4538-8db0-c1fbba446c78','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('a85ace86-cbe2-4bbe-8f3d-3c61509fef0c','d20dc9fc-1faf-4638-a64e-f98f58e1822d','allowed-protocol-mapper-types','saml-role-list-mapper'),('aa48abb5-8749-4db2-9234-7b9387973d3e','66e5e1c0-f194-486e-a79c-13b6927e65b5','priority','100'),('b1381245-6736-4418-95ea-4ce2e2dccde8','cfeb0930-e695-4b90-8f92-eea1fe112a94','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('b35dc489-7bb0-40dc-812b-70252f2101be','f327673f-fbe2-46d5-9ca5-b1b90856c6b9','host-sending-registration-request-must-match','true'),('b3692119-5f8a-4dd9-84b3-04dcf20a810f','66e5e1c0-f194-486e-a79c-13b6927e65b5','kid','b2f1a9ac-fa05-4141-ba75-f3a1081aab79'),('b397fa7c-f2df-4f60-a40c-0425112d689a','cfeb0930-e695-4b90-8f92-eea1fe112a94','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('b674c396-6915-4af4-a32b-b2c5e46f68d5','cf0d3988-0d65-4e94-b04e-813641c3efae','algorithm','HS256'),('b8b9420c-59b9-4a1d-ae45-ad3b0ca82a7d','cfeb0930-e695-4b90-8f92-eea1fe112a94','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('bc7a301d-a413-4937-9cd8-183e2b5cace6','3df33531-96e8-49d9-81e1-8d217a0c1422','allowed-protocol-mapper-types','saml-user-property-mapper'),('c0e5c84e-1309-4f0f-998f-16b372d61779','d20dc9fc-1faf-4638-a64e-f98f58e1822d','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('ccb2cc41-eb8e-4741-85b4-ebb39712b632','55a63a72-ac48-47c2-a37e-990819efb9fd','certificate','MIICoTCCAYkCBgF01MlQcjANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAlBUFBfUkVBTE0wHhcNMjAwOTI4MTI1NDU3WhcNMzAwOTI4MTI1NjM3WjAUMRIwEAYDVQQDDAlBUFBfUkVBTE0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDN+cIpIYRqFY+mtQRF4u7OrHU6TY7dCJ7wMgd4QmIcwbwQXcReGDfWdEUHdWEcudJ8/aBT1idXIaAxs9v/vYUz3BMrhgSXO/wZDHjcsSHSWfcpyuF/+d2vmNgcIksSrYK+uZJgMhQWOtYpl5SfZ+EhYzmI7ulcKFkLGvcfdSF7FWwdRFLEkFQ/ef+uBUBQWxWLv8bfCzWuC8zqixRPfkYnKzrrEj+Dgtkyfpz+ND1RQNUp1dd5zSIMrkp1MwbwhwhQM5eWsw2Dv/j8E/+euJ4VTMRJDqa2dHTkYjYHKNgOskLctvYjah0TWcHqXTAZoHukAAXZU4fILMxhxwjBL/ENAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAD9DdX+0stQduND4pZouLlqclvPrVQHnMi0iaAwhJMSU0vCirALjAUqv/GsaI2yV11PRo2cgKbi//vDA/n83qijHtDNH0zWH05aNUF5kid2dMtmwvbkRh8MDlmDG2/q7jCTZ8t+SX7WWAhYZXAW6tPkTryz8xW7ZqO4ayQphktaQeGC/W5P/O8CKTOu+63JyQFjDiBnRjBxh58UP9oYqcLiBKrEiYuq4CVo1ri6WaFDXjgkqPv+mTrw/pUazX6zW3CGjiIlnc81/e9hxsaGi6JwHicTHCliocd7ckk3J2djkOJoorZpE+Wh8zDgcroiCRnKe3PVSEiwhOLCvQ/+7/Lg='),('cddc70c7-1c7a-453e-b6da-2c470f5d70f1','e412bee1-4cae-4538-8db0-c1fbba446c78','allowed-protocol-mapper-types','saml-role-list-mapper'),('d60001fa-d2ef-40cb-a6ad-55a88a5eaed1','52a5af94-84fb-4ded-a5f2-69f92b4276a0','allow-default-scopes','true'),('d77412b4-04e2-4794-ba91-af9fd99c844e','e412bee1-4cae-4538-8db0-c1fbba446c78','allowed-protocol-mapper-types','oidc-address-mapper'),('d819827e-988b-4e49-9ba0-79f22db46f60','cfeb0930-e695-4b90-8f92-eea1fe112a94','allowed-protocol-mapper-types','oidc-address-mapper'),('e7860ad1-ebc7-427c-938e-22f0f36a7c7a','cf0d3988-0d65-4e94-b04e-813641c3efae','priority','100'),('f26a66c9-138d-497d-8f9d-24d372865dfe','d20dc9fc-1faf-4638-a64e-f98f58e1822d','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('f502d1cf-afd2-4f6e-9ca3-93149b94d4af','cf0d3988-0d65-4e94-b04e-813641c3efae','secret','1XnKv4plwxFwa9cCrTHvO-LCQcKe3qeTzQosRV2jEi-sR1WQOnkoJaLFgYnCsYPUGUas3RHGAlefu0Ma7r76OA'),('fc0b17d2-c382-4580-b414-a8319b27f98f','9f9b3bbd-464c-4466-b246-e5d8800cf7a2','secret','omfQePYt9edT8oxZs4gQFlxCGf58w3r_1XY1oF8712ALU44wq6ejd8tnF0FZd9qL1qVc-Pcrep4wWRFjojphZw');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0979820b-72c5-4362-aac9-9464136cd26b','9ed4fdab-8c7e-47b8-be69-f4c87317ec83'),('0979820b-72c5-4362-aac9-9464136cd26b','dc545930-f6d0-419b-9813-d4caaa951b49'),('1b854c50-9f5e-45ea-875c-cae18c83b819','7b109a7f-f6ea-4296-828c-90271c857245'),('1e15321a-13b6-4ebf-9a27-408af3db6580','ada6789c-2d2b-4329-9945-66c2290946c5'),('28126449-c873-4afe-8812-b31ba76102d7','ed89ddeb-cf7a-409a-bb9c-9e79513ac778'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','092d3e68-ba83-40b5-b22d-aca2dd30ba12'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','0ae5ee27-a98a-46b4-a19a-a4f75b824951'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','0e744528-f0fc-4512-a6f9-0ffa4a4e5dfa'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','116140d9-a301-4f50-b728-23c0d9f2f041'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','13717066-c23f-4ae1-bc50-9b3b778cd4b4'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','18966a8d-6734-432b-ad58-9c39973c9c9d'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','1f20692e-2c5e-45bc-9a0f-cfc1ea152953'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','2abec0cf-cc0a-4d8d-9f1b-ebdff8b88680'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','2bc1e04d-82f0-4bd4-bc37-726f13254855'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','2c90c842-3d4b-45e5-82ca-875d57f88bd4'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','36b1093d-fb04-4337-b647-f29b9ec4e38d'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','3a478027-350b-4f67-83d6-8c553747d31c'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','41a765b1-cb0c-4aaa-955d-47244c9ab939'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','459bf23f-6dfe-4ec7-a472-6e5ff86bd8f8'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','5399416e-b572-4bd3-809b-4d6c0657e0a3'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','5e0bc232-1b44-448f-a708-18f172b87b59'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','65ab2510-68ed-4202-a7fa-1599b34b110c'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','728e84d3-3b3c-4ab1-a6f7-61ae114c96ed'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','75fd50e3-f424-4069-83d0-4b7cf28cf39c'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','81cd7052-96e9-4f6d-b5d8-df0fe7765615'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','8490c989-c477-4376-8d3e-53d1c72d034f'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','88cec46b-ea16-4a8a-b7e0-685ce1ff13c6'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','893bdf6e-13f5-4bcb-adf5-e23f1f1c688b'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','8ff50d39-a2cc-4fa9-a590-8677aeec6f3d'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','a4e2623f-58f5-4f2c-ab7e-8b70da40db2f'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','a6c58f05-a0be-4080-a93b-5975ec416a59'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','a774a0b3-274b-4219-9d65-5daa46d54b08'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','b3296801-24fc-4ab8-b226-c5de87cbd988'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','b4cf285a-0a1a-4782-bbe0-29604d1b896f'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','bc86f518-2af7-445f-86aa-8b77f5ef8b59'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','bd6bda25-c349-4a6e-913a-bc3a721d1d34'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','c1b8db9f-cfee-4813-a995-0acf09716552'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','e4d1d9a2-8ffb-4150-a39a-47c7c2abc844'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','e7e9ddc7-4991-4f02-9abf-1dbd744e1dd2'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','f17dfb0e-5275-4212-be98-9372c477e893'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','f3649a86-1fb0-40ca-b232-87fe35ea3220'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','ffb7a70f-91c6-45ec-b6d9-437844a7c144'),('32b604a7-733c-443d-bc37-64a27cacea9e','e64680f0-ae80-4a48-84cf-86d9f8f63cdf'),('3a478027-350b-4f67-83d6-8c553747d31c','2bc1e04d-82f0-4bd4-bc37-726f13254855'),('5399416e-b572-4bd3-809b-4d6c0657e0a3','2c90c842-3d4b-45e5-82ca-875d57f88bd4'),('59fbbb2b-17ac-4738-9082-4c1354f161bf','60c873ef-fdbc-4ca4-a6d8-b36c456c68c0'),('66fb4c72-69d1-4115-9582-f55472a873b6','7309e862-bdd4-4fbb-8319-fcbbb4d5ff7d'),('88cec46b-ea16-4a8a-b7e0-685ce1ff13c6','092d3e68-ba83-40b5-b22d-aca2dd30ba12'),('88cec46b-ea16-4a8a-b7e0-685ce1ff13c6','bd6bda25-c349-4a6e-913a-bc3a721d1d34'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','0979820b-72c5-4362-aac9-9464136cd26b'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','17f68a9b-0c5a-402b-9fc2-0bb6bd5ea1c8'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','32b604a7-733c-443d-bc37-64a27cacea9e'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','4632c6cc-1cdc-4b05-9988-168706b4f9cf'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','59c9dd74-cf99-4fce-aa8a-f1d1101adaac'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','79a1256f-6ad3-49d6-96b6-29e8b7013869'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','948b3d2a-5805-4a5c-836b-f5c73e1f1a6a'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','9ed4fdab-8c7e-47b8-be69-f4c87317ec83'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','a92ebc52-d1de-401d-80ee-9db480091a0f'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','b2183466-46f1-48cc-b0fb-95f9efd045c4'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','ba4d6bbe-6fc9-4229-9ffa-4c23be68c459'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','c4d845ba-7973-43e8-ba07-89324b6b662f'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','ca1ee5bc-b9a0-49d9-95bf-a4f89c27a0be'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','dc545930-f6d0-419b-9813-d4caaa951b49'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','e43d2a51-2427-4a13-9186-8ea4b73c8809'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','e64680f0-ae80-4a48-84cf-86d9f8f63cdf'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','ef8a8132-1111-4861-8023-a345f45f1073'),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','f475d9c5-e268-413b-82ff-0095c227ab89'),('fb5b9f0c-f400-4161-a5fe-8a9e591d1eef','f3ecb189-a578-4a28-a435-552c2e2178c4'),('ffb7a70f-91c6-45ec-b6d9-437844a7c144','75fd50e3-f424-4069-83d0-4b7cf28cf39c'),('ffb7a70f-91c6-45ec-b6d9-437844a7c144','e7e9ddc7-4991-4f02-9abf-1dbd744e1dd2');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('06900308-37ea-42ff-ab43-28481f2f15f1',NULL,'password','990a3262-48fb-4890-b996-3e459c3bf375',1601299748729,NULL,'{\"value\":\"erVa9nJ0nhOpMpdB0XO/bI4fvksfEzt7S6RlMTV8NODGq4m2neGorgTyUoknUI+v9Y2Y/z/71vcYufoEDpYRqg==\",\"salt\":\"CuL68+LXAmpCk7vzkve9yA==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('39aa1f54-81d6-4d3b-b4cf-aa195628c8ee',NULL,'password','78c0f5b8-11f2-4e2d-a2fd-5145c99fb808',1601299847390,NULL,'{\"value\":\"ta9Dw8+ckLxbHcDdBl1abYUODHYHrpsv0kKaizJotE37bWuTTgzV9PhEExXTJStHy3dN2ve9WICGk6RMxHQ7mQ==\",\"salt\":\"WY7Pd7MV1qCcxdlUrNIS3Q==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('664a1c0d-fca0-4044-a92a-cd8abd23c323',NULL,'password','49ce24cc-ab3c-495d-99df-e18685ac1b6b',1601297730124,NULL,'{\"value\":\"WrAXPGF665UtymoQZ45mH0xRgwxI0m8W07cI1lutA/xhM2QICpKNPcJ9gcW5rWAFWrb5HUdOOexeB03PL+0V3Q==\",\"salt\":\"SiH0b5VpHEByql88EDXEJw==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('86d146ec-60b1-4504-8abc-b1d530314375',NULL,'password','ba1333c1-a9d6-465b-b9fc-a5f9364a623a',1601298270702,NULL,'{\"value\":\"blpPHKNFjtg9hv0dISU+6KXZPPyRF0Rd/CiNRHftFt00OQdkNriEIA8v5h8Qawc0gMV65cWoJAWO3iUmWiHr8g==\",\"salt\":\"nGEDEO4RQafKcF4YuR+IXw==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2020-09-28 12:54:57',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2020-09-28 12:54:57',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2020-09-28 12:54:58',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2020-09-28 12:54:58',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2020-09-28 12:55:00',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2020-09-28 12:55:00',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2020-09-28 12:55:02',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2020-09-28 12:55:02',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2020-09-28 12:55:02',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2020-09-28 12:55:04',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2020-09-28 12:55:05',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2020-09-28 12:55:05',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2020-09-28 12:55:05',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-09-28 12:55:05',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-09-28 12:55:05',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-09-28 12:55:05',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-09-28 12:55:05',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2020-09-28 12:55:07',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2020-09-28 12:55:08',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2020-09-28 12:55:08',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2020-09-28 12:55:08',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2020-09-28 12:55:08',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2020-09-28 12:55:08',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2020-09-28 12:55:08',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2020-09-28 12:55:08',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1297692840'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2020-09-28 12:55:09',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2020-09-28 12:55:10',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2020-09-28 12:55:10',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1297692840'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2020-09-28 12:55:11',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2020-09-28 12:55:12',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2020-09-28 12:55:12',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2020-09-28 12:55:12',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'1297692840'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-09-28 12:55:13',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1297692840'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-09-28 12:55:13',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-09-28 12:55:14',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2020-09-28 12:55:14',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1297692840'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-09-28 12:55:14',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1297692840'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2020-09-28 12:55:14',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2020-09-28 12:55:14',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-09-28 12:55:14',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-09-28 12:55:14',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2020-09-28 12:55:14',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-09-28 12:55:16',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2020-09-28 12:55:16',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-09-28 12:55:16',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-09-28 12:55:16',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-09-28 12:55:16',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-09-28 12:55:18',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-09-28 12:55:18',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2020-09-28 12:55:19',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2020-09-28 12:55:19',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2020-09-28 12:55:19',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2020-09-28 12:55:19',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1297692840'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2020-09-28 12:55:19',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-09-28 12:55:20',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-09-28 12:55:20',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-09-28 12:55:20',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-09-28 12:55:23',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2020-09-28 12:55:24',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2020-09-28 12:55:24',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2020-09-28 12:55:24',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2020-09-28 12:55:24',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2020-09-28 12:55:24',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2020-09-28 12:55:24',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2020-09-28 12:55:24',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2020-09-28 12:55:24',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2020-09-28 12:55:24',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2020-09-28 12:55:24',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2020-09-28 12:55:25',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2020-09-28 12:55:25',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1297692840'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2020-09-28 12:55:25',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'1297692840'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-09-28 12:55:25',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1297692840'),('8.0.0-updating-credential-data-not-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-09-28 12:55:25',73,'EXECUTED','7:03b3f4b264c3c68ba082250a80b74216','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1297692840'),('8.0.0-updating-credential-data-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-09-28 12:55:25',74,'MARK_RAN','7:64c5728f5ca1f5aa4392217701c4fe23','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1297692840'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-09-28 12:55:26',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-09-28 12:55:26',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'1297692840'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-09-28 12:55:26',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1297692840'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-09-28 12:55:26',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-09-28 12:55:27',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-09-28 12:55:27',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'1297692840'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-09-28 12:55:27',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1297692840'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-09-28 12:55:27',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1297692840'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-09-28 12:55:27',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1297692840'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-09-28 12:55:27',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1297692840'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-09-28 12:55:27',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1297692840'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2020-09-28 12:55:27',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'1297692840');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('APP_REALM','0765c7b0-6090-4e01-adc4-e4dd8301e6d1',_binary '\0'),('APP_REALM','09bc5378-0176-4b17-9724-069ef3604bca',_binary ''),('APP_REALM','0a503c70-1fb5-4273-a12d-7e0e67309a45',_binary '\0'),('APP_REALM','3096766e-49ec-4524-9ca5-f176b57e20e9',_binary '\0'),('APP_REALM','95295b0d-5ce6-4a79-86dc-ef3584169c97',_binary ''),('APP_REALM','bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a',_binary ''),('APP_REALM','e39a0b78-bcf4-4ea9-97a8-7acde56904c0',_binary ''),('APP_REALM','fa149584-d261-4e89-94cb-d072a4a3347f',_binary '\0'),('APP_REALM','fb87bc7b-c6eb-452d-8bdd-f87a885d4c11',_binary ''),('master','17ac7f56-616c-4c80-8e3a-b695b70f976e',_binary '\0'),('master','3d51b084-e895-4877-91f8-e41c75644cb6',_binary ''),('master','3ff97939-6d32-456c-8035-66d8eb7808df',_binary '\0'),('master','4f44c47f-acc3-4e04-9e80-352a089e8f57',_binary '\0'),('master','5e86c331-ba64-4015-b6fc-3b87ab7a8173',_binary ''),('master','6ecaf5af-968d-4733-bde6-d5201a03ec4a',_binary ''),('master','81c61780-4ae6-4b9c-a39d-714c849e6964',_binary '\0'),('master','bbc89e4a-6028-4354-98b2-ac0f46046cbb',_binary ''),('master','d1e91a49-a671-465d-bb7b-407673c90801',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`),
  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('092d3e68-ba83-40b5-b22d-aca2dd30ba12','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_query-groups}','query-groups','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('0979820b-72c5-4362-aac9-9464136cd26b','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_view-users}','view-users','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('0ae5ee27-a98a-46b4-a19a-a4f75b824951','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('0e744528-f0fc-4512-a6f9-0ffa4a4e5dfa','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_manage-clients}','manage-clients','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('10387270-d81b-44e1-bb7b-ec147a208fff','4fdad061-bf77-4490-9132-a9c477d5e84e',_binary '','${role_view-profile}','view-profile','APP_REALM','4fdad061-bf77-4490-9132-a9c477d5e84e',NULL),('116140d9-a301-4f50-b728-23c0d9f2f041','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_create-client}','create-client','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('13717066-c23f-4ae1-bc50-9b3b778cd4b4','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_manage-users}','manage-users','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('17f68a9b-0c5a-402b-9fc2-0bb6bd5ea1c8','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_query-realms}','query-realms','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('18966a8d-6734-432b-ad58-9c39973c9c9d','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('1b854c50-9f5e-45ea-875c-cae18c83b819','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',_binary '','${role_manage-account}','manage-account','master','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',NULL),('1e15321a-13b6-4ebf-9a27-408af3db6580','4fdad061-bf77-4490-9132-a9c477d5e84e',_binary '','${role_manage-consent}','manage-consent','APP_REALM','4fdad061-bf77-4490-9132-a9c477d5e84e',NULL),('1f20692e-2c5e-45bc-9a0f-cfc1ea152953','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_manage-authorization}','manage-authorization','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('28126449-c873-4afe-8812-b31ba76102d7','APP_REALM',_binary '\0',NULL,'app-user','APP_REALM',NULL,'APP_REALM'),('2abec0cf-cc0a-4d8d-9f1b-ebdff8b88680','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_view-identity-providers}','view-identity-providers','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('2bc1e04d-82f0-4bd4-bc37-726f13254855','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_query-clients}','query-clients','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('2c90c842-3d4b-45e5-82ca-875d57f88bd4','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_query-clients}','query-clients','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','master',_binary '\0','${role_admin}','admin','master',NULL,'master'),('32b604a7-733c-443d-bc37-64a27cacea9e','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_view-clients}','view-clients','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('36b1093d-fb04-4337-b647-f29b9ec4e38d','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_manage-users}','manage-users','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('39d7bafb-29ef-478f-aea8-c2b5bd080e24','APP_REALM',_binary '\0','${role_offline-access}','offline_access','APP_REALM',NULL,'APP_REALM'),('3a478027-350b-4f67-83d6-8c553747d31c','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_view-clients}','view-clients','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('41a765b1-cb0c-4aaa-955d-47244c9ab939','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_impersonation}','impersonation','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('459bf23f-6dfe-4ec7-a472-6e5ff86bd8f8','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_view-identity-providers}','view-identity-providers','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('4632c6cc-1cdc-4b05-9988-168706b4f9cf','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_view-events}','view-events','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('4f6a3028-8054-4abc-a3d7-598f9c88641d','5242a967-aa9e-41ff-87d4-9a83a01d35a8',_binary '',NULL,'uma_protection','APP_REALM','5242a967-aa9e-41ff-87d4-9a83a01d35a8',NULL),('5399416e-b572-4bd3-809b-4d6c0657e0a3','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_view-clients}','view-clients','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('598235e4-b2c3-4843-bbf6-f7191acc1870','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,'master'),('59c9dd74-cf99-4fce-aa8a-f1d1101adaac','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_view-realm}','view-realm','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('59fbbb2b-17ac-4738-9082-4c1354f161bf','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',_binary '','${role_manage-consent}','manage-consent','master','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',NULL),('5e0bc232-1b44-448f-a708-18f172b87b59','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_impersonation}','impersonation','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('60c873ef-fdbc-4ca4-a6d8-b36c456c68c0','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',_binary '','${role_view-consent}','view-consent','master','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',NULL),('65ab2510-68ed-4202-a7fa-1599b34b110c','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_view-authorization}','view-authorization','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('66fb4c72-69d1-4115-9582-f55472a873b6','APP_REALM',_binary '\0',NULL,'app-admin','APP_REALM',NULL,'APP_REALM'),('728e84d3-3b3c-4ab1-a6f7-61ae114c96ed','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_manage-realm}','manage-realm','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('7309e862-bdd4-4fbb-8319-fcbbb4d5ff7d','5242a967-aa9e-41ff-87d4-9a83a01d35a8',_binary '',NULL,'admin','APP_REALM','5242a967-aa9e-41ff-87d4-9a83a01d35a8',NULL),('75fd50e3-f424-4069-83d0-4b7cf28cf39c','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_query-users}','query-users','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('79a1256f-6ad3-49d6-96b6-29e8b7013869','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_view-authorization}','view-authorization','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('7b109a7f-f6ea-4296-828c-90271c857245','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',_binary '','${role_manage-account-links}','manage-account-links','master','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',NULL),('81cd7052-96e9-4f6d-b5d8-df0fe7765615','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_view-realm}','view-realm','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('8490c989-c477-4376-8d3e-53d1c72d034f','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_view-realm}','view-realm','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('88cec46b-ea16-4a8a-b7e0-685ce1ff13c6','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_view-users}','view-users','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('893bdf6e-13f5-4bcb-adf5-e23f1f1c688b','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_create-client}','create-client','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('8ff50d39-a2cc-4fa9-a590-8677aeec6f3d','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_manage-events}','manage-events','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('948b3d2a-5805-4a5c-836b-f5c73e1f1a6a','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_create-client}','create-client','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('97e77bed-7b21-458f-ab5a-973a113f8f4f','APP_REALM',_binary '\0','${role_uma_authorization}','uma_authorization','APP_REALM',NULL,'APP_REALM'),('9ed4fdab-8c7e-47b8-be69-f4c87317ec83','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_query-users}','query-users','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('a19b7c33-f598-416a-b6d9-7d6deb7f0e3f','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_realm-admin}','realm-admin','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('a4891740-cbae-4bac-b5b0-79cd3faf5d72','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',_binary '','${role_view-profile}','view-profile','master','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',NULL),('a4e2623f-58f5-4f2c-ab7e-8b70da40db2f','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_manage-realm}','manage-realm','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('a6c58f05-a0be-4080-a93b-5975ec416a59','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_manage-events}','manage-events','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('a774a0b3-274b-4219-9d65-5daa46d54b08','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_view-events}','view-events','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('a92ebc52-d1de-401d-80ee-9db480091a0f','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_manage-users}','manage-users','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('aae86c1f-07d6-43c8-a66b-9778b3b07310','13f98761-41ff-4171-b3fe-ffc0c1e26738',_binary '','${role_read-token}','read-token','APP_REALM','13f98761-41ff-4171-b3fe-ffc0c1e26738',NULL),('ada6789c-2d2b-4329-9945-66c2290946c5','4fdad061-bf77-4490-9132-a9c477d5e84e',_binary '','${role_view-consent}','view-consent','APP_REALM','4fdad061-bf77-4490-9132-a9c477d5e84e',NULL),('b2183466-46f1-48cc-b0fb-95f9efd045c4','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_manage-clients}','manage-clients','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('b3296801-24fc-4ab8-b226-c5de87cbd988','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_manage-authorization}','manage-authorization','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('b4cf285a-0a1a-4782-bbe0-29604d1b896f','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_manage-clients}','manage-clients','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('ba4d6bbe-6fc9-4229-9ffa-4c23be68c459','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_manage-authorization}','manage-authorization','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('bc86f518-2af7-445f-86aa-8b77f5ef8b59','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_query-realms}','query-realms','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('bd6bda25-c349-4a6e-913a-bc3a721d1d34','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_query-users}','query-users','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('c1b8db9f-cfee-4813-a995-0acf09716552','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_view-events}','view-events','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('c4d845ba-7973-43e8-ba07-89324b6b662f','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_manage-identity-providers}','manage-identity-providers','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('ca1ee5bc-b9a0-49d9-95bf-a4f89c27a0be','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_manage-realm}','manage-realm','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('ca2d7c3e-40df-46e8-8358-8556abad5829','4fdad061-bf77-4490-9132-a9c477d5e84e',_binary '','${role_view-applications}','view-applications','APP_REALM','4fdad061-bf77-4490-9132-a9c477d5e84e',NULL),('dc0e0b32-a951-46ba-b8f9-fa7aacc8ee5a','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,'master'),('dc545930-f6d0-419b-9813-d4caaa951b49','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_query-groups}','query-groups','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('e337df29-1a44-41b6-9ebb-fa4eb98fe0d5','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',_binary '','${role_view-applications}','view-applications','master','12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4',NULL),('e3b47fcc-f67a-4c65-98f3-a38b28c2750a','ccf7b354-82a2-4a42-a958-9c89155895a5',_binary '','${role_read-token}','read-token','master','ccf7b354-82a2-4a42-a958-9c89155895a5',NULL),('e43d2a51-2427-4a13-9186-8ea4b73c8809','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_view-identity-providers}','view-identity-providers','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('e4d1d9a2-8ffb-4150-a39a-47c7c2abc844','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,'master'),('e64680f0-ae80-4a48-84cf-86d9f8f63cdf','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_query-clients}','query-clients','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('e7e9ddc7-4991-4f02-9abf-1dbd744e1dd2','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_query-groups}','query-groups','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('ed89ddeb-cf7a-409a-bb9c-9e79513ac778','5242a967-aa9e-41ff-87d4-9a83a01d35a8',_binary '',NULL,'user','APP_REALM','5242a967-aa9e-41ff-87d4-9a83a01d35a8',NULL),('ef8a8132-1111-4861-8023-a345f45f1073','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_manage-events}','manage-events','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('f17dfb0e-5275-4212-be98-9372c477e893','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',_binary '','${role_view-authorization}','view-authorization','master','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',NULL),('f3649a86-1fb0-40ca-b232-87fe35ea3220','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_query-realms}','query-realms','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL),('f3ecb189-a578-4a28-a435-552c2e2178c4','4fdad061-bf77-4490-9132-a9c477d5e84e',_binary '','${role_manage-account-links}','manage-account-links','APP_REALM','4fdad061-bf77-4490-9132-a9c477d5e84e',NULL),('f475d9c5-e268-413b-82ff-0095c227ab89','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',_binary '','${role_impersonation}','impersonation','APP_REALM','4ccdfe3d-278e-4083-ab42-386fe7ed13a8',NULL),('fb5b9f0c-f400-4161-a5fe-8a9e591d1eef','4fdad061-bf77-4490-9132-a9c477d5e84e',_binary '','${role_manage-account}','manage-account','APP_REALM','4fdad061-bf77-4490-9132-a9c477d5e84e',NULL),('ffb7a70f-91c6-45ec-b6d9-437844a7c144','6f142b78-4794-4693-93da-80a5d59ee74d',_binary '','${role_view-users}','view-users','master','6f142b78-4794-4693-93da-80a5d59ee74d',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('lkhgz','11.0.2',1601297729);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0051534b-64aa-45e6-80ef-62bb3891fc35','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'0a503c70-1fb5-4273-a12d-7e0e67309a45'),('0576d41f-b4e7-449c-a639-27b78f1494a1','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','5242a967-aa9e-41ff-87d4-9a83a01d35a8',NULL),('05d5a265-06a3-458f-9b56-e150f74c1244','full name','openid-connect','oidc-full-name-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('0c8df0f4-e525-4d96-83f2-76cc4222af02','username','openid-connect','oidc-usermodel-property-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('11db8d79-5bd5-47e1-b4e5-60e062d1e460','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'d1e91a49-a671-465d-bb7b-407673c90801'),('12e0a07a-d1b7-4e39-a93a-41daeed277db','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('18a59a35-0999-486b-926b-8a0a4514cf7b','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('22640d0c-4963-483c-8ae7-ce21b2cfb0d3','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('259bbe34-7b7c-4d0c-b5cc-a16fee54b823','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'3d51b084-e895-4877-91f8-e41c75644cb6'),('29037ea5-e537-4166-ae11-f4f56e9ee6ff','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('2e3feb25-2585-491c-8c91-300dd0a0d54c','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'bbc89e4a-6028-4354-98b2-ac0f46046cbb'),('34a269cd-2227-4291-a08e-0d440ec117f5','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('3685d748-033b-424c-86d4-9e7ae095467a','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'95295b0d-5ce6-4a79-86dc-ef3584169c97'),('3c69f976-5e4a-4a61-9d89-dc5b7f4a1afd','locale','openid-connect','oidc-usermodel-attribute-mapper','61d4fd35-00a5-48ec-9eff-872a6880ace1',NULL),('3c856b25-703e-45c4-b250-953515dccb99','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('40eb08b7-f3ab-4633-a05d-aac6e2091a8a','role list','saml','saml-role-list-mapper',NULL,'bccdf7ea-aaa6-4074-bcef-6bb24cecbe7a'),('441a08e9-e7da-4804-9e10-8dc08b59bf1e','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('476c4e86-7189-4a25-8aab-c3ca4b76265b','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'e39a0b78-bcf4-4ea9-97a8-7acde56904c0'),('4a7685e3-e117-4117-9397-f9f2a2201f1d','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('4c0711f9-6152-4e05-bdff-364b7f7e2d92','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('55647542-50a4-47f7-967a-f8562ad167f1','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('576573d0-9443-4396-9b7f-f02838b5a107','full name','openid-connect','oidc-full-name-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('5a4890cb-502e-47ee-804d-b93d90f642ca','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('5b79f6fb-db59-4150-8b6e-ed9416f0e9e5','username','openid-connect','oidc-usermodel-property-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('600d5db7-b211-40b3-9690-2958c7860abd','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'17ac7f56-616c-4c80-8e3a-b695b70f976e'),('62e9875a-0826-443f-b60f-aae92147aff7','role list','saml','saml-role-list-mapper',NULL,'6ecaf5af-968d-4733-bde6-d5201a03ec4a'),('64aa6fcb-deee-42ab-bbec-261df860d295','address','openid-connect','oidc-address-mapper',NULL,'3ff97939-6d32-456c-8035-66d8eb7808df'),('6956b1d8-942e-4295-8489-8e22a87683a0','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','5242a967-aa9e-41ff-87d4-9a83a01d35a8',NULL),('72f4a175-ef37-45f2-b5b9-8847d4f34122','locale','openid-connect','oidc-usermodel-attribute-mapper','25f2db29-4065-4b45-be1a-1c8140dcd383',NULL),('7a2c2df6-6c7e-421b-affd-7bb3d291a0b1','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('7b99f28a-fde4-4df3-9195-38c2e9180e11','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'3d51b084-e895-4877-91f8-e41c75644cb6'),('7f873627-ace8-470f-ba30-58af808f0924','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','5242a967-aa9e-41ff-87d4-9a83a01d35a8',NULL),('81af4200-7234-41b7-914f-f8e6ced83cba','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('835fb478-2193-4f62-81a6-75d549e017c6','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'81c61780-4ae6-4b9c-a39d-714c849e6964'),('8b9a35f7-f035-47a3-9ef9-8389b361e067','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'95295b0d-5ce6-4a79-86dc-ef3584169c97'),('98e888e4-17fc-4793-b47c-b532735acb24','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('9dfca476-392a-4908-91c5-641764ea16e7','audience resolve','openid-connect','oidc-audience-resolve-mapper','e8aff873-3dfd-4123-a5de-a855a6e5846a',NULL),('a18be068-af32-4743-8fbb-a87b173842d0','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('ab92ad28-444f-403f-9602-129034981909','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('ad44a12f-5b71-427d-bf89-693a6f5754ed','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'17ac7f56-616c-4c80-8e3a-b695b70f976e'),('ae8991bc-ea20-4afd-ade6-cffc775f23a6','audience resolve','openid-connect','oidc-audience-resolve-mapper','eba3388a-e978-4ff6-b7c9-d6e1c9be2d42',NULL),('b5f7b196-57e1-4253-88be-898a3c1be3d2','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'95295b0d-5ce6-4a79-86dc-ef3584169c97'),('b71ab936-8607-4896-bf30-144fac39bbf6','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'09bc5378-0176-4b17-9724-069ef3604bca'),('bc50cb96-f068-4ffb-9db9-16a4c6488701','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'3d51b084-e895-4877-91f8-e41c75644cb6'),('bdf89c74-93b9-4045-8364-ebd45f394939','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('c44a46bc-cbea-41d5-9b9f-044a8ae8ca15','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fa149584-d261-4e89-94cb-d072a4a3347f'),('c8406f98-533c-4f31-a087-7eeb8e9944ab','address','openid-connect','oidc-address-mapper',NULL,'3096766e-49ec-4524-9ca5-f176b57e20e9'),('ca5c7dc2-a2f8-45e1-a64a-ddd641f70cb9','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fa149584-d261-4e89-94cb-d072a4a3347f'),('d0edfcdc-3c82-460e-9dc7-4e328d990107','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('d89a8a7e-03d7-4f6b-83f9-774a78baca47','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('df333895-9b45-4b2c-9c01-0f10149f6b17','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('e4cc3f0e-bbbc-4978-8b74-f3da57a8d26b','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'0a503c70-1fb5-4273-a12d-7e0e67309a45'),('e680e161-29d5-4ecb-af86-c07ef23b718a','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('e7a2741c-128b-4889-a285-4d5ecca5e27b','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11'),('e9e1ad08-8c2a-4b0c-882d-1dec5e2f8521','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5e86c331-ba64-4015-b6fc-3b87ab7a8173'),('ead775cf-af68-4e11-a6c2-5c1d6b6764b5','email','openid-connect','oidc-usermodel-property-mapper',NULL,'bbc89e4a-6028-4354-98b2-ac0f46046cbb'),('f7f55411-c98f-45be-ac94-308437222c3e','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'81c61780-4ae6-4b9c-a39d-714c849e6964'),('fe7f1b9b-840b-40e1-a671-0320af2b13fe','email','openid-connect','oidc-usermodel-property-mapper',NULL,'09bc5378-0176-4b17-9724-069ef3604bca'),('ff7bcbd5-d076-45ac-9580-279a050a1c84','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb87bc7b-c6eb-452d-8bdd-f87a885d4c11');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0051534b-64aa-45e6-80ef-62bb3891fc35','true','access.token.claim'),('0051534b-64aa-45e6-80ef-62bb3891fc35','groups','claim.name'),('0051534b-64aa-45e6-80ef-62bb3891fc35','true','id.token.claim'),('0051534b-64aa-45e6-80ef-62bb3891fc35','String','jsonType.label'),('0051534b-64aa-45e6-80ef-62bb3891fc35','true','multivalued'),('0051534b-64aa-45e6-80ef-62bb3891fc35','foo','user.attribute'),('0576d41f-b4e7-449c-a639-27b78f1494a1','true','access.token.claim'),('0576d41f-b4e7-449c-a639-27b78f1494a1','clientAddress','claim.name'),('0576d41f-b4e7-449c-a639-27b78f1494a1','true','id.token.claim'),('0576d41f-b4e7-449c-a639-27b78f1494a1','String','jsonType.label'),('0576d41f-b4e7-449c-a639-27b78f1494a1','clientAddress','user.session.note'),('05d5a265-06a3-458f-9b56-e150f74c1244','true','access.token.claim'),('05d5a265-06a3-458f-9b56-e150f74c1244','true','id.token.claim'),('05d5a265-06a3-458f-9b56-e150f74c1244','true','userinfo.token.claim'),('0c8df0f4-e525-4d96-83f2-76cc4222af02','true','access.token.claim'),('0c8df0f4-e525-4d96-83f2-76cc4222af02','preferred_username','claim.name'),('0c8df0f4-e525-4d96-83f2-76cc4222af02','true','id.token.claim'),('0c8df0f4-e525-4d96-83f2-76cc4222af02','String','jsonType.label'),('0c8df0f4-e525-4d96-83f2-76cc4222af02','username','user.attribute'),('0c8df0f4-e525-4d96-83f2-76cc4222af02','true','userinfo.token.claim'),('12e0a07a-d1b7-4e39-a93a-41daeed277db','true','access.token.claim'),('12e0a07a-d1b7-4e39-a93a-41daeed277db','birthdate','claim.name'),('12e0a07a-d1b7-4e39-a93a-41daeed277db','true','id.token.claim'),('12e0a07a-d1b7-4e39-a93a-41daeed277db','String','jsonType.label'),('12e0a07a-d1b7-4e39-a93a-41daeed277db','birthdate','user.attribute'),('12e0a07a-d1b7-4e39-a93a-41daeed277db','true','userinfo.token.claim'),('18a59a35-0999-486b-926b-8a0a4514cf7b','true','access.token.claim'),('18a59a35-0999-486b-926b-8a0a4514cf7b','website','claim.name'),('18a59a35-0999-486b-926b-8a0a4514cf7b','true','id.token.claim'),('18a59a35-0999-486b-926b-8a0a4514cf7b','String','jsonType.label'),('18a59a35-0999-486b-926b-8a0a4514cf7b','website','user.attribute'),('18a59a35-0999-486b-926b-8a0a4514cf7b','true','userinfo.token.claim'),('22640d0c-4963-483c-8ae7-ce21b2cfb0d3','true','access.token.claim'),('22640d0c-4963-483c-8ae7-ce21b2cfb0d3','locale','claim.name'),('22640d0c-4963-483c-8ae7-ce21b2cfb0d3','true','id.token.claim'),('22640d0c-4963-483c-8ae7-ce21b2cfb0d3','String','jsonType.label'),('22640d0c-4963-483c-8ae7-ce21b2cfb0d3','locale','user.attribute'),('22640d0c-4963-483c-8ae7-ce21b2cfb0d3','true','userinfo.token.claim'),('259bbe34-7b7c-4d0c-b5cc-a16fee54b823','true','access.token.claim'),('259bbe34-7b7c-4d0c-b5cc-a16fee54b823','resource_access.${client_id}.roles','claim.name'),('259bbe34-7b7c-4d0c-b5cc-a16fee54b823','String','jsonType.label'),('259bbe34-7b7c-4d0c-b5cc-a16fee54b823','true','multivalued'),('259bbe34-7b7c-4d0c-b5cc-a16fee54b823','foo','user.attribute'),('29037ea5-e537-4166-ae11-f4f56e9ee6ff','true','access.token.claim'),('29037ea5-e537-4166-ae11-f4f56e9ee6ff','family_name','claim.name'),('29037ea5-e537-4166-ae11-f4f56e9ee6ff','true','id.token.claim'),('29037ea5-e537-4166-ae11-f4f56e9ee6ff','String','jsonType.label'),('29037ea5-e537-4166-ae11-f4f56e9ee6ff','lastName','user.attribute'),('29037ea5-e537-4166-ae11-f4f56e9ee6ff','true','userinfo.token.claim'),('2e3feb25-2585-491c-8c91-300dd0a0d54c','true','access.token.claim'),('2e3feb25-2585-491c-8c91-300dd0a0d54c','email_verified','claim.name'),('2e3feb25-2585-491c-8c91-300dd0a0d54c','true','id.token.claim'),('2e3feb25-2585-491c-8c91-300dd0a0d54c','boolean','jsonType.label'),('2e3feb25-2585-491c-8c91-300dd0a0d54c','emailVerified','user.attribute'),('2e3feb25-2585-491c-8c91-300dd0a0d54c','true','userinfo.token.claim'),('34a269cd-2227-4291-a08e-0d440ec117f5','true','access.token.claim'),('34a269cd-2227-4291-a08e-0d440ec117f5','zoneinfo','claim.name'),('34a269cd-2227-4291-a08e-0d440ec117f5','true','id.token.claim'),('34a269cd-2227-4291-a08e-0d440ec117f5','String','jsonType.label'),('34a269cd-2227-4291-a08e-0d440ec117f5','zoneinfo','user.attribute'),('34a269cd-2227-4291-a08e-0d440ec117f5','true','userinfo.token.claim'),('3685d748-033b-424c-86d4-9e7ae095467a','true','access.token.claim'),('3685d748-033b-424c-86d4-9e7ae095467a','resource_access.${client_id}.roles','claim.name'),('3685d748-033b-424c-86d4-9e7ae095467a','String','jsonType.label'),('3685d748-033b-424c-86d4-9e7ae095467a','true','multivalued'),('3685d748-033b-424c-86d4-9e7ae095467a','foo','user.attribute'),('3c69f976-5e4a-4a61-9d89-dc5b7f4a1afd','true','access.token.claim'),('3c69f976-5e4a-4a61-9d89-dc5b7f4a1afd','locale','claim.name'),('3c69f976-5e4a-4a61-9d89-dc5b7f4a1afd','true','id.token.claim'),('3c69f976-5e4a-4a61-9d89-dc5b7f4a1afd','String','jsonType.label'),('3c69f976-5e4a-4a61-9d89-dc5b7f4a1afd','locale','user.attribute'),('3c69f976-5e4a-4a61-9d89-dc5b7f4a1afd','true','userinfo.token.claim'),('3c856b25-703e-45c4-b250-953515dccb99','true','access.token.claim'),('3c856b25-703e-45c4-b250-953515dccb99','nickname','claim.name'),('3c856b25-703e-45c4-b250-953515dccb99','true','id.token.claim'),('3c856b25-703e-45c4-b250-953515dccb99','String','jsonType.label'),('3c856b25-703e-45c4-b250-953515dccb99','nickname','user.attribute'),('3c856b25-703e-45c4-b250-953515dccb99','true','userinfo.token.claim'),('40eb08b7-f3ab-4633-a05d-aac6e2091a8a','Role','attribute.name'),('40eb08b7-f3ab-4633-a05d-aac6e2091a8a','Basic','attribute.nameformat'),('40eb08b7-f3ab-4633-a05d-aac6e2091a8a','false','single'),('441a08e9-e7da-4804-9e10-8dc08b59bf1e','true','access.token.claim'),('441a08e9-e7da-4804-9e10-8dc08b59bf1e','updated_at','claim.name'),('441a08e9-e7da-4804-9e10-8dc08b59bf1e','true','id.token.claim'),('441a08e9-e7da-4804-9e10-8dc08b59bf1e','String','jsonType.label'),('441a08e9-e7da-4804-9e10-8dc08b59bf1e','updatedAt','user.attribute'),('441a08e9-e7da-4804-9e10-8dc08b59bf1e','true','userinfo.token.claim'),('4a7685e3-e117-4117-9397-f9f2a2201f1d','true','access.token.claim'),('4a7685e3-e117-4117-9397-f9f2a2201f1d','gender','claim.name'),('4a7685e3-e117-4117-9397-f9f2a2201f1d','true','id.token.claim'),('4a7685e3-e117-4117-9397-f9f2a2201f1d','String','jsonType.label'),('4a7685e3-e117-4117-9397-f9f2a2201f1d','gender','user.attribute'),('4a7685e3-e117-4117-9397-f9f2a2201f1d','true','userinfo.token.claim'),('4c0711f9-6152-4e05-bdff-364b7f7e2d92','true','access.token.claim'),('4c0711f9-6152-4e05-bdff-364b7f7e2d92','picture','claim.name'),('4c0711f9-6152-4e05-bdff-364b7f7e2d92','true','id.token.claim'),('4c0711f9-6152-4e05-bdff-364b7f7e2d92','String','jsonType.label'),('4c0711f9-6152-4e05-bdff-364b7f7e2d92','picture','user.attribute'),('4c0711f9-6152-4e05-bdff-364b7f7e2d92','true','userinfo.token.claim'),('55647542-50a4-47f7-967a-f8562ad167f1','true','access.token.claim'),('55647542-50a4-47f7-967a-f8562ad167f1','nickname','claim.name'),('55647542-50a4-47f7-967a-f8562ad167f1','true','id.token.claim'),('55647542-50a4-47f7-967a-f8562ad167f1','String','jsonType.label'),('55647542-50a4-47f7-967a-f8562ad167f1','nickname','user.attribute'),('55647542-50a4-47f7-967a-f8562ad167f1','true','userinfo.token.claim'),('576573d0-9443-4396-9b7f-f02838b5a107','true','access.token.claim'),('576573d0-9443-4396-9b7f-f02838b5a107','true','id.token.claim'),('576573d0-9443-4396-9b7f-f02838b5a107','true','userinfo.token.claim'),('5a4890cb-502e-47ee-804d-b93d90f642ca','true','access.token.claim'),('5a4890cb-502e-47ee-804d-b93d90f642ca','locale','claim.name'),('5a4890cb-502e-47ee-804d-b93d90f642ca','true','id.token.claim'),('5a4890cb-502e-47ee-804d-b93d90f642ca','String','jsonType.label'),('5a4890cb-502e-47ee-804d-b93d90f642ca','locale','user.attribute'),('5a4890cb-502e-47ee-804d-b93d90f642ca','true','userinfo.token.claim'),('5b79f6fb-db59-4150-8b6e-ed9416f0e9e5','true','access.token.claim'),('5b79f6fb-db59-4150-8b6e-ed9416f0e9e5','preferred_username','claim.name'),('5b79f6fb-db59-4150-8b6e-ed9416f0e9e5','true','id.token.claim'),('5b79f6fb-db59-4150-8b6e-ed9416f0e9e5','String','jsonType.label'),('5b79f6fb-db59-4150-8b6e-ed9416f0e9e5','username','user.attribute'),('5b79f6fb-db59-4150-8b6e-ed9416f0e9e5','true','userinfo.token.claim'),('600d5db7-b211-40b3-9690-2958c7860abd','true','access.token.claim'),('600d5db7-b211-40b3-9690-2958c7860abd','phone_number','claim.name'),('600d5db7-b211-40b3-9690-2958c7860abd','true','id.token.claim'),('600d5db7-b211-40b3-9690-2958c7860abd','String','jsonType.label'),('600d5db7-b211-40b3-9690-2958c7860abd','phoneNumber','user.attribute'),('600d5db7-b211-40b3-9690-2958c7860abd','true','userinfo.token.claim'),('62e9875a-0826-443f-b60f-aae92147aff7','Role','attribute.name'),('62e9875a-0826-443f-b60f-aae92147aff7','Basic','attribute.nameformat'),('62e9875a-0826-443f-b60f-aae92147aff7','false','single'),('64aa6fcb-deee-42ab-bbec-261df860d295','true','access.token.claim'),('64aa6fcb-deee-42ab-bbec-261df860d295','true','id.token.claim'),('64aa6fcb-deee-42ab-bbec-261df860d295','country','user.attribute.country'),('64aa6fcb-deee-42ab-bbec-261df860d295','formatted','user.attribute.formatted'),('64aa6fcb-deee-42ab-bbec-261df860d295','locality','user.attribute.locality'),('64aa6fcb-deee-42ab-bbec-261df860d295','postal_code','user.attribute.postal_code'),('64aa6fcb-deee-42ab-bbec-261df860d295','region','user.attribute.region'),('64aa6fcb-deee-42ab-bbec-261df860d295','street','user.attribute.street'),('64aa6fcb-deee-42ab-bbec-261df860d295','true','userinfo.token.claim'),('6956b1d8-942e-4295-8489-8e22a87683a0','true','access.token.claim'),('6956b1d8-942e-4295-8489-8e22a87683a0','clientHost','claim.name'),('6956b1d8-942e-4295-8489-8e22a87683a0','true','id.token.claim'),('6956b1d8-942e-4295-8489-8e22a87683a0','String','jsonType.label'),('6956b1d8-942e-4295-8489-8e22a87683a0','clientHost','user.session.note'),('72f4a175-ef37-45f2-b5b9-8847d4f34122','true','access.token.claim'),('72f4a175-ef37-45f2-b5b9-8847d4f34122','locale','claim.name'),('72f4a175-ef37-45f2-b5b9-8847d4f34122','true','id.token.claim'),('72f4a175-ef37-45f2-b5b9-8847d4f34122','String','jsonType.label'),('72f4a175-ef37-45f2-b5b9-8847d4f34122','locale','user.attribute'),('72f4a175-ef37-45f2-b5b9-8847d4f34122','true','userinfo.token.claim'),('7a2c2df6-6c7e-421b-affd-7bb3d291a0b1','true','access.token.claim'),('7a2c2df6-6c7e-421b-affd-7bb3d291a0b1','given_name','claim.name'),('7a2c2df6-6c7e-421b-affd-7bb3d291a0b1','true','id.token.claim'),('7a2c2df6-6c7e-421b-affd-7bb3d291a0b1','String','jsonType.label'),('7a2c2df6-6c7e-421b-affd-7bb3d291a0b1','firstName','user.attribute'),('7a2c2df6-6c7e-421b-affd-7bb3d291a0b1','true','userinfo.token.claim'),('7f873627-ace8-470f-ba30-58af808f0924','true','access.token.claim'),('7f873627-ace8-470f-ba30-58af808f0924','clientId','claim.name'),('7f873627-ace8-470f-ba30-58af808f0924','true','id.token.claim'),('7f873627-ace8-470f-ba30-58af808f0924','String','jsonType.label'),('7f873627-ace8-470f-ba30-58af808f0924','clientId','user.session.note'),('81af4200-7234-41b7-914f-f8e6ced83cba','true','access.token.claim'),('81af4200-7234-41b7-914f-f8e6ced83cba','profile','claim.name'),('81af4200-7234-41b7-914f-f8e6ced83cba','true','id.token.claim'),('81af4200-7234-41b7-914f-f8e6ced83cba','String','jsonType.label'),('81af4200-7234-41b7-914f-f8e6ced83cba','profile','user.attribute'),('81af4200-7234-41b7-914f-f8e6ced83cba','true','userinfo.token.claim'),('835fb478-2193-4f62-81a6-75d549e017c6','true','access.token.claim'),('835fb478-2193-4f62-81a6-75d549e017c6','upn','claim.name'),('835fb478-2193-4f62-81a6-75d549e017c6','true','id.token.claim'),('835fb478-2193-4f62-81a6-75d549e017c6','String','jsonType.label'),('835fb478-2193-4f62-81a6-75d549e017c6','username','user.attribute'),('835fb478-2193-4f62-81a6-75d549e017c6','true','userinfo.token.claim'),('8b9a35f7-f035-47a3-9ef9-8389b361e067','true','access.token.claim'),('8b9a35f7-f035-47a3-9ef9-8389b361e067','realm_access.roles','claim.name'),('8b9a35f7-f035-47a3-9ef9-8389b361e067','String','jsonType.label'),('8b9a35f7-f035-47a3-9ef9-8389b361e067','true','multivalued'),('8b9a35f7-f035-47a3-9ef9-8389b361e067','foo','user.attribute'),('98e888e4-17fc-4793-b47c-b532735acb24','true','access.token.claim'),('98e888e4-17fc-4793-b47c-b532735acb24','updated_at','claim.name'),('98e888e4-17fc-4793-b47c-b532735acb24','true','id.token.claim'),('98e888e4-17fc-4793-b47c-b532735acb24','String','jsonType.label'),('98e888e4-17fc-4793-b47c-b532735acb24','updatedAt','user.attribute'),('98e888e4-17fc-4793-b47c-b532735acb24','true','userinfo.token.claim'),('a18be068-af32-4743-8fbb-a87b173842d0','true','access.token.claim'),('a18be068-af32-4743-8fbb-a87b173842d0','middle_name','claim.name'),('a18be068-af32-4743-8fbb-a87b173842d0','true','id.token.claim'),('a18be068-af32-4743-8fbb-a87b173842d0','String','jsonType.label'),('a18be068-af32-4743-8fbb-a87b173842d0','middleName','user.attribute'),('a18be068-af32-4743-8fbb-a87b173842d0','true','userinfo.token.claim'),('ab92ad28-444f-403f-9602-129034981909','true','access.token.claim'),('ab92ad28-444f-403f-9602-129034981909','given_name','claim.name'),('ab92ad28-444f-403f-9602-129034981909','true','id.token.claim'),('ab92ad28-444f-403f-9602-129034981909','String','jsonType.label'),('ab92ad28-444f-403f-9602-129034981909','firstName','user.attribute'),('ab92ad28-444f-403f-9602-129034981909','true','userinfo.token.claim'),('ad44a12f-5b71-427d-bf89-693a6f5754ed','true','access.token.claim'),('ad44a12f-5b71-427d-bf89-693a6f5754ed','phone_number_verified','claim.name'),('ad44a12f-5b71-427d-bf89-693a6f5754ed','true','id.token.claim'),('ad44a12f-5b71-427d-bf89-693a6f5754ed','boolean','jsonType.label'),('ad44a12f-5b71-427d-bf89-693a6f5754ed','phoneNumberVerified','user.attribute'),('ad44a12f-5b71-427d-bf89-693a6f5754ed','true','userinfo.token.claim'),('b71ab936-8607-4896-bf30-144fac39bbf6','true','access.token.claim'),('b71ab936-8607-4896-bf30-144fac39bbf6','email_verified','claim.name'),('b71ab936-8607-4896-bf30-144fac39bbf6','true','id.token.claim'),('b71ab936-8607-4896-bf30-144fac39bbf6','boolean','jsonType.label'),('b71ab936-8607-4896-bf30-144fac39bbf6','emailVerified','user.attribute'),('b71ab936-8607-4896-bf30-144fac39bbf6','true','userinfo.token.claim'),('bc50cb96-f068-4ffb-9db9-16a4c6488701','true','access.token.claim'),('bc50cb96-f068-4ffb-9db9-16a4c6488701','realm_access.roles','claim.name'),('bc50cb96-f068-4ffb-9db9-16a4c6488701','String','jsonType.label'),('bc50cb96-f068-4ffb-9db9-16a4c6488701','true','multivalued'),('bc50cb96-f068-4ffb-9db9-16a4c6488701','foo','user.attribute'),('bdf89c74-93b9-4045-8364-ebd45f394939','true','access.token.claim'),('bdf89c74-93b9-4045-8364-ebd45f394939','picture','claim.name'),('bdf89c74-93b9-4045-8364-ebd45f394939','true','id.token.claim'),('bdf89c74-93b9-4045-8364-ebd45f394939','String','jsonType.label'),('bdf89c74-93b9-4045-8364-ebd45f394939','picture','user.attribute'),('bdf89c74-93b9-4045-8364-ebd45f394939','true','userinfo.token.claim'),('c44a46bc-cbea-41d5-9b9f-044a8ae8ca15','true','access.token.claim'),('c44a46bc-cbea-41d5-9b9f-044a8ae8ca15','phone_number','claim.name'),('c44a46bc-cbea-41d5-9b9f-044a8ae8ca15','true','id.token.claim'),('c44a46bc-cbea-41d5-9b9f-044a8ae8ca15','String','jsonType.label'),('c44a46bc-cbea-41d5-9b9f-044a8ae8ca15','phoneNumber','user.attribute'),('c44a46bc-cbea-41d5-9b9f-044a8ae8ca15','true','userinfo.token.claim'),('c8406f98-533c-4f31-a087-7eeb8e9944ab','true','access.token.claim'),('c8406f98-533c-4f31-a087-7eeb8e9944ab','true','id.token.claim'),('c8406f98-533c-4f31-a087-7eeb8e9944ab','country','user.attribute.country'),('c8406f98-533c-4f31-a087-7eeb8e9944ab','formatted','user.attribute.formatted'),('c8406f98-533c-4f31-a087-7eeb8e9944ab','locality','user.attribute.locality'),('c8406f98-533c-4f31-a087-7eeb8e9944ab','postal_code','user.attribute.postal_code'),('c8406f98-533c-4f31-a087-7eeb8e9944ab','region','user.attribute.region'),('c8406f98-533c-4f31-a087-7eeb8e9944ab','street','user.attribute.street'),('c8406f98-533c-4f31-a087-7eeb8e9944ab','true','userinfo.token.claim'),('ca5c7dc2-a2f8-45e1-a64a-ddd641f70cb9','true','access.token.claim'),('ca5c7dc2-a2f8-45e1-a64a-ddd641f70cb9','phone_number_verified','claim.name'),('ca5c7dc2-a2f8-45e1-a64a-ddd641f70cb9','true','id.token.claim'),('ca5c7dc2-a2f8-45e1-a64a-ddd641f70cb9','boolean','jsonType.label'),('ca5c7dc2-a2f8-45e1-a64a-ddd641f70cb9','phoneNumberVerified','user.attribute'),('ca5c7dc2-a2f8-45e1-a64a-ddd641f70cb9','true','userinfo.token.claim'),('d0edfcdc-3c82-460e-9dc7-4e328d990107','true','access.token.claim'),('d0edfcdc-3c82-460e-9dc7-4e328d990107','zoneinfo','claim.name'),('d0edfcdc-3c82-460e-9dc7-4e328d990107','true','id.token.claim'),('d0edfcdc-3c82-460e-9dc7-4e328d990107','String','jsonType.label'),('d0edfcdc-3c82-460e-9dc7-4e328d990107','zoneinfo','user.attribute'),('d0edfcdc-3c82-460e-9dc7-4e328d990107','true','userinfo.token.claim'),('d89a8a7e-03d7-4f6b-83f9-774a78baca47','true','access.token.claim'),('d89a8a7e-03d7-4f6b-83f9-774a78baca47','birthdate','claim.name'),('d89a8a7e-03d7-4f6b-83f9-774a78baca47','true','id.token.claim'),('d89a8a7e-03d7-4f6b-83f9-774a78baca47','String','jsonType.label'),('d89a8a7e-03d7-4f6b-83f9-774a78baca47','birthdate','user.attribute'),('d89a8a7e-03d7-4f6b-83f9-774a78baca47','true','userinfo.token.claim'),('df333895-9b45-4b2c-9c01-0f10149f6b17','true','access.token.claim'),('df333895-9b45-4b2c-9c01-0f10149f6b17','website','claim.name'),('df333895-9b45-4b2c-9c01-0f10149f6b17','true','id.token.claim'),('df333895-9b45-4b2c-9c01-0f10149f6b17','String','jsonType.label'),('df333895-9b45-4b2c-9c01-0f10149f6b17','website','user.attribute'),('df333895-9b45-4b2c-9c01-0f10149f6b17','true','userinfo.token.claim'),('e4cc3f0e-bbbc-4978-8b74-f3da57a8d26b','true','access.token.claim'),('e4cc3f0e-bbbc-4978-8b74-f3da57a8d26b','upn','claim.name'),('e4cc3f0e-bbbc-4978-8b74-f3da57a8d26b','true','id.token.claim'),('e4cc3f0e-bbbc-4978-8b74-f3da57a8d26b','String','jsonType.label'),('e4cc3f0e-bbbc-4978-8b74-f3da57a8d26b','username','user.attribute'),('e4cc3f0e-bbbc-4978-8b74-f3da57a8d26b','true','userinfo.token.claim'),('e680e161-29d5-4ecb-af86-c07ef23b718a','true','access.token.claim'),('e680e161-29d5-4ecb-af86-c07ef23b718a','family_name','claim.name'),('e680e161-29d5-4ecb-af86-c07ef23b718a','true','id.token.claim'),('e680e161-29d5-4ecb-af86-c07ef23b718a','String','jsonType.label'),('e680e161-29d5-4ecb-af86-c07ef23b718a','lastName','user.attribute'),('e680e161-29d5-4ecb-af86-c07ef23b718a','true','userinfo.token.claim'),('e7a2741c-128b-4889-a285-4d5ecca5e27b','true','access.token.claim'),('e7a2741c-128b-4889-a285-4d5ecca5e27b','profile','claim.name'),('e7a2741c-128b-4889-a285-4d5ecca5e27b','true','id.token.claim'),('e7a2741c-128b-4889-a285-4d5ecca5e27b','String','jsonType.label'),('e7a2741c-128b-4889-a285-4d5ecca5e27b','profile','user.attribute'),('e7a2741c-128b-4889-a285-4d5ecca5e27b','true','userinfo.token.claim'),('e9e1ad08-8c2a-4b0c-882d-1dec5e2f8521','true','access.token.claim'),('e9e1ad08-8c2a-4b0c-882d-1dec5e2f8521','middle_name','claim.name'),('e9e1ad08-8c2a-4b0c-882d-1dec5e2f8521','true','id.token.claim'),('e9e1ad08-8c2a-4b0c-882d-1dec5e2f8521','String','jsonType.label'),('e9e1ad08-8c2a-4b0c-882d-1dec5e2f8521','middleName','user.attribute'),('e9e1ad08-8c2a-4b0c-882d-1dec5e2f8521','true','userinfo.token.claim'),('ead775cf-af68-4e11-a6c2-5c1d6b6764b5','true','access.token.claim'),('ead775cf-af68-4e11-a6c2-5c1d6b6764b5','email','claim.name'),('ead775cf-af68-4e11-a6c2-5c1d6b6764b5','true','id.token.claim'),('ead775cf-af68-4e11-a6c2-5c1d6b6764b5','String','jsonType.label'),('ead775cf-af68-4e11-a6c2-5c1d6b6764b5','email','user.attribute'),('ead775cf-af68-4e11-a6c2-5c1d6b6764b5','true','userinfo.token.claim'),('f7f55411-c98f-45be-ac94-308437222c3e','true','access.token.claim'),('f7f55411-c98f-45be-ac94-308437222c3e','groups','claim.name'),('f7f55411-c98f-45be-ac94-308437222c3e','true','id.token.claim'),('f7f55411-c98f-45be-ac94-308437222c3e','String','jsonType.label'),('f7f55411-c98f-45be-ac94-308437222c3e','true','multivalued'),('f7f55411-c98f-45be-ac94-308437222c3e','foo','user.attribute'),('fe7f1b9b-840b-40e1-a671-0320af2b13fe','true','access.token.claim'),('fe7f1b9b-840b-40e1-a671-0320af2b13fe','email','claim.name'),('fe7f1b9b-840b-40e1-a671-0320af2b13fe','true','id.token.claim'),('fe7f1b9b-840b-40e1-a671-0320af2b13fe','String','jsonType.label'),('fe7f1b9b-840b-40e1-a671-0320af2b13fe','email','user.attribute'),('fe7f1b9b-840b-40e1-a671-0320af2b13fe','true','userinfo.token.claim'),('ff7bcbd5-d076-45ac-9580-279a050a1c84','true','access.token.claim'),('ff7bcbd5-d076-45ac-9580-279a050a1c84','gender','claim.name'),('ff7bcbd5-d076-45ac-9580-279a050a1c84','true','id.token.claim'),('ff7bcbd5-d076-45ac-9580-279a050a1c84','String','jsonType.label'),('ff7bcbd5-d076-45ac-9580-279a050a1c84','gender','user.attribute'),('ff7bcbd5-d076-45ac-9580-279a050a1c84','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('APP_REALM',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'APP_REALM',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','6f142b78-4794-4693-93da-80a5d59ee74d',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','fc2c77eb-5e8d-4344-a408-a4dce9faf018','72e75eca-7836-4dc9-9bdf-ba41d604a863','7ba5e255-fbf8-4a53-91d1-0a02e0234cd0','b1e7a92d-6213-4d9b-af04-e82cd1ab94f9','846bcdc0-558d-4456-a352-da7ecadc243d',2592000,_binary '\0',900,_binary '',_binary '\0','6aad7605-080b-447e-8068-02a2790058e9',0,_binary '\0',0,0),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','13e08dc8-7cb9-4ceb-b5c1-10d3db68ae5c',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','41e26dec-9828-41a9-8576-7ddf866f519c','7bd40b08-a155-4a74-9942-4936f6646bc0','eee2569d-7fd8-4b7a-940a-bb6687647f3f','d8931467-b905-41c2-bfc7-fb5a155bcb26','7bee3332-ddb2-4c7a-badb-8749267a5e61',2592000,_binary '\0',900,_binary '',_binary '\0','f6595d4e-b7d1-42b5-b626-92c66b0d59e2',0,_binary '\0',0,0);
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','APP_REALM'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','master'),('_browser_header.contentSecurityPolicyReportOnly','','APP_REALM'),('_browser_header.contentSecurityPolicyReportOnly','','master'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','APP_REALM'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','master'),('_browser_header.xContentTypeOptions','nosniff','APP_REALM'),('_browser_header.xContentTypeOptions','nosniff','master'),('_browser_header.xFrameOptions','SAMEORIGIN','APP_REALM'),('_browser_header.xFrameOptions','SAMEORIGIN','master'),('_browser_header.xRobotsTag','none','APP_REALM'),('_browser_header.xRobotsTag','none','master'),('_browser_header.xXSSProtection','1; mode=block','APP_REALM'),('_browser_header.xXSSProtection','1; mode=block','master'),('actionTokenGeneratedByAdminLifespan','43200','APP_REALM'),('actionTokenGeneratedByUserLifespan','300','APP_REALM'),('bruteForceProtected','false','APP_REALM'),('bruteForceProtected','false','master'),('displayName','Keycloak','master'),('displayNameHtml','<div class=\"kc-logo-text\"><span>Keycloak</span></div>','master'),('failureFactor','30','APP_REALM'),('failureFactor','30','master'),('maxDeltaTimeSeconds','43200','APP_REALM'),('maxDeltaTimeSeconds','43200','master'),('maxFailureWaitSeconds','900','APP_REALM'),('maxFailureWaitSeconds','900','master'),('minimumQuickLoginWaitSeconds','60','APP_REALM'),('minimumQuickLoginWaitSeconds','60','master'),('offlineSessionMaxLifespan','5184000','APP_REALM'),('offlineSessionMaxLifespan','5184000','master'),('offlineSessionMaxLifespanEnabled','false','APP_REALM'),('offlineSessionMaxLifespanEnabled','false','master'),('permanentLockout','false','APP_REALM'),('permanentLockout','false','master'),('quickLoginCheckMilliSeconds','1000','APP_REALM'),('quickLoginCheckMilliSeconds','1000','master'),('waitIncrementSeconds','60','APP_REALM'),('waitIncrementSeconds','60','master'),('webAuthnPolicyAttestationConveyancePreference','not specified','APP_REALM'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','not specified','APP_REALM'),('webAuthnPolicyAuthenticatorAttachment','not specified','APP_REALM'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','not specified','APP_REALM'),('webAuthnPolicyAvoidSameAuthenticatorRegister','false','APP_REALM'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','false','APP_REALM'),('webAuthnPolicyCreateTimeout','0','APP_REALM'),('webAuthnPolicyCreateTimeoutPasswordless','0','APP_REALM'),('webAuthnPolicyRequireResidentKey','not specified','APP_REALM'),('webAuthnPolicyRequireResidentKeyPasswordless','not specified','APP_REALM'),('webAuthnPolicyRpEntityName','keycloak','APP_REALM'),('webAuthnPolicyRpEntityNamePasswordless','keycloak','APP_REALM'),('webAuthnPolicyRpId','','APP_REALM'),('webAuthnPolicyRpIdPasswordless','','APP_REALM'),('webAuthnPolicySignatureAlgorithms','ES256','APP_REALM'),('webAuthnPolicySignatureAlgorithmsPasswordless','ES256','APP_REALM'),('webAuthnPolicyUserVerificationRequirement','not specified','APP_REALM'),('webAuthnPolicyUserVerificationRequirementPasswordless','not specified','APP_REALM');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('APP_REALM','39d7bafb-29ef-478f-aea8-c2b5bd080e24'),('master','598235e4-b2c3-4843-bbf6-f7191acc1870'),('APP_REALM','97e77bed-7b21-458f-ab5a-973a113f8f4f'),('master','dc0e0b32-a951-46ba-b8f9-fa7aacc8ee5a');
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('APP_REALM','jboss-logging'),('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','APP_REALM'),('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('12d9c75e-0bc7-4e5a-8e75-2b460dde4fc4','/realms/master/account/*'),('25f2db29-4065-4b45-be1a-1c8140dcd383','/admin/master/console/*'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','http://localhost:4200/*'),('4fdad061-bf77-4490-9132-a9c477d5e84e','/realms/APP_REALM/account/*'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','http://localhost:3000/*'),('61d4fd35-00a5-48ec-9eff-872a6880ace1','/admin/APP_REALM/console/*'),('e8aff873-3dfd-4123-a5de-a855a6e5846a','/realms/master/account/*'),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','/realms/APP_REALM/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('24470007-4604-49fa-a740-15b15b7501fe','VERIFY_EMAIL','Verify Email','APP_REALM',_binary '',_binary '\0','VERIFY_EMAIL',50),('296b421a-5d3e-4bc5-8c6f-48f3dd9a16cd','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('428a634c-f490-4d67-8387-092777868462','update_user_locale','Update User Locale','APP_REALM',_binary '',_binary '\0','update_user_locale',1000),('50331027-2df3-4549-b919-75a7d798cf9a','terms_and_conditions','Terms and Conditions','APP_REALM',_binary '\0',_binary '\0','terms_and_conditions',20),('88ccfbe3-61e5-4cbe-ba37-bfa00fe33a7f','UPDATE_PASSWORD','Update Password','APP_REALM',_binary '',_binary '\0','UPDATE_PASSWORD',30),('a30136fd-5e6b-4d67-87e7-095b258d7f97','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('a7f305bd-ad58-40ec-a035-f36316795552','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('aed15358-79cd-407b-97d7-79e11e7c9cb6','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('c417f39b-cd7c-45e7-83d6-098e0053a3ed','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('cdd94cf7-82af-4aa4-9384-6479c4fef614','UPDATE_PROFILE','Update Profile','APP_REALM',_binary '',_binary '\0','UPDATE_PROFILE',40),('d292fce5-e593-4598-b9c5-78df5217d1a3','CONFIGURE_TOTP','Configure OTP','APP_REALM',_binary '',_binary '\0','CONFIGURE_TOTP',10),('de2d22e5-0044-46af-87a1-f0e52f8072d5','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('e8aff873-3dfd-4123-a5de-a855a6e5846a','1b854c50-9f5e-45ea-875c-cae18c83b819'),('eba3388a-e978-4ff6-b7c9-d6e1c9be2d42','fb5b9f0c-f400-4161-a5fe-8a9e591d1eef');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('44d4fb41-84bc-4093-96f6-255431606656',NULL,'a07c1b3c-4c44-415e-8bca-68f7e196bc73',_binary '\0',_binary '',NULL,NULL,NULL,'APP_REALM','service-account-nodejs',1601297875641,'5242a967-aa9e-41ff-87d4-9a83a01d35a8',0),('49ce24cc-ab3c-495d-99df-e18685ac1b6b',NULL,'d670d528-00f7-4168-a3b6-ac2fead5b136',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1601297730041,NULL,0),('78c0f5b8-11f2-4e2d-a2fd-5145c99fb808',NULL,'b2445ea9-8b2a-4b7b-ab31-fd4d264e66ff',_binary '',_binary '',NULL,NULL,NULL,'APP_REALM','employee3',1601299841357,NULL,0),('990a3262-48fb-4890-b996-3e459c3bf375',NULL,'1dc978b7-567d-45f8-ab2c-920a664ff591',_binary '',_binary '',NULL,NULL,NULL,'APP_REALM','employee2',1601298335627,NULL,0),('ba1333c1-a9d6-465b-b9fc-a5f9364a623a',NULL,'1fad8f20-10f8-448c-a258-4355357d8acd',_binary '',_binary '',NULL,NULL,NULL,'APP_REALM','employee1',1601298263405,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('10387270-d81b-44e1-bb7b-ec147a208fff','44d4fb41-84bc-4093-96f6-255431606656'),('39d7bafb-29ef-478f-aea8-c2b5bd080e24','44d4fb41-84bc-4093-96f6-255431606656'),('4f6a3028-8054-4abc-a3d7-598f9c88641d','44d4fb41-84bc-4093-96f6-255431606656'),('97e77bed-7b21-458f-ab5a-973a113f8f4f','44d4fb41-84bc-4093-96f6-255431606656'),('fb5b9f0c-f400-4161-a5fe-8a9e591d1eef','44d4fb41-84bc-4093-96f6-255431606656'),('1b854c50-9f5e-45ea-875c-cae18c83b819','49ce24cc-ab3c-495d-99df-e18685ac1b6b'),('2e062f5a-59d1-478b-b019-bdb2ea5cbb45','49ce24cc-ab3c-495d-99df-e18685ac1b6b'),('598235e4-b2c3-4843-bbf6-f7191acc1870','49ce24cc-ab3c-495d-99df-e18685ac1b6b'),('a4891740-cbae-4bac-b5b0-79cd3faf5d72','49ce24cc-ab3c-495d-99df-e18685ac1b6b'),('dc0e0b32-a951-46ba-b8f9-fa7aacc8ee5a','49ce24cc-ab3c-495d-99df-e18685ac1b6b'),('10387270-d81b-44e1-bb7b-ec147a208fff','78c0f5b8-11f2-4e2d-a2fd-5145c99fb808'),('28126449-c873-4afe-8812-b31ba76102d7','78c0f5b8-11f2-4e2d-a2fd-5145c99fb808'),('39d7bafb-29ef-478f-aea8-c2b5bd080e24','78c0f5b8-11f2-4e2d-a2fd-5145c99fb808'),('66fb4c72-69d1-4115-9582-f55472a873b6','78c0f5b8-11f2-4e2d-a2fd-5145c99fb808'),('97e77bed-7b21-458f-ab5a-973a113f8f4f','78c0f5b8-11f2-4e2d-a2fd-5145c99fb808'),('fb5b9f0c-f400-4161-a5fe-8a9e591d1eef','78c0f5b8-11f2-4e2d-a2fd-5145c99fb808'),('10387270-d81b-44e1-bb7b-ec147a208fff','990a3262-48fb-4890-b996-3e459c3bf375'),('39d7bafb-29ef-478f-aea8-c2b5bd080e24','990a3262-48fb-4890-b996-3e459c3bf375'),('66fb4c72-69d1-4115-9582-f55472a873b6','990a3262-48fb-4890-b996-3e459c3bf375'),('97e77bed-7b21-458f-ab5a-973a113f8f4f','990a3262-48fb-4890-b996-3e459c3bf375'),('fb5b9f0c-f400-4161-a5fe-8a9e591d1eef','990a3262-48fb-4890-b996-3e459c3bf375'),('10387270-d81b-44e1-bb7b-ec147a208fff','ba1333c1-a9d6-465b-b9fc-a5f9364a623a'),('28126449-c873-4afe-8812-b31ba76102d7','ba1333c1-a9d6-465b-b9fc-a5f9364a623a'),('39d7bafb-29ef-478f-aea8-c2b5bd080e24','ba1333c1-a9d6-465b-b9fc-a5f9364a623a'),('97e77bed-7b21-458f-ab5a-973a113f8f4f','ba1333c1-a9d6-465b-b9fc-a5f9364a623a'),('fb5b9f0c-f400-4161-a5fe-8a9e591d1eef','ba1333c1-a9d6-465b-b9fc-a5f9364a623a');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('25f2db29-4065-4b45-be1a-1c8140dcd383','+'),('34ee2ded-eac7-4fea-aaa6-aae1ca6a91c1','http://localhost:4200'),('5242a967-aa9e-41ff-87d4-9a83a01d35a8','http://localhost:3000'),('61d4fd35-00a5-48ec-9eff-872a6880ace1','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-22 14:30:26
