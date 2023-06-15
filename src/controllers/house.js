const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const addHouse = async (req, res) => {
  try {
    const { address, wifipassword } = req.body;
    const newHouse = await prisma.house.create({
      data: {
        address,
        wifipassword,
      },
    });
    res.status(201).json(newHouse);
  } catch (error) {
    console.log(error);
  }
};

const getHouses = async (req, res) => {
  const allHouses = await prisma.house.findMany({
    include: {
      owner: true,
      builtBy: true,
    },
  });

  res.status(200).json(allHouses);
};

module.exports = { addHouse, getHouses };
