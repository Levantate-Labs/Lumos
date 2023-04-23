-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "imageUrl" TEXT;

-- CreateTable
CREATE TABLE "EventCerts" (
    "ID" TEXT NOT NULL,

    CONSTRAINT "EventCerts_pkey" PRIMARY KEY ("ID")
);
