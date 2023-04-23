-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "certAddress" TEXT;

-- CreateTable
CREATE TABLE "Certs" (
    "ID" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "tokenId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "eventId" TEXT NOT NULL,

    CONSTRAINT "Certs_pkey" PRIMARY KEY ("ID")
);

-- AddForeignKey
ALTER TABLE "Certs" ADD CONSTRAINT "Certs_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certs" ADD CONSTRAINT "Certs_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Post"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;
