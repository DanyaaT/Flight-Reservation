
var num:Int
var check:Int?
var ch:Int
var id=""
var name=""
var origin=""
var des=""
var date=""
var time=""
var type=" "
var dict:[String:[Any]]=[:]
var invoice:Int=0
var inv = 110

print("Welcome to Swift Flight Reservation!")
repeat{
    print("""

-------------------------------

Choose the service number:
1.Book a Flight
2.Check your reservations
3.Exit

-------------------------------
""")
    ch=Int(readLine()!) ?? 3
    inv+=1
    switch ch{
        
    case 1:
        print("Enter Departure City:")
        if let origin1=readLine(){
            origin=origin1
        }
        else {
        }
        print("Enter Arrival City:")
        if let des1=readLine(){
            des=des1
        }
        else {
        }
        print("Enter trip's Date(YYYY/MM/DD):")
        if let date1=readLine(){
            date=date1
        }
        else {
        }
        print("Enter the trip's Time(HH:MM Am or Pm):")
        if let time1=readLine(){
            time=time1
        }
        else {
        }
       
        print("One way or Round trip(O/R):")
        if let type1=readLine(){
            type=type1.uppercased()}
        while type[type.index(type.startIndex, offsetBy: 0)] != "O" &&
                type[type.index(type.startIndex, offsetBy: 0)] != "R"{
        print("Erorr, enter (O) for one way or (R) for round trip:")
        if let type1=readLine(){
            type=type1.uppercased()
            }
        }
        
        print("Enter Number of Travelers:")
        num=Int(readLine()!) ?? 1
        
        for i in 1...num {
            print("Enter Traveler's Name",i,":")
            if let name1=readLine(){
                name=name1
            }
            else {
            }
            print("Enter ID Number for",name,":")
            if let id1=readLine(){
                id=id1
            }
            
            
            
            print("Choose seat type for \(name)")
            let seat=seat(t:type)
            let seatClass=seat.getClass()
            let price=seat.getPrice()
            
            print(price)
            print(seatClass)
            
            dict[id] = [name,origin,des,type,seatClass,price,inv,date,time]
          
        }
        printInvoice(origin:origin,des:des,inv:inv,date:date,time:time)
        
    case 2:
        print(
"""
-------------------------------
Choose a way to check your reservations:
1.travelr's ID number
2.ticket Invoice number
"""
        )
        if let check1=Int(readLine()!){
            check=check1
        }
        
        if check==1{
            check1()
        }
        if check==2{
            check2()
        }
        
        else{
            fallthrough
        }
        
        
    default:
        print("Thank You!")
        
    }
    
}while ch < 3



func check1(){
    var notFound=true
    print("Enter travelrs ID Number:")
    if let id1=readLine()
    {
        id=id1
    }
    for (keys,values) in dict{
        if id==keys {
    print("-------------------------------------------------------------------")
    print("Name:\(values[0])","ID:\(keys)","Seat Class:\(values[4])","Price:\(values[5])","\n",separator:"  ")
    print( "-------------------------------------------------------------------")

            notFound = false
            break
        }
        
        if notFound{
            print("There is no reservations under this ID: \(id)")
        }
    }
    
}

func check2(){
    var notFound=true
    print("Enter Ticket's Invoice Number:")
    if let invoice1=Int(readLine()!){
        invoice=invoice1
    }
    for (_,values) in dict{
        if invoice == values[6] as? Int {
            printInvoice(origin:values[1] as! String,des:values[2] as! String,inv:values[6] as! Int,date:values[7] as! String,time:values[8] as! String)
            notFound = false
            break
        }
        
        if notFound{
            print("There is no ticket under this invoice number: \(invoice)")
        }
    }
}

func printInvoice(origin:String,des:String,inv:Int,date:String,time:String){
    var total:Double=0
    print("Departure City:",origin,"--> Arival City:",des,separator: "  ")
    print("Date and Time:",date,"-",time)
    print("-------------------------------------------------------------------")
    for (keys,values) in dict{
        if inv == values[6] as! Int{
            print("""
            Departure City:\(origin) --> Arival City:\(des)
            Date and Time:\(date)-\(time))
            -------------------------------------------------------------------
            """
            )
                
         print("Name:\(values[0])","ID:\(keys)","Seat Class:\(values[4])","Price:\(values[5])","\n",separator:"  ")
              
        }
            

        total +=  values[5] as! Double
     }
    print("""
    Total Price: \(total)    Invoice Number:\(inv)
    -------------------------------------------------------------------
    """)
    }

