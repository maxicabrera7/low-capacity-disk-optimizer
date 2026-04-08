# low-capacity-disk-optimizer
Ways to save space with a small hard drive
# Windows Storage Optimization Toolkit

A collection of PowerShell scripts and manual procedures to maintain a high-performance development environment on storage-constrained systems (e.g., 120GB SSDs).

## 🚀 Optimization Strategies

### 1. Transparent File Compression
I use Windows `compact` with the `LZX` algorithm. It provides the highest compression ratio for static files and applications without significant CPU overhead.
* **Target:** Heavy applications and game folders.
* **Command:** `compact /c /s /i /exe:lzx "PATH_TO_FOLDER\*"`

### 2. Automated Cleanup
PowerShell scripts to purge temporary files and system bloat.
* **Targets:** `%TEMP%` and `C:\Windows\Temp`.

### 3. Component Store Maintenance (DISM)
Advanced cleanup of the WinSxS folder to remove obsolete Windows updates and service pack files.

### 4. System Footprint Reduction
* **Hibernation Disabled:** Reclaims space equivalent to the installed RAM.
* **Pagefile Optimization:** Static 4GB limit to prevent dynamic growth while maintaining system stability for development tasks.
