import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
  
class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://10.0.2.2:7545"; //7545로 변경
  final String _wsUrl = "ws://10.0.2.2:7545/";
  final String _privateKey = "36e5bd7b9a889df0f5c7fc6e4f8fec7758dcbaea97df3ec9a076208f4744a653"; //너 개인키

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
        EthereumAddress.fromHex("0x74d81BadD6d4b6F80Dfc20d74782EF7cE1b53F36"); //address 중에 나는 1번 사용(암거나 사용해도 될듯 앱에는 address가 있더라구)
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

  modifyFood(BigInt number, String name, String origin) async {

    // Getting the current name declared in the smart contract.
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _modifyFood, parameters: [number, name, origin], maxGas: 10000000));
    // getFood(number);
  }
  addFood( String name, String origin) async {

    // Getting the current name declared in the smart contract.
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _addFood, parameters: [ name, origin], maxGas: 10000000));
    var number = await _client.call(contract: _contract, function: _getNumber, params: []);
    print(number);
  }

  getNumber() async {
    var number = await _client.call(contract: _contract, function: _getNumber, params: []);
    print(number);
  }
  
  getFood(BigInt number) async {
    // Setting the name to nameToSet(name defined by user)
    var foods = await _client.call(contract: _contract, function: _getFood, params: [number]);
    print(foods);

    isLoading = false;
    notifyListeners();
    return foods;
  }
}