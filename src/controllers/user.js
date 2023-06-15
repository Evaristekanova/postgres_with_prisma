const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const getAllUsers = async (req, res) => {
  const allUsers = await prisma.user.findMany();
  res.status(200).json(allUsers);
};

const addUser = async (req, res) => {
  try {
    const { email, name } = req.body;
    const newUser = await prisma.user.create({
      data: {
        email,
        name,
      },
    });
    res.status(201).json(newUser);
  } catch (error) {
    console.log(error);
  }
};
const updateUser = async (req, res) => {
  const { id } = req.params;
  console.log(id, 'id here');
  const { email, name } = req.body;

  try {
    const updatedUser = await prisma.user.update({
      where: { id: parseInt(id) },
      data: {
        name,
        email,
      },
    });

    res.status(201).json(updatedUser);
  } catch (error) {
    console.error(error);
  }
};

module.exports = { addUser, getAllUsers, updateUser };
