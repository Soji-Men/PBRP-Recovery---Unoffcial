/* Pengganti minimal libhardware_legacy untuk RECOVERY.
 * libhardware_legacy asli (Android 14+) memanggil service android.system.suspend lewat binder dan menunggu
 * tanpa batas waktu; service itu tidak ada di recovery. Stub ini langsung mengembalikan sukses. */
int acquire_wake_lock(int lock, const char* id) { (void)lock; (void)id; return 0; }
int release_wake_lock(const char* id) { (void)id; return 0; }
int set_screen_state(int on) { (void)on; return 0; }
