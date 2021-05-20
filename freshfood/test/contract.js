const Storage = artifacts.require("Storage") ;
  
contract("Storage" , () => {
    it("Storage Testing" , async () => {
       const storage = await Storage.deployed() ;
       await storage.addFood(1, "Food", "Korean") ;
       await storage.addFood(1, "Food2", "Korean") ;
       const result = await storage.getFood(1) ;
       assert(result[0].name === "Food") ;
       console.log(result);
    });
});