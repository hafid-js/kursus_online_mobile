enum TextSizes { small, medium, large }

enum ProductType { single, variable }

enum OrderStatus { processing, shipped, delivered, pending }

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm,
  cashOnDelivery,
}

enum DiscountType { fixed, percentage }


enum UserRole {
  student,
  instructor,
  unknown,
}

UserRole parseRole(String? role) {
  switch (role) {
    case 'student':
      return UserRole.student;
    case 'instructor':
      return UserRole.instructor;
    default:
      return UserRole.unknown;
  }
}
