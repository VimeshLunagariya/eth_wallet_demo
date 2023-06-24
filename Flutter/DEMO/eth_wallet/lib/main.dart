import 'dart:math';
import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter/material.dart';
import 'package:web3dart/credentials.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Random random = Random.secure();
          String mnemonic = bip39.generateMnemonic();
          // debugPrint('mnemonic - - - - $mnemonic');
          // final seed = bip39.mnemonicToSeedHex(mnemonic);
          // final master = await ED25519_HD_KEY.getMasterKeyFromSeed(hex.decode(seed), masterSecret: 'Bitcoin seed');
          // final privateKey = HEX.encode(master.key);
          // debugPrint('private - - - - $privateKey');
          // final publicAddress = EthPrivateKey.fromHex(privateKey);
          // debugPrint('publicAddress - - - - ${publicAddress.address}');
          // debugPrint('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');

          EthPrivateKey credentials = EthPrivateKey.createRandom(random);
          Wallet wallet = Wallet.createNew(credentials, mnemonic, random);

          // final publicKey = wallet.tron.createPublicKey(privateKey);

          debugPrint('credentials PRIVATEKEY - - - - ${credentials.address}');
          debugPrint('credentials PRIVATEKEY - - - - ${credentials.publicKey}');
          debugPrint('WALLET PRIVATEKEY - - - - ${wallet.privateKey.address}');
          debugPrint('UUID - - - - ${wallet.uuid}');

          debugPrint('- - - - - - - - - - - - - - - - - - - - - - - - -');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
