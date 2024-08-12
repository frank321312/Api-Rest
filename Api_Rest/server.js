import express from 'express';
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
import { validacionNombre } from './errors/ValidationError.js';

dotenv.config();
const app = express();

const PORT = process.env.PORT || 7000;

const db = await mysql.createConnection({
    host: process.env.HOST,
    user: process.env.USUARIO,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
}).catch(err => {
    console.log("Error, no se pudo conectar con la base de datos");
    console.error(err);
});

app.use(express.json());

app.get("/", async (req, res) => {
    try {
        const results = await db.query("SELECT * FROM Usuario");
        res.status(200).send(results[0]);
    } catch (error) {
        res.status(500).send("Error interno del servidor");
    }
});

app.post("/api/rol", (req, res) => {
    try {
        validacionNombre(req.body.nombre)
        res.status(200).send("Registro exitoso");
    } catch (error) {
        if (error.name == "ValidationError") {
            res.status(401).send(error.message);
        }
    }
})

app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
