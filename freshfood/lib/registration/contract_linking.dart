import 'dart:convert';
// import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
  
class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://10.0.2.2:8545"; //7545로 변경
  final String _wsUrl = "ws://10.0.2.2:8545/";
  final String _privateKey = "0x0f9b8f5ab41e36bf9aa5fd28a74618703bff7d2be44712031c17bdedc04f8e0a"; //너 개인키

  Web3Client _client;
  bool isLoading = true;
    
  String _abiCode;
  EthereumAddress _contractAddress;
    
  Credentials _credentials;

  DeployedContract _contract;
  ContractFunction _addFood;
  ContractFunction _getFood;
  ContractFunction _getNumber;
  ContractFunction _modifyFood;
    
  String deployedName;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {
      
    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websocket instead of
    // http-polls. However, the socketConnector property is experimental.
    // _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
    //   return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    // });
    // _client = Web3Client(_rpcUrl, new Client());
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
    print(_client.getBlockNumber());


    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }
  
  Future<void> getAbi() async {
      
    // Reading the contract abi
    String abiStringFile =
        await rootBundle.loadString("src/artifacts/Storage.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);
  
    _contractAddress =
        EthereumAddress.fromHex("0x6DCD96f9b9F354175876C7e33D139FC77b5D38d3"); //address 중에 나는 1번 사용(암거나 사용해도 될듯 앱에는 address가 있더라구)
        // EthereumAddress.fromHex(jsonAbi["networks"]["1622391058350"]["address"]);
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
    _modifyFood = _contract.function("modifyFood");
    _getNumber = _contract.function("getNumber");
  }

  modifyFood(BigInt number, String name, String origin, String author) async {

    // Getting the current name declared in the smart contract.
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _modifyFood, parameters: [number, name, origin, author], maxGas: 15000000));
    // getFood(number);
  }
  Future<int> addFood( String name, String origin, String author) async {

    // Getting the current name declared in the smart contract.
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _addFood, parameters: [ name, origin, author], maxGas: 15000000));
    // var number = await _client.call(contract: _contract, function: _getNumber, params: []);
    // print(number);
    BigInt number = await getNumber();
    int _number = number.toInt();

    return _number;
  }

  Future<BigInt> getNumber() async {
    var number = await _client.call(contract: _contract, function: _getNumber, params: []);
    // print(number);
    BigInt _number = number[0];
    return _number;
  }

  Future<List> getFood(BigInt number) async {
    // Setting the name to nameToSet(name defined by user)
    isLoading = true;
    notifyListeners();
    var foods = await _client.call(contract: _contract, function: _getFood, params: [number]);
    print(foods);
    List foodlist = List();
    // List<String> foodlist = List<String>();
    for(var i in foods) {
      foodlist.add([i[0][1], i[0][2], i[0][3]]);
    }
    print(foodlist);
    // isLoading = false;
    // notifyListeners();
    return foodlist;
  }
}