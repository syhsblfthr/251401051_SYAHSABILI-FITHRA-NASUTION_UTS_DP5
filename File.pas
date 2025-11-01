program uts;
uses crt, strutils;

var
    { Variabel Toko Cici (#1) }
    metode_pembayaran: string;
    pembelian, potongan: real;
    buku, pulpen, pensil, penghapus, penggaris: integer;

    { Variabel Angka Rahasia }
    rahasia, tebakan: extended;

    { Variabel Bintang Idamanku }
    i: integer;
    bintang: array[0..7] of string;

    { Variabel Deret Fibonacci }
    j, k, n, idx, total: integer;

begin
    { Toko Cici }
    clrscr;

    write('Masukkan jumlah buku: ');
    readln(buku);

    write('Masukkan jumlah pulpen: ');
    readln(pulpen);

    write('Masukkan jumlah pensil: ');
    readln(pensil);

    write('Masukkan jumlah penghapus: ');
    readln(penghapus);

    write('Masukkan jumlah penggaris: ');
    readln(penggaris);

    write('Metode Pembayaran (QRIS/Tunai): ');
    readln(metode_pembayaran);

    // Tambahkan setiap jumlah dikali dengan harga masing-masing produk
    pembelian := buku * 25000;
    pembelian := pembelian + pulpen * 5000;
    pembelian := pembelian + pensil * 3000;
    pembelian := pembelian + penghapus * 2000;
    pembelian := pembelian + penggaris * 4000;

    // Inisialisasi potongan menjadi 0, jika tidak ada potongan maka variabel ini akan tidak berubah dan akan tetap 0
    potongan := 0;

    // Jika pembelian melebihi 100.000
    if (pembelian > 100000) then
        // maka tambah potongan sebanyak 10% dari total pembelian
        potongan := pembelian * 0.1;

    // Buat metode pembayaran menjadi huruf kecil semua
    metode_pembayaran := LowerCase(metode_pembayaran);

    if (metode_pembayaran = 'qris') then
        // Jika user menggunakan QRIS sebagai metode pembayaran maka tambah potongan 5000
        potongan := potongan + 5000
    else if (metode_pembayaran = 'tunai') then
        // Jika tunai maka tambah total pembelian dengan pajak sebesar 5%
        pembelian := pembelian + (pembelian * 0.05)
    else
    begin
        // Jika metode pembayaran yang diberikan bukan berupa QRIS ataupun tunai maka tolak pembelian
        writeln('Mohon memberikan metode pembayaran yang valid (QRIS / Tunai)');
        exit;
    end;

    writeln('Total pembelian sebelum discount: ', pembelian : 0 : 0);
    writeln('Seluruh potongan dan discount: ', potongan : 0 : 0);
    writeln('Total pembelian setelah discount: ', pembelian - potongan : 0 : 0);

    writeln('[ENTER] untuk lanjut');
    readln;

    { Program Angka Rahasia }
    clrscr;

    // Inisialisasi untuk fungsi Random
    Randomize;

    // Ambil angka Random
    // Random memberikan angka dari 0 ke 100 - 1 (99), dan karena saya
    // mau angkanya dari 1 ke 100 maka saya tambahkan 1 ke hasil Random
    rahasia := Random(100) + 1;

    repeat
        write('Masukkan tebakan: ');
        readln(tebakan);

        if (tebakan > rahasia) then
            writeln('Tebakan terlalu besar!')
        else if (tebakan < rahasia) then
            writeln('Tebakan terlalu kecil!')
        else
        begin
            writeln('Selamat, kamu benar!');
            break;
        end;
    until (false); // Loop sampai dihentikan secara langsung (user telah menebak angkanya)

    writeln('[ENTER] untuk lanjut');
    readln;

    { Program Bintang Idamanku }
    clrscr;

    // Mengisi arraynya dengan gaya 😎 (menggunakan DupeString untuk
    // meningkatkan readability)
    bintang[0] := '*';
    bintang[1] := DupeString('*', 2);
    bintang[2] := DupeString('*', 3);
    bintang[3] := DupeString('*', 8);
    bintang[4] := DupeString('*', 7);
    bintang[5] := DupeString('*', 6);
    bintang[6] := DupeString('*', 7);
    bintang[7] := DupeString('*', 8);

    // Print bintangnya
    for i := 0 to 7 do
        writeln(bintang[i]);

    writeln('[ENTER] untuk lanjut');
    readln;

    { Program Deret Fibonacci }
    clrscr;

    write('N = ');
    readln(n);

    // Inisialisasi masing-masing variabel

    // Variabel total berguna untuk menyimpan total dari i dan j di
    // setiap iterasi

    // Variabel i dan j berguna untuk menyimpan angka yang akan di-print dan
    // angka selanjutnya

    // Variabel k berguna untuk menyimpan hasil dari penambahan i dan j
    // karena penambahan i dan j adalah hasil untuk variabel j, namun nilai
    // awal j diperlukan untuk menggantikan variabel i diakhir setiap iterasi
    // dan karena itu hasilnya disimpan dulu di variabel k dan setelah nilai
    // awal j telah menggantikan nilai i, maka nilai j digantikan dengan
    // nilai yang sudah disimpan di k

    total := 0;
    i := 0;
    j := 1;

    write('Sequence = ');
    // idx untuk for-loop dimulai dari 2 untuk mengurasi jumlah iterasi dengan 1
    // sama saja dengan
    // for idx := 1 to n - 1 do
    // tapi lebih cantik kalau begini 😊
    for idx := 2 to n do
    begin
        write(i, ', ');

        k := j + i;
        total := total + i;
        i := j;
        j := k;
    end;

    // Ini satu writeln diluar dari for-loop karena komanya tidak diperlukan
    writeln(i);
    total := total + i;

    writeln('Total = ', total);
end.
