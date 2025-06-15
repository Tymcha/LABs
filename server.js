const express = require("express");
const mysql = require("mysql2");
const builder = require("xmlbuilder");
const path = require("path");

const app = express();

const dbConfig = {
  host: "maglev.proxy.rlwy.net",
  user: "root",
  password: "JOsQoIHuxgprzEqncQezYaVSLovPCImV",
  database: "railway",
  port: 26671,
};

// Підключення до бази даних
const connection = mysql.createConnection(dbConfig);

connection.connect((err) => {
  if (err) {
    console.error("Помилка підключення до бази даних:", err);
  } else {
    console.log("Успішно підключено до бази даних");
  }
});

// Головна сторінка
app.get("/", (req, res) => {
  res.send(`
    <html>
      <head>
        <title>Завантаження XML</title>
      </head>
      <body>
        <h1>Генерація XML-файлу</h1>
        <button onclick="window.location.href='/generate-xml'">Завантажити XML</button>
      </body>
    </html>
  `);
});

// Маршрут для генерації XML
app.get("/generate-xml", async (req, res) => {
  const root = builder.create("realty_ads");

  try {
    // Отримання даних із таблиць
    const baseParams = await connection.promise().query("SELECT * FROM base_params");
    baseParams[0].forEach((row) => {
      const baseParamsElement = root.ele("base_params");
      for (const [key, value] of Object.entries(row)) {
        baseParamsElement.ele(key, value);
      }
    });

    const locationData = await connection.promise().query("SELECT * FROM location");
    locationData[0].forEach((row) => {
      const locationElement = root.ele("location");
      for (const [key, value] of Object.entries(row)) {
        locationElement.ele(key, value);
      }
    });

    const mainParams = await connection.promise().query("SELECT * FROM main_params");
    mainParams[0].forEach((row) => {
      const mainParamsElement = root.ele("main_params");
      for (const [key, value] of Object.entries(row)) {
        mainParamsElement.ele(key, value);
      }
    });

    const priceData = await connection.promise().query("SELECT * FROM price");
    priceData[0].forEach((row) => {
      const priceElement = root.ele("price");
      for (const [key, value] of Object.entries(row)) {
        priceElement.ele(key, value);
      }
    });

    const xmlContent = root.end({ pretty: true });

    // Надсилаємо XML для завантаження
    res.setHeader("Content-Type", "application/xml");
    res.setHeader("Content-Disposition", "attachment; filename=realty_ads.xml");
    res.send(xmlContent);
  } catch (error) {
    console.error("Помилка під час генерації XML:", error);
    res.status(500).send("Помилка під час генерації XML");
  }
});

// Запуск сервера
const port = 3000;
app.listen(port, () => {
  console.log(`Сервер працює на http://localhost:${port}`);
});