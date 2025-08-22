import db from "../db.js";

// Ambil bab + progres + nama_pelajaran berdasarkan id_pelajaran
export const getBabAndProgresByPelajaran = async (req, res) => {
  try {
    const { id_pelajaran } = req.query;

    if (!id_pelajaran) {
      return res.status(400).json({ message: "id_pelajaran wajib diisi" });
    }

    // Ambil nama pelajaran
    const [pelajaranRows] = await db.execute(
      "SELECT nama_pelajaran, icon FROM pelajaran WHERE id_pelajaran = ?",
      [id_pelajaran]
    );
    const nama_pelajaran = pelajaranRows.length > 0 ? pelajaranRows[0].nama_pelajaran : null;
    const icon_pelajaran = pelajaranRows.length > 0 ? pelajaranRows[0].icon : null;

    // Ambil semua bab dari pelajaran tertentu
    const [bab] = await db.execute(
      "SELECT * FROM bab WHERE id_pelajaran = ?",
      [id_pelajaran]
    );

    if (bab.length === 0) {
      return res.json({ nama_pelajaran, bab: [], progres: [] });
    }

    // Ambil semua id_bab dari bab hasil query
    const idBabList = bab.map(b => b.id_bab);

    // Query progres untuk bab-bab tersebut
    const [progres] = await db.query(
      `SELECT * FROM progres_bab WHERE id_bab IN (${idBabList.map(() => "?").join(",")})`,
      idBabList
    );

    res.json({
      nama_pelajaran: nama_pelajaran || "",
      icon_pelajaran: icon_pelajaran || "/img/default.png",
      bab,
      progres
    });

  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
export default { getBabAndProgresByPelajaran };