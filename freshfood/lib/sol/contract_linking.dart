import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
  
class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://10.0.2.2:8545";
  final String _wsUrl = "ws://10.0.2.2:8545/";
  final String _privateKey = "Enter Private Key";

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
        await rootBundle.loadString("../../Fresh-Food-Contract/build/contracts/Storage.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);
  
    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["development"]["7545"]["address"]);
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
            contract: _contract, function: addFood, params: [number, name, origin]));
  }
  
  getFood(int number) async {
      
    // Setting the name to nameToSet(name defined by user)
    var foods = await _client.call(contract: _contract, function: getFood, params: [number]);
    isLoading = false;
    notifyListeners();
  }
}