/*
  Warnings:

  - You are about to drop the column `token` on the `Certs` table. All the data in the column will be lost.
  - Added the required column `collectionId` to the `Certs` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Certs" DROP COLUMN "token",
ADD COLUMN     "collectionId" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "CertCollection" (
    "ID" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "symbol" TEXT NOT NULL,
    "ownerId" TEXT NOT NULL,

    CONSTRAINT "CertCollection_pkey" PRIMARY KEY ("ID")
);

-- AddForeignKey
ALTER TABLE "CertCollection" ADD CONSTRAINT "CertCollection_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certs" ADD CONSTRAINT "Certs_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "CertCollection"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;
