# Mobix VPN — موبیکس وی‌پی‌ان

<div align="center">
  <img src="branding/mobix-logo.png" width="140" alt="Mobix VPN logo" />

  **اتصال امن، سریع و پایدار — روی همه‌ی اپراتورها و همه‌ی گوشی‌ها**
</div>

---

## فارسی

### موبیکس چیست؟

**Mobix VPN** یک کلاینت VPN کامل برای اندروید است که موتور اتصال آن هسته‌ی
[Xray](https://github.com/XTLS/Xray-core) است. یعنی همه‌ی پروتکل‌های پرکاربرد و
ضد‌فیلتر را پشتیبانی می‌کند و با هر اپراتور و هر شبکه‌ای (همراه اول، ایرانسل،
رایتل، وای‌فای خانگی و …) کار می‌کند.

| ویژگی | توضیح |
| --- | --- |
| پروتکل‌ها | VLESS، VMess، Trojan، Shadowsocks، SOCKS، HTTP، WireGuard، Hysteria2، و کانفیگ سفارشی |
| هسته‌ی اتصال | Xray core (به‌همراه پشتیبانی از v2fly) |
| حالت اتصال | VpnService (بدون روت، همه‌ی اپ‌ها) + حالت پروکسی + tun2socks (hev-socks5-tunnel) |
| پینگ و تست | تست واقعی (Real ping)، تست سرعت همه‌ی سرورها به‌صورت گروهی |
| اشتراک | لینک ساب، بروزرسانی خودکار، نمایش حجم مصرفی |
| امنیت | پشتیبانی TLS/REALITY، پین گواهی، مسیریابی هوشمند (ایران/جهانی) |
| طراحی | رابط Compose و Material 3، تم روشن/تاریک، رنگ اختصاصی برند |
| سازگاری | اندروید ۷ به بالا (API 24+) و ABIهای `arm64-v8a`، `armeabi-v7a`، `x86_64`، `x86` + APK یونیورسال |

### نصب

۱. از تب **Actions** در همین مخزن، آخرین بیلد موفق `Build Mobix VPN APK` را باز کنید.
۲. فایل `MobixVPN-apk` را دانلود کنید.
۳. APK مناسب گوشی‌تان را نصب کنید:

| فایل | مناسب برای |
| --- | --- |
| `MobixVPN_*_arm64-v8a.apk` | تقریباً همه‌ی گوشی‌های امروزی (پیشنهادی) |
| `MobixVPN_*_armeabi-v7a.apk` | گوشی‌های قدیمی ۳۲ بیتی |
| `MobixVPN_*_x86_64.apk` / `x86` | شبیه‌سازها و تبلت‌های اینتل |
| `MobixVPN_*_universal.apk` | یک فایل برای همه‌ی دستگاه‌ها |

> اگر مطمئن نیستید کدام نسخه را بگیرید، همان `universal` را نصب کنید.

### ساخت نسخه‌ی ریلیز (نسخه‌ی قابل دانلود در Releases)

از تب **Actions** → `Build Mobix VPN APK` → **Run workflow** و در فیلد
`release_tag` عددی مثل `v1.0.0` وارد کنید. APKها به‌طور خودکار به بخش
**Releases** اضافه می‌شوند تا لینک دانلود دائمی داشته باشند.

### حریم خصوصی

برنامه هیچ داده‌ای را به سرور شخص ثالث نمی‌فرستد؛ همه‌ی کانفیگ‌ها، ساب‌ها و
تنظیمات فقط روی خود گوشی ذخیره می‌شوند.

### لوگو و هویت بصری

فایل‌های برند در پوشه‌ی [`branding/`](branding) قرار دارند:

- `mobix-logo.png` — لوگوی اصلی (۱۰۲۴×۱۰۲۴)
- `mobix-logo.svg` — نسخه‌ی وکتور برای چاپ و وب
- `mobix-playstore-512.png` — آیکون ۵۱۲×۵۱۲ برای استور
- `mobix-feature-graphic.png` — تصویر ۱۰۲۴×۵۰۰ برای استور
- `render_brand.py` — اسکریپت بازسازی همه‌ی آیکون‌های اندروید از لوگو

برای بازسازی آیکون‌ها:

```bash
pip install pillow
python3 branding/render_brand.py
```

---

## English

**Mobix VPN** is an Android VPN client powered by the [Xray](https://github.com/XTLS/Xray-core)
core, with a custom Material 3 interface and a dedicated brand identity
(shield + bolt mark, violet → cyan gradient).

### Highlights

- Protocols: VLESS, VMess, Trojan, Shadowsocks, SOCKS, HTTP, WireGuard, Hysteria2, custom configs
- Connection modes: VpnService (no root), proxy-only, and tun2socks via hev-socks5-tunnel
- Subscriptions with auto-update and usage info, real-ping and batch speed tests
- Smart routing profiles (Iran / global / whitelist / blacklist), TLS pinning, REALITY support
- Works on Android 7.0+ (API 24) across `arm64-v8a`, `armeabi-v7a`, `x86_64` and `x86`

### Getting the APK

1. Open the **Actions** tab and pick the latest successful `Build Mobix VPN APK` run.
2. Download the `MobixVPN-apk` artifact.
3. Install the APK that matches your device (see the table above; `universal` always works).

To produce a permanent download link, run the workflow with a `release_tag`
(e.g. `v1.0.0`) — the APKs are then attached to **Releases**.

### Building locally

```bash
git submodule update --init --recursive
# LLVM NDK 30.x is required for the hev-socks5-tunnel native libraries
bash compile-hevtun.sh
cp -r libs/* V2rayNG/app/libs/
# put libv2ray.aar from 2dust/AndroidLibXrayLite into V2rayNG/app/libs/
cd V2rayNG && ./gradlew assemblePlaystoreRelease
```

The same steps, fully automated, live in [`.github/workflows/build.yml`](.github/workflows/build.yml).

---

## Credits & License

Mobix VPN is based on the open-source work of
[v2rayNG](https://github.com/2dust/v2rayNG) by 2dust and the Xray team, and is
distributed under the **GNU General Public License v3.0** — see [LICENSE](LICENSE).
All third-party libraries and their licenses are listed inside the app
(*Settings → About → Open source licenses*).
