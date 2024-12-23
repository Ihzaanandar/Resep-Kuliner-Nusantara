import java.awt.event.*;
import java.io.FileWriter;
import java.io.IOException;
import javax.swing.*;

// Kelas DetailFrame digunakan untuk menampilkan detail resep makanan
// Menggunakan **Inheritance** karena mewarisi JFrame
public class DetailFrame extends JFrame {
    public DetailFrame(String makanan) {
        setTitle("Detail DbResep");
        setSize(500, 500);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(null);

        // Menambahkan judul aplikasi
        JLabel titleLabel = new JLabel("Kuliner Nusantara", SwingConstants.CENTER);
        titleLabel.setBounds(155, 20, 200, 30);

        // Label untuk nama makanan
        JLabel resepLabel = new JLabel("Resep : " + makanan);
        resepLabel.setBounds(50, 60, 300, 30);

        // Area teks untuk menampilkan langkah-langkah resep
        JTextArea langkahArea = new JTextArea();
        langkahArea.setText(DbResep.getLangkah(makanan)); // Mengambil langkah dari kelas DbResep
        langkahArea.setEditable(false);

        // Membungkus JTextArea dalam JScrollPane agar bisa di-scroll
        JScrollPane scrollPane = new JScrollPane(langkahArea);
        scrollPane.setBounds(50, 100, 400, 280); // Atur posisi dan ukuran scroll pane

        // Tombol kembali ke frame utama
        JButton kembaliButton = new JButton("Kembali");
        kembaliButton.setBounds(100, 395, 120, 30);

        // Tombol untuk mencetak resep ke file
        JButton cetakButton = new JButton("Cetak");
        cetakButton.setBounds(240, 395, 120, 30);

        // Event listener untuk tombol kembali
        kembaliButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                new Frame(); // Membuka frame utama
                dispose(); // Menutup frame detail
            }
        });

        // Event listener untuk tombol cetak
        cetakButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                saveToFile(makanan, DbResep.getLangkah(makanan)); // Menyimpan resep ke file
            }
        });

        // Menambahkan komponen ke frame
        add(titleLabel);
        add(resepLabel);
        add(scrollPane);  // Menambahkan JScrollPane yang berisi JTextArea
        add(kembaliButton);
        add(cetakButton);

        setVisible(true); // Menampilkan frame
    }

    // Metode untuk menyimpan resep ke file
    private void saveToFile(String makanan, String langkah) {
        try {
            String folder = "D:/Documents/Ngoding/Java/Project/KulinerNusantara_0.2/cetak";
            FileWriter writer = new FileWriter(folder + "/" + makanan + ".txt");
            writer.write("Resep: " + makanan + "\n\n" + langkah);
            writer.close();
            JOptionPane.showMessageDialog(null, "Resep berhasil disimpan sebagai " + makanan + ".txt");
        } catch (IOException e) {
            JOptionPane.showMessageDialog(null, "Gagal menyimpan file!");
            e.printStackTrace();
        }
    }
}
