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

Jawab: Perbedaan utama antara StatelessWidget dan StatefulWidget terletak pada apakah widget tsb dapat berubah atau tidak selama aplikasi sedang running. StatelessWidget adalah widget statis, yaitu widget yg tampilannya tidak berubah setelah dirender. Data yg digunakan oleh widget ini bersifat final dan hanya dapat diubah dengan merender ulang widget widget dari luar, bukan dari perubahan internal. Sedangkan, StatefulWidget adalah widget yg memiliki state internal, yaitu data yg bisa berubah selama aplikasi running tanpa merender ulang seluruh widget dari luar. Setiap kali state berubah, Flutter akan memanggil method build() untuk memperbarui tampilan dengan state terbaru. 

StatelessWidget dipilih jika ingin membuat tampilan yg tidak bergantung pada data yg berubah, misal teks statis, ikon, atau layout sederhana. Sementara StatefulWidget digunakan jika perlu menyimpan, mengubah, atau memantau data yg memengaruhi tampilan, seperti input pengguna, animasi, atau interaksi real-time.

-----------------------------------------------------------------------------------------------

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

Jawab: BuildContext adalah objek yg menyimpan informasi tentang posisi suatu widget di dalam widget tree Flutter. BuildContext memberi tahu Flutter siapa parent dari widget itu, widget apa saja yg mengelilinginya, serta sumber data atau tema apa yg bisa diakses dari posisi tsb.

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

<details>
<Summary><b>Tugas 9</b></Summary>

[TUGAS 9]

1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Jawab: Model Dart akan memberi kita struktur yg jelas mengenai bnetuk data yg diterima/kirim,misal field2nya punya tipe yg sudah ditentukan sehingga kesalahan tipe/field kosong bisa dideteksi langsung. Misal kita memkai Map<String, dynamic> maka semua datanya akan menjadi dynamic. Karena nilainya dynamic, Dart tidak bisa memastikan kebenaran tipe pada saat compile time, sehingga jika kita mengasumsikan tipe yg salah, program baru error saat dijalankan. Selnjutnya, dengan model kita bisa menentukan field yg bisa null atau wajib ada sehingga menjaga aspek null safety. Misal kalau pakai Map langsung, key yg tidak ada atau value yg null tidak akan tertangkap. Selain itu, model membuat aplikasi lebih mudah dimaintain karena semua perubahan struktur API cukup dilakukan dengan merubah model dartnya. Jika tidak memakai model, maka kita harus menyesuaikan key Map di banyak file yg membuat proyek sulit dibaca

-----------------------------------------------------------------------------------------------

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Jawab: Package http adalah package yg berfungsi utk melakukan request ke server (GET, POST, dst). Package CookieRequest adalah package yg berfungsi agar bisa terhubung dengan backend django yg memakai session based auth.  CookieRequest berperan utk menyimpan cookie session setelah login dr sessionid, mengirim cookie tersebut otomatis di setiap request selanjutnya, serta menangani login, logout, post JSON, dan get JSON dengan autentikasi server. Http request tidak menyimpan cookie dan tidak bisa mempertahankan sesi login, sehingga ia berperan untuk melakukan request yg tidak memerlukan autentikasi.

-----------------------------------------------------------------------------------------------

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Jawab: Ketika pengguna login Django akan memberikan cookie sessionid, CookieRequest menyimpan cookie itu secara internal. Agar aplikasi mengetahui bahwa pengguna sudah login dan bisa mengakses endpoint, kita harus menggunakan instance CookieRequest yg sama di semua screen.

Misal setiap halaman membuat instance CookieRequest baru, maka instance tersebut tidak memiliki cookie session yg sama, sehingga halaman selanjutnya tidak tahu bahwa user sudah login karena state login hilang setiap pindah halaman.

Dengan menggunakan satu instance CookieRequest yg sama di seluruh widget maka status login, session, dan cookie selalu konsisten dan sinkron di semua bagian aplikasi. Ini memastikan bahwa aplikasi tetap mengingat user sudah login selama sesi berlangsung.

-----------------------------------------------------------------------------------------------

4. Jelaskan konfigurasi konektivitas yg diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yg akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Jawab: Untuk Flutter bisa berkomunikasi dgn Django ada beberapa lapisan keamanan yg harus dilewati supaya request dari aplikasi Android dianggap valid oleh Django. Hal pertama yg perlu dilakukan adalah memasukkan 10.0.2.2 ke dalam ALLOWED_HOSTS. 10.0.2.2 adalah alamat khusus yg merepresentasikan localhost komputer host di emulator android, krn emulator tidak bisa langsung mengakses 127.0.0.1. Jika Django tidak mengenali alamat seperti 10.0.2.2, Django akan menganggap permintaan tsb berbahaya dan menolak akan menolak request krn mengira request itu berasal dari domain asing.

Setelah itu, ada permasalahan dengan CORS. Flutter berjalan di Android/Web sehingga dianggap sbg origin berbeda dari server Django. Demi keamanan, browser dan webview tidak akan membiarkan aplikasi mengakses API dari domain berbeda kecuali servernya mengizinkan. Oleh krn itu kita perlu mengaktifkan CORS dan menambahkan domain aplikasi Flutter di CORS_ALLOWED_ORIGINS. Jika tidak, maka request akan diblokir di sisi client.

Selanjutnya adalah cookie dan pengaturan SameSite. Django secara default akan membuat cookie dengan aturan keamanan ketat, namun Flutter yg menggunakan CookieRequest mengirim dan menerima cookie lewat cross site request. Jika cookie Django tidak diatur sebagai SameSite=None; Secure, maka browser/emulator akan menolak cookie session, sehingga login selalu gagal meski username dan password benar. Sehingga aplikasi tidak pernah dianggap sudah log in dan semua request setelah login akan dianggap anonymous oleh Django.

Selain itu, Android juga memerlukan izin akses internet di file AndroidManifest.xml. Tanpa izin ini, aplikasi Flutter tidak bisa mengakses jaringan.

Apa yg akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar? Jika salah satu dari konfigurasi yg disebutkan di atas tidak dilakukan dgn benar, maka Flutter dan Django tidak akan bisa saling berkomunikasi. Akibatnya yaitu app bisa gagal login, gagal mengambil data, request diblokir, dst.

-----------------------------------------------------------------------------------------------

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Jawab: User pertama akan mengisi form di flutter. Flutter akan mengubah input menjadi JON dengan jsonEncode. Kemudian, Flutter mengirimkan requst ke endpoint DJango dimana Django akan menerima request tsb dan memprosesnya. Django membaca request body JSON dan memvalidasi data berdasarkan model yg ada di Django, lalu membuat objek model baru dan menyimpan ke database. Django mengembalikan response berupa JSON yg kemudian akan diteirma oleh Flutter. Adapun saat mengambil data (GET), Flutter biasanya akan menerima list JSON, FLutter menerjemahkan JSON ke model dart. Model dart tsb kemudian dikirin ke UI dan ditampilkan dengan menmanfaatkan FutureBuilder, ListView, atau Provider.

-----------------------------------------------------------------------------------------------

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Jawab: User akan mengisi data registrasi pada form Flutter, yg diisi pada form ini kemudian diambil oleh Flutter dan diubah menjadi sebuah objek JSON menggunakan jsonEncode. JSON tsb lalu dikirimkan ke server Django melalui sebuah request HTTP POST menuju endpoint register yg sudah disiapkan di backend. Django menerima JSON ini melalui body request, mengubahnya kembali menjadi dictionary Python, lalu mulai melakukan proses validasi dengan memeriksa apakah username sudah pernah digunakan, apakah format email valid, memastikan password memenuhi syarat keamanan tertentu dst. Selanjutnya, Django membuat objek user baru menggunakan model User dan menyimpannya ke dalam database. Django mengembalikan response berupa JSON sederhana yg menandakan bahwa proses registrasi berhasil. Flutter menerima response tsb dan menampilkan pesan bahwa pengguna sudah berhasil membuat akun serta mengarahkan mereka menuju halaman login.

Pada proses login, user mengisi username dan password di Flutter, kemudian Flutter mengubah data tsb menjadi JSON dan mengirimkannya ke Django melalui POST request ke endpoint login. Django menerima JSON itu, mengekstrak dan melakukan validasi username dan password. Jika kredensialnya benar, Django mengambil sebuah token autentikasi yg menjadi kunci pengguna untuk setiap interaksi selanjutnya dengan server. Django mengirimkan token ini kembali ke Flutter sebagai bagian dari JSON response.

Flutter kemudian menyimpan token tsb agar tetap dapat digunakan. Setelah token tersimpan, Flutter mengarahkan pengguna ke halaman utama aplikasi, misalnya dashboard atau menu. Dari titik ini, setiap kali Flutter perlu mengambil data dari server, misalnya daftar item, profil pengguna, atau data apa pun yg membutuhkan autentikasi, Flutter akan menyertakan token tsb di header request HTTP. Django akan menerima request tsb dan memeriksa token yg dikirim. Jika token valid maka Django akan memperbolehkan akses ke endpoint tsb dan mengirimkan data yg diminta dalam format JSON. Flutter kemudian membaca JSON tsb, mengubahnya ke model Dart, dan menampilkannya ke UI menggunakan widget seperti FutureBuilder atau state management seperti Provider.

Ketika user melakukan logout, Flutter akan menghapus token yg disimpan sehingga tidak ada lagi kredensial untuk mengakses endpoint Django yg membutuhkan autentikasi. Setelah token dihapus, Flutter mengarahkan pengguna kembali ke halaman login.

-----------------------------------------------------------------------------------------------

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

Jawab: Langkah pertama yg saya lakukan untuk mengimplementasikan checklist diatas adalah mengintegrasikan autentikasi Django-Flutter. Saya melakukan setu up dengan membuat app baru bernama authentication dan menambahkan aplikasi tsb ke INSTALLED_APPS di settings. Selanjutnya, saya mengaktifkan dan mengonfigurasi CORS di Django, dan mengizinkan Android emulator terhubung ke backend Django. Dimulai dengan menginstal library django-cors-headers. Library ini membantu mengatur aturan CORS agar backend bisa diakses oleh aplikasi frontend atau emulator. Setelah diinstal, library tsb didaftarkan ke INSTALLED_APPS dan juga ke dalam MIDDLEWARE, supaya Django tahu bahwa request yg masuk harus diproses oleh middleware ini untuk menambahkan header CORS. Selanjutnya adalah menambahkan konfigurasi CORS_ALLOW_ALL_ORIGINS, CORS_ALLOW_CREDENTIALS, serta pengaturan cookie seperti CSRF_COOKIE_SAMESITE dan SESSION_COOKIE_SAMESITE. Tujuannya adalah agar aplikasi eksternal bisa mengirimkan request ke Django tanpa diblokir. Jika request membutuhkan session atau login, pengaturan ini memastikan cookie tetap terkirim walaupun berasal dari domain berbeda. Terakhir adalah penambahan alamat 10.0.2.2 ke ALLOWED_HOSTS yg membuat Django bisa menerima request dari Android emulator. 

Setelah melakukan konfigurasi tsb, saya menambahkan fungsi login di authentication/views dan melakukan routing. Selanjutnya adalah mengintegrasikan login ini di Flutter. Proses integrasi dimulai dengan menambahkan dua package penting, yaitu provider dan pbp_django_auth. Package pbp_django_auth bertujuan agar aplikasi Flutter dapat berkomunikasi dengan backend Django menggunakan cookie, termasuk login, logout, GET, dan POST. Paket Provider dipasang untuk memudahkan distribusi satu instance CookieRequest ke seluruh widget. Dengan ini, seluruh bagian aplikasi akan berbagi session dan cookie yg sama.

Setelah package-nya dipasang, root widget di main.dart dengan menggunakan Provider utk membungkus MaterialApp. Perubahan ini penting karena Provider menciptakan sebuah objek CookieRequest sekali saja dan menyebarkannya ke semua child widget di dalam aplikasi.

Selanjutnya saya membuat file login.dart yg berisi halaman login yg memanfaatkan CookieRequest dari provider. Halaman ini menyediakan form username dan password, dan ketika tombol login ditekan, halaman tersebut menggunakan request.login() untuk berkomunikasi dengan URL backend Django. Flutter mengirim username dan password, dan menunggu respon Django apakah login berhasil. Saat login berhasil Django akan mengirimkan id dari user yg login (akan digunakan utk mencocokan produk pada filter produk)

Selanjutnya saya memodifikasi halaman login sebagai halaman pertama, yaitu mengubah MaterialApp yg tadinya mengarah ke MyHomePage() diubah menjadi LoginPage(). Ini membuat aplikasi selalu membuka halaman login pertama kali ketika dibuka.

Langkah selanjutnya adalah menambahkan fitur register pada sistem autentikasi Django–Flutter. Saya menambahkan fungsi register di authentication/views, register berfungsi menerima data pendaftaran (username, password, dan konfirmasi password) dari Flutter. Django kemudian mengecek apakah password cocok dan apakah username sudah digunakan, sebelum akhirnya membuat user baru menggunakan User.objects.create_user(). Fungsi tsb kemudian dirouting di authentications/urls.

Selanjutnya di sisi Flutter, saya membuat file register.dart yg berisi tampilan halaman pendaftaran. Form tsb akan menerima input username dan password dari user. Flutter akna mengirim data tersebut dalam bentuk JSON ke endpoint Django yg sebelumnya dibuat dengan request.postJson(). 

Selanjutnya, agar halaman register ini bisa diakses, maka saya perlu menambahkan import register.dart dan mengubah fungsi onTap pada teks “Register”. Ketika user menekan teks tsb maka Flutter menavigasikan mereka ke halaman RegisterPage.

Langkah selanjutnya akan berfokus pada pembuatan model kustom. Saya mengambil data JSON yg disediakan oleh Django pada endpoint /json/. JSON tsb kemudian diubah menjadi sebuah model Dart yg bisa digunakan Flutter, hal ini saya lakukan dengan bantuan QuickType. Model tsb menjadi struktur dari bagaimana Flutter membaca, memahami, dan menampilkan data dari Django. Kemudian, saya membuat folder models/ di dalam lib/ dan meletakkan file product_entry.dart untuk model yg tadi telah didapatkan.

Setelah model siap, saya masuk ke tahap fetch data dari Django ke Flutter. Saya menambahkan package http utk melakukan request dan mengaktifkan permission internet.

Saya membuat endpoint baru bernama proxy-image agar ketika Flutter minta gambar, maka Django akan mengambil gambar tsb dan mengirimkannya kembali ke Flutter sebagai respon aman. Dengan cara ini, Flutter seolah-olah mengambil gambar dari server Django sendiri, bukan dari domain asing yg diblokir. 

Saya kemudian mulai membangun tampilan di Flutter dengan widget baru bernama ProductEntryCard. Field pada produk akan diambil dari model ProductEntry dan ditampilkan di Card.

Kemudian saya membuat halaman baru ProductEntryListPage yg akan melakukan fetch ke endpoint /json/ menggunakan CookieRequest. Setelah data diterima, JSON itu dikonvert menjadi list ProductEntry menggunakan model yg disiapkan sebelumnya. List tsb ditampilkan menggunakan ListView.builder dalam bentuk ProductEntryCard. Pada bagian ini saya juga menerapkan filtering tergantung widget yg diklik user, jika user mengklik widget dengan argumen filter "all" maka list yg dikembalikan berisi semua produkya, sedangkan jika filter "mine" maka list yg dikembalikan hanya list yg berasosiasi dengan user yg login. Selanjutnya, saya menambahkan halaman ini ke drawer dan juga menambahkan navigasi agar tombol “Universal Product” dan "Personal Product" bisa mengarahkan user ke halaman daftar produk.

Langkah selanjutnya, saya membuat halaman ProductDetailPage yg akan menampilkan info produk secara lengkap. 
Saya mengubah onTap pada setiap card di halaman list sehingga ketika user klik pada produk, Flutter melakukan navigasi ke halaman detail dengan mengirimkan objek ProductEntry sebagai parameter. Dengan begitu, halaman detail bisa langsung menampilkan konten produk yg tadi ditekan. Saya juga menambahkan endpoint baru pada Django bernama increase-hype. Tiap kali suatu produk ditekan, maka Flutter akan membuat request pada endpoint tsb yg akan mengincrement hype sebuah produk sebanyak 1. Django akan mengembalikan hype prduk setelah increment dan akan diterima Flutter, sehingga Flutter akan menampilkan hype yg sesuai.

Pada bagian selanjutnya, saya berfokus melakukan integrasi Form Flutter dgn Django. Saya membuat endpoint baru create-flutter/ yg  menerima request Flutter. Data yg diterima dari Flutter berupa JSON, sehingga saya parsing request body menggunakan json.loads. Setelah data berhasil diambil, Django membuat objek Product baru menggunakan data2 yg dikirim dari Flutter, menyimpannya ke database dengan .save(), kemudian mengembalikan respons JSON yg menyatakan bahwa penyimpanan berhasil. Saya menambahkan routing pada fungsi create_flutter agar endpoint create-flutter/ tsb bisa diakses.

Selanjutnya di sisi Flutter, saya menghuungkan halaman form dengan CookieRequest agar Flutter bisa mengirimkan HTTP request yg membawa sesi login pengguna. Ketika user menambahkan produk baru, Flutter akan memvalidasi form. Jika valid, Flutter mengambil nilai yg diinput user dan mengubahnya menjadi JSON menggunakan jsonEncode. Flutter kemudian mengirimkan JSON tsb ke endpoint Django dengan postJson. Django menerima data tersebut, memprosesnya, dan mengembalikan status.bJika responsnya sukses, Flutter menampilkan snackbar produk berhasil disimpan lalu menavigasikan user kembali ke halaman utama. 

Bagian selanjutnya, saya berfokus pada mengimplementasikan fitur logout. Di sisi Django, saya membuat fungsi logout di authentication/views. Fungsi ini menggunakan auth_logout dari Django untuk menghapus sesi login pengguna yg sedang aktif. Endpoint ini kemudian dirouting di authentication/urls agar Flutter dapat mengaksesnya.

Di sisi Flutter, saya menyesuaikan widget di product_card.dart agar dapat menggunakan CookieRequest—library yg menangani sesi pengguna dan komunikasi dengan Django. Pada event onTap untuk item “Logout”, Flutter menjalankan method logout dari CookieRequest, yg mengirim request ke endpoint Django tadi. Setelah Django membalas dengan status logout, Flutter menampilkan snackbar untuk memberitahu pengguna apakah logout berhasil atau gagal. Jika berhasil, aplikasi menavigasi pengguna kembali ke halaman login.

Dengan ini, saya telah mengimplementasikan semua checklist yg ada pada tugas 9.










