import java.sql.*;

public class DbResep {
    static String url = "jdbc:mysql://localhost:3306/db_Kuliner_Nusantara";
    static String dbUser = "root";
    static String dbPassword = "";

    // Metode untuk mendapatkan langkah memasak dari database
    public static String getLangkah(String makanan) {
        String hasil = "Resep tidak ditemukan.";
        try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword)) {
            String query = "SELECT bahan, langkah FROM resep WHERE nama_makanan = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, makanan);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                hasil = "Bahan - bahan:\n" + rs.getString("bahan") +
                        "\n\nLangkah - langkah:\n" + rs.getString("langkah");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            hasil = "Terjadi kesalahan: " + e.getMessage();
        }
        return hasil;
    }
}
