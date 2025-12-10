#!/bin/bash
# Скрипт для сборки Windows релиза с помощью cargo xwin

set -e

echo "🔨 Сборка Windows релиза для entropy_ui..."
echo ""

# Переходим в директорию проекта
cd "$(dirname "$0")"

# Проверяем наличие cargo-xwin
if ! command -v cargo xwin &> /dev/null; then
    echo "❌ cargo-xwin не найден. Установите его:"
    echo "   cargo install cargo-xwin"
    exit 1
fi

# Проверяем наличие Windows target
if ! rustup target list --installed | grep -q "x86_64-pc-windows-msvc"; then
    echo "📦 Устанавливаю Windows target..."
    rustup target add x86_64-pc-windows-msvc
fi

# Собираем релиз
echo "🚀 Запускаю сборку релиза для Windows..."
cargo xwin build --release --package entropy_ui --target x86_64-pc-windows-msvc

# Проверяем результат
EXE_PATH="target/x86_64-pc-windows-msvc/release/entropy_ui.exe"
if [ -f "$EXE_PATH" ]; then
    SIZE=$(du -h "$EXE_PATH" | cut -f1)
    echo ""
    echo "✅ Сборка завершена успешно!"
    echo "📦 Файл: $EXE_PATH"
    echo "📊 Размер: $SIZE"
    echo ""
    echo "💡 Файл готов к использованию на Windows!"
else
    echo "❌ Ошибка: исполняемый файл не найден"
    exit 1
fi


