// session-timer.js - Menangani session timer untuk timeout 1 menit
document.addEventListener('DOMContentLoaded', function() {
    // Elemen untuk menampilkan timer
    const timerElement = document.getElementById('session-timer');
    
    if (!timerElement) return; // Keluar jika tidak ada elemen timer di halaman
    
    // Tambahkan style untuk animasi kedip pada timer
    const style = document.createElement('style');
    style.innerHTML = `
        @keyframes blink {
            0% { opacity: 1; }
            50% { opacity: 0.3; }
            100% { opacity: 1; }
        }
        .timer-blinking {
            animation: blink 1s linear infinite;
            color: red !important;
            font-weight: bold !important;
        }
    `;
    document.head.appendChild(style);
    
    // Hapus localStorage jika pada halaman login
    if (window.location.href.includes('login')) {
        localStorage.removeItem('sessionStartTime');
        localStorage.removeItem('notifiedUser');
        return; // Tidak perlu menjalankan timer di halaman login
    }
    
    // Waktu timeout dalam milidetik (1 menit = 60000 ms)
    const sessionTimeout = 60000;
    
    // Fungsi untuk memulai timer baru
    function startNewTimer() {
        const now = new Date().getTime();
        localStorage.setItem('sessionStartTime', now.toString());
        return now;
    }
    
    // Dapatkan waktu mulai dari localStorage atau buat baru jika tidak ada
    let startTime = localStorage.getItem('sessionStartTime');
    if (!startTime) {
        startTime = startNewTimer();
        // Notifikasi awal dihapus - tidak ada alert yang ditampilkan
    } else {
        startTime = parseInt(startTime);
        
        // Jika timer sudah kedaluwarsa, buat yang baru
        const now = new Date().getTime();
        if (now - startTime >= sessionTimeout) {
            startTime = startNewTimer();
        }
    }
    
    // Fungsi untuk memperbarui tampilan timer
    function updateTimer() {
        const now = new Date().getTime();
        const timeLeft = sessionTimeout - (now - startTime);
        
        if (timeLeft <= 0) {
            // Hentikan interval timer
            clearInterval(timerInterval);
            clearInterval(extendInterval);
            
            // Hapus localStorage
            localStorage.removeItem('sessionStartTime');
            
            // Tampilkan notifikasi bahwa sesi telah habis
            alert('Sesi Anda telah berakhir. Silakan login kembali.');
            
            // Redirect ke halaman logout setelah user menutup alert
            window.location.href = '/logout';
            return;
        }
        
        // Format waktu tersisa (mm:ss)
        const minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);
        
        // Tampilkan timer dengan format yang benar
        timerElement.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
        
        // Tambahkan peringatan visual saat waktu hampir habis (kurang dari 15 detik)
        if (timeLeft < 15000) {
            timerElement.classList.add('timer-blinking');
        } else {
            timerElement.classList.remove('timer-blinking');
            // Warna oranye untuk 30 detik terakhir
            if (timeLeft < 30000) {
                timerElement.style.color = 'orange';
                timerElement.style.fontWeight = 'bold';
            } else {
                timerElement.style.color = '';
                timerElement.style.fontWeight = '';
            }
        }
    }
    
    // Perbarui timer setiap 1 detik
    updateTimer(); // Panggil sekali untuk menghindari delay awal
    const timerInterval = setInterval(updateTimer, 1000);
    
    // Setup AJAX untuk perpanjang sesi di backend setiap 30 detik
    const extendInterval = setInterval(function() {
        fetch('/extend-session', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            credentials: 'same-origin'
        })
        .catch(error => console.error('Error extending session:', error));
    }, 30000);
    
    // Bersihkan interval saat halaman ditutup
    window.addEventListener('beforeunload', function() {
        clearInterval(timerInterval);
        clearInterval(extendInterval);
    });

    
});