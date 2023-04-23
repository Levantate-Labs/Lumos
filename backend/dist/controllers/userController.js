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
const service_manager_1 = require("../services/service-manager");
const prisma = new client_1.PrismaClient();
const register = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const params = req.body;
        let serviceResponse = yield service_manager_1.userService.registerUser(params);
        res.status(serviceResponse.statusCode).send({ message: serviceResponse.message });
    }
    catch (error) {
        res.status(500).send({ error: error.message });
    }
});
const login = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const params = req.body;
        let serviceResponse = yield service_manager_1.userService.loginUser(params);
        res.status(serviceResponse.response.statusCode).send(serviceResponse.user ? serviceResponse.user : serviceResponse.response.statusCode);
    }
    catch (error) {
        res.status(500).send({ error: error.message });
    }
});
const follow = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const params = req.body;
        let serviceResponse = yield service_manager_1.userService.follow(params);
        res.status(serviceResponse.statusCode).send({ message: serviceResponse.message });
    }
    catch (error) {
        res.status(500).send({ error: "Internal Server Error" });
    }
});
exports.default = {
    register,
    login,
    follow
};
