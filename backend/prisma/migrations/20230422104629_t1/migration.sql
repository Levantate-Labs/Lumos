-- CreateEnum
CREATE TYPE "POST_TYPE" AS ENUM ('CONTENT', 'EVENT');

-- CreateEnum
CREATE TYPE "REGISTRATION_TYPE" AS ENUM ('SOLO', 'GROUP');

-- CreateTable
CREATE TABLE "Auth" (
    "ID" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "privKeyHash" TEXT NOT NULL,

    CONSTRAINT "Auth_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "User" (
    "ID" TEXT NOT NULL,
    "pubAddress" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Post" (
    "ID" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "postType" "POST_TYPE" NOT NULL,
    "createdById" TEXT NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Follows" (
    "ID" TEXT NOT NULL,
    "followerId" TEXT NOT NULL,
    "followingId" TEXT NOT NULL,

    CONSTRAINT "Follows_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Event" (
    "ID" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "dateOfEvent" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "EventRegistrations" (
    "ID" TEXT NOT NULL,
    "postId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EventRegistrations_pkey" PRIMARY KEY ("ID")
);

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Follows" ADD CONSTRAINT "Follows_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES "User"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Follows" ADD CONSTRAINT "Follows_followingId_fkey" FOREIGN KEY ("followingId") REFERENCES "User"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EventRegistrations" ADD CONSTRAINT "EventRegistrations_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EventRegistrations" ADD CONSTRAINT "EventRegistrations_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;
