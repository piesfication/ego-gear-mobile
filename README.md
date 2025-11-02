Muhammad Rafi Sugianto / PBP B / 2406357135


<details>
<Summary><b>Tugas 7</b></Summary>

[TUGAS 7]

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Jawab: Dalam Flutter, seluruh tampilan seperti teks, tombol, gambar, dst disebut widget. Flutter membangun userinterface dengan menyusun widget secara bertingkat yg disebut widget tree. Bayangkan jika kita membuat rumah dari balok lego yg kecil, setiap balok bisa dihubungkan ke balok lain dan membentuk struktur yg lebih besar. Flutter bekerja dengan prinsip yg sama, yaitu setiap elemen kecil di layar adalah satu widget, dan widget itu bisa berisi widget lain di dalamnya. Misalnya, satu halaman aplikasi biasanya dimulai dengan sebuah Scaffold yg memegang AppBar dan Body. Di sini konsep parent-child relationship atau hubungan induk-anak muncul. Widget yg membungkus widget lain disebut parent, sementara widget yg ada di dalamnya disebut child. Hubungan parent-child pada Flutter adalah sistem hierarki di mana widget induk (parent) membungkus dan mengatur widget anak (child). Parent menentukan posisi, ukuran, gaya, dan konteks bagi childnya, misalnya Column menata anak-anaknya secara vertikal, Row secara horizontal, dan Padding memberi jarak di sekelilingnya. Child kemudian mengisi ruang yg disediakan parent dengan kontennya, missal berupa teks atau icon. Singkatnya, parent mengatur struktur dan layout, sementara child menampilkan isi visualnya. Seluruh tampilan Flutter terbentuk dari hubungan parent-child ini dalam satu widget tree besar yg saling terhubung.

-----------------------------------------------------------------------------------------------

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Jawab: Widget yg digunakan dalam projek ini di antaranya adalah

- MyApp, adalah StatelessWidget yg menjadi aroot dari aplikasi.
Ia memanggil MaterialApp untuk menjalankan seluruh struktur aplikasi Flutter.

- MaterialApp, adalah widget utama Flutter berbasis desain Material Design.
Ia mengatur tema, judul, halaman awal home, serta navigasi aplikasi.

- MyHomePage, adalah StatelessWidget yg menjadi tampilan utama aplikasi.
Di dalamnya terdapat struktur halaman menggunakan Scaffold.

- Scaffold, menyediakan kerangka dasar halaman dengan elemen umum seperti AppBar, Body, FloatingActionButton, dan Drawer.

- AppBar, adalah header dari halaman yg biasanya menampilkan judul, ikon navigasi, atau tombol aksi.

- SingleChildScrollView, memungkinkan konten halaman discroll ketika isinya lebih tinggi dari layar.

- Padding, memberikan jarak di sekitar widget anaknya.

- Column, menyusun widget secara vertikal.

- Row, menyusun widget secara horizontal.

- InfoCard, adalah StatelessWidget yg menampilkan kotak berisi informasi (seperti NPM, Nama, Kelas).

- Card, adalah widget Material Design berbentuk kotak dengan bayangan untuk menampilkan informasi yg terpisah seperti kartu profil atau item.

- Text, digunakan untuk menampilkan teks.

- SizedBox, digunakan untuk memberi jarak kosong antar widget atau menentukan ukuran tetap.

- Center, menempatkan widget anak di tengah baik secara vertikal maupun horizontal dalam area.

- Material, memberikan efek visual Material Design (seperti bayangan, warna dasar, dan efek gelombang).

- InkWell, adalah widget interaktif yg mendeteksi tap dan menampilkan efek “ripple”.

- Container, adalah widget serbaguna untuk mengatur ukuran, padding, warna, margin, dan alignment dari widget di dalamnya.

- ScaffoldMessenger, digunakan untuk menampilkan pesan singkat (SnackBar) di bagian bawah layar.

- SnackBar, notifikasi singkat yg muncul di bawah layar untuk memberi feedback ke user.

- Icon, menampilkan icon.

- GridView.count, adalah variasi dari GridView yg menyusun item dalam bentuk grid dengan jumlah kolom tetap.

- Theme, adalah widget yg menyimpan pengaturan warna, font, dan gaya global aplikasi.

-----------------------------------------------------------------------------------------------

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

Jawab: Widget MaterialApp berfungsi sebagai root frmaework untuk aplikasi Flutter yg menggunakan gaya Material Design, yaitu sebuah design system buatan Google yg memberikan tampilan dan perilaku standar seperti tombol, warna, animasi, dan tata letak khas Android modern. Menggunakan MaterialApp mengaktifkan seluruh ekosistem fitur Material, seperti:

- Tema global (ThemeData), yg mengatur warna, font, dan gaya seluruh aplikasi.
- Navigasi halaman (Navigator) dan sistem routing antar-screen.
- Widget bawaan Material Design, seperti Scaffold, AppBar, FloatingActionButton, dan SnackBar.
- Pengaturan dasar aplikasi, seperti title, home, debugShowCheckedModeBanner, dan locale.

MaterialApp hampir selalu digunakan sebagai widget root karena ia berfungsi sebagai dasar yg menyediakan konteks global (melalui BuildContext) bagi semua widget di bawahnya.
Tanpa MaterialApp, widget seperti Scaffold, AppBar, atau Theme.of(context) tidak akan bisa berfungsi dengan benar, karena mereka membutuhkan desain dan navigasi yg disediakan oleh MaterialApp.

-----------------------------------------------------------------------------------------------

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Jawab: Perbedaan utama antara StatelessWidget dan StatefulWidget terletak pada apakah widget tersebut dapat berubah atau tidak selama aplikasi sedang running. StatelessWidget adalah widget statis, yaitu widget yg tampilannya tidak berubah setelah dirender. Data yg digunakan oleh widget ini bersifat final dan hanya dapat diubah dengan merender ulang widget widget dari luar, bukan dari perubahan internal. Sedangkan, StatefulWidget adalah widget yg memiliki state internal, yaitu data yg bisa berubah selama aplikasi running tanpa merender ulang seluruh widget dari luar. Setiap kali state berubah, Flutter akan memanggil method build() untuk memperbarui tampilan dengan state terbaru. 

StatelessWidget dipilih jika ingin membuat tampilan yg tidak bergantung pada data yg berubah, misal teks statis, ikon, atau layout sederhana. Sementara StatefulWidget digunakan jika perlu menyimpan, mengubah, atau memantau data yg memengaruhi tampilan, seperti input pengguna, animasi, atau interaksi real-time.

-----------------------------------------------------------------------------------------------

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

Jawab: BuildContext adalah objek yg menyimpan informasi tentang posisi suatu widget di dalam widget tree Flutter. BuildContext memberi tahu Flutter siapa parent dari widget itu, widget apa saja yg mengelilinginya, serta sumber data atau tema apa yg bisa diakses dari posisi tersebut.

BuildContext penting karena dari sini widget bisa mengakses data atau fungsi dari widget lain yg berada di atasnya, seperti tema aplikasi (Theme.of(context)), ukuran layar (MediaQuery.of(context)), navigasi halaman (Navigator.of(context)), dst.

Dalam metode build(BuildContext context), Flutter memberikan context kepada setiap widget yg dibangun, agar widget tersebut tahu posisinya dalam hierarki interface, misal:

    backgroundColor: Theme.of(context).colorScheme.primary,

context digunakan untuk mencari theme terdekat dari widget tersebut.

BuildContext memungkinkan setiap widget dibangun dengan tampilan dan perilaku yg sesuai dengan posisi dan kondisi tempatnya berada.

-----------------------------------------------------------------------------------------------

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Jawab: Hot reload di Flutter adalah fitur yg memungkinkan developer melihat perubahan kode secara langsung tanpa harus menghentikan dan menjalankan ulang aplikasi. Ketika terdapat perubahan yg dilakukan pada aplikasi, Flutter akan menginject kode baru ke dalam aplikasi yg sedang berjalan dan rebuild widget tree dari state yg ada. Hasilnya, tampilan berubah sesuai kode terbaru, tetapi data dan state aplikasi (seperti nilai counter, posisi halaman, input pengguna) tetap dipertahankan.

Sementara itu, hot restart akan menjalankan aplikasi ulang dari awal. Flutter akan menghapus seluruh state dan objek yg sudah dibuat di memori, lalu memulai ulang fungsi main(). Akibatnya, semua data sementara hilang, tapi aplikasi benar-benar memuat ulang seluruh logika dan struktur dari awal.

Hot reload cocok untuk mengubah tampilan atau isi dalam metode build(), sedangkan hot restart digunakan untuk melihat perubahan setelah mengubah struktur logika besar seperti variabel global, main(), atau isi initState() yg tidak ikut diperbarui oleh hot reload.

</details>
