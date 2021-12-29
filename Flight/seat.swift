
class seat{
    var type=""
    var Class=""
    var price:Double=0
    
    init(t:String)
    {
        self.type=t
        list()
}
    
    func list(){
        var ch1:Int
        if self.type[self.type.index(type.startIndex, offsetBy: 0)]=="O"{
            Swift.print(
        """
        --------------------------------
        1.First Class, Price = 1000SR
        2.Buisness Class, Price = 750SR
        3.Econemy Classs = 500SR
        --------------------------------
        """
            )
            
        }
        else if self.type[self.type.index(self.type.startIndex, offsetBy: 0)]=="R"{
            
            Swift.print(
        """
        --------------------------------
        1.First Class, Price = 1700SR
        2.Buisness Class, Price = 1350SR
        3.Econemy Classs = 900SR
        --------------------------------
        """
            )
            
            
        }
        ch1=Int(readLine()!) ?? 4
        if ch1==1  {
            if self.type=="O"{
                Class="First Class"
                price=1000}
            if type=="R"{
                Class="First Class"
                price=1700}
        }
        if ch1==2{
            if self.type=="O"{
                Class="Buisness Class"
                price=750}
            if type=="R"{
                Class="Buisness Class"
                price=1350}
        }
        if ch1==3 {
            if self.type=="O"{
               Class="Econemy class"
                price=500}
            if self.type=="R"{
                Class="Econemy class"
                 price=900}
        }
       
        
}
    func getClass()->String{
        return Class
    }
    
    func setClass(c:String){
      Class=c
    }
    
    func getType()->String{
        return type
    }
    
    func setType(t:String){
      type=t
    }
    
    func getPrice()->Double{
        return price
    }
    
   
}
