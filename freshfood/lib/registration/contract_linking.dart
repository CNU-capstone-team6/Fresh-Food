import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
  
class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://127.0.0.1:8545";
  final String _wsUrl = "ws://127.0.0.1:8545/";
  final String _privateKey = "0xfd3703827b8ed0246aef453d961d25f311c24314bdcaa642a5481b465ef7e899";

  Web3Client _client;
  bool isLoading = true;
    
  String _abiCode;
  EthereumAddress _contractAddress;
    
  Credentials _credentials;
    
  DeployedContract _contract;
  ContractFunction _addFood;
  ContractFunction _getFood;
    
  String deployedName;

  ContractLinking() {
    initialSetup();
  }
  
  initialSetup() async {
      
    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websocket instead of
    // http-polls. However, the socketConnector property is experimental.
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
  
    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }
  
  Future<void> getAbi() async {
      
    // Reading the contract abi
    String abiStringFile =
        await rootBundle.loadString("build/contracts/Storage.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);
  
    _contractAddress =
        // EthereumAddress.fromHex("0xde4a68c1c492eba58c526ca1e32040c8b3d2cff1aa6c6037ea7465a79bcbc600");
        EthereumAddress.fromHex(jsonAbi["networks"]["1621510952794"]["address"]);
  }
  
  Future<void> getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }
  
  Future<void> getDeployedContract() async {
      
    // Telling Web3dart where our contract is declared.
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Storage"), _contractAddress);
  
    // Extracting the functions, declared in contract.
    _addFood = _contract.function("addFood");
    _getFood = _contract.function("getFood");
  }
  
  addFood(int number, String name, String origin) async {
      
    // Getting the current name declared in the smart contract.
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _addFood, parameters: [number, name, origin]));
  }
  
  getFood(int number) async {
      
    // Setting the name to nameToSet(name defined by user)
    var foods = await _client.call(contract: _contract, function: _getFood, params: [number]);
    isLoading = false;
    notifyListeners();
  }
}