import 'package:flutter/material.dart';
import 'article_model.dart';
import 'article_card.dart';
import 'article_dialog.dart';

class HomeScreen extends StatelessWidget {
  final List<Article> articles = [
    Article(
      id: '1',
      title: 'ما هي شبكات الكمبيوتر؟',
      content: '''
## تعريف الشبكات
نظام يربط بين أجهزة الحاسوب لتبادل البيانات والموارد.

## أنواع الشبكات
- **LAN**: شبكة محلية
- **WAN**: شبكة واسعة
- **MAN**: شبكة حضرية

## مكونات الشبكة
1. الأجهزة (حاسوب، راوتر)
2. وسائط الاتصال (كابلات)
3. البروتوكولات (TCP/IP)''',
      category: 'أساسيات',
    ),
    Article(
      id: '2',
      title: 'بروتوكول TCP/IP',
      content: '''
## الطبقات الرئيسية
1. **التطبيق**: HTTP, FTP
2. **النقل**: TCP, UDP
3. **الإنترنت**: IP
4. **الوصول للشبكة**

## أهمية البروتوكول
- أساس عمل الإنترنت
- يدعم جميع التطبيقات الحديثة''',
      category: 'بروتوكولات',
    ),
    Article(
      id: '3',
      title: 'أمن الشبكات',
      content: '''
## التهديدات الأمنية
- الفيروسات
- هجمات الاختراق
- التصيد الاحتيالي

## طرق الحماية
- جدران الحماية
- التشفير
- المصادقة''',
      category: 'أمن',
    ),

    // المقالات السابقة...
    Article(
      id: '4',
      title: 'أنواع كابلات الشبكة',
      content: '''
## الكابلات النحاسية (Copper)
1. **UTP**: الأكثر شيوعاً في الشبكات المحلية
   - فئات: Cat5e, Cat6, Cat7
   - سرعات تصل إلى 10Gbps
2. **STP**: يحتوي على طبقة حماية ضد التشويش

## الكابلات الضوئية (Fiber)
1. **Single-mode**: لمسافات طويلة (حتى 100km)
2. **Multi-mode**: لمسافات متوسطة (حتى 2km)

## المقارنة
| النوع          | السرعة القصوى | المسافة | التكلفة  |
|---------------|--------------|---------|---------|
| UTP Cat6      | 10Gbps       | 55m     | منخفضة  |
| Single-mode   | 100Gbps      | 100km   | عالية    |
''',
      category: 'بنية تحتية',
    ),
    Article(
      id: '5',
      title: 'بروتوكول DHCP',
      content: '''
## وظيفة DHCP
- توزيع عناوين IP تلقائياً
- توفير معلومات:
  - Gateway
  - DNS
  - Subnet Mask

## عملية العمل (DORA)
1. **Discover**: البحث عن الخادم
2. **Offer**: عرض عنوان IP
3. **Request**: طلب العنوان
4. **Acknowledge**: تأكيد التخصيص

## فوائده
- تقليل الأخطاء اليدوية
- إدارة مركزية للعناوين
- توفير الوقت في الإعداد
''',
      category: 'بروتوكولات',
    ),
    Article(
      id: '6',
      title: 'شبكات VLAN',
      content: '''
## مفهوم VLAN
تقسيم شبكة فيزيائية إلى شبكات منطقية مستقلة

## فوائدها
- **زيادة الأمان**: عزل الأقسام
- **تحسين الأداء**: تقليل حركة البث
- **إدارة مرنة**: إعادة التقسيم دون تغيير البنية

## أنواعها
1. **Port-based**: حسب المنفذ
2. **MAC-based**: حسب عنوان الجهاز
3. **Protocol-based**: حسب نوع البروتوكول
''',
      category: 'إدارة الشبكات',
    ),
    Article(
      id: '7',
      title: 'جدار الحماية (Firewall)',
      content: '''
## أنواع Firewalls
1. **Network-level**: فلترة حسب العناوين والمنافذ
2. **Application-level**: فحص محتوى التطبيقات
3. **Next-gen**: دمج ميزات متقدمة

## سياسات الحماية
- **Allow-list**: السماح للمعروف فقط
- **Deny-list**: حظر المهددات المعروفة
- **Deep Packet Inspection**: فحص محتوى الحزم

## أفضل الممارسات
- تحديث القواعد بانتظام
- تسجيل جميع الأحداث
- تفعيل NAT عند الحاجة
''',
      category: 'أمن',
    ),
    Article(
      id: '8',
      title: 'شبكات الـ Wi-Fi',
      content: '''
## المعايير الشائعة
| المعيار    | التردد   | السرعة القصوى | المدى |
|-----------|---------|--------------|------|
| 802.11ac | 5GHz    | 1.3Gbps      | 35m  |
| 802.11ax | 2.4/5GHz| 10Gbps       | 30m  |

## نصائح الأمان
1. استخدام WPA3 بدلاً من WPA2
2. تغيير كلمة المرور الافتراضية
3. تعطيل WPS
4. تحديث البرامج الثابتة

## حل المشاكل الشائعة
- **بطء السرعة**: تغيير القناة اللاسلكية
- **انقطاع الإشارة**: تقليل العوائق
- **عدم الاتصال**: إعادة تشغيل الجهاز
''',
      category: 'لاسلكي',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print('يتم تحميل ${articles.length} مقالة'); // للتأكد

    return Scaffold(
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ArticleCard(
            article: article,
            onTap: () => showDialog(
              context: context,
              builder: (_) => ArticleDialog(article: article),
            ),
          );
        },
      ),
    );
  }
}
