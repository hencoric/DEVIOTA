<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin</title>
    <link rel="icon" type="image/png" href="{{ asset('images/logo.png') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .topnav {
            display: flex;
            align-items: center;
            padding: 25px 40px;
            background: linear-gradient(to bottom, #6554C4, #FFFFFF);
            color: white;
        }

        .topnav .logo {
            font-weight: bold;
            font-size: 23px;
            margin-right: 50px;
            color: white;
            text-decoration: none;
            line-height: 1.2;
        }

        .topnav a {
            display: flex;
            align-items: center;
            margin-right: 40px;
            text-decoration: none;
            color: white;
            font-weight: 500;
            padding: 8px 12px;
            border-radius: 10px;
            transition: background 0.3s;
        }

        .topnav a i {
            margin-right: 8px;
        }

        .topnav a.active, .topnav a:hover {
            background-color: rgba(101, 84, 196, 0.3);
            color: white;
        }

        /* Add a style for the new button */
        .btn-dashboard {
            margin-left: auto;
            display: inline-block;
            background-color: #6a0dad;
            color: white;
            padding: 8px 16px;
            border-radius: 10px;
            font-weight: 500;
            text-decoration: none;
            transition: background 0.3s;
        }

        .btn-dashboard:hover {
            background-color: rgba(101, 84, 196, 0.3);
        }

        .notif {
            margin-left: 20px;
            position: relative;
        }

        .notif i {
            font-size: 20px;
            color: white;
        }

        .notif .badge {
            position: absolute;
            top: -8px;
            right: -8px;
            background-color: red;
            color: white;
            font-size: 10px;
            padding: 2px 5px;
            border-radius: 50%;
            min-width: 15px;
            height: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .notif a {
            position: relative;
            display: inline-block;
        }
    </style>
</head>
<body>

    <div class="topnav">
        <a href="/adminDashboard" class="logo">ADMIN<br>DASHBOARD</a>
        <a class="{{ request()->routeIs('barang.index') ? 'active' : '' }}" href="{{ route('barang.index') }}">
            <i class="fas fa-box-open"></i> Product
        </a>
        <a class="{{ request()->routeIs('admin/peminjaman.index') ? 'active' : '' }}" href="{{ route('admin/peminjaman.index') }}">
            <i class="fas fa-shopping-bag"></i> Riwayat Peminjaman
        </a>
        <a class="{{ request()->routeIs('admin/pengambilan.index') ? 'active' : '' }}" href="{{ route('admin/pengambilan.index') }}">
            <i class="fas fa-archive"></i> Riwayat Pengambilan
        </a>

        <!-- Replace the search box with a button -->
        <a href="{{ url('/welcome') }}" class="btn-dashboard">
            Dashboard Utama
        </a>

        <div class="notif">
            <a class="{{ request()->routeIs('barang.notifikasi') ? 'active' : '' }}" href="{{ route('barang.notifikasi') }}">
                <i class="fas fa-bell"></i>
                <span class="badge">
                    @php
                        // Jika $barang_notif belum didefinisikan, ambil datanya
                        if (!isset($barang_notif)) {
                            $barang_notif = App\Models\Barang::whereColumn('stok', '<=', 'stok_minimum')->get();
                        }
                        echo $barang_notif->count();
                    @endphp
                </span>
            </a>
        </div>

    </div>

    <div class="container">
        @yield('content')
    </div>

</body>
</html>
