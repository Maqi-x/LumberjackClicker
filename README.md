# EN  
Lumberjack Clicker - Simple Clicker  

## How to Compile?  

### 1. Install Required Tools  

**Install Flutter SDK:**  

*   **Download and extract:**  

    ```sh
    wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.0-stable.tar.xz  # Check the latest version at flutter.dev
    tar xf flutter_linux_{version}.tar.xz
    ```
*   **Add to PATH:**  

    ```sh
    echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc  # Replace with the appropriate file if using a different shell
    ```
    Then:  
    ```sh
    source ~/.bashrc
    ```

**Install dependencies:**  

*   **Fedora-based (Fedora, CentOS, RHEL, ...):**  

    ```sh
    sudo dnf install cmake ninja gtk3-devel libblkid-devel pkg-config desktop-file-utils
    ```

*   **Debian-based (Ubuntu, Debian, Mint, ...):**  

    ```sh
    sudo apt-get update
    sudo apt-get install cmake ninja-build libgtk-3-dev libblkid-dev pkg-config libstdc++-12-dev
    ```

*   **Arch-based (Arch Linux, Manjaro, ...):**  

    ```sh
    sudo pacman -S cmake ninja gtk3 libblkid pkg-config
    ```

*  **Verify installation:**  

    ```sh
    flutter doctor
    ```

### 2. Install Dependencies:  
    ```sh
    flutter pub get
    ```

### 3. Start Compilation:  
* **For Android .apk file** *(recommended, as the game is primarily designed for mobile phones)*:  
    ```sh
    flutter build apk --release
    ```
* **For a native Linux application:**  
    ```sh
    flutter build linux --release
    ```
* **For the web version:**  
    ```sh
    flutter build web --release
    ```


# PL
Lumberjack clicker - prosty clicker

## Jak skompilować?
### 1. Zainstaluj potrzebne narzędzia

**Zainstaluj Flutter SDK:**

*   **Pobierz i rozpakuj:**

    ```sh
    wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.0-stable.tar.xz             # Sprawdź najnowszą wersję na flutter.dev
    tar xf flutter_linux_{version}.tar.xz
    ```
*   **Dodaj do PATH:**

    ```sh
    echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc  # zamień odpowiednim plikiem jeśli używasz innego shella
    ```
    Następnie:
    ```sh
    source ~/.bashrc
    ```

**Zainstaluj zależności:**

*   **Fedora based (Fedora, CentOS, RHEL, ...):**

    ```sh
    sudo dnf install cmake ninja gtk3-devel libblkid-devel pkg-config desktop-file-utils
    ```

*   **Debian based (Ubuntu, Debian, Mint, ...):**

    ```sh
    sudo apt-get update
    sudo apt-get install cmake ninja-build libgtk-3-dev libblkid-dev pkg-config libstdc++-12-dev
    ```

*   **Arch based (Arch Linux, Manjaro, ...):**

    ```sh
    sudo pacman -S cmake ninja gtk3 libblkid pkg-config
    ```

*  **Sprawdź instalację:**

    ```sh
    flutter doctor
    ```

### 2. Zainstaluj zależności:
    ```sh
    flutter pub get
    ```

### 3. Uruchom kompilacje:
* **Dla pliku .apk na androida** *(zalecane, gra jest stworzona głównie z myślą o telefonach)***:**
    ```sh
    flutter build apk --release
    ```
* **Dla natywnnej aplikacji linux:**
    ```sh
    flutter build linux --release
    ```
* **Dla wersji webowej:**
    ```sh
    flutter build web --release
    ```