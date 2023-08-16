// import 'dart:io';

// import 'package:asn1lib/asn1lib.dart';
// import 'package:convert/convert.dart';
// import 'dart:typed_data';
// import 'package:pointycastle/api.dart';
// import 'package:pointycastle/digests/sha1.dart';
// import 'package:pointycastle/digests/sha256.dart';
// import 'package:pointycastle/ecc/api.dart';
// import 'package:pointycastle/ecc/curves/secp256k1.dart';
// import 'package:pointycastle/macs/hmac.dart';
// import 'package:pointycastle/random/fortuna_random.dart';
// import 'package:pointycastle/signers/ecdsa_signer.dart';
// import 'package:x509/x509.dart';

// import 'dart:typed_data';

// import 'model/Cert_Subject.dart';
// import 'package:convert/convert.dart';
// import 'dart:typed_data';
// import 'package:pointycastle/api.dart';
// import 'package:pointycastle/digests/sha256.dart';
// import 'package:pointycastle/ecc/api.dart';
// import 'package:pointycastle/ecc/curves/secp256k1.dart';
// import 'package:pointycastle/macs/hmac.dart';
// import 'package:pointycastle/random/fortuna_random.dart';
// import 'package:pointycastle/signers/ecdsa_signer.dart';

// ECPrivateKey generatePrivateKey(String input1, String input2) {
//   // Concatenate the inputs to create the seed
//   String seed = input1 + input2;

//   // Create a SHA-256 digest of the seed
//   Digest sha256Digest = SHA256Digest();
//   Uint8List seedBytes = Uint8List.fromList(seed.codeUnits);
//   Uint8List digest = sha256Digest.process(seedBytes);

//   // Create an ECC private key using the secp256k1 curve
//   ECCurve_secp256k1 curve = ECCurve_secp256k1();
//   ECPrivateKey privateKey =
//       ECPrivateKey(BigInt.parse(hex.encode(digest), radix: 16), curve);

//   // Make sure the private key is within the valid range for the curve
//   BigInt n = curve.n;
//   BigInt privateKeyInt = privateKey.d!;
//   privateKeyInt = privateKeyInt % n;

//   String privateKeyHex = privateKeyInt.toRadixString(16).padLeft(64, '0');
//   Uint8List privateKeyBytes = Uint8List.fromList(hex.decode(privateKeyHex));
//   return ECPrivateKey(privateKeyBytes as BigInt, curve);
//   //  privateKeyBytes;
// }

// ECPublicKey generatePublicKey(Uint8List privateKeyBytes) {
//   ECCurve_secp256k1 curve = ECCurve_secp256k1();
//   ECPrivateKey privateKey =
//       ECPrivateKey(BigInt.parse(hex.encode(privateKeyBytes), radix: 16), curve);

//   ECPoint? publicKeyPoint = curve.G * privateKey.d!;
//   return ECPublicKey(publicKeyPoint, curve);
// }

// // Function to sign a message using the private key
// // Function to sign a message using the private key
// Uint8List signMessage(Uint8List privateKeyBytes, Uint8List message) {
//   ECCurve_secp256k1 curve = ECCurve_secp256k1();
//   ECPrivateKey privateKey =
//       ECPrivateKey(BigInt.parse(hex.encode(privateKeyBytes), radix: 16), curve);

//   // Create a secure random number generator
//   SecureRandom secureRandom = FortunaRandom();
//   secureRandom.seed(KeyParameter(Uint8List.fromList(privateKeyBytes)));

//   final sha256Digest = SHA256Digest();
//   final hmac = HMac(sha256Digest, 64);
//   final signer = ECDSASigner(sha256Digest, hmac); // Use the digests here
//   signer.init(true, PrivateKeyParameter(privateKey));

//   final signature = signer.generateSignature(Uint8List.fromList(message));

//   // Extract r and s from the Signature object
//   BigInt r = (signature as ECSignature).r;
//   BigInt s = (signature).s;

//   // Convert r and s to 32-byte Uint8Lists
//   Uint8List rBytes = _encodeBigInt(r, 32);
//   Uint8List sBytes = _encodeBigInt(s, 32);

//   // Concatenate r and s to get the 64-byte signature
//   Uint8List signatureBytes = Uint8List.fromList([...rBytes, ...sBytes]);

//   return signatureBytes;
// }

// Uint8List _encodeBigInt(BigInt value, int size) {
//   var result = Uint8List(size);
//   for (var i = size - 1; i >= 0; i--) {
//     result[i] = value.toUnsigned(8).toInt();
//     value >>= 8;
//   }
//   return result;
// }
// //************************************** */
// // ASN1Sequence buildTbsCertificate(
// //     BigInt serialNumber,
// //     ASN1ObjectIdentifier signatureAlgorithmOid,
// //     X509Subject subject,
// //     DateTime calBefore,
// //     DateTime calAfter,
// //     Uint8List publicKeyBytes) {
// //   var subjectPublicKeyInfo = ASN1Sequence();
// //   subjectPublicKeyInfo.add(ASN1Integer(Uint8List.fromList([0]) as BigInt));
// //   subjectPublicKeyInfo.add(ASN1BitString(publicKeyBytes));

// //   var tbsCertificate = ASN1Sequence();
// //   tbsCertificate.add(ASN1Integer(serialNumber));
// //   tbsCertificate.add(signatureAlgorithmOid);
// //   tbsCertificate.add(subject.toJson() as ASN1Object);
// //   tbsCertificate.add(buildValidity(calBefore, calAfter));
// //   tbsCertificate.add(subject.toJson() as ASN1Object);
// //   tbsCertificate.add(subjectPublicKeyInfo);

// //   return tbsCertificate;
// // }

// ASN1Sequence buildValidity(DateTime notBefore, DateTime notAfter) {
//   var validity = ASN1Sequence();
//   validity.add(ASN1UtcTime(notBefore));
//   validity.add(ASN1UtcTime(notAfter));
//   return validity;
// }

// ASN1Sequence generateTbsCertificate(
//     BigInt serialNumber,
//     ASN1ObjectIdentifier signatureAlgorithmOid,
//     X509Subject subject,
//     DateTime calBefore,
//     DateTime calAfter,
//     Uint8List publicKeyBytes) {
//   var subjectPublicKeyInfo = ASN1Sequence();
//   subjectPublicKeyInfo.add(ASN1Integer(Uint8List.fromList([0]) as BigInt));
//   subjectPublicKeyInfo.add(ASN1BitString(publicKeyBytes));

//   var tbsCertificate = ASN1Sequence();
//   tbsCertificate.add(ASN1Integer(serialNumber));
//   tbsCertificate.add(signatureAlgorithmOid);
//   tbsCertificate.add(subject.toJson() as ASN1Object);
//   tbsCertificate.add(buildValidity(calBefore, calAfter));
//   tbsCertificate.add(subject.toJson() as ASN1Object);
//   tbsCertificate.add(subjectPublicKeyInfo);

//   return tbsCertificate;
// }

// ASN1ObjectIdentifier oidFromDot(String value) {
//   return ASN1ObjectIdentifier.fromComponentString(value);
// }

// Future<ASN1Sequence> generateSelfSignedCertificate(
//     BigInt serialNumber, ECPublicKey publicKey, ECPrivateKey privateKey) async {
//   var subject = X509Subject(
//     country: 'Pak',
//     designation: 'The warriers of care pvt. ltd',
//     locality: 'Islamabad',
//     address: 'I93',
//     email: 'asif.mehmood@carepvtled.com',
//   );

//   DateTime now = DateTime.now();

//   // Calculate a date one year ahead of now
//   DateTime calAfter = now.add(Duration(days: 365));

//   // Calculate a date one year before now
//   DateTime calBefore = now.subtract(Duration(days: 365));

//   // Get the bytes of the ECDSA public key
//   Uint8List publicKeyBytes = publicKey.Q!.getEncoded(false);

//   // Replace the OID with the appropriate ECDSA signature algorithm OID
//   ASN1ObjectIdentifier signatureAlgorithmOid =
//       oidFromDot('1.2.840.10045.4.3.2'); // ECDSA with SHA256

//   // Generate the TBS certificate
//   ASN1Sequence tbsCertificate = generateTbsCertificate(serialNumber,
//       signatureAlgorithmOid, subject, calBefore, calAfter, publicKeyBytes);

//   return tbsCertificate;
// }

// void main() async {
//   ECPrivateKey privateKey = generatePrivateKey("input1", "input2");
//   ECPublicKey publicKey = generatePublicKey(privateKey as Uint8List);
//   Uint8List privateKeyBytes =
//       _encodeBigInt(privateKey.d!, 32); // Convert BigInt to Uint8List
//   // BigInt serialNumber = BigInt.from(123456);
//   ASN1Sequence tbsCertificate = await generateSelfSignedCertificate(
//       1 as BigInt, publicKey, privateKeyBytes as ECPrivateKey);

//   print('TBS Certificate:');
//   print(tbsCertificate.isEncoded);
// }

// X509Certificate(tbsCertificate, signatureAlgorithm, signatureValue)

// class listnode{
//   int val;
//   listnode? next;
//   listnode(this.val,this.next);
// }

// class soultion{
//   listnode? mtl(listnode? list1,listnode? list2){
//     return list1;
//   }
// }
// void main(){
// }

// void printMergedList(listnode? mergedList) {
//   while (mergedList != null) {
//     print(mergedList.val);
//     mergedList = mergedList.next;
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:internship_project/Binding.dart';
import 'package:internship_project/view/Start_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
      initialBinding: Storebinding(),
    );
  }
}

// appRoutes() => [
//       GetPage(
//         name: '/BottomNavBar',
//         page: () => BottomNavBar(),
//         transition: Transition.leftToRightWithFade,
//         transitionDuration: Duration(milliseconds: 500),
//       ),
//       GetPage(
//         name: '/second',
//         page: () => QrScreen(),
//         middlewares: [MyMiddelware()],
//         transition: Transition.leftToRightWithFade,
//         transitionDuration: Duration(milliseconds: 500),
//       ),
//       GetPage(
//         name: '/third',
//         page: () => SettingScreen(),
//         middlewares: [MyMiddelware()],
//         transition: Transition.leftToRightWithFade,
//         transitionDuration: Duration(milliseconds: 500),
//       ),
//     ];

// class MyMiddelware extends GetMiddleware {
//   @override
//   GetPage? onPageCalled(GetPage? page) {
//     print(page?.name);
//     return super.onPageCalled(page);
//   }
// }
