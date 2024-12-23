import java.awt.event.*;
import javax.swing.*;

// Kelas Frame digunakan untuk menampilkan tampilan utama aplikasi
// Menggunakan konsep **Inheritance** karena mewarisi kelas JFrame
public class Frame extends JFrame {
    private JComboBox<String> provinsiComboBox; // Dropdown untuk memilih provinsi
    private JComboBox<String> makananComboBox; // Dropdown untuk memilih makanan
    private JButton tampilkanButton; // Tombol untuk menampilkan detail makanan

    public Frame() {
        setTitle("Kuliner Nusantara");
        setSize(500, 500);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(null);

        // Menambahkan judul aplikasi
        JLabel titleLabel = new JLabel("Kuliner Nusantara", SwingConstants.CENTER);
        titleLabel.setBounds(155, 20, 200, 30);

        // Label untuk provinsi
        JLabel provinsiLabel = new JLabel("Provinsi:");
        provinsiLabel.setBounds(50, 80, 100, 30);

        // Dropdown untuk memilih provinsi
        provinsiComboBox = new JComboBox<>(new String[]{"Pilih Provinsi", "Jawa Tengah", "Jawa Timur", "Jawa Barat"});
        provinsiComboBox.setBounds(150, 80, 200, 30);

        // Label untuk makanan
        JLabel makananLabel = new JLabel("Makanan:");
        makananLabel.setBounds(50, 130, 100, 30);

        // Dropdown untuk memilih makanan
        makananComboBox = new JComboBox<>(new String[]{"Pilih Makanan"});
        makananComboBox.setBounds(150, 130, 200, 30);

        // Tombol untuk menampilkan detail makanan
        tampilkanButton = new JButton("Tampilkan");
        tampilkanButton.setBounds(150, 180, 100, 30);

        // Event listener untuk mengubah daftar makanan berdasarkan provinsi yang dipilih
        provinsiComboBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String selectedProvinsi = (String) provinsiComboBox.getSelectedItem();
                updateMakananList(selectedProvinsi); // Memperbarui daftar makanan
            }
        });

        // Event listener untuk tombol tampilkan
        tampilkanButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String makanan = (String) makananComboBox.getSelectedItem();
                if (!makanan.equals("Pilih Makanan")) {
                    new DetailFrame(makanan); // Membuka frame detail
                    dispose(); // Menutup frame utama
                } else {
                    JOptionPane.showMessageDialog(null, "Silakan pilih makanan!");
                }
            }
        });

        // Menambahkan komponen ke frame
        add(titleLabel);
        add(provinsiLabel);
        add(provinsiComboBox);
        add(makananLabel);
        add(makananComboBox);
        add(tampilkanButton);

        setVisible(true); // Menampilkan frame
    }

    // Metode untuk memperbarui daftar makanan berdasarkan provinsi yang dipilih
    private void updateMakananList(String provinsi) {
        makananComboBox.removeAllItems(); // Menghapus item lama
        if (provinsi.equals("Jawa Tengah")) {
            makananComboBox.addItem("Tahu Petis");
            makananComboBox.addItem("Tempe Mendoan");
            makananComboBox.addItem("Wingko Babat");
        } else if (provinsi.equals("Jawa Timur")) {
            makananComboBox.addItem("Sate Madura");
            makananComboBox.addItem("Tahu Tek");
            makananComboBox.addItem("Bakso Malang");
        } else if (provinsi.equals("Jawa Barat")) {
            makananComboBox.addItem("Ubi Cilembu");
            makananComboBox.addItem("Batagor");
            makananComboBox.addItem("Seblak");
        } else {
            makananComboBox.addItem("Pilih Makanan");
        }
    }
}
