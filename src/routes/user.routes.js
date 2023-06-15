const express = require('express');
const {
  addUser,
  getAllUsers,
  updateUser,
} = require('../controllers/user');

const router = express.Router();

router.route('/user').get(getAllUsers).post(addUser);
router.route('/user/:id').patch(updateUser);

module.exports = router;
