import re
import sys
from pathlib import Path

def categorize_import(imp):
    if imp.startswith("package:"):
        return 3  # Pakiety zewnętrzne
    elif imp.startswith(".."):  # Relative imports do folderów nadrzędnych
        return 2
    elif imp.startswith(".") or "/" in imp:  # Relative imports w tym samym folderze
        return 1
    return 3  # Domyślnie traktujemy jako pakiet zewnętrzny

def sort_imports(imports):
    return sorted(imports, key=lambda imp: (categorize_import(imp), imp))

def process_file(file_path):
    with open(file_path, "r", encoding="utf-8") as file:
        lines = file.readlines()
    
    import_lines = []
    code_lines = []
    
    for line in lines:
        if line.strip().startswith("import"):
            import_lines.append(line.strip())
        else:
            code_lines.append(line)
    
    sorted_imports = sort_imports(import_lines)
    
    with open(file_path, "w", encoding="utf-8") as file:
        file.write("\n".join(sorted_imports) + "\n\n")
        file.writelines(code_lines)
    
    print(f"Processed {file_path}")

def main():
    if len(sys.argv) < 2:
        print("Usage: python sort_imports.py <path_to_dart_file_or_folder>")
        sys.exit(1)
    
    path = Path(sys.argv[1])
    
    if path.is_file() and path.suffix == ".dart":
        process_file(path)
    elif path.is_dir():
        for dart_file in path.rglob("*.dart"):
            process_file(dart_file)
    else:
        print("Invalid file or directory.")
        sys.exit(1)

if __name__ == "__main__":
    main()

