// lib/services/google_play_billing.dart

enum SubscriptionPlan { demo, starter, pro }

class GooglePlayBillingService {
  static const int demoGunSayisi = 10;

  /// Bu method, kullanıcının kayıt olduğu tarihi alarak demo süresinin bitip bitmediğini kontrol eder.
  static bool isDemoExpired(DateTime kayitTarihi) {
    final simdikiZaman = DateTime.now();
    final fark = simdikiZaman.difference(kayitTarihi).inDays;
    return fark > demoGunSayisi;
  }

  /// Plan adına göre ilgili paketi döner
  static SubscriptionPlan getPlanFromString(String planAdi) {
    switch (planAdi.toLowerCase()) {
      case 'starter':
        return SubscriptionPlan.starter;
      case 'pro':
        return SubscriptionPlan.pro;
      case 'demo':
      default:
        return SubscriptionPlan.demo;
    }
  }

  /// Bu method, plan adına göre ödeme gerekip gerekmediğini kontrol eder
  static bool requiresPayment(SubscriptionPlan plan) {
    return plan == SubscriptionPlan.starter || plan == SubscriptionPlan.pro;
  }

  /// Sadece Pro plana sahip kullanıcılar için özel erişim kontrolü
  static bool isProAccess(SubscriptionPlan plan) {
    return plan == SubscriptionPlan.pro;
  }

  /// Sadece Starter ve Pro kullanıcıların erişebileceği alanlar için kontrol
  static bool isPaidUser(SubscriptionPlan plan) {
    return plan == SubscriptionPlan.starter || plan == SubscriptionPlan.pro;
  }
}
