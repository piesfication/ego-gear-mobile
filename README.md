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

<details>
<Summary><b>Tugas 8</b></Summary>

[TUGAS 8]
 
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Jawab: Dalam Flutter, sistem navigasi bekerja seperti stack halaman. Ketika membuka halaman baru, Flutter akan mempush halaman baru tsb diatas halaman sebelumnya. Navigator.push() digunakan untuk menambahkan halaman baru di atas tumpukan tsb tanpa menghapus halaman sebelumnya. Halaman lama tetap disimpan di memori, dan pengguna bisa kembali dengan menekan tombol back. Sementara itu, Navigator.pushReplacement() bekerja dnegan mengganti halaman yg sedang ditampilkan dengan halaman baru, bukan menambahkannya di atas tumpukan. Halaman sebelumnya dihapus dari memori, dan pengguna tidak dapat kembali ke sana dengan tombol back. Menggunakan Navigator.pushReplacement() ibarat melakukan pop sekali dan melakukan push halaman baru ke stack. Dalam aplikasi Football Shop, Navigator.push() sebaiknya digunakan pada kasus dmn pengguna masih bisa kembali ke halaman sebelumnya, misal saat berpindah dari Home Page ke Add Product Form Page, pengguna bisa kembali ke beranda jika membatalkan pengisian. Sementara Navigator.pushReplacement() sebaiknya digunakan pada kasus dmn pengguna tidak bisa kembali ke halaman sebelumnya, misal saat menekan tombol Home, pengguna akan diarahkan ke halaman Home tapi tidak bisa ke halaman sebelumnya karena ia sudah di Home.

-----------------------------------------------------------------------------------------------

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Jawab: Scaffold digunakan sbg kerangka utama setiap halaman. Scaffold menyediakan struktur dasar interface seprti area untuk AppBar di atas, body di tengah, serta Drawer. Dengan menggunakan Scaffold secara konsisten, setiap halaman dalam aplikasi memiliki tata letak yg seragam dan mudah dikenali pengguna.

AppBar digunakan sebagai elemen navigasi dan identitas halaman. Setiap halaman di aplikasi menampilkan AppBar dengan warna dan gaya yg sama sehingga pengguna merasa berada dalam lingkungan aplikasi yg sama meskipun berpindah halaman.

Drawer dimanfaatkan sebagai menu navigasi global. Drawe ditempatkan di Scaffold, sehingga pengguna dapat mengakses berbagai halaman utama seperti Home, Add Product, dan About dari satu tempat tanpa perlu kembali ke halaman sebelumnya. Drawer membantu menjaga konsistensi navigasi di seluruh aplikasi, karena struktur menunya sama di setiap halaman.

-----------------------------------------------------------------------------------------------

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Jawab: Dalam konteks desain antarmuka, penggunaan layout widget seperti Padding, SingleChildScrollView, dan ListView membuat tampilan form menjadi lebih rapih dan responsif di berbagai ukuran layar.

Padding memberikan jarak antar elemen form sehingga tampilan tidak terlalu rapat dan lebih mudah dibaca. Misalnya, pada aplikasi EGO Gear, setiap input seperti Name, Price, Description, dst dibungkus dengan Padding
utk memberi jarak antara TextFormField dan elemen lain di sekitarny.

SingleChildScrollView digunakan agar seluruh form bisa discroll ketika isinya lebih panjang dari layar. Ini penting saat form memiliki banyak input field atau ketika keyboard muncul dan menutupi sebagian tampilan. Misalnya, pada aplikasi EGO Gear ketik pengguna melakukan pengisian form pada Create Gear , SingleChildScrollView digunakan agar seluruh form bisa discroll ketika tinggi konten melebihi tinggi layar.
Tanpa SingleChildScrollView, jika pengguna membuka keyboard atau jika banyak field seperti Name, Price, Description, dst sebagian form akan tidak terlihat.

Listview digunakan saat jika ingin menampilkan banyak item yg tersusun secara vertikal dan bisa langsung discroll, seperti daftar produk atau menu di Drawer. MIsalnya, pada apliksi EGO Gear, Litview digunakan di drawer agar isi drawer bisa discroll jika jumlah item di dalamnya terlalu banyak dan tidak muat di layar.
-----------------------------------------------------------------------------------------------

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yg konsisten dengan brand toko?

Jawab: Agar memiliki identitas visual yg konsisten, warna tema disesuaikan menggunakan widget ThemeData di MaterialApp. Dengan ThemeData, kita bisa menetapkan warna utama, sekunder, aksen, dst, serta style default untuk berbagai widget seperti AppBar, tombol, dan teks. Hal ini memastikan seluruh halaman aplikasi mengikuti warna dan style yg seragam, sehingga pengguna langsung mengenali identitas visual apliasi tsb.

-----------------------------------------------------------------------------------------------
 
</details>
    