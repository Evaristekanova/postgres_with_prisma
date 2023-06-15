/*
  Warnings:

  - The `id` column on the `House` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `id` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `ownerId` on the `House` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `builtById` on the `House` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "House" DROP CONSTRAINT "House_builtById_fkey";

-- DropForeignKey
ALTER TABLE "House" DROP CONSTRAINT "House_ownerId_fkey";

-- DropIndex
DROP INDEX "User_id_key";

-- AlterTable
ALTER TABLE "House" DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "ownerId",
ADD COLUMN     "ownerId" INTEGER NOT NULL,
DROP COLUMN "builtById",
ADD COLUMN     "builtById" INTEGER NOT NULL,
ADD CONSTRAINT "House_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "User" DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");

-- AddForeignKey
ALTER TABLE "House" ADD CONSTRAINT "House_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "House" ADD CONSTRAINT "House_builtById_fkey" FOREIGN KEY ("builtById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
