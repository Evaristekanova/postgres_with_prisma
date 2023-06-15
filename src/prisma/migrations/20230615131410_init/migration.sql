/*
  Warnings:

  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[id]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT;
DROP SEQUENCE "User_id_seq";

-- CreateTable
CREATE TABLE "House" (
    "id" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "wifipassword" TEXT,
    "ownerId" TEXT NOT NULL,
    "builtById" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "House_address_key" ON "House"("address");

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- AddForeignKey
ALTER TABLE "House" ADD CONSTRAINT "House_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "House" ADD CONSTRAINT "House_builtById_fkey" FOREIGN KEY ("builtById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
