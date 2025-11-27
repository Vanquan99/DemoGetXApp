# Flutter GetX Base Project

Dự án Flutter cơ bản sử dụng GetX cho quản lý trạng thái và điều hướng.

## Cấu trúc dự án

```
lib/
├── main.dart              # Entry point của ứng dụng
├── my_home_page.dart      # Trang chủ
├── content_page.dart      # Trang nội dung
└── my_detail_page.dart    # Trang chi tiết
```

## Tính năng

- ✅ Quản lý trạng thái với GetX
- ✅ Điều hướng giữa các màn hình
- ✅ Cấu trúc dự án đơn giản, dễ mở rộng

## Yêu cầu

- Flutter SDK: 3.35.3 hoặc cao hơn
- Dart SDK: 3.9.2 hoặc cao hơn

### Phiên bản đã test

```
Flutter 3.35.3 • channel stable
Dart 3.9.2 • DevTools 2.48.0
```

## Cài đặt

1. Clone repository:

```bash
git clone <repository-url>
cd flutter-getx-app
```

2. Cài đặt dependencies:

```bash
flutter pub get
```

3. Chạy ứng dụng:

```bash
flutter run
```

## Dependencies chính

- `get`: Quản lý trạng thái và điều hướng
- `flutter`: Flutter SDK

## Hướng dẫn sử dụng

Đây là base source để bắt đầu phát triển ứng dụng Flutter với GetX. Bạn có thể:

1. Thêm các trang mới vào thư mục `lib/`
2. Sử dụng `Get.to()`, `Get.off()`, `Get.back()` để điều hướng
3. Tạo controller với GetX để quản lý trạng thái

## License

MIT License
