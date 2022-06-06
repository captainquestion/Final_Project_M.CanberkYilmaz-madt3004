import Darwin
class NSObject{
    
}

class StockHolding:NSObject{
    var companyName: String
    var purchaseSharePrice: Float
    var currentSharePrice: Float
    var numberOfShares: Int
    var typeStock: String
    
    init(companyName: String, purchaseSharePrice: Float, currentSharePrice: Float, numberOfShares: Int, typeStock: String){
    self.companyName = companyName
    self.purchaseSharePrice = purchaseSharePrice
    self.currentSharePrice = currentSharePrice
    self.numberOfShares = numberOfShares
    self.typeStock = typeStock
    }
    
    func costInDollars() -> Float{
        return purchaseSharePrice * Float(numberOfShares)
    }
    func valueInDollars() -> Float{
        return currentSharePrice * Float(numberOfShares)
    }

    func profitable() -> Float{
        return valueInDollars() - costInDollars()
    }
}


class ForeignStockHolding:StockHolding {
    
    var conversionRate: Float
    
    init(companyName: String, purchaseSharePrice: Float, currentSharePrice: Float, numberOfShares: Int, typeStock: String, conversionRate: Float) {
           self.conversionRate = conversionRate
           super.init(companyName: companyName, purchaseSharePrice: purchaseSharePrice, currentSharePrice: currentSharePrice, numberOfShares: numberOfShares, typeStock: typeStock)
               
        
    }
    func newPurchaseSharePriceF() -> Float{
        return purchaseSharePrice * conversionRate
    }
    func newCurrentSharePriceF() -> Float{
        return currentSharePrice * conversionRate
    }
    
    override func costInDollars() -> Float {
        return purchaseSharePrice * Float(numberOfShares) * conversionRate
    }
    override func valueInDollars() -> Float{
        return currentSharePrice * Float(numberOfShares) * conversionRate
    }
    override func profitable() -> Float {
        return valueInDollars() - costInDollars()
    }
    
}



func printForeignStock(ForeignStock: ForeignStockHolding) {
    print("Name of the Company: \(ForeignStock.companyName)\nPurchase share price of the company: \(ForeignStock.newPurchaseSharePriceF())\nCurrent share price of the company: \(ForeignStock.newCurrentSharePriceF())\nNumber of shares of the company: \(ForeignStock.numberOfShares)\nConversation Rate: \(ForeignStock.conversionRate)\nCost in dollars \(ForeignStock.costInDollars())\nValue in dollars \(ForeignStock.valueInDollars())\nType Stock: \(ForeignStock.typeStock)\n-----------------")
         }

var listing = [
    StockHolding(companyName: "L Company", purchaseSharePrice: 4.2, currentSharePrice: 3.3, numberOfShares: 23, typeStock: "Local"),
    StockHolding(companyName: "V Company", purchaseSharePrice: 4.5, currentSharePrice: 1.8, numberOfShares: 48, typeStock: "Local"),
    StockHolding(companyName: "Z Company", purchaseSharePrice: 3.2, currentSharePrice: 2.2, numberOfShares: 55, typeStock: "Local"),
    StockHolding(companyName: "P Company", purchaseSharePrice: 2.8, currentSharePrice: 3.6, numberOfShares: 45, typeStock: "Local"),
    StockHolding(companyName: "O Company", purchaseSharePrice: 2.9, currentSharePrice: 6.8, numberOfShares: 35, typeStock: "Local"),
    StockHolding(companyName: "E Company", purchaseSharePrice: 5.5, currentSharePrice: 2.5, numberOfShares: 42, typeStock: "Local"),
    StockHolding(companyName: "N Company", purchaseSharePrice: 3.4, currentSharePrice: 4.6, numberOfShares: 56, typeStock: "Local"),
    StockHolding(companyName: "R Company", purchaseSharePrice: 4.8, currentSharePrice: 1.9, numberOfShares: 65, typeStock: "Local"),
    StockHolding(companyName: "S Company", purchaseSharePrice: 1.6, currentSharePrice: 2.8, numberOfShares: 84, typeStock: "Local"),
    StockHolding(companyName: "Q Company", purchaseSharePrice: 2.7, currentSharePrice: 4.9, numberOfShares: 19, typeStock: "Local")
     
   ]
listing.append(ForeignStockHolding(companyName: "F Company", purchaseSharePrice: 3.4, currentSharePrice: 4.2, numberOfShares: 80, typeStock: "Foreign" , conversionRate: 2))
listing.append(ForeignStockHolding(companyName: "U Company", purchaseSharePrice: 4.5, currentSharePrice: 4, numberOfShares: 95, typeStock: "Foreign" , conversionRate: 1.5))
listing.append(ForeignStockHolding(companyName: "T Company", purchaseSharePrice: 6.2, currentSharePrice: 5.5, numberOfShares: 55, typeStock: "Foreign", conversionRate: 2))


func printStock(Stock: StockHolding) {
       
        
    print("Name of the Company: \(Stock.companyName)\nPurchase share price of the company: \(Stock.purchaseSharePrice)\nCurrent share price of the company: \(Stock.currentSharePrice)\nNumber of shares of the company: \(Stock.numberOfShares)\nCost in dollars \(Stock.costInDollars()).\nValue in dollars \(Stock.valueInDollars())\nType Stock: \(Stock.typeStock)\n -----------------")
}

func sortAllByName(Sort: Int){
    switch Sort{
    case 1:
        listing.sort{$0.companyName < $1.companyName}
        for records in listing {
        if let nameOrder = records as? StockHolding {
            if records.typeStock == "Local"{
                
                printStock(Stock: nameOrder)
            } else if records.typeStock == "Foreign"{
                if let nameOrder2 = records as? ForeignStockHolding{
                printForeignStock(ForeignStock: nameOrder2)
                }
            }
                 
             }
    }
    case 2:
        listing.sort{$0.companyName > $1.companyName}
        for records in listing {
        if let nameOrder = records as? StockHolding {
            if records.typeStock == "Local"{
                
                printStock(Stock: nameOrder)
            } else if records.typeStock == "Foreign"{
                if let nameOrder2 = records as? ForeignStockHolding{
                printForeignStock(ForeignStock: nameOrder2)
                }
            }
                 
             }
    }
    default:
        print("Please Enter 1 for sorting A > Z or Enter 2 for sorting Z > A by Company Name")
    }

    }
func sortAllByValue(Sort: Int){
    switch Sort{
    case 1:
        listing.sort{$0.valueInDollars() < $1.valueInDollars()}
        for records in listing {
        if let nameOrder = records as? StockHolding {
            if records.typeStock == "Local"{
                
                printStock(Stock: nameOrder)
            } else if records.typeStock == "Foreign"{
                if let nameOrder2 = records as? ForeignStockHolding{
                printForeignStock(ForeignStock: nameOrder2)
                }
            }
                 
             }
    }
    case 2:
        listing.sort{$0.valueInDollars() > $1.valueInDollars()}
        for records in listing {
        if let nameOrder = records as? StockHolding {
            if records.typeStock == "Local"{
                
                printStock(Stock: nameOrder)
            } else if records.typeStock == "Foreign"{
                if let nameOrder2 = records as? ForeignStockHolding{
                printForeignStock(ForeignStock: nameOrder2)
                }
            }
                 
             }
    }
        
    default:
        print("Please Enter 1 for sorting Ascending or Enter 2 for sorting Descending by Value in dollars")
    }

    }
func typeSelection(Sort: Int, Type: String){
    switch Sort{
    case 1:
        listing.sort{$0.companyName < $1.companyName}
        for records in listing {
            
        
            switch Type{
            case "Local":
                if let nameOrder = records as? StockHolding {
                if records.typeStock == Type{
                    
                    printStock(Stock: nameOrder)
                }
                }
            case "Foreign":
                if records.typeStock == Type{
                   if let nameOrder2 = records as? ForeignStockHolding{
                   printForeignStock(ForeignStock: nameOrder2)
                   }
                }
            default:
                    print("Enter type of the stock in either 'Local' or 'Foreign'")
             
                }
            }
    case 2:
        listing.sort{$0.companyName > $1.companyName}
        for records in listing {
            
        
            switch Type{
            case "Local":
                if let nameOrder = records as? StockHolding {
                if records.typeStock == Type{
                    
                    printStock(Stock: nameOrder)
                }
                }
            case "Foreign":
                if records.typeStock == Type{
                   if let nameOrder2 = records as? ForeignStockHolding{
                   printForeignStock(ForeignStock: nameOrder2)
                   }
                }
            default:
                    print("Enter type of the stock in either 'Local' or 'Foreign'")
             
                }
            }
    default:
        print("Please Enter 1 for sorting A > Z or Enter 2 for sorting Z > A")
    }
       
                 
        }


func addStock(){
    
                    print("Please declare the type of the new stock (F for Foreign, L for Local)")
                    let Type = readLine()
                    if Type == "L"{

                        
                        print("Please Enter Name of the Company")
                        if let a = readLine(){
                            let test = a
                            //listing.append(StockHolding(companyName: test, purchaseSharePrice: b, currentSharePrice: c, numberOfShares: d, typeStock: e))
                            print("Please Enter Purchase Share Price")
                            if let b = readLine(){
                                
                                if let test2 = Float(b){
                                print("Please Enter Current Share Price")
                                if let c = readLine(){
                                    if let test3 = Float(c){
                                        print("Please Enter Number of Shares")
                                    if let d = readLine(){
                                        if let test4 = Int(d){
                                            
                                            listing.append(StockHolding(companyName: test , purchaseSharePrice: test2, currentSharePrice: test3, numberOfShares: test4, typeStock: "Local"))
                                            print("New Stock Succesfully Added !")
                                            
                                    }
                                }
                                }
                            }
                        }
                        }
                        }
                        
                    }
    else if Type == "F"{
        print("Please Enter Name of the Company")
        if let a = readLine(){
            let test = a
            
            print("Please Enter Purchase Share Price")
            if let b = readLine(){
                
                if let test2 = Float(b){
                print("Please Enter Current Share Price")
                if let c = readLine(){
                    if let test3 = Float(c){
                        print("Please Enter Number of Shares")
                    if let d = readLine(){
                        if let test4 = Int(d){
                            print("Please Enter Conversion Rate")
                            if let e = readLine(){
                                if let test5 = Float(e){
                                    listing.append(ForeignStockHolding(companyName: test, purchaseSharePrice: test2, currentSharePrice: test3, numberOfShares: test4, typeStock: "Foreign", conversionRate: test5))
                                    print("New Stock Succesfully Added !\n")
                                }
                            }

                            
                    }
                }
                }
            }
        }
        }
        }
    }
    else{
        addStock()
    }
                }
func maxValue(){
    
    for record in listing{
        if let nameOrdered = record as? StockHolding{
        if let max = listing.max(by: { $0.valueInDollars() < $1.valueInDollars()}){
            var a = max.valueInDollars()
            if record.valueInDollars() == a{
                printStock(Stock: nameOrdered)
            }
            }
        }
    }
}
func minValue(){
    for record in listing{
        if let nameOrdered = record as? StockHolding{
        if let max = listing.min(by: { $0.valueInDollars() < $1.valueInDollars()}){
            let a = max.valueInDollars()
            if record.valueInDollars() == a{
                printStock(Stock: nameOrdered)
            }
            }
        }
    }
}
func mostProfitable(){
    for record in listing{
        if let nameOrdered = record as? StockHolding{
        if let max = listing.max(by: { $0.profitable() < $1.profitable()}){
            let a = max.profitable()
            if record.profitable() == a{
                printStock(Stock: nameOrdered)
            }
            }
        }
    }
}


func leastProfitable(){
    for record in listing{
        if let nameOrdered = record as? StockHolding{
        if let max = listing.min(by: { $0.profitable() < $1.profitable()}){
            let a = max.profitable()
            if record.profitable() == a{
                printStock(Stock: nameOrdered)
            }
            }
        }
    }
}
func backToMenu(){
    if let back = readLine(){
        menu()
    }
}
func backToMain(){
    if let back = readLine(){
        main()
    }
}
func menu(){
    print("Enter 1-7 to display the records\n1) Display stock information with the lowest value\n2) Display stock information with the highest value\n3) Display the most profitable stock\n4) Display the least profitable stock\n5) List all stocks sorted by company name (A-Z)\n6) List all stocks sorted by company name (Z-A)\n7) List all stocks sorted from the lowest value to the highest value\n8) Exit to main menu")
    if let Selection = readLine(){
     let a = Int(Selection)
    
    switch a {
    case 1:
        minValue()
        print("Enter anything to go back to display menu")
        backToMenu()
    case 2:
        maxValue()
        print("Enter anything to go back to display menu")
        backToMenu()
    case 3:
        mostProfitable()
        print("Enter anything to go back to display menu")
        backToMenu()
    case 4:
        leastProfitable()
        print("Enter anything to go back to display menu")
        backToMenu()
    case 5:
        print("1) List all Foreign Stocks by company name(A > Z)\n2) List all Local Stocks by company name(A>Z)\n3) List ALL Stocks by company name (A>Z)")
        if let SortSelect = readLine(){
            let b = Int(SortSelect)
            switch b {
            case 1:
                typeSelection(Sort: 1, Type: "Foreign")
                print("Enter anything to go back to display menu")
                backToMenu()
            case 2:
                typeSelection(Sort: 1, Type: "Local")
                print("Enter anything to go back to display menu")
                backToMenu()
            case 3:
                sortAllByName(Sort: 1)
                print("Enter anything to go back to display menu")
                backToMenu()
            default:
                print("Please enter a number in range of 1-3\nPlease enter to return to display menu")
                backToMenu()
            }
            
        }
    case 6:
        print("1) List all Foreign Stocks by company name(Z>A)\n2) List all Local Stocks by company name(Z>A)\n3) List ALL Stocks by company name (Z>A)")
        if let SortSelect = readLine(){
            let b = Int(SortSelect)
            switch b {
            case 1:
                typeSelection(Sort: 2, Type: "Foreign")
                print("Enter anything to go back to display menu")
                backToMenu()
            case 2:
                typeSelection(Sort: 2, Type: "Local")
                print("Enter anything to go back to display menu")
                backToMenu()
            case 3:
                sortAllByName(Sort: 2)
                print("Enter anything to go back to display menu")
                backToMenu()
            default:
                
                print("Please enter a number in range of 1-3\nPlease enter anything to return to display menu")
                backToMenu()
            }
            
        }
        
    case 7:
        sortAllByValue(Sort: 1)
        print("Enter anything to go back to display menu")
        backToMenu()
    case 8:
        main()
    default:
        print("Please enter a number in range of 1-8\nPlease enter anything to return to display menu")
        backToMenu()
    }
    }
}
func main(){
    print("Welcome !\n1. Enter new stock(s)\n2. List all the stocks (A > Z) by Company Name\n3. List all the stocks (Z > A) by Company Name")
    if let Selection = readLine(){
        let a = Int(Selection)
        switch a{
        case 1:
            print("How many new stock information do you want to enter ?")
            if let counter = readLine(){
                if let count = Int(counter){
                    if count <= 0 {
                    print("Navigating to main menu. (Please enter a valid integer ( > 0))")
                    main()
                }
                    else if count > 0{

                        for var i in 1...count{
                            addStock()
                            i = i + 1
                        }
                        print("All Entries Succesfully Added !\n")
                        menu()
                        
                        
                    }
                }
            }
            
        case 2:
            sortAllByName(Sort: 1)
            print("Please enter a number in range of 1-3\nPlease enter anything to return to main menu")
            backToMain()
        case 3:
            sortAllByName(Sort: 2)
            print("Please enter a number in range of 1-3\nPlease enter anything to return to main menu")
            backToMain()
        default:
            print("Please Enter a value between 1-3\n")
            main()
        }
    }
}
    
main()







