"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
const register = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    const { username, password, privateKeyHash } = req.body;
    try {
        yield prisma.auth.create({
            data: {
                ID: username,
                passwordHash: password,
                privKeyHash: privateKeyHash
            }
        });
        res.send({ message: "User registered" });
    }
    catch (error) {
        res.send({ error: "Username already exists" });
    }
});
const login = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    const { username, password } = req.body;
    let auth = yield prisma.auth.findUnique({
        where: {
            ID: username
        }
    });
    if (auth) {
        if (auth.passwordHash == password) {
            res.status(200).send({ message: "Found" });
        }
        else {
            res.status(403).send({ message: "Wrong Password" });
        }
    }
    else {
        res.status(403).send({ message: "Username Not Found" });
    }
});
exports.default = {
    register,
    login
};
