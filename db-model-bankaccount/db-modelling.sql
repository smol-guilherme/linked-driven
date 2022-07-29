CREATE TABLE "customers" ("id" SERIAL NOT NULL PRIMARY KEY,  "fullName" VARCHAR(50) NOT NULL, "cpf" VARCHAR(11) NOT NULL UNIQUE, "email" TEXT NOT NULL UNIQUE, "password" TEXT NOT NULL);
CREATE TABLE "bankAccount"("id" SERIAL NOT NULL PRIMARY KEY, "customerId" INTEGER REFERENCES "customers"("id") NOT NULL UNIQUE, "accountNumber" TEXT NOT NULL UNIQUE, "agency" TEXT NOT NULL, "openDate" TIMESTAMP NOT NULL DEFAULT NOW(), "closeDate" TIMESTAMP DEFAULT NULL);
CREATE TABLE "transactions" ("id" SERIAL NOT NULL PRIMARY KEY, "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"), "amount" SERIAL NOT NULL, "type" TEXT NOT NULL, "time" TIMESTAMP NOT NULL DEFAULT NOW(), "description" TEXT, "cancelled" BOOLEAN NOT NULL DEFAULT "f");
CREATE TABLE "creditCards" ("id" SERIAL NOT NULL PRIMARY KEY, "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"), "name" VARCHAR(25) NOT NULL, "number" VARCHAR(16) NOT NULL UNIQUE, "securityCode" VARCHAR(3) NOT NULL, "expirationMonth" VARCHAR(2) NOT NULL, "expirationYear" VARCHAR(4) NOT NULL, "password" TEXT NOT NULL, "limit" SERIAL NOT NULL);
CREATE TABLE "customerPhones"("id" SERIAL NOT NULL PRIMARY KEY, "customerId" INTEGER NOT NULL REFERENCES "customers"("id"), "number" VARCHAR(16) NOT NULL UNIQUE, "type" TEXT NOT NULL);
CREATE TABLE "states"("id" SERIAL NOT NULL PRIMARY KEY, "name" TEXT NOT NULL UNIQUE);
CREATE TABLE "cities"("id" SERIAL NOT NULL PRIMARY KEY, "name" TEXT NOT NULL, "stateId" INTEGER NOT NULL REFERENCES "states"("id"));
CREATE TABLE "customerAdresses"("id" SERIAL NOT NULL PRIMARY KEY, "customerId" INTEGER NOT NULL REFERENCES "customers"("id"), "street" TEXT NOT NULL, "number" TEXT NOT NULL, "complement" TEXT, "postalCode" VARCHAR(10), "cityId" INTEGER NOT NULL REFERENCES "cities"("id"));

-- BÔNUS 1
CREATE TYPE "phone_type" AS ENUM ('landline', 'mobile');
CREATE TABLE "customerPhones"("id" SERIAL NOT NULL PRIMARY KEY, "customerId" INTEGER NOT NULL REFERENCES "customers"("id"), "number" VARCHAR(16) NOT NULL UNIQUE, "type" "phone_type" NOT NULL);
-- BÔNUS 2
CREATE TYPE "transaction_type" AS ENUM ('deposit', 'withdraw');
CREATE TABLE "transactions" ("id" SERIAL NOT NULL PRIMARY KEY, "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"), "amount" SERIAL NOT NULL, "type" "transaction_type" NOT NULL, "time" TIMESTAMP NOT NULL DEFAULT NOW(), "description" TEXT, "cancelled" BOOLEAN NOT NULL DEFAULT "f");
