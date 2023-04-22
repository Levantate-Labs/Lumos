/*
  Warnings:

  - You are about to drop the `Event` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "dateOfEvent" TIMESTAMP(3),
ADD COLUMN     "location" TEXT,
ADD COLUMN     "name" TEXT;

-- DropTable
DROP TABLE "Event";
