import express from 'express';
import cors from 'cors';
import jenjangroutes from './routes/jenjangroutes.js';
import pelajaranroutes from './routes/pelajaranroutes.js';
import loginroutes from './routes/loginroutes.js';
import materiroutes from './routes/materiroutes.js';
import babroutes from './routes/babroutes.js';
// import signinroutes from './routes/signinroutes.js';

const app = express();
app.use(cors({ origin: 'http://localhost:5173' }));
app.use(express.json());

// Register routes
// app.use('/api/regis', signinroutes);
app.use('/api/auth', loginroutes);
app.use('/api/jenjang', jenjangroutes);
app.use('/api/pelajaran', pelajaranroutes);
app.use('/api/materi', materiroutes);
app.use('/api/bab', babroutes);

// Handle 404
app.use((req, res) => {
  res.status(404).json({ message: 'Rute tidak ditemukan' });
});

// Handle errors
app.use((err, req, res, next) => {
  console.error('Error:', err.message);
  res.status(500).json({ message: 'Terjadi kesalahan pada server', error: err.message });
});

app.listen(5000, () => console.log('Server running on port 5000'));