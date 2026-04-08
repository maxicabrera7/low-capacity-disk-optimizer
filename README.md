#low-capacity-disk-optimizer
Ways to save space with a small hard drive
#Windows Storage Optimization Toolkit

A collection of PowerShell scripts and manual procedures to maintain a high-performance development environment on storage-constrained systems (e.g., 120GB SSDs).

##🚀 Optimization Strategies

###1. Transparent File Compression
I use Windows `compact` with the `LZX` algorithm. It provides the highest compression ratio for static files and applications without significant CPU overhead.
* **Target:** Heavy applications and game folders.
* **Command:** `compact /c /s /i /exe:lzx "PATH_TO_FOLDER\*"`

###2. Automated Cleanup
PowerShell scripts to purge temporary files and system bloat.
* **Targets:** `%TEMP%` and `C:\Windows\Temp`.

###3. Component Store Maintenance (DISM)
Advanced cleanup of the WinSxS folder to remove obsolete Windows updates and service pack files.

###4. System Footprint Reduction
* **Hibernation Disabled:**
* * **Command:**`powercfg -h off`. Reclaims space equivalent to the installed RAM.
* **Pagefile Optimization:** Static 4GB limit to prevent dynamic growth while maintaining system stability for development tasks.

###5. Virtual Memory (Paging File) Optimization
⚠️ WARNING: Only perform this tweak if you have 16GB of RAM or more. Reducing the pagefile on systems with low physical memory will cause system instability, application crashes, and BSODs.

Technical Logic:
Windows dynamically manages the paging file size, which leads to two problems on small, near-full SSDs:

Disk Fragmentation: Constant resizing creates fragmented space.

Unexpected Storage Depletion: The pagefile can grow exponentially during heavy workloads, leaving the drive with 0 bytes of free space.

The Tweak:
Setting a static size of 4096MB (4GB) ensures a safety net for applications that require a paging file to function, while reclaiming several gigabytes of storage and preventing dynamic growth overhead.

Manual Procedure:

Press Win + R, type sysdm.cpl, and hit Enter.

Go to Advanced > Performance (Settings) > Advanced > Virtual Memory (Change).

Uncheck "Automatically manage paging file size for all drives".

Select the C: drive, choose Custom size, and set:

Initial size (MB): 4096

Maximum size (MB): 4096

Click Set, then OK, and Restart the PC.
