<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Rekap Riwayat Pengambilan</title>
    <style>
        body { 
            font-family: sans-serif;
            margin: 20px;
        }
        .header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .header-text {
            margin-left: 20px;
        }
        .header-text h1 {
            margin: 0;
            font-size: 24px;
        }
        .header-text p {
            margin: 5px 0 0 0;
            font-size: 14px;
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            font-size: 12px;
            margin-top: 20px;
        }
        th, td { 
            border: 1px solid #000; 
            padding: 8px; 
            text-align: left; 
        }
        th { 
            background-color: #6c2bd9;
            font-color 
            font-weight: bold;
            color: white;
        }
        .filter-info {
            margin: 10px 0;
            font-size: 14px;
        }
        .logo {
            height: 80px;
        }
    </style>
</head>
<body>
    <div style="text-align: center;" class="header">
        <img src="{{ public_path('images/logo.png') }}" class="logo" alt="Logo">
        <div class="header-text">
        </div>
    </div>
    <h1 style="text-align: center;">Rekap Data Riwayat Pengambilan Barang</h1>

    @if($tanggal_mulai && $tanggal_selesai)
        <p>Periode: {{ $tanggal_mulai }} s/d {{ $tanggal_selesai }}</p>
    @endif

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nama Mahasiswa</th>
                <th>NIM</th>
                <th>Barang</th>
                <th>Jumlah</th>
                <th>Tanggal Ambil</th>
            </tr>
        </thead>
        <tbody>
            @foreach($pengambilan as $ambil)
            <tr>
                <td>{{ $ambil->id_pengambilan }}</td>
                <td>{{ optional($ambil->mahasiswa)->nama_mahasiswa ?? '-' }}</td>
                <td>{{ optional($ambil->mahasiswa)->nim ?? '-' }}</td>
                <td>{{ optional($ambil->barang)->nama_barang ?? '-' }}</td>
                <td>{{ $ambil->jumlah }}</td>
                <td>{{ $ambil->tanggal_ambil }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
