import 'package:convert/convert.dart';
import 'dart:typed_data';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/digests/sha256.dart';
import 'package:pointycastle/ecc/api.dart';
import 'package:pointycastle/ecc/curves/secp256k1.dart';
import 'package:pointycastle/macs/hmac.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:pointycastle/signers/ecdsa_signer.dart';

class EntityCryptoModule {
  Uint8List generatePrivateKey(String input1, String input2) {
    // Concatenate the inputs to create the seed
    String seed = input1 + input2;

    // Create a SHA-256 digest of the seed
    Digest sha256Digest = SHA256Digest();
    Uint8List seedBytes = Uint8List.fromList(seed.codeUnits);
    Uint8List digest = sha256Digest.process(seedBytes);

    // Create an ECC private key using the secp256k1 curve
    ECCurve_secp256k1 curve = ECCurve_secp256k1();
    ECPrivateKey privateKey =
        ECPrivateKey(BigInt.parse(hex.encode(digest), radix: 16), curve);

    // Make sure the private key is within the valid range for the curve
    BigInt n = curve.n;
    BigInt privateKeyInt = privateKey.d!;
    privateKeyInt = privateKeyInt % n;

    String privateKeyHex = privateKeyInt.toRadixString(16).padLeft(64, '0');
    Uint8List privateKeyBytes = Uint8List.fromList(hex.decode(privateKeyHex));

    return privateKeyBytes;
  }

  ECPublicKey generatePublicKey(Uint8List privateKeyBytes) {
    ECCurve_secp256k1 curve = ECCurve_secp256k1();
    ECPrivateKey privateKey = ECPrivateKey(
        BigInt.parse(hex.encode(privateKeyBytes), radix: 16), curve);

    ECPoint? publicKeyPoint = curve.G * privateKey.d!;
    return ECPublicKey(publicKeyPoint, curve);
  }

// Function to sign a message using the private key
// Function to sign a message using the private key
  Uint8List signMessage(Uint8List privateKeyBytes, Uint8List message) {
    ECCurve_secp256k1 curve = ECCurve_secp256k1();
    ECPrivateKey privateKey = ECPrivateKey(
        BigInt.parse(hex.encode(privateKeyBytes), radix: 16), curve);

    // Create a secure random number generator
    SecureRandom secureRandom = FortunaRandom();
    secureRandom.seed(KeyParameter(Uint8List.fromList(privateKeyBytes)));

    final sha256Digest = SHA256Digest();
    final hmac = HMac(sha256Digest, 64);
    final signer = ECDSASigner(sha256Digest, hmac); // Use the digests here
    signer.init(true, PrivateKeyParameter(privateKey));

    final signature = signer.generateSignature(Uint8List.fromList(message));

    // Extract r and s from the Signature object
    BigInt r = (signature as ECSignature).r;
    BigInt s = (signature).s;

    // Convert r and s to 32-byte Uint8Lists
    Uint8List rBytes = _encodeBigInt(r, 32);
    Uint8List sBytes = _encodeBigInt(s, 32);

    // Concatenate r and s to get the 64-byte signature
    Uint8List signatureBytes = Uint8List.fromList([...rBytes, ...sBytes]);

    return signatureBytes;
  }

  Uint8List _encodeBigInt(BigInt value, int size) {
    var result = Uint8List(size);
    for (var i = size - 1; i >= 0; i--) {
      result[i] = value.toUnsigned(8).toInt();
      value >>= 8;
    }
    return result;
  }
}
