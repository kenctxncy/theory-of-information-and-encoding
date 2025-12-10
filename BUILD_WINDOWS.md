# Сборка Windows релиза

## Быстрый старт

```bash
./build-windows-release.sh
```

Или вручную:

```bash
cargo xwin build --release --package entropy_ui --target x86_64-pc-windows-msvc
```

## Требования

1. **cargo-xwin** - установлен через `cargo install cargo-xwin`
2. **Windows target** - установлен через `rustup target add x86_64-pc-windows-msvc`

## Результат

После сборки исполняемый файл будет находиться в:
```
target/x86_64-pc-windows-msvc/release/entropy_ui.exe
```

Размер файла: ~5.3 MB

## Проверка

Проверить, что файл собран правильно:
```bash
file target/x86_64-pc-windows-msvc/release/entropy_ui.exe
```

Должно показать: `PE32+ executable for MS Windows`

## Установка зависимостей (если нужно)

```bash
# Установить cargo-xwin
cargo install cargo-xwin

# Добавить Windows target
rustup target add x86_64-pc-windows-msvc
```

## Дополнительные опции

### Сборка с отладочной информацией
```bash
cargo xwin build --package entropy_ui --target x86_64-pc-windows-msvc
```

### Очистка перед сборкой
```bash
cargo xwin clean --target x86_64-pc-windows-msvc
cargo xwin build --release --package entropy_ui --target x86_64-pc-windows-msvc
```



