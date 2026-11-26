import os
import zipfile
import sys

def make_zip(source_dir, output_filename):
    exclude_dirs = {
        'node_modules',
        '.git',
        '__pycache__',
        '.pytest_cache',
        '.system_generated',
        '.cache',
    }
    
    exclude_files = {
        '.env',
        'Market_Basket_Project_FINAL.zip',
    }
    
    exclude_exts = {
        '.pyc',
        '.log',
    }

    print(f"Creating ZIP archive: {output_filename}")
    print(f"Source: {source_dir}")
    
    total_files = 0
    total_bytes = 0

    with zipfile.ZipFile(output_filename, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(source_dir):
            # Prune excluded directories
            dirs[:] = [d for d in dirs if d not in exclude_dirs]
            
            for file in files:
                if file in exclude_files:
                    continue
                if any(file.endswith(ext) for ext in exclude_exts):
                    continue
                
                full_path = os.path.join(root, file)
                rel_path = os.path.relpath(full_path, os.path.dirname(source_dir))
                
                # Check file size
                fsize = os.path.getsize(full_path)
                zipf.write(full_path, rel_path)
                total_files += 1
                total_bytes += fsize
                
                if total_files % 100 == 0:
                    print(f"  Archived {total_files} files...")

    print(f"\n[SUCCESS] Archive completed!")
    print(f"  Total files packaged: {total_files}")
    print(f"  Uncompressed source size: {total_bytes / (1024 * 1024):.2f} MB")
    archive_size = os.path.getsize(output_filename)
    print(f"  Final ZIP archive size: {archive_size / (1024 * 1024):.2f} MB")
    print(f"  Output location: {output_filename}")

if __name__ == "__main__":
    src = r"c:\Users\dibya\OneDrive\Desktop\Market_Basket_Project"
    out = r"c:\Users\dibya\OneDrive\Desktop\Market_Basket_Project_FINAL.zip"
    make_zip(src, out)
