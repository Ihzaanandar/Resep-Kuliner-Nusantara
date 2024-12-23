import javax.swing.*;
import java.sql.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Login implements ActionListener {
    private static JTextField userText;
    private static JPasswordField passwordText;
    private static JLabel messageLabel;
    private JFrame frame;

    public Login() {
        // Membuat frame utama
        frame = new JFrame("Kuliner Nusantara - Login");
        frame.setSize(400, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Membuat panel utama
        JPanel panel = new JPanel();
        panel.setLayout(null);
        frame.add(panel);

        // Label judul di bagian atas
        JLabel titleLabel = new JLabel("Selamat Datang di Kuliner Nusantara", SwingConstants.CENTER);
        titleLabel.setBounds(50, 10, 300, 30);
        panel.add(titleLabel);

        // Label untuk Username
        JLabel userLabel = new JLabel("Username:");
        userLabel.setBounds(50, 60, 80, 25);
        panel.add(userLabel);

        // Text field untuk Username
        userText = new JTextField(20);
        userText.setBounds(150, 60, 180, 25);
        panel.add(userText);

        // Label untuk Password
        JLabel passwordLabel = new JLabel("Password:");
        passwordLabel.setBounds(50, 100, 80, 25);
        panel.add(passwordLabel);

        // Password field untuk Password
        passwordText = new JPasswordField(20);
        passwordText.setBounds(150, 100, 180, 25);
        panel.add(passwordText);

        // Tombol Login
        JButton loginButton = new JButton("Login");
        loginButton.setBounds(50, 150, 120, 30);
        loginButton.addActionListener(this);
        panel.add(loginButton);

        // Tombol Sign Up
        JButton signupButton = new JButton("Sign Up");
        signupButton.setBounds(200, 150, 120, 30);
        signupButton.addActionListener(e -> {
            // Memunculkan form sign up
            signUpForm();
        });
        panel.add(signupButton);

        // Label untuk pesan berhasil/gagal login
        messageLabel = new JLabel("", SwingConstants.CENTER);
        messageLabel.setBounds(36, 200, 300, 25);
        panel.add(messageLabel);

        // Menampilkan frame
        frame.setVisible(true);
    }

    private void signUpForm() {
        JFrame signupFrame = new JFrame("Kuliner Nusantara - Sign Up");
        signupFrame.setSize(400, 300);
        signupFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        JPanel panel = new JPanel();
        panel.setLayout(null);
        signupFrame.add(panel);

        JLabel userLabel = new JLabel("Username:");
        userLabel.setBounds(50, 60, 80, 25);
        panel.add(userLabel);

        JTextField userText = new JTextField(20);
        userText.setBounds(150, 60, 180, 25);
        panel.add(userText);

        JLabel passwordLabel = new JLabel("Password:");
        passwordLabel.setBounds(50, 100, 80, 25);
        panel.add(passwordLabel);

        JPasswordField passwordText = new JPasswordField(20);
        passwordText.setBounds(150, 100, 180, 25);
        panel.add(passwordText);

        JButton registerButton = new JButton("Register");
        registerButton.setBounds(130, 150, 120, 30);
        registerButton.addActionListener(e -> {
            String username = userText.getText();
            String password = new String(passwordText.getPassword());

            if (username.isEmpty() || password.isEmpty()) {
                JOptionPane.showMessageDialog(signupFrame, "Username dan Password tidak boleh kosong!", "Peringatan", JOptionPane.WARNING_MESSAGE);
            } else {
                // Simpan data ke database
                String url = "jdbc:mysql://localhost:3306/db_Kuliner_Nusantara";
                String dbUser = "root";
                String dbPassword = "";

                try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword)) {
                    // Periksa apakah username sudah ada
                    String checkQuery = "SELECT * FROM login WHERE username = ?";
                    try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                        checkStmt.setString(1, username);
                        ResultSet rs = checkStmt.executeQuery();

                        if (rs.next()) {
                            JOptionPane.showMessageDialog(signupFrame, "Username sudah terdaftar!", "Peringatan", JOptionPane.WARNING_MESSAGE);
                        } else {
                            // Simpan data baru
                            String insertQuery = "INSERT INTO login (username, password) VALUES (?, ?)";
                            try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                                insertStmt.setString(1, username);
                                insertStmt.setString(2, password);

                                insertStmt.executeUpdate();
                                JOptionPane.showMessageDialog(signupFrame, "Pendaftaran berhasil!", "Sukses", JOptionPane.INFORMATION_MESSAGE);
                                signupFrame.dispose();
                            }
                        }
                    }
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(signupFrame, "Gagal menyimpan data: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                    ex.printStackTrace();
                }
            }
        });
        panel.add(registerButton);

        signupFrame.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String user = userText.getText();
        String password = new String(passwordText.getPassword());

        // Koneksi ke database
        String url = "jdbc:mysql://localhost:3306/db_Kuliner_Nusantara";
        String dbUser = "root";
        String dbPassword = "";

        try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword)) {
            String query = "SELECT * FROM login WHERE username = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, user);
                stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    frame.dispose(); // Menutup frame login
                    JOptionPane.showMessageDialog(null, "Selamat Datang, " + user + "!", "Login Berhasil", JOptionPane.INFORMATION_MESSAGE);
                    new Frame();
                } else {
                    JOptionPane.showMessageDialog(null, "Username atau Password salah!", "Login Gagal", JOptionPane.INFORMATION_MESSAGE);
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Gagal terkoneksi ke database: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            ex.printStackTrace();
        }
    }
}
