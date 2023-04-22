-- AlterTable
ALTER TABLE "EventRegistrations" ADD COLUMN     "RSVP" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "approved" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "checkedIn" BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE "EventRegInvites" (
    "ID" TEXT NOT NULL,
    "eventRegistrationId" TEXT NOT NULL,
    "inviteeId" TEXT NOT NULL,
    "approved" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "EventRegInvites_pkey" PRIMARY KEY ("ID")
);

-- AddForeignKey
ALTER TABLE "EventRegInvites" ADD CONSTRAINT "EventRegInvites_inviteeId_fkey" FOREIGN KEY ("inviteeId") REFERENCES "User"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;
