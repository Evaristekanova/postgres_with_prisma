const express = require('express');
const userRoutes = require('./routes/user.routes');
const app = express();

app.use(express.json());
app.use('/api/v1', userRoutes);
app.get('*', async (req, res) => {
  res.status(404).json({ message: 'endpoint not found' });
});
app.listen(3000, () =>
  console.log('Server started on port 3000........')
);
