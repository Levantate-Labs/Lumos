/*
  Warnings:

  - Added the required column `teamLeader` to the `EventRegistrations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "EventRegistrations" ADD COLUMN     "teamLeader" TEXT NOT NULL;
