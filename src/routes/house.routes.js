const express = require('express')
const { addHouse, getHouses } = require('../controllers/house')
const router = express.Router()

router.route('/house').get(getHouses).post(addHouse)

module.exports = router