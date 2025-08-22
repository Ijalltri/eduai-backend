import db from '../db.js';
import jwt from "jsonwebtoken";
// Fungsi untuk login user
export const loginUser = async (req, res) => {
  const { email, password } = req.body;

  try {
    const [rows] = await db.query('SELECT * FROM users WHERE email = ?', [email]);

    if (rows.length === 0) {
      return res.status(404).json({ message: 'User tidak ditemukan' });
    }
    const user = rows[0];

    if (rows[0].password !== password) {
      return res.status(401).json({ message: 'Password salah' });
    }
    return res.json({
      message: 'Login berhasil!',
      user: {
        id: user.id_user,
        username: user.username,
        email: user.email
      }
    });
  } catch (err) {
    console.error('Database error:', err);
    return res.status(500).json({ message: 'Terjadi kesalahan pada server' });
  }
};

export const signinUser = async (req, res) => {
  const { username, email, password } = req.body;

  if (!username || !email || !password) {
    return res.status(400).json({ message: 'Username, email, dan kata sandi harus diisi' });
  }

  try {
    const [existingUsers] = await db.query('SELECT * FROM users WHERE email = ?', [email]);
    if (existingUsers.length > 0) {
      return res.status(400).json({ message: 'Email sudah terdaftar' });
    }

    const [result] = await db.query(
      'INSERT INTO users (username, email, password) VALUES (?, ?, ?)',
      [username, email, password]
    );

    return res.status(201).json({ message: 'User berhasil ditambahkan', id: result.insertId });
  } catch (err) {
    console.error('Database error:', err);
    return res.status(500).json({ message: 'Terjadi kesalahan pada server', error: err.message });
  }
};



export default { loginUser, signinUser };